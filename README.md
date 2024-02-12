# Home Lab

## README.md

Overview of the homelab project, its objectives, and a high-level description of each component.

## TIMELINE.md

[This](./TIMELINE.md) file will contain a basic overview of the timeline of when things were added to the home lab, as well as a link to more detailed documentation of each item (if needed).

## Section-level Files

As mentioned in the above, these files contain the detailed information about each section. For example, in the network-stack directory, information about the network setup, including hardware and software used, configuration notes, and troubleshooting tips are housed. The general layout of this repository is as follows:

| Directory        | Documentation File          | Description |
|------------------|-----------------------------|-------------|
| root             | [README.md](README.md)      | What you're reading! |
| root             | [START.md](START.md)        | Starting point, before any additions. |
| root             | [TIMELINE.md](TIMELINE.md)  | Brief timeline describing progress. |
| cybersecurity    | [SECURITY.md](./cybersecurity/SECURITY.md)| Security documentation. |
| database         | [DATABASE.md](./database/DATABASE.md)    | Database documentation. |
| network-stack    | [NETWORK.md](./network-stack/NETWORK.md)   | Network documentation. |
| services         | [SERVICES.md](./services/SERVICES.md)      | Service documentation. |
| webpage          | [WEBPAGE.md](./webpage/WEBPAGE.md)         | Webpage documentation. |

Notice the [START.md](START.md), which contains the starting point before any additions to the home lab project.

## Plans

As of writing this initially, nothing concrete had been established. The starting home network setup I had is contained in the START.md file in this repository.

The eventual goal, and what I have on my resume, is the following:

- Sophisticated Virtualization Setup: Utilized Proxmox VE on Intel-based hardware for server virtualization, incorporating a Debian Server with Portainer for efficient Docker container orchestration. LXC containers are used to host over 10 distinct services, while Grafana is used for network performance monitoring, facilitating risk-free application testing and deployment.
- Network Management/Security: Configured an ASUS RT-AX5400 router with a Starlink internet connection for advanced LAN and WAN management. Implemented DHCP reservations and network security protocols to enhance overall network reliability and security.
- Diverse Virtual Machine Network: Created a varied network of virtual machines (VMs) with both Windows and Linux systems to refine skills in Active Directory, Samba, and other tools. Enhanced the network/security stack with an integrated ELK stack and Wazuh for SIEM/EDR, Suricata for IDS/IPS, OpenVAS for vulnerability scanning, and Wireshark for traffic analysis.
- Penetration Testing: Performed penetration testing with Kali Linux to assess the security of the network stack, verifying the effectiveness of deployed defense mechanisms.
- Future Goals:
  - Custom OPNsense Router: Planning to build a custom OPNsense router on bare metal to further improve network security and customization capabilities.
  - Home-based NAS System: Aiming to establish a home NAS solution using TrueNAS Scale/Unraid with ZFS for superior file storage and backup, including off-site backups with a cloud provider for data security.
  - Segregated CCTV System: Planning to set up a dedicated home CCTV network with an NVR, potentially on a separate VLAN or completely air-gapped from the main LAN to enhance security and minimize risks.
- Documentation and Insights: Detailed documentation of the home lab setup, including problem-solving processes and challenges overcome, is thoroughly described on my GitHub repository “home-lab.”

I didn't orignally have anything past what I had in [START.md](./START.md) but I have started to add to that.
