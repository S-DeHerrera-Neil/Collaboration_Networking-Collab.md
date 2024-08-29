# Network Reconnaissance
![alt](https://git.cybbh.space/net/public/raw/master/modules/networking/slides-v4/images/recon.png)


## Passive External (OSINT)
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

## Terminology
### Passive (not usually detectable by adversary)
### Active (detectable recon: ssh, nmap, traceroute, etc)
### Internal (operating on local network)
### External (operating on external network)
