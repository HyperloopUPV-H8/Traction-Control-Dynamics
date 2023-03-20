%% tcp client

HOST = 'localhost';  % Server IP
PORT = 65432;        % Port

t = tcpclient(HOST,PORT)

data = "Hello word!";
write(t,data)