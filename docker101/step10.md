## Docker compose example
### Example by wordpress setup

`example-wordpress/Dockerfile`{{open}}

cd into build context

`cd /root/labdocker101/example-wordpress`{{execute}}

Start wordpress stack

`docker-compose up -d`{{execute}}

Open port 8089 to view

[https://[[HOST_SUBDOMAIN]]-8089-[[KATACODA_HOST]].environments.katacoda.com/](https://[[HOST_SUBDOMAIN]]-8089-[[KATACODA_HOST]].environments.katacoda.com/)
