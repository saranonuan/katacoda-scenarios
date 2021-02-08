## Docker build example - nodejs / express framework
### https://expressjs.com/
\
Review dockerfile \
*Tip: check Dockerfile in https://www.fromlatest.io* 

`example-expressjs/Dockerfile`{{open}}

Review code to build

`example-expressjs/www/index.html`{{open}}

`example-expressjs/www/index.js`{{open}}

`example-expressjs/www/package.json`{{open}}

cd into build context

`cd /root/labdocker101`{{execute interrupt}}

run build image and tag *example2-web*

`docker build -t example-expressjs .`{{execute interrupt}}

try to run, and expose port 8081

`docker run --rm -p 8081:3000 example-expressjs`{{execute interrupt}}

Open port 8081 to view
https://[[HOST_SUBDOMAIN]]-8081-[[KATACODA_HOST]].environments.katacoda.com/
