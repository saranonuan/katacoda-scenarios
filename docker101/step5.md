## Clean up

Stop all container

`docker stop $(docker ps -aq)`{{execute}}

Clear stopped container

`docker container prune`{{execute}}

Clear unuse image

`docker image prune`{{execute}}

Check

`docker ps -a`{{execute}}

`docker images`{{execute}}

