# Namespaces

Docker uses Linux namespaces to isolate and virtualize system resources.
The UTS namespaces allow a single system to appear to have different host and domain names to different processes.

1. Build the loop image
2. Run the container in foreground
3. In another shell, use `docker exec` to enter the loop container and change its hostname to stop the loop
