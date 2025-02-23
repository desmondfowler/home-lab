# Equipment Overview

This document details the equipment used in my home lab, from the original network starting point to recent upgrades. It covers networking gear, endpoints, server devices, and IoT components. This overview demonstrates how I’ve iterated on the infrastructure to improve performance, scalability, and reliability.

## 1. Networking Gear

### Starlink Internet

- **Setup:**
  - **Dish:** Starlink V2 dish (affectionately known as “Dishy McFlatface”)
  - **Router:** Starlink V2 router, which lacks Ethernet ports and connects via a proprietary cable to the dish.
- **Adaptation:**
  - Purchased an Ethernet adapter to add one Ethernet port, enabling integration with standard network equipment.

### Asus RT-AX5400 Router
 **Role:**
  - Acts as the primary routing device after passing through the Starlink adapter.
- **Key Features:**
  - 5 switchable Gigabit Ethernet ports.
  - Configurable WAN intake: Port 1 is used by default; port 2 is available for redundancy or aggregated connections if speeds exceed sub-gigabit.
- **Current Usage:**
  - Serves the main network, handling both LAN and a segregated guest network.
- **Future Plans:**
  - When building an OPNsense router, this unit may be repurposed as an access point for a guest house/furnished shed.

#### RT-AX5400 Configuration Details
- **Wi-Fi:**
  - Configured with WPA2/WPA3 Personal encryption.
  - Combined 5 GHz and 2.4 GHz bands for simplicity.
- **Guest Network:**
  - Provides internet access with unlimited bandwidth.
  - Isolated from the primary LAN to secure critical devices.
- **Intended Use:**
  - The guest network is the designated space for IoT devices.

## 2. Endpoints

### Home PCs
- Primary Desktop:
  - Equipped with a 1GB Ethernet port.
  - Note: Future upgrades may include a faster network card or a new motherboard with at least 2.5GB networking.

- Secondary Desktop:
  - Features a 2.5GB Ethernet port (used by my spouse).

- Laptop:
  - Serves as a semi-dedicated streaming/TV device, connecting via Wi-Fi.

## 3. Server Devices

### Legacy System: "lapprox"

- Device:
  - An older Intel i5-6500 laptop.

- Specifications:
  - 8GB RAM
  - 1GB Ethernet port

- Usage History:
  - Initially set up with Proxmox for experimental purposes.
  - Configured with a static IP and a corresponding DHCP reservation in the Asus router.

- Storage Configuration:
  - A ~100GB SSD for the Proxmox OS.
  - A 1TB HDD dedicated to VM storage, ISOs, and other local resources.

### Current Main Host: HP Prodesk 400 G6

- Acquisition Date: February 2025
- Specifications:
  - Intel i5-10500T
  - 16GB RAM
  - 1TB M.2 SSD
- Role:
  - Serves as the main Proxmox host for the lab.
- Repurposing Legacy Hardware:
  - The “lapprox” system has been reconfigured as a Proxmox backup server, utilizing its 1TB HDD for backup storage.

### 4. IoT Devices
- Devices:
  - Currently, only Pura Scent Diffusers are connected over Wi-Fi.
- Placement:
  - These devices are assigned to the guest network to keep them separate from critical infrastructure.
- Rationale:
  - Although they’re more about ambiance, segregating them ensures that non-critical devices don’t impact core network performance.