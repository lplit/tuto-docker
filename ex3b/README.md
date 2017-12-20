# Namespaces

0. Build nsenter
1. Build the bomb image
2. Run the container in background (with the safe option saw in ex2)
3. Use `nsenter` to enter the bomb's UTS namespaces and change its hostname to stop the bomb (Why would `docker exec` fail to change the hostname?)
4. Check if the bomb container exited correctly (`docker ps -a` should return exit 0, `docker logs` should have "Bomb has been defused")

You might want to automate the steps.

# Snippets

Remove dangling images

Docker images consist of multiple layers. Dangling images are layers that have no relationship to any tagged images. They no longer serve a purpose and consume disk space. They can be located by adding the filter flag, `-f` with a value of `dangling=true` to the docker images command. When you're sure you want to delete them, you can add the `-q` flag, then pass their ID to docker rmi: 

List:

```bash
docker images -f dangling=true
```

Remove:

```bash
docker rmi $(docker images -f dangling=true -q)
```