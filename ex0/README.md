# Hello Docker World

By now you should already have installed docker (if not, check [https://www.docker.com/get-docker](https://www.docker.com/get-docker))

Lets boot your first container:

```
docker run -ti ubuntu 
# -t Allocate a pseudo-TTY
# -i Keep STDIN open
# why ubuntu? fine, debian or alpine or busybox...
```

Feel free to run any commands... you are in a container after all.

```
ls /proc
echo b > /proc/sysrq-trigger
shutdown now
```

Run `exit` or hold `ctrl-D` when you are done.

# Wordpress

Ok lets run a real application now.

```
docker run -d -p 80 wordpress
# -d Run container in background and print container ID
# -p Publish a container's port(s) to the host
```

Now rush to [http://localhost](http://localhost)!!!

You can run multiple instances of wordpress!!!

```
docker run -d -p 80 wordpress
docker run -d -p 80 wordpress
```

But? Wait... You can't reach them through [http://localhost](http://localhost) right?
More over how could they all listen on the same 80 port!

Try `docker ps`.
It lists all the running containers.
In the `PORT` column, you should see something like `0.0.0.0:XXXXX->80/tcp`.
Docker randomize the listening port, even if the application asked for the same 80 port.
You can specify the port like this `docker run -d -p 8080:80 wordpress`, now the container should be reachable [http://localhost:8080](http://localhost:8080).

Try to reach the firsts wordpress containers.

Now is good time to check the following commands:
* `docker logs [id|name]`
* `docker rename [id|name] [newname]` (by default, containers name are adjective_noun)
* `docker stats`
* `docker pause [id|name]` (freezes the processes)
* `docker unpause [id|name]`
* `docker stop [id|name]` (send signal)
* `docker start [id|name]`
* `docker restart [id|name]`
