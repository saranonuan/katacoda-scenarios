## Docker build example

Review dockerfile \
*Tip: check Dockerfile in https://www.fromlatest.io* 

`example2/Dockerfile`{{open}}

Review code to build

`example2/index.html`{{open}}

`example2/nginx.conf`{{open}}

cd into build context

`cd /root/labdocker101`{{execute interrupt}}

run build image and tag *example2-web*

`docker build -t example2-web .`{{execute interrupt}}

try to run, and expose port 8080

`docker run --rm -p 8080:81 example2-web`{{execute interrupt}}
