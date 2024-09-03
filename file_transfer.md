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

## FTP
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

##
