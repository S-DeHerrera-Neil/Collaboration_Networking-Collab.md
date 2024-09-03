## Local Port Forward
```
ssh student@172.16.82.106 -L 1111:localhost:22 -NT
```

Example usage of port:
```
scp -P 1111 student@localhost:secretstuff.txt /home/student
scp -P 1111 secretstuff.txt student@localhost:/home/student
```

## Dynamic Port Forward
```
ssh student@172.16.82.106 -D 9050 -NT
```
forwards traffic on local port 9050 to remote host 172.16.82.106

Example usage of port (proxychains uses port 9050 by default):
```
proxychains scp student@localhost:secretstuff.txt .
proxychains scp secretstuff.txt student@localhost:
```

# Types of Tunnels

## Ipv6 over Ipv4

RFC 3056
- Permits IPv6 to be encapsulated in order to move through a IPv4 network
- Done by the Dual Stack Router
- Payload is not generally encrypted
- IPSEC commonly used to secure the payloads

## Dual Stack
- Configures an IPv4 and IPv6 address on all devices
- Resource intensive
- Allows for IPv4 and IPv6 routing because it has the addresses already set
- Can use both but not interchangeably

## SSH Tunnels

### Syntax
```

```
### Options
    -L - Creates a port on the client mapped to a ip:port via the server

    -D - Creates a port on the client and sets up a SOCKS4 proxy tunnel where the target ip:port is specified dynamically

    -R - Creates the port on the server mapped to a ip:port via the client

    -NT - Do not execute a remote command and disable pseudo-tty (will hang window)

### Examples

```
ssh -p <optional alt port> <user>@<server ip> -L <local bind port>:<tgt ip>:<tgt port> -NT

or

ssh -L <local bind port>:<tgt ip>:<tgt port> -p <alt port> <user>@<server ip> -NT
```
Local Port Forwarding



```
Internet_Host:
ssh student@172.16.1.15 -L 1122:localhost:22
or
ssh -L 1122:localhost:22 student@172.16.1.15
```
```
Internet_Host:
ssh student@localhost -p 1122
Blue_DMZ_Host-1~$
```
![alt](https://git.cybbh.space/net/public/-/raw/master/networking/modules/08_tunneling/assets/images/local1.png)

Local Port Forward to localhost of server

```
ssh <user>@<server ip> -p <alt port> -D <port> -NT
or
ssh -D <port> -p <alt port> <user>@<server ip> -NT
```
Dynamic Port Forwarding

```
Internet_Host:
ssh student@172.16.1.15 -L 2222:172.16.40.10:22
or
ssh -L 2222:172.16.40.10:22 student@172.16.1.15
```
```
Internet_Host:
ssh student@localhost -p 2222
Blue_INT_DMZ_Host-1~$
```
![alt](https://git.cybbh.space/net/public/-/raw/master/networking/modules/08_tunneling/assets/images/local4.png)

Local Port Forward to remote target via server


```
Internet_Host:
ssh student@172.16.1.15 -L 2222:172.16.40.10:22
ssh student@localhost -p 2222 -L 3322:172.16.82.106:22
```
```
Internet_Host:
ssh student@localhost -p 3322
Blue_Host-1~$
```
![alt](https://git.cybbh.space/net/public/-/raw/master/networking/modules/08_tunneling/assets/images/doublelocal1.png)

Forward through Tunnel
