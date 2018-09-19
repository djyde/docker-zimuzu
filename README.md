# docker-zimuzu

[字幕组 Linux 客户端](http://app.zimuzu.io/) Docker 镜像

## Install

`DOWNLOAD_DIR` 替换成你的本地目录路径

```bash
sudo docker run djyde/docker-zimuzu -d --name zimuzu -p 3001:3001 -v /DOWNLOAD_DIR:/data
```

## Build

```bash
sudo docker build . -t djyde/docker-zimuzu
```