`example2/Dockerfile`{{open}}

`example2/index.html`{{open}}

`example2/nginx.conf`{{open}}

`cd /root/labdocker101`{{execute interrupt}}

`docker build -t example2-web .`{{execute interrupt}}

`docker run --rm -p 8080:81 example2-web`{{execute interrupt}}
