# Home Lab

## This README.md

Overview of the homelab project, its objectives, and a high-level description of each component.

## Component-level README.md's

More detailed information about each component. For example, in the network-stack directory, information about the network setup, including hardware and software used, configuration guides, and troubleshooting tips. The general layout of the documentation will be as follows:

.
├── README.md
├── cybersecurity
│   └── README.md
├── database
│   └── README.md
├── network-stack
│   ├── README.md
│   └── START.md
├── services
│   └── README.md
└── webpage
    └── README.md

## Plans

As of writing (current date 2/7/2024), nothing concrete has been established. The current home network setup I have is contained in the START.md file in the network-stack directory of this repository.

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

Now, of course, I don't have anything past what I have in ./network-stack/START.md but I plan to add that. I also don't know which services I want to run.
