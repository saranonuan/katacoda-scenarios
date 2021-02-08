## Clean up

Stop all container

`docker stop $(docker ps -aq)`{{execute}}

Clear stopped container

`docker container prune`{{execute}}

Check

`docker ps -a`{{execute}}
