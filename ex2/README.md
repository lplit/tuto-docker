# Introduction to Isolation

CPU:

1. Build the cpuburn image
2. Run the container and measure its cpu consumption with `docker stats`
3. Find an option in docker to slow down its cpu consumption (ex: 1% of cpu)

Pids:

1. Build the forkbomb image
2. Find a safe option in docker to run this container

https://fr.wikipedia.org/wiki/Fork_bomb
