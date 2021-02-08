## Example 1

Run `busybox` image tag `1.33.0` version with command `echo "Hello world"`

`docker run busybox:1.33.0 echo "Hello world"`{{execute interrupt}}

List all local images

`docker images`{{execute interrupt}}

List all running container

`docker ps`{{execute interrupt}}

Try to stop running container

`docker stop CONTAINER_ID`{{copy}}

Try to remove stopped container

`docker rm CONTAINER_ID`{{copy}}

Try to run 

