# When to setup a dynamic?
part of recon, find ports (services)

setup dynamic portforward (proxychains) to move further into network (netcat scan script, wget, etc)

Don't do tunnels through proxychains as that will close once the dynamic tunnel is reset

# What tools do I have on a box

You are given only what you need

when you need to send tcp traffic it should be sent from internet host

when you need to sniff (tcpdump) it will be done on the remote device

# Making TCP dump more readable
```
tcpdump -XX -n -i [ethX or any] -e 'expression' -vv
```
`-XX` gives hex and ascii output (useful for reading messages)
`-vv` shows more details about traffic

# Can I use `-w` to write tcpdump to a pcap file

It may be possible if a directory such as `/tmp` is avaliable you can write it there

HOWEVER, it will never be too much to have to write it too a file

# Keeping track of tunnels

Draw it on paper or on draw.io

Whenever you make a portforward put it on your map

USE A MAP!

# Finding neighboors

```
arp -a
```
```
ip neighboor
```
Cross reference `arp -a` or `ip neighboor` and with ping sweep or netcat scan

# Transferring files
```
ftp X.X.X.X
```
best option - if it is visible

YOU MUST SET IT TO PASSIVE AFTER LOGGING IN (run `passive`)

commands:
- `ls -lisa` list directory
- `pwd` print working directory
- `cd` change directory
- `get [filepath]` download a file
- `put [filepath]` upload a file

```
scp user@X.X.X.X:sourcefile destination
or
scp sourcefile user@X.X.X.X:destfile
```

Its better to download pcaps to workstation and not the internet host because it has more resources

# Test
Easy Box -- Medium Box -- Hard Box

# wget
```
wget -r [ftp | http]://X.X.X.X:XX
```
if http is 7777 you can write the command as `wget -r http://X.X.X.X:7777`

# Tips
- Don't overthink shit
- Capstone should develop your methodology for the test, figure out what the steps are
- Make sure your shit (terminals) are organized
- Use `-NT` to make sure you don't mess up your terminals
- Expect knowledge questions take good notes
