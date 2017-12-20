# Namespaces

Docker uses Linux namespaces to isolate and virtualize system resources.
The UTS namespaces allow a single system to appear to have different host and domain names to different processes.

1. Build the loop image

`docker build loop -t loop`

2. Run the container in foreground

`docker run -it loop` (interactive tty)

3. In another shell, use `docker exec` to enter the loop container and change its hostname to stop the loop

`docker exec --privileged <container> hostname newname`

or 

`docker exec -u root <container> <command>`

4. Without using `docker exec`, rm the file `rmthisfile` to stop the loop (From the host, explore /var/lib/docker/)

```bash
cd /var/lib/docker
find . -name rmthisfile
/var/lib/docker/overlay2/901cc2c1c559d49042e84fab5aca15d26b543b55433bff76bff9757f555a4066/merged/rmthisfile
/var/lib/docker/overlay2/901cc2c1c559d49042e84fab5aca15d26b543b55433bff76bff9757f555a4066/diff/rmthisfile
rm (...)/merged/rmthisfile
```
