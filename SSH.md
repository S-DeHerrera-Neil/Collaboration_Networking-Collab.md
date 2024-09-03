# SSH 
## How it works
- Various Implementations (v1 and v2)
- Provides authentication, encryption, and integrity.
- Allows remote terminal sessions
- Can enable X11 Forwarding
- Used for tunneling and port forwarding
- Proxy connections

### Config Files
- Client Configuration File `/etc/ssh/ssh_config`
- Server Configuration File `/etc/ssh/sshd_config`
- Known Hosts File `~/.ssh/known_hosts`

### Architecture
![alt](https://git.cybbh.space/net/public/raw/master/modules/networking/slides-v4/images/ssh_architecture.png)

### Connecting Via SSH
```
student@internet-host:~$ ssh student@172.16.82.106
The authenticity of host '172.16.82.106 (172.16.82.106)' can't be established.
ECDSA key fingerprint is SHA256:749QJCG1sf9zJWUm1LWdMWO8UACUU7UVgGJIoTT8ig0.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '172.16.82.106' (ECDSA) to the list of known hosts.
student@172.16.82.106's password:
student@blue-host-1:~$
```
Key is saved to `/home/student/.ssh/known_hosts`

```
ssh student@172.16.82.106
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
The fingerprint for the ECDSA key sent by the remote host is
SHA256:RO05vd7h1qmMmBum2IPgR8laxrkKmgPxuXPzMpfviNQ.
Please contact your system administrator.
Add correct host key in /home/student/.ssh/known_hosts to get rid of this message.
Offending ECDSA key in /home/student/.ssh/known_hosts:1
remove with:
ssh-keygen -f "/home/student/.ssh/known_hosts" -R "172.16.82.106"
ECDSA host key for 172.16.82.106 has changed and you have requested strict checking.
Host key verification failed.
```
This is what it looks like when the key is changed

to fix this, run:
```
ssh-keygen -f "/home/student/.ssh/known_hosts" -R "172.16.82.106"
```

# Command Syntax

```
ssh user@host
```

## Options
- `-L` Creates a port on the client mapped to a ip:port via the server
- `-D` Creates a port on the client and sets up a SOCKS4 proxy tunnel where the target ip:port is specified dynamically
- `-R` Creates the port on the server mapped to a ip:port via the client
- `-NT` Do not execute a remote command and disable pseudo-tty (will hang window)

## Local Port to Localhost of Server

### Example 1 (Tunnel for SSH)
```
# Creates Tunnel
ssh student@172.16.1.15 -L 1122:localhost:22
```
```
# Uses the tunnel to SSH
ssh student@localhost -p 1122
```
![alt](https://git.cybbh.space/net/public/-/raw/master/networking/modules/08_tunneling/assets/images/local1.png)
### Example 2 (Tunnel for Telnet)
```
# Creates Tunnel
ssh student@172.16.1.15 -L 1123:localhost:23
```
```
# Uses the tunnel for telnet
telnet localhost 1123
```

![alt](https://git.cybbh.space/net/public/-/raw/master/networking/modules/08_tunneling/assets/images/local2.png)

## Local Port to Remote Target Via Server
### Example 1 (Tunnel for SSH)
```
# Creates the Tunnel
ssh student@172.16.1.15 -L 2222:172.16.40.10:22
```
```
# Uses the Tunnel to SSH
ssh student@localhost -p 2222
```
![alt](https://git.cybbh.space/net/public/-/raw/master/networking/modules/08_tunneling/assets/images/local4.png)
### Example 2 (Tunnel for Telnet)
```
# Creates the Tunnel
ssh student@172.16.1.15 -L 2223:172.16.40.10:23
```
```
# Uses the Tunnel for telnet
telnet localhost 2223
```
![alt](https://git.cybbh.space/net/public/-/raw/master/networking/modules/08_tunneling/assets/images/local5.png)

### Example 3 (Tunnel for web browser)
```
# Creates the Tunnel
ssh student@172.16.1.15 -L 2280:172.16.40.10:80
```
```
# Uses the Tunnel to SSH
firefox http://localhost:2280
```
![alt](https://git.cybbh.space/net/public/-/raw/master/networking/modules/08_tunneling/assets/images/local6.png)

## Forward Through Tunnel
### Example 3
```
# Creates the Tunnel
ssh student@172.16.1.15 -L 2222:172.16.40.10:22
ssh student@localhost -p 2222 -L 3322:172.16.82.106:22
```
```
# Uses the Tunnel to SSH
ssh student@localhost -p 3322
```
![alt](https://git.cybbh.space/net/public/-/raw/master/networking/modules/08_tunneling/assets/images/doublelocal1.png)
