# OSI Model
![alt](https://net.cybbh.io/public/networking/latest/01_data/_images/OSI.png)

## PDU
How "data" is referred to throughout the OSI Model
| Layer | Data Unit |
| - | - |
| Application | Data |
| Presentation | Data |
| Session | Data |
| Transport | Segment/Datagram |
| Network | Packet |
| Data Link | Frames |
| Physical | Bits |

# Internet Standards

## Internet Engineering Task Force (IETF)
Manages RFC which define various networking and engineering standards

Some notable RFCs can be found in the handbook [here](https://net.cybbh.io/public/networking/latest/01_data/fg.html#_1_1_2_internet_standards_organizations)

## Internet Assigned Numbers Authority (IANA)
Connects users to large domain servers which contain the ips for the internet

## Institute of Electrical and Electronics Engineers (IEEE)
Primarily manage engineering and signal standards (such as IEEE)

# [Network Topologies](https://net.cybbh.io/public/networking/latest/01_data/fg.html#_1_2_2_1_topologies)



![source](https://net.cybbh.io/public/networking/latest/01_data/_images/LAN_Bus_Top.png)
![source](https://net.cybbh.io/public/networking/latest/01_data/_images/LAN_Star_Top.png)
![source](https://net.cybbh.io/public/networking/latest/01_data/_images/LAN_RING_TOP.png)
![source](https://net.cybbh.io/public/networking/latest/01_data/_images/LAN_MESH_TOP.png)
![source](https://net.cybbh.io/public/networking/latest/01_data/_images/LAN_WIRELESS_TOP.png)
![source](https://net.cybbh.io/public/networking/latest/01_data/_images/LAN_HIERARCHICAL_TOP.png)

# MAC Address
01-23-45-67-89-AB

| **01-23-45** | **67-89-AB** |
| - | - |
| Manufacturer ID | Unique Identifier |

## Format
- Windows: 01-23-45-12-34-56
- Unix/Linux: 01:23:45:12:34:56
- Cisco: 1234.5612.3456


# Payloads
### Message Formatting
![alt](https://net.cybbh.io/public/networking/latest/01_data/_images/Message_Format.png)

### Message Encapsulation and Decapsulation
![alt](https://net.cybbh.io/public/networking/latest/01_data/_images/PDU_SDU.png)

# Switch
### Operation
- Forwards frames based on MAC address
- Uses frames to build a CAM (Content Addressable Memory) Table which maps MAC addresses to switch ports

### Switching Modes
- Cut-Through
- Fragment Free
- Store-and-Forward (accepts analyzes and forwards frames)

### Vulnerabilities
- CAM Table Overflow Attack
  - Send frames with bogus source MAC addresses
  - fills CAM table
  - Can work as a DOS attack 

# VLAN
A way of segregating ports on a VLAN by VLAN ID

Two switches with VLANs can be connected via a trunk port which passes VLAN ID information

The default VLAN for cisco is VLAN 1, if this does not exist adverse behavior may occur

![alt](https://net.cybbh.io/public/networking/latest/01_data/_images/802.1QFrame.png)

# VTP

Allows you to create a "VLAN" server which holds VLAN configurations and propogates it through the network

# DTP 

Dynamically creates trunking ports between switches

# ARP

![alt](https://net.cybbh.io/public/networking/latest/01_data/_images/ARP_Header.png)

### Types
- ARP (OP 1 and 2) - resolve MAC from IP
- RARP (OP 3 and 4) - resolve IP from MAC
- Proxy ARP (OP 2) - router answers ARP queries for IP on a different network
- Gratuitous ARP (OP 2) - one way arp where the sender provides their MAC and IP without anything in return

# Attack Mitigation Techniques

# Fragmented Ipv4
look it up, [this](https://www.cloudshark.org/captures/004070781efd) is a 
