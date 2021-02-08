## Run in `interactive mode`

Run *busybox* image tag *1.33.0* version with command *echo "Hello world"*

`docker run busybox:1.33.0 echo "Hello world"`{{execute interrupt}}

Try to run in foreground mode

`docker run -i -t busybox:1.33.0`{{execute interrupt}}

Try `echo "Hello world"`{{execute interrupt}} in the container

Type `exit`{{execute interrupt}} to exit container
