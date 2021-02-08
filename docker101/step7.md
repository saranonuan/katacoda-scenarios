## Docker volume example - 
### https://hub.docker.com/r/alchen99/express-hello
### https://github.com/alchen99/express-hello-world

`docker run --rm -p 8080:3000 alchen99/express-hello`{{execute interrupt}}

Try to mount index.html to replace in container
`docker run --rm -p 8080:3000 -v ${PWD}/example-volumes:/opt/hello-world-app/www alchen99/express-hello`{{execute interrupt}}

Open port 8080 to view
https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/
