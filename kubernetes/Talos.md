# Talos Proxmox Cluster

"Talos Linux is Linux designed for Kubernetes – secure, immutable, and minimal." - [talos.dev](https://talos.dev)

I decided that, to gain experience with kubernetes, I would install a small 1 control plane, 2 worker node cluster on my home lab, using Proxmox to virtualize it. 

## Talos Install Process

1. Install Homebrew (not covered)
2. Install kubectl (not covered)
3. `brew install siderolabs/tap/talosctl`

### Proxmox

1. Download .iso file from [Image Factory](https://factory.talos.dev/) by following the prompts. We're interested in the following:
- ISO: https://factory.talos.dev/image/ce4c980550dd2ab1b17bbf2b08801c7eb59418eafe8f279833297925d67c7515/v1.9.4/metal-amd64.iso (ISO documentation) 
- Initial Installation: (add the following to the machine configuration) factory.talos.dev/installer/ce4c980550dd2ab1b17bbf2b08801c7eb59418eafe8f279833297925d67c7515:v1.9.4 
- Upgrading Talos: factory.talos.dev/installer/ce4c980550dd2ab1b17bbf2b08801c7eb59418eafe8f279833297925d67c7515:v1.9.4 
1. Upload .iso file to Proxmox
2. Create VM to be control plane, making sure to keep in mind the [system requirements](https://www.talos.dev/v1.9/introduction/system-requirements/) for Talos (v1.9 linked)
3. Use defaults for most options, use the .iso that was uploaded, change disk size to 50Gb, ensure storage on local-lvm, uncheck ballooning memory, use a compatible cpu, ensure networking uses the bridge interface, etc.
   - Note: As of Talos v1.0 (which requires the x86-64-v2 microarchitecture), prior to Proxmox V8.0, booting with the default Processor Type kvm64 will not work. You can enable the required CPU features after creating the VM by adding the following line in the corresponding /etc/pve/qemu-server/<vmid>.conf file: `args: -cpu kvm64,+cx16,+lahf_lm,+popcnt,+sse3,+ssse3,+sse4.1,+sse4.2`
4. Repeat as necessary for worker nodes keeping in mind [system requirements](https://www.talos.dev/v1.9/introduction/system-requirements/) again.
5. Start control plane node. As I use DHCP, it was auto-assigned an IP (192.168.0.91/24). I use the command `export CONTROL_PLANE_IP=192.168.0.91` to store it in my WSL instance, as I will be commanding the cluster from here. 

### TalosCTL Continued

1. Generate machine configurations. For QEMU support, make sure to generate the config with the custom install image from before:

```sh 
talosctl gen config talos-proxmox-cluster https://$CONTROL_PLANE_IP:6443 --output-dir ~/talos --install-image factory.talos.dev/installer/ce4c980550dd2ab1b17bbf2b08801c7eb59418eafe8f279833297925d67c7515:v1.9.4 
```
RESULT:
```
generating PKI and tokens
Created /home/desmond/talos/controlplane.yaml
Created /home/desmond/talos/worker.yaml
Created /home/desmond/talos/talosconfig
```
2. Ensure QEMU guest agent is turned on in proxmox vm options
3. Create control plane node with `talosctl apply-config --insecure --nodes $CONTROL_PLANE_IP --file ~/talos/controlplane.yaml` After this, Talos is seen being installed to your proxmox vm console, then the vm reboots. 
4. Create the worker node(s) with: `talosctl apply-config --insecure --nodes $WORKER_IP --file ~/talos/worker.yaml`

## Using the Cluster

Now that we have it up and running, the first thing we do is play around with it. Patching comes later. The docs provide an extensive command list for the [cli](https://www.talos.dev/v1.9/reference/cli/). We do the following:
```sh 
export TALOSCONFIG=~/talos/talosconfig
talosctl config endpoint $CONTROL_PLANE_IP
talosctl config node $CONTROL_PLANE_IP
talosctl bootstrap
talosctl kubeconfig .
export KUBECONFIG=~/talos/kubeconfig
```
- `talosctl dashboard` shows a handy dashboard, we can use the `-n $WORKER_IP1` or `-n $WORKER_IP2` options to see them, as it defaults to the control plane.
- `kubectl get nodes -o wide` ensures we can connect to the kubernetes cluster, and shows our nodes.