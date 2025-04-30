运行示例
启动一个 iperf3 服务端：

docker run -d --name iperf3-server -p 5201:5201 my-iperf3

启动一个客户端测试（例如测试本机服务端）：

docker run --rm my-iperf3 -c host.docker.internal

或者你可以使用服务器的 IP 地址：

docker run --rm my-iperf3 -c 192.168.1.100