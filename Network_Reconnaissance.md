# Network Reconnaissance
![alt](https://git.cybbh.space/net/public/raw/master/modules/networking/slides-v4/images/recon.png)


## Passive External (OSINT) THIS IS OUT OF THE SCOPE OF THIS COURSE!
### IP Registry Information
- [IANA IPv4](https://www.iana.org/assignments/ipv4-address-space/ipv4-address-space.xhtml)
- [IANA IPv6](https://www.iana.org/assignments/ipv6-unicast-address-assignments/ipv6-unicast-address-assignments.xhtml)

### DNS Lookup
- [whois.domaintools.com](http://whois.domaintools.com/)
- [arin.net](https://search.arin.net/rdap/)
- [viewdns.info](http://viewdns.info/)
- [dnsdumpster.com](https://dnsdumpster.com/)
- [centralops.net](https://centralops.net/co/)

### URL Scan
- [sitereport.netcraft.com](https://sitereport.netcraft.com/)
- [web-check.xyz](https://web-check.xyz/)
- [web-check.as93.net](https://web-check.as93.net/)
- [urlscan.io](https://urlscan.io/)

### IP GeoLocation
- [maxmind.com](https://www.maxmind.com/en/locate-my-ip-address/)
- [iplocation.io](https://iplocation.io/)
- [iplocation.net](https://www.iplocation.net/ip-lookup/)
- [infosniper.net](https://infosniper.net/)

### BGP prefixes
- [bgpview.io](https://bgpview.io/)
- [hackertarget.com](https://hackertarget.com/as-ip-lookup/)
- [bgp.he.net](https://bgp.he.net/)
- [bgp4.as](https://www.bgp4.as/tools/)

### Identifying people
- Crawler tools ([Maltego](https://www.maltego.com/) or [Creepy](https://www.geocreepy.com/))
- [Search Engines](https://en.wikipedia.org/wiki/List_of_search_engines)
- [Social Media](https://en.wikipedia.org/wiki/List_of_social_networking_services)
- [Job Portals](https://en.wikipedia.org/wiki/List_of_employment_websites)

### Identfying Technologies
- [File extensions](https://en.wikipedia.org/wiki/List_of_filename_extensions)
- [Server responses](https://websiteguidelines.com/guides/different-types-of-web-servers/)
- [Website content](https://dorik.com/blog/how-to-tell-what-website-builder-was-used)
- [Google Hacking](https://gist.github.com/sundowndev/283efaddbcf896ab405488330d1bbc06)
- [MAC OUI Lookup](https://macaddress.io/)

### Helpful links
- [OSINT Framework](https://osintframework.com/)
- [Pentest-Standard](http://www.pentest-standard.org/index.php/Intelligence_Gathering)
- [SecuritySift](https://www.securitysift.com/passive-reconnaissance/)

### DNS Scanning
#### Whois
queries DNS registrar over TCP 43
```
whois zonetransfer.me
```
#### Dig
queries DNS server over UDP 53
```
dig zonetransfer.me A # ipv4 records
dig zonetransfer.me AAAA # ipv6 records
dig zonetransfer.me MX # mail server records
dig zonetransfer.me TXT
dig zonetransfer.me NS # Name server records
dig zonetransfer.me SOA # Start of Authority Records
```

```
dig axfr @nsztm1.digi.ninja zonetranfer.me 
```
shows an example of a zone tranfer from the `nsztm1.digi.ninja` SOA server on the `zonetransfer.me` domain 

Note: Technically zone transfers are considered 
#### [netcraft.com](https://sitereport.netcraft.com)
web based alternative to dig and whois

### Historical Content
- [Wayback Machine](http://archive.org/web/)

### Google Searches
- [List of filters](https://gist.github.com/sundowndev/283efaddbcf896ab405488330d1bbc06)
- [Dork Search](https://dorksearch.com/)

### Shodan
- [Shodan.io](https://www.shodan.io/)

### Passive OS Fingerprinter (P0F)
```
more /etc/p0f/p0f.fp
sudo p0f -i eth0
sudo p0f -r test.pcap
```

## Active External

### Ping
```
ping 172.16.82.106 -c 1
```
individual ping - ping one ip once

```
for i in {1..254}; do (ping -c 1 172.16.82.$i | grep "bytes from" &) ; done
```
ping sweep - pings all ips 172.16.82.1 to 172.16.82.254

### NMAP
[Nmap guide](https://nmap.org/book/man.html)
```
nmap -sS -O -T4 -Pn -n X.X.X.X -p1-1024 
```

#### [Scan Types](https://nmap.org/book/man-port-scanning-techniques.html)
- "Half connect" SYN scan `-sS`
- Full connect scan `-sT`
- Null scan `-sN`
- FIN scan `-sF`
- XMAS tree scan `-sX`
- UDP scan `-sU`
- Idle scan `-sI`
- Broadcast Ping `-sP`
- Ping sweep `-PE`

#### [Speed Options](https://nmap.org/book/man-performance.html)
- `T5` - Insane - 250 ms
- `T4` - Aggressive - 500 ms
- `T3` - Normal - 1 sec

#### [Additional Args](https://nmap.org/book/man-misc-options.html)
- Version scan `-sV`
- OS Fingerprinting `-O`
- Skip Ping `-Pn`

### Traceroute
[Traceroute man page](https://ss64.com/bash/traceroute.html)
```
traceroute 172.16.82.106
traceroute 172.16.82.106 -p 123
sudo traceroute 172.16.82.106 -I # Use ICMP ECHO for probes
sudo traceroute 172.16.82.106 -T # User TCP SYN for probes
sudo traceroute 172.16.82.106 -T -p 443
```

### Netcat
```
#!/bin/bash
echo "Enter network address (e.g. 192.168.0): "
read net
echo "Enter starting host range (e.g. 1): "
read start
echo "Enter ending host range (e.g. 254): "
read end
echo "Enter ports space-delimited (e.g. 21-23 80): "
read ports
for ((i=$start; $i<=$end; i++))
do
    nc -nvzw1 $net.$i $ports 2>&1 | grep -E 'succ|open'
done
```
Script for automating TCP network scans

```
#!/bin/bash
echo "Enter network address (e.g. 192.168.0): "
read net
echo "Enter starting host range (e.g. 1): "
read start
echo "Enter ending host range (e.g. 254): "
read end
echo "Enter ports space-delimited (e.g. 21-23 80): "
read ports
for ((i=$start; $i<=$end; i++))
do
    nc -nuvzw1 $net.$i $ports 2>&1 | grep -E 'succ|open'
done
```
Script for automating UDP network scans

```
nc 172.16.82.106 80
```
use `get`, `head`, `get-banner` to grab website information

### CURL and WGET
tools to interact with HTTP, HTTPS, and FTP

```
curl http://172.16.82.106
curl ftp://172.16.82.106
curl ftp://172.16.82.106:8080 # specify port if it is non-standard
```

```
wget -r http://172.16.82.106
wget -r ftp://172.16.82.106
wget -r ftp://172.16.82.106:8080
```

**WGET is recommended over CURL**

### FTP
```
ftp 10.10.10.10
```

in FTP session, to use commands on local machine add the letter 'l' to the start of the command, I.E: `ls` becomes `lls`

### IP Config
```
Windows: ipconfig /all
Linux: ip address (ifconfig depreciated)
VyOS: show interface
```
### DNS configuration
```
Windows: ipconfig /displaydns
Linux: cat /etc/resolv.conf
```
### ARP Cache
```
Windows: arp -a
Linux: ip neighbor (arp -a depreciated)
```
### Active Internal Network Reconnaissance

    Will use similar tools as Active External Network Reconnaissance

    Scope and addresses may differ

### ARP Scanning
```
arp-scan --interface=eth0 --localnet
nmap -sP -PR 172.16.82.96/27
```
### Ping Scanning
```
ping -c 1 172.16.82.106
for i in {1..254}; do (ping -c 1 172.16.82.$i | grep "bytes from" &) ; done
sudo nmap -sP 172.16.82.96/27
```

### Network Connections
```
Windows: netstat -ano
Linux: ss -ntlp
```
### Service Files
```
Windows: %SystemRoot%\system32\drivers\etc\services
Linux/Unix: /etc/services
```
### OS Information
```
Windows: systeminfo
Linux: uname -a and /etc/os-release
```
### Running Processes
```
Windows: tasklist
Linux: ps -elf or top
```

## Active Internal
Same as Active External except for:

### DEV TCP
```
exec 3<>/dev/tcp/172.16.82.106/22; echo -e "" >&3; cat <&3
```
Banner grab
```
for p in {1..1023}; do(echo >/dev/tcp/172.16.82.106/$p) >/dev/null 2>&1 && echo "$p open"; done
```
Scan all ports
## Network Mapping Tools

[draw.io](https://app.diagrams.net/) ----- [template](https://1drv.ms/u/s!Arz6vf8sVG8vgpMsQ1RRtb0rcP7x4w?e=R9tlao)

## Terminology
### Passive (not usually detectable by adversary)
### Active (detectable recon: ssh, nmap, traceroute, etc)
### Internal (operating on local network)
### External (operating on external network)
