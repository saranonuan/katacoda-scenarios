## Expose container to the world

Without host port specific

`docker run -d -p 80 nginx:alpine`{{execute interrupt}}

`docker ps`{{execute interrupt}}

With host port specific

`docker run -d -p 8090:80 nginx:alpine`{{execute interrupt}}

Open port 8090 to view nginx home page
https://[[HOST_SUBDOMAIN]]-8090-[[KATACODA_HOST]].environments.katacoda.com/