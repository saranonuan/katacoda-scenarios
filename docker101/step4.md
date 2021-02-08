## Run in `detached mode`

Run *busybox* image tag *1.33.0* version with command *"sleep 10"* to simulate program running for 10 seconds

`docker run busybox:1.33.0 sleep 10`{{execute}}

Container will run in foreground for 10 sec then exit

try to run in detached mode with argument `-d`

`docker run -d busybox:1.33.0 sleep 10`{{execute}}

Container will detach and run in background for 10 sec then exit

`docker ps -a`{{execute}}

after 10 sec, try ps again

`docker ps -a`{{execute}}

