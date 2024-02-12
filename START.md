# Original Network Starting Point

## Hardware

### Networking Gear

#### Starlink

The original setup includes a Starlink internet connection, with their V2 dish (Dishy McFlatface) and V2 router, which does not contain an ethernet port, only the proprietary connection to the dish, and Wifi 5. I purchased their ethernet adaptor which allowed for one ethernet port.

#### Asus RT-AX5400 Router

Using the ethernet adaptor, I put the Starlink router into bypass mode and passed it through to my Asus RT-AX5400 router. This router has 5 switchable Gigabit ethernet ports, with ports 1 and 2 being capable of being the WAN intake port. Generally, port 1 is alone, but if you have two WAN inputs for redundancy, you can configure it to use port 2 as well, which I have not done. Starlink provides sub-gigabit speeds at the moment so I have no need of more speed on my router, but if I had the resources for over 1 Gigabit, I could use ports 1 and 2 for a 2 Gigabit aggregated connection. When I build my OPNsense router (discussed in the "Plans" section of the main README.md), I may try to use this router as an access point for my guest house/furnished shed.

##### RT-AX5400 Configuration

Initial setup on the router included setting the Wifi passkey to WPA2/WPA3 Personal, and combining the 5Ghz and 2.4Ghz bands. Created a guest network that has internet access, unlimited bandwidth, and can not connect to primary home LAN for segregation purposes. At the moment, I plan to put any IOT devices onto this network, but they aren't currently here.

### Endpoints

#### Home PCs

I have a desktop PC with a 1GB ethernet port, though when I upgrade I will either buy a network card for faster networking, or I will be purchasing a motherboard with at least 2.5GB networking.

My wife has a desktop PC with a 2.5GB ethernet port.

My wife's laptop is the semi-dedicated streaming/TV watching device, and it connects over Wifi.

#### Server-ish? Devices

I have an old Intel i5-6500 laptop with 8Gb of RAM, and 1GB networking that I've installed Proxmox on to play around with before dipping my toes into any more purchasing. The name of this machine is "lapprox" which is a play on "laptop" and "Proxmox." I am very clever, I know. lapprox was configured to have a static IP address, which I also set as a DHCP reservation (for ease of remembering) in the Asus router. It has a very small, ~100GB SSD that Proxmox itself is loaded on, as well as a 1TB hard drive that I set up to be VM storage, along with any ISOs or anything else I need to store locally. This was good experience in learning how to set up Linux devices, especially non-standard distributions, over the command line.

#### IOT Devices

As of right now, the only IOT devices in the house are Pura Scent Diffusers that connect to the Wifi, and are plugged into a power outlet. My wife likes the smell, and I can go either way, so I put up with them.
