## Expose container to the world
\
Without host port specific

`docker run -d -p 80 nginx:alpine`{{execute}}

`docker ps`{{execute}}

With host port specific

`docker run -d -p 8090:80 nginx:alpine`{{execute}}

Open port 8090 to view\
[https://[[HOST_SUBDOMAIN]]-8090-[[KATACODA_HOST]].environments.katacoda.com](https://[[HOST_SUBDOMAIN]]-8090-[[KATACODA_HOST]].environments.katacoda.com)
