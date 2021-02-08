## Docker build example 2 - nodejs / express framework
### https://expressjs.com/
\
Review dockerfile \
*Tip: check Dockerfile in https://www.fromlatest.io* 

`example3/Dockerfile`{{open}}

Review code to build

`example3/www/index.html`{{open}}

`example3/www/index.js`{{open}}

`example3/www/package.json`{{open}}

cd into build context

`cd /root/labdocker101`{{execute interrupt}}

run build image and tag *example2-web*

`docker build -t example3-web .`{{execute interrupt}}

try to run, and expose port 8080

`docker run --rm -p 8081:81 example3-web`{{execute interrupt}}

Open port 8081 to view nginx home page
https://[[HOST_SUBDOMAIN]]-8081-[[KATACODA_HOST]].environments.katacoda.com/
