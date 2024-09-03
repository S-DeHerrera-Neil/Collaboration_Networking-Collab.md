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

# SSH Command
