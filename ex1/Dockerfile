FROM gcc
#COPY hello_world.sh /hello_world.sh
COPY hello_world.c /hello_world.c
RUN gcc -o lel hello_world.c && /lel
ENTRYPOINT [ "/lel" ]