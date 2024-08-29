# Stream vs Datagram Sockets
Stream is used with TCP where Datagram sockets are used with UDP

# User Space vs Kernel Space Sockets
User Space used with user applications and raw sockets are used in the kernel space

socket.socket( *family*, *type*, *proto*)
- family:
  - AF_INET*, AF_INET6, AF_UNIX
- type:
  - SOCK_STREAM*, SOCK_DGRAM, SOCK_RAW
- proto:
  - 0*, IPPROTO_TCP, IPPROTO_UDP, IPPROTO_IP, IPPROTO_ICMP, IPPROTO_RAW

\* These are the default

# Examples
- [stream_socket_demo.py](Socket_Scripts/stream_socket_demo.py)
- [datagram_socket_demo.py](Socket_Scripts/datagram_socket_demo.py)
- [stream_socket_receiver_demo.py](Socket_Scripts/stream_socket_receiver_demo.py)
- [ipraw.py](Socket_Scripts/ipraw.py)
- [tcpraw.py](Socket_Scripts/tcpraw.py)
