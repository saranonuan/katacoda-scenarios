## Run in `interactive mode`

Run *busybox* image tag *1.33.0* version with command *echo "Hello world"*

`docker run busybox:1.33.0 echo "Hello world"`{{execute}}

Try to run in interactive mode

`docker run -i -t busybox:1.33.0`{{execute}}

Try `echo "Hello world"`{{execute}} in the container

Type `exit`{{execute}} to exit container
