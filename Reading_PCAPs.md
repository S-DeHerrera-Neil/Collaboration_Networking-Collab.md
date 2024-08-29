# Tcpdump
tcpdump {A} [B:C] {D} {E} {F} {G}

- A = Protocol
- B = Header Byte offset
- C = optional: Byte length. Can be 1, 2, or 4 (default 1)
- D = optional: Bitwise mask ( & )
- E = relational Operator ( = | == | > | < | <= | >= | != | () )
- F = result of expression
- G = optional: Logical Operator ( && || )

### Syntax
```
tcpdump -i {interface} {protocol}[{byte offset}[:byte length]] [Bitwise mask] {=|==|>|<|<=|>=|!=|()} {result of expression} [additional arguments]
```

- `-i {interface}` this specifies the interface that can be found by running `ip addr`, you can also run tcpdump from a file
- `{protocol}[X:X]` the protocol specifes which header tcpdump searches through
- `[{byte offset}:X]` the byte offset specifies at which byte in the header does the program begin reading
- `[X:{byte length}]` the byte length is an optional argument which specifies how many bytes to read, by default it is set to 1
- `[Bitwise mask]` the bitwise mask is an optional argument that allows you to filter the bytes you are looking at:
```
take the example of a header with 0x15 at byte offset 1
0001 0101 (0x15)
1111 0000 (0xF0 bitwise mask)
result:
0001 0000
here only the first 4 bits are unique, this allows you to search for specific bits in a byte
```

### Examples

```
tcpdump -i eth0 'ether[0] & 0x01 = 0x00'
```
Searches the interface "eth0" in the ethernet header, at byte offset 0 and a mask of 0x01 or 0000 0001, to see if the value equals 0x00

# p0f
analyzes packet signatures and finds matches to the database in `/etc/p0f`


# Wireshark
