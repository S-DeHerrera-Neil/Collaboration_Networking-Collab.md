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

## Local Tunnel
![Local](https://github.com/user-attachments/assets/fbfd5351-e14a-4d13-a082-70069532054b)

## Remote (Reverse) Tunnel
![Remote](https://github.com/user-attachments/assets/6d037e08-f937-447c-9ad8-db540ab632a6)

In the provided Example a firewall prevents further tunnelling via SSH, this is avoided by going past the firewall via telnet and setting up a SSH Tunnel via a non-standard port to allow the traffic through

```
# Initial Telnet Traffic to Blue_DMZ_Host-1
telnet student@172.16.1.15
# Tunnel setup from 172.16.1.15
ssh student@10.10.0.40 -R 2222:localhost:22
# Once the tunnel is setup we can traverse past the firewall with the following syntax
ssh student@127.0.0.1:2222
```

## Multi Tunnel
![Multi](https://github.com/user-attachments/assets/53d73afb-d043-41c4-8040-151f5879d42a)

## Proxychains

