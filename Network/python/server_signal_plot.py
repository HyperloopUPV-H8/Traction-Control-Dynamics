# echo-server.py

import socket
#import matplotlib.pyplot as plt

HOST = 'localhost'  # Standard loopback interface address (localhost)
PORT = 65432  # Port to listen on (non-privileged ports are > 1023)

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((HOST, PORT))
    s.listen()
    conn, addr = s.accept()
    with conn:
        print(f"Connected by {addr}")
        while True:
            data = conn.recv(1024)
            print(f"Received {data!r}")
            if not data:
                break
            conn.sendall(data)

#x = [1 2 3]
#plt.plot(x,data)