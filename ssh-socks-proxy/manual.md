docker build -t ssh-socks-proxy .

默认端口（1080）：
docker run -d \
  -v /home/user/ssh-socks-proxy:/home/proxyuser/.ssh \
  -p 20168:1080 \
  ssh-socks-proxy

自定义端口（比如 1088）：
docker run -d \
  -v /your/local/ssh-dir:/home/proxyuser/.ssh \
  -e SOCKS_PORT=1088 \
  -p 1088:1088 \
  ssh-socks-proxy


docker run -d \
  --name ssh-socks \
  -v /home/codespace/proxy:/home/proxyuser/.ssh \
  -p 20168:1080 \
  ssh-socks-proxy

curl -x socks5h://127.0.0.1:20168 http://ipinfo.io
curl  http://ipinfo.io

docker rm -f ssh-socks

docker save --output ssh-socks-proxy.tar ssh-socks-proxy:latest
docker image rm ssh-socks-proxy:latest
docker load --input ssh-socks-proxy.tar