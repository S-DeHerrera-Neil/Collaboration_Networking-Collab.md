# TCPDUMP
```
tcpdump {A} [B:C] {D} {E} {F} {G}

A = Protocol (ether | arp | ip | ip6 | icmp | tcp | udp)
B = Header Byte offset
C = optional: Byte Length. Can be 1, 2 or 4 (default 1)
D = optional: Bitwise mask ( & )
E = Relational operator ( = | == | > | < | <= | >= | != | () | << | >> )
F = Result of Expression
G = optional: Logical Operator ( && || ) to bridge expressions
```
# Data-link (Layer 2)
## [Ethernet](https://net.cybbh.io/public/networking/latest/01_data/fg.html#_1_3_6_describe_the_contents_of_an_ethernet_header_and_frame)
![alt](https://github.com/user-attachments/assets/453eefde-c97c-4612-84b3-ab0a72df9a86)
![alt](https://net.cybbh.io/public/networking/latest/01_data/_images/Ethernet_II_Frame.png)
| Bytes 0 - 5 | Bytes 6 - 11 | Bytes 12 - 13 |
| - | - | - |
| Destination MAC | Source MAC | Ethertype |

| [Ethertype](https://en.wikipedia.org/wiki/EtherType)| Name |
| - | - |
| 0x0806 | [ARP](https://en.wikipedia.org/wiki/Address_Resolution_Protocol) |
| 0x0800 | [Ipv4](https://en.wikipedia.org/wiki/Internet_Protocol_version_4) |
| 0x86DD | [Ipv6](https://en.wikipedia.org/wiki/Internet_Protocol_Version_6) |
### [802.1Q VLAN](https://net.cybbh.io/public/networking/latest/01_data/fg.html#_1_3_7_describe_an_802_1q_virtual_local_area_network_vlan_frame_and_how_its_frames_differ_from_a_standard_802_3_frame)
![alt](https://net.cybbh.io/public/networking/latest/01_data/_images/802.1QFrame.png)
### [802.1AD Double Tagging](https://net.cybbh.io/public/networking/latest/01_data/_images/802.1adframe.png)
![alt](https://net.cybbh.io/public/networking/latest/01_data/_images/802.1adframe.png)
## [ARP](https://net.cybbh.io/public/networking/latest/01_data/fg.html#_1_3_8_describe_the_address_resolution_protocol_arp)
![alt](https://net.cybbh.io/public/networking/latest/01_data/_images/ARP_Header.png)
# Network (Layer 3)
## [IPv4](https://net.cybbh.io/public/networking/latest/02_network/fg.html#_2_1_1_2_analyze_ipv4_packet_header)
![alt](https://net.cybbh.io/public/networking/latest/02_network/_images/IPv4_Header.png)

| [Protocol](https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml) | Name |
| - | - |
| 0x01 (1) | ICMP |
| 0x06 (6) | TCP |
| 0x11 (17)| UDP |

![alt](https://net.cybbh.io/public/networking/latest/02_network/_images/IPv4_Structure.png)
## [IPv6](https://net.cybbh.io/public/networking/latest/02_network/fg.html#_2_1_2_2_analyze_ipv6_packet_header)
![alt](https://net.cybbh.io/public/networking/latest/02_network/_images/IPv6_Header.png)

| [Protocol](https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml) | Name |
| - | - |
| 0x01 (1) | ICMP |
| 0x06 (6) | TCP |
| 0x11 (17)| UDP |

![alt](https://net.cybbh.io/public/networking/latest/02_network/_images/IPv6_Structure.png)
# Transport (Layer 4)
## [ICMPv4](https://net.cybbh.io/public/networking/latest/02_network/_images/net_2.5_ICMP.png)
![alt](https://net.cybbh.io/public/networking/latest/02_network/_images/ICMPHeader.png)
![alt](https://net.cybbh.io/public/networking/latest/02_network/_images/net_2.5_ICMP.png)
## [TCP](https://net.cybbh.io/public/networking/latest/03_transport/fg.html#_3_1_4_1_tcp_headers)
![alt](https://net.cybbh.io/public/networking/latest/03_transport/_images/TCPHeader.png)
| Byte Number | Field Name | Bit Range | Length | Description |
| - | - | - | - | - |
| 0-1 | Source Port | 0-15 | 16 bits | Specifies the port that localhost is listening on for traffic during this communication. |
| 2-3 | Destination Port | 16-31 | 16 bits | Specifies the port on the receiving(destination) host that it is listening on for this communication. |
| 4-7 | Sequence Number | 32-63 | 32 bits | If SYN flag set: this is the initial(starting) sequence number; If SYN flag is not set: this is the sequence number of the current segment that has incremented from the starting sequence number. |
| 8-11 | Acknowledgment Number (if ACK is set) | 64-95 | 32 bits | If ACK flag is set, it specifies the next sequence number the sender is expecting. Sender’s Sequence Number +1. |
| 12 | Data Offset | 96-99 | High 4 bits | The size of TCP header in 32-bit WORDS. Minimum=5, Max=15. Used if there are TCP options. |
| 12 | Reserved | 100-102 | Low 3 bits | Reserved for future use and should be set to zero. |
| 12 | NS | 103 | Low 1 bit | Optional addition to the L3 ECN. Reference RFC 3540. |
| 13 | Flags | 104-111 | 8 bits | Control bits: CWR, ECE, URG, ACK, PSH, RST, SYN, FIN |
| 14-15 | Window Size | 112-127 | 16 bits | Size (in bytes) that this host is able to receive. This can be different on each end and can change during the course of the connection. Reference Wikipedia (Flow Control) (Window Scaling) |
| 16-17 | Checksum | 128-143 | 16 bits | Calculation done using the TCP header, Payload, and the Pseudo-Header (Source IP, Destination IP, and Protocol number (0x06)) |
| 18-19 | Urgent Pointer (if URG is set) | 144-159 | 16 bits | If URG is set then this is an offset (range) from the sequence number indicating the last urgent data byte. |
| 20-59 | Options | variable | 0-320 bits and divisible by 32 | Variable options. Reference www.networksorcery.com for examples. |

![alt](https://net.cybbh.io/public/networking/latest/03_transport/_images/net_2.3_TCP.png)
## [UDP](https://net.cybbh.io/public/networking/latest/03_transport/fg.html#_3_1_4_2_udp_headers)
![alt](https://net.cybbh.io/public/networking/latest/03_transport/_images/UDPHeader.png)
| Byte Number | Field Name | Bit Range | Length | Description |
| - | - | - | - | - |
| 0-1 | Source Port | 0-15 | 16 bits | Specifies the port that localhost is listening on for traffic during this communication. |
| 2-3 | Destination Port | 16-31 | 16 bits | Specifies the port on the receiving(destination) host that it is listening on for this communication. |
| 4-5 | Length | 32-47 | 16 bits | Specifies the length of the UDP header and data. |
| 6-7 | Checksum | 48-63 | 16 bits | Used for error checking of the header and data. This is optional for IPv4 and mandatory in IPv6. |

![alt](https://net.cybbh.io/public/networking/latest/03_transport/_images/net_2.4_UDP.png)
# Application (Layer 5)
## [HTTP(S)](https://net.cybbh.io/public/networking/latest/03_transport/fg.html#_3_4_3_analyze_hypertext_transfer_protocol_secure_https)
![alt](https://net.cybbh.io/public/networking/latest/03_transport/_images/http.png)
## [DNS](https://net.cybbh.io/public/networking/latest/03_transport/fg.html#_3_4_4_analyze_domain_name_system_dns_protocol)
![alt](https://net.cybbh.io/public/networking/latest/03_transport/_images/dns.png)
## [FTP](https://net.cybbh.io/public/networking/latest/03_transport/fg.html#_3_4_5_analyze_file_transfer_protocol_ftp)
![alt](https://net.cybbh.io/public/networking/latest/03_transport/_images/ftp.png)
