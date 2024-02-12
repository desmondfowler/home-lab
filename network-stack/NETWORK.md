# Networking

## Pi-Hole

For this, a new Debian 12 VM was created on the lapprox machine, dedicated to being a PiHole DNS sinkhole to provide network-wide ad-blocking on all devices. To install the Pi-hole on the VM, I just used the following command (as referenced on the Pi-hole [documentation](https://docs.pi-hole.net/main/basic-install/)):

```bash
curl -sSL https://install.pi-hole.net | bash
```

While piping to bash is generally discouraged, they address that in the documentation.

In addition, to allow all devices to use the Pi-hole as their DNS server, I configured that in the ASUS RT-AX5400 router's admin page. First, I set the DNS server to the Pi-hole's IP address on the "DHCP Server" tab of the LAN page on the router's settings (which, after reading documentation, seems to be the old way of doing it). Then, I also set it on the WAN page of the router's settings to be the DNS server, which seems to be the more modern way of doing it, according to the router's documentation.

On the Pi-hole VM, I also installed [unbound](https://github.com/NLnetLabs/unbound) by following the [guide](https://docs.pi-hole.net/guides/dns/unbound/) in the official Pi-hole documentation as well as following along with Craft Computing's YouTube video [You're running Pi-Hole wrong! Setting up your own Recursive DNS Server!](https://www.youtube.com/watch?v=FnFtWsZ8IP0). This allows Pi-hole to work as a fully-featured recursive DNS server.

Very little configuration was needed for this, other than unselecting any of the Upstream DNS servers that were on by default, and using the "Custom 1 (IPv4)" DNS server, which I set to 127.0.0.1#5335 as per the guide. This allows unbound to be used as the upstream DNS.