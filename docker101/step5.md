## Clean up

Stop all container

`docker stop $(docker ps -aq)`{{execute interrupt}}

Clear stopped container

`docker container prune`{{execute interrupt}}

Clear unuse image

`docker image prune`{{execute interrupt}}

Check

`docker ps -a`{{execute interrupt}}

`docker images`{{execute interrupt}}

