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
## Apply to Interface
```
router(config)#  interface {type} {mod/slot/port}

router(config)#  ip access-group {ACL# | name} {in | out}

router(config)#  interface s0/0/0

router(config-if)#  ip access-group 10 out

router(config)#  interface g0/1/1

router(config-if)#  ip access-group CCTC-EXT in

router(config)#  line vty 0 15

router(config)#  access-class CCTC-STD i
```
## ACL Uses
Filtering traffic in/out of a network interface.

Permit or deny traffic to/from a router VTY line.

Identify authorized users and traffic to perform NAT.

Classify traffic for Quality of Service (QoS).

Trigger dial-on-demand (DDR) calls.

Control Bandwidth.

Limit debug command output.

Restrict the content of routing updates

## ACL Rules
ne ACL per interface, protocol and direction

Must contain one permit statement

Read top down

Standard ACL generally applied closer to traffic destination

Extended ACL generally applied closer to traffic sourc
# IDS and IPS
![image](https://git.cybbh.space/net/public/raw/master/modules/networking/slides-v4/images/T13_IDSList.jpg)
## SNORT
Installation Directory
```
    /etc/snort
```
Configuration File
```
    /etc/snort/snort.conf
```
Rules Directory
```
    /etc/snort/rules
```
Rule naming
```
[name].rules
```
Default Log Directory
```
/var/log/snort
```
### SNORT run options
```
snort [options]
```
- `-D` to run snort as a daemon
- `-c` to specify a configuration file when running snort
- `-l` specify a log directory
- `-r` to have snort read a pcap file

### Creating a rule
```
[action] [protocol] [s.ip] [s.port] [direction] [d.ip] [d.port] ( match conditions ;)
```
```
* Action - alert, log, pass, drop, or reject
* Protocol - TCP, UDP, ICMP, or IP
* Source IP address - one IP, network, [IP range], or any
* Source Port - one, [multiple], any, or [range of ports]
* Direction - source to destination or both
* Destination IP address - one IP, network, [IP range], or any
* Destination port - one, [multiple], any, or [range of ports]
```
#### rule options
```
* msg:"text" - specifies the human-readable alert message
* reference: - links to external source of the rule
* sid: - used to uniquely identify Snort rules (required)
* rev: - uniquely identify revisions of Snort rules
* classtype: - used to describe what a successful attack would do
* priority: - level of concern (1 - really bad, 2 - badish, 3 - informational)
* metadata: - allows a rule writer to embed additional information about the rule
```
#### payload detection

- `content:"text"` - looks for a string of text.
- `content:"|binary data|"` - to look for a string of binary HEX
- `nocase` - modified content, makes it case insensitive
- `depth: {num}` - specify how many bytes into a packet Snort should search for the
           specified pattern
- `offset: {num}` - skips a certain number of bytes before searching (i.e. offset: 12)
- `distance: {num}` - how far into a packet Snort should ignore before starting to
              search for the specified pattern relative to the end of the
              previous pattern match
- `within: {num}` - modifier that makes sure that at most N bytes are between pattern
            matches using the content keyword

#### non-payload detection

- `flow: {options}` - direction (to/from client and server) and state of connection
         (established, stateless, stream/no stream)
- `ttl: {options}`- The ttl keyword is used to check the IP time-to-live value.
- `tos: {options}` - The tos keyword is used to check the IP TOS field for a specific value.
- `ipopts: {options}` - The ipopts keyword is used to check if a specific IP option is present
- `fragbits: {options}` - Check for R|D|M ip flags.
- `dsize: {options}` - Test the packet payload size
- `seq: {options}` - Check for a specific TCP sequence number
- `ack: {options}` - Check for a specific TCP acknowledge number.
- `flags: {options}` - Check for E|C|U|A|P|R|S|F|0 TCP flags.
- `itype: {options}` - The itype keyword is used to check for a specific ICMP type value.
- `icode: {options}` - The icode keyword is used to check for a specific ICMP code value.

#### post detection
* logto: - The logto keyword tells Snort to log all packets that trigger this rule to
           a special output log file.
* session: - The session keyword is built to extract user data from TCP Sessions.
* react: - This keyword implements an ability for users to react to traffic that
           matches a Snort rule by closing connection and sending a notice.
* tag: - The tag keyword allow rules to log more than just the single packet that
         triggered the rule.
* detection_filter - defines a rate which must be exceeded by a source or destination
                     host before a rule can generate an event.
#### thresholding and suppression options
```
threshold: type [limit | threshold | both], track [by_src | by_dst],
count [#], seconds [seconds]
```
* limit - alerts on the 1st event during defined period then ignores the rest.
* threshold - alerts every [x] times during defined period.
* both - alerts once per time internal after seeing [x] amount of occurrences
         of event. It then ignores all other events during period.
* track - rate is tracked either by source IP address, or destination IP address
* count - number of rule matching in [s] seconds that will cause event_filter
          limit to be exceeded
* seconds - time period over which count is accrued. [s] must be nonzero value
