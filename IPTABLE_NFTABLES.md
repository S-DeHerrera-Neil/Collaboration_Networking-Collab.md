# Chain Flow
![image](https://git.cybbh.space/net/public/raw/master/modules/networking/slides-v4/images/IPtables.png)

B: Your machine
- Input: A -> B
- Output: B -> C
- Forward: A -> B -> C

# IPTABLE options
```
-t - Specifies the table. (Default is filter)
-A - Appends a rule to the end of the list or below specified rule
-I - Inserts the rule at the top of the list or above specified rule
-R - Replaces a rule at the specified rule number
-D - Deletes a rule at the specified rule number
-F - Flushes the rules in the selected chain
-L - Lists the rules in the selected chain using standard formatting
-S - Lists the rules in the selected chain without standard formatting
-P - Sets the default policy for the selected chain
-n - Disables inverse lookups when listing rules
--line-numbers - Prints the rule number when listing rules
-p - Specifies the protocol
-i - Specifies the input interface
-o - Specifies the output interface
--sport - Specifies the source port
--dport - Specifies the destination port
-s - Specifies the source IP
-d - Specifies the destination IP
-j - Specifies the jump target action
```
Before you flush change default policy

# Syntax

iptables -t [table] -A [chain] [rules] -j [action]
- Table: filter*, nat, mangle
- Chain: INPUT, OUTPUT, PREROUTING, POSTROUTING, FORWARD

-i [ iface ]
-o [ iface ]
-s [ ip.add | network/CIDR ]
-d [ ip.add | network/CIDR ]

-p icmp [ --icmp-type type# { /code# } ]
-p tcp [ --sport | --dport { port1 |  port1:port2 } ]
-p tcp [ --tcp-flags SYN,ACK,PSH,RST,FIN,URG,ALL,NONE ]
-p udp [ --sport | --dport { port1 | port1:port2 } ]

-m state --state NEW,ESTABLISHED,RELATED,UNTRACKED,INVALID
-m mac [ --mac-source | --mac-destination ] [mac]
-p [tcp|udp] -m multiport [ --dports | --sports | --ports { port1 | port1:port15 } ]
-m bpf --bytecode [ 'bytecode' ]
-m iprange [ --src-range | --dst-range { ip1-ip2 } ]

    ACCEPT - Allow the packet

    REJECT - Deny the packet (send an ICMP reponse)

    DROP - Deny the packet (send no response)

    -j [ ACCEPT | REJECT | DROP ]

Flush `iptables -t [table] -F`
Change Default Policy `iptables -t [table] -P [chain] [action]`
List Rule as commands: `iptables -t [table] -S`

# NFTABLES
Replaces:
- iptables
- ip6tables
- arptables
- ebtables

## Chain Types
- filter - to filter packets - can be used with arp, bridge, ip, ip6, and inet families
- route - to reroute packets - can be used with ip and ipv6 families only
- nat - used for Network Address Translation - used with ip and ip6 table families only

## Syntax

### 1. Create Table
```
nft add table [family] [table]
```
- [family] = ip*, ip6, inet, arp, bridge and netdev.
- [table] = user provided name for the table.
### 2. Create the Base Chain
```
nft add chain [family] [table] [chain] { type [type] hook [hook]
    priority [priority] \; policy [policy] \;}
```
* [chain] = User defined name for the chain.

* [type] =  can be filter, route or nat.

* [hook] = prerouting, ingress, input, forward, output or
         postrouting.

* [priority] = user provided integer. Lower number = higher
             priority. default = 0. Use "--" before
             negative numbers.

* ; [policy] ; = set policy for the chain. Can be
              accept (default) or drop.

 Use "\" to escape the ";" in bash
### 3. Create a rule in the chain
```
nft add rule [family] [table] [chain] [matches (matches)] [statement]
```
* [matches] = typically protocol headers(i.e. ip, ip6, tcp,
            udp, icmp, ether, etc)

* (matches) = these are specific to the [matches] field.

* [statement] = action performed when packet is matched. Some
              examples are: log, accept, drop, reject,
              counter, nat (dnat, snat, masquerade)
### Rule Match Options'
ip [ saddr | daddr { ip | ip1-ip2 | ip/CIDR | ip1, ip2, ip3 } ]

tcp flags { syn, ack, psh, rst, fin }

tcp [ sport | dport { port1 | port1-port2 | port1, port2, port3 } ]

udp [ sport| dport { port1 | port1-port2 | port1, port2, port3 } ]

icmp [ type | code { type# | code# } ]

ct state { new, established, related, invalid, untracked }

iif [iface]

oif [iface]

## Modify NFTABLES
nft { list | flush } ruleset

nft { delete | list | flush } table [family] [table]

nft { delete | list | flush } chain [family] [table] [chain]

# NAT & PAT Operators & Chains
![image](https://git.cybbh.space/net/public/raw/master/modules/networking/slides-v4/images/T55_NAT&PAT_Chains.png)
![image](https://git.cybbh.space/net/public/raw/master/modules/networking/slides-v4/images/Source_NAT_image.png)
```
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.0.1 -j SNAT --to 1.1.1.1
```
![image](https://git.cybbh.space/net/public/raw/master/modules/networking/slides-v4/images/T16_Source_NAT_Graphic.png)
```
iptables -t nat -A POSTROUTING -p tcp -o eth0 -s 192.168.0.1 -j SNAT --to 1.1.1.1:9001
```
```
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
```
![image](https://git.cybbh.space/net/public/raw/master/modules/networking/slides-v4/images/Dest_NAT_image.png)
```
iptables -t nat -A PREROUTING -i eth0 -d 8.8.8.8 -j DNAT --to 10.0.0.1
```
![image]()
```
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 22 -j DNAT --to 10.0.0.1:22
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT --to 10.0.0.2:80
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 443 -j DNAT --to 10.0.0.3:443
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080
```
