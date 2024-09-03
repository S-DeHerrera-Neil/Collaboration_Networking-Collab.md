# [Cyberchef](https://gchq.github.io/CyberChef/)
Extensive web tool to encode and decode

# [Emn178.github.io/online-tools](https://emn178.github.io/online-tools/)
Collection of online tools, primarily hashing, encryption, and a few QOL tools
# xxd

```
echo "message" | xxd
```

```
xxd -r file-encoded.txt file-decodedd
```

hex



## Base64
### via terminal
```
base64 file.txt > file-encoded.txt
base64 -d file-encoded.txt > file-decoded.txt
```
### via python
```
import base64
# <insert code here>
message = b'Message'
hidden_msg = base64.b64encode(message)
```

# Hashing
## md5sum
```
md5sum file
echo "text" | md5sum
cat file | md5sum
```
