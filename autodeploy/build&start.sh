docker build -f Dockerfile -t server_probe .
docker run -d --restart=always --name=server_probe -v ~/config.json:/ServerStatus/server/config.json -p 9000:80 -p 35601:35601 server_probe
