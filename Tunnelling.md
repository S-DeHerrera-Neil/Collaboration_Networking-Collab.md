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

Example usage of port:
```
proxychains scp student@localhost:secretstuff.txt .
proxychains scp secretstuff.txt student@localhost:
```
