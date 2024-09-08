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
ssh-keygen -f "/home/student/.ssh/known_hosts" -R "172.16.82.106" <<<< THIS IS THE COMMAND TO REMOVE THIS ERROR MESSAGE
ECDSA host key for 172.16.82.106 has changed and you have requested strict checking.
Host key verification failed.
```
This is what it looks like when the key is changed

to fix this, run the provided command which in this example is:
```
ssh-keygen -f "/home/student/.ssh/known_hosts" -R "172.16.82.106"
```

# Command Syntax

```
ssh [user@]{host} [-L localport:send_traffic_to:destport] [-R remoteport:send_traffic_to:destport] [-D 9050] [-NT]
```

## Options
- `-L` Creates a port on the client mapped to a ip:port via the server
- `-D` Creates a port on the client and sets up a SOCKS4 proxy tunnel where the target ip:port is specified dynamically
- `-R` Creates the port on the server mapped to a ip:port via the client
- `-NT` Do not execute a remote command and disable pseudo-tty (will hang window)

# Local Tunnel `-L`
## End-to-End
![Local_Tunnel_SSH_End-to-End](https://github.com/user-attachments/assets/a876de72-44bd-4824-ada1-a4c5b3af61f7)
```
internet Host> ssh netX_studentXX@172.16.1.15 -L 1111:127.0.0.1:22
```
Explanation
- This command creates an ssh tunnel to user `netX_studentXX` on `172.16.1.15`
- The `-L` specifies that a port `1111` will be opened on your "local" machine, which in this case is the internet host
- The `127.0.0.1` states where the traffic will be forwarded after it reaches the BLUE_DMZ_Host_1, in this case we want to keep it on the DMZ_Host so we give a loopback ip
- The `22` specifies the destination port

```
internet Host> ssh netX_studentXX@127.0.0.1 -p 1111 -D 9050
```
Explanation
- This command creates a dynamic tunnel through an existing tunnel accessed via the internet host loopback `127.0.0.1` on port `1111`
- The `-D 9050` specifies we will be sending data from port 9050 (which is the default port for proxychains)

## Forwarding
![Local_Tunnel_SSH_Forwarding](https://github.com/user-attachments/assets/aaeb5452-42d3-41c8-977f-7ebe039b6f58)
```
internet Host> ssh netX_studentXX@172.16.1.15 -L 1111:172.16.40.10:22
```
Explanation
- This command creates an ssh tunnel to user `netX_studentXX` on `172.16.1.15` (BLUE_DMZ_Host-1)
- The `-L` specifies that a port `1111` will be opened on your "local" machine, which in this case is the internet host
- The `172.16.40.10` states where the traffic will be forwarded after it reaches the BLUE_DMZ_Host_1, in this case we want to forward traffic to the BLUE_INT_DMZ_Host-1
- The `22` specifies the destination port, in reference to the DMZ_Host

```
internet Host> ssh netX_studentXX@127.0.0.1 -p 1111 -D 9050
```
Explanation
- This command creates a dynamic tunnel through an existing tunnel accessed via the internet host loopback `127.0.0.1` on port `1111`
- The `-D 9050` specifies we will be sending data from port 9050 (which is the default port for proxychains)
# Remote Tunnel `-R`
## End-to-End
![Remote_Tunnel_SSH_End-to-End](https://github.com/user-attachments/assets/3a78630b-4699-4973-b7d8-66740b57153e)

## Forwarding
![Remote_Tunnel_SSH_Forwarding](https://github.com/user-attachments/assets/65ca38f5-fdfc-41f4-a9df-9359f0c7518d)

# Complex Scenarios
## Joining Tunnels
![Joining_Tunnels](https://github.com/user-attachments/assets/c72aa4b8-ded0-4dd7-a423-598f35cb9e0b)

## Tunnel-in-a-tunnel
![Tunnel_in_a_Tunnel](https://github.com/user-attachments/assets/4c949f6c-d0d6-44e7-9fa3-c95d5df4e39d)


