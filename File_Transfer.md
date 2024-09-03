# File Transfer Methods

- TFTP
- FTP
  - Active
  - Passive
- FTPS
- SFTP
- SCP

## TFTP
- RC 1350 Rev2
- Uses UDP 69
- Insecure
- Simple with limited functionality

## [FTP](https://ss64.com/bash/ftp.html)
- RC 959
- TCP 20 (control), TCP 21 (data)
- requires login, but login information is plaintext
- creates a shell on the FTP host which allows you to traverse directories

Note: if you see a message `500 Illegal PORT command` try switching from active to passive with the command `PASV`

### Active (Default)
Unsafe because FTP server initiates communication
![alt](https://git.cybbh.space/net/public/raw/master/modules/networking/slides-v4/images/ftp_active.png)


### Passive
Designed to fix the issues with Active FTP
![alt](https://git.cybbh.space/net/public/raw/master/modules/networking/slides-v4/images/ftp_passive.png)

## FTPS
- Adds encryption (SSL/TLS) to FTP
- For connections on TCP 20/21 encryption is optional
- For connections on TCP 989/990 encryption is mandatory

## SFTP
- TCP 22
- Adds FTP like features to SSH

## [SCP](https://ss64.com/bash/scp.html)
- TCP 22
- Allows simple file transfer (think TFTP) via SSH

### Syntax

```
scp [-p <alternate port>] <file to grab> <where to send>
```

Options:
- `-v` verbose mode
- `-P` alternate port
- `-r` recursively copy directory
- `-3` 3-way copy (instead of copying directly between 2 hosts, the file is downloaded to local host then sent from local host)
  - Remote host 1 -> Local Machine
  - Local Machine -> Remote host 2

### Examples
```
scp /home/scpuser/myfile.txt student@10.10.10.10:/home/client/
```
 sends file from local machine to remote client

```
scp student@10.10.10.10:/home/client/myfile.txt .
```
grabs file from remote client to present working directory

```
scp student@10.10.10.10:/home/client/myfile.txt admin@10.10.11.0:/user/admin/stuff
```
from `10.10.10.10` `myfile.txt` is sent directly to `10.10.11.0`

```
scp -3 student@10.10.10.10:/home/client/myfile.txt admin@10.10.11.0:/user/admin/stuff
```
grabs file from `10.10.10.10` downloads it to local machine, then from the local machine it sends the file to `10.10.11.0`

Note: you will have to sign into both machines

```
proxychains scp student@localhost:secretstuff.txt .
proxychains scp secretstuff.txt student@localhost:
```
Use proxychains to scp over a port forward
