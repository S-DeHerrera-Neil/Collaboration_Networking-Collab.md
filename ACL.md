![image](https://ptgmedia.pearsoncmg.com/images/chap2_9781587144462/elementLinks/02fig15_alt.jpg)
Data Flow Diagram
![image](https://git.cybbh.space/net/public/raw/master/modules/networking/slides-v4/images/placement4.jpg)
Filtering Locations

A - Generic Firewall Device

B - Setup ACLS 

C - IPS or other intrusion Detection Device

D - Proxy for DMZ and a VPN concentrator

# CISCO ACL
![image](https://git.cybbh.space/net/public/raw/master/modules/networking/slides-v4/images/T4a_ACL_Naming2.jpg)

## Standard ACLs
Rule: Place closest to destination of traffic
```
router(config)# access-list {1-99 | 1300-1999} {permit|deny} {source IP add} {source wildcard mask}
or
router(config)# ip access-list standard [name]
router(config-(ACL NAME))# {permit | deny}  {source ip add}  {source wildcard mask}
```
#### Examples
```
router(config)#  access-list 10 permit host 10.0.0.1
router(config)#  access-list 10 deny 10.0.0.0 0.255.255.255
router(config)#  access-list 10 permit any
```
or
```
router(config)#  ip access-list standard CCTC-STD
router(config-std-nacl)#  permit host 10.0.0.1
router(config-std-nacl)#  deny 10.0.0.0 0.255.255.255
router(config-std-nacl)#  permit any
```

## Extended ACLS
Rule: Place closest to source of traffic
### Numbered
```
router(config)# access-list {100-199 | 2000-2699} {permit | deny} {protocol}
                {source IP add & wildcard} {operand: eq|lt|gt|neq}
                {port# |protocol} {dest IP add & wildcard} {operand: eq|lt|gt|neq}
                {port# |protocol}
or
router(config)# ip access-list extended  [name]
router(config-ext-nacl)# [sequence number] {permit | deny} {protocol}
                         {source IP add & wildcard} {operand: eq|lt|gt|neq}
                         {port# |protocol} {dest IP add & wildcard} {operand:
                         eq|lt|gt|neq} {port# |protocol}
```
#### Examples
```
router(config)# access-list 144 permit tcp host 10.0.0.1 any eq 22
router(config)# access-list 144 deny tcp 10.0.0.0 0.255.255.255 any eq telnet
router(config)# access-list 144 permit icmp 10.0.0.0 0.255.255.255 192.168.0.0
                0.0.255.255 echo
router(config)# access-list 144 deny icmp 10.0.0.0 0.255.255.255 192.168.0.0
                0.0.255.255 echo-reply
router(config)# access-list 144 permit ip any any
```
or
```
router(config)# ip access-list extended CCTC-EXT
router(config-ext-nacl)# permit tcp host 10.0.0.1 any eq 22
router(config-ext-nacl)# deny tcp 10.0.0.0 0.255.255.255 any eq telnet
router(config-ext-nacl)# permit icmp 10.0.0.0 0.255.255.255 192.168.0.0
                         0.0.255.255 echo
router(config-ext-nacl)# deny icmp 10.0.0.0 0.255.255.255 192.168.0.0
                         0.0.255.255 echo-reply
router(config-ext-nacl)# permit ip any any
```
