## Docker build example - nginx
### https://nginx.org
\

Review dockerfile \
*Tip: check Dockerfile in https://www.fromlatest.io* 

`example-nginx/Dockerfile`{{open}}

Review code to build

`example-nginx/index.html`{{open}}

`example-nginx/nginx.conf`{{open}}

cd into build context

`cd /root/labdocker101/example-nginx`{{execute}}

run build image and tag *example-nginx-web*

`docker build -t example-nginx-web .`{{execute}}

try to run, and expose port 8080

`docker run --rm -p 8082:80 example-nginx-web`{{execute}}

Open port 8082 to view\
[https://[[HOST_SUBDOMAIN]]-8082-[[KATACODA_HOST]].environments.katacoda.com/](https://[[HOST_SUBDOMAIN]]-8082-[[KATACODA_HOST]].environments.katacoda.com/)
