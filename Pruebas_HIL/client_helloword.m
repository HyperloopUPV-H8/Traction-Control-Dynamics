%% tcp client

HOST = '127.0.0.1';  % Server IP
PORT = 65432;        % Port

t = tcpclient(HOST,PORT)

data = "Hello word!";
write(t,data)