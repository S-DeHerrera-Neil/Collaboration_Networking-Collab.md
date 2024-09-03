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

### Active (Default)
![alt](https://git.cybbh.space/net/public/raw/master/modules/networking/slides-v4/images/ftp_active.png)
Unsafe because FTP server initiates communication

### Passive
![alt](https://git.cybbh.space/net/public/raw/master/modules/networking/slides-v4/images/ftp_passive.png)
Designed to fix the issues with Active FTP

