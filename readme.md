# [dclong/deepin](https://hub.docker.com/r/dclong/deepin/)

Deepin desktop environment in Docker.

## Usage in Linux/Unix

Please refer to the Section
[Usage](http://www.legendu.net/en/blog/my-docker-images/#usage)
of the post [My Docker Images](http://www.legendu.net/en/blog/my-docker-images/) 
for detailed instruction on how to use the Docker image.

The following command starts a container 
and mounts the current working directory and `/home` on the host machine 
to `/workdir` and `/home_host` in the container respectively.
```
docker run -d \
    --name jupyterhub-ds \
    --log-opt max-size=50m \
    -p 8000:8000 \
    -p 5006:5006 \
    -v `pwd`:/workdir \
    -v `dirname $HOME`:/home_host \
    dclong/deepin
```
The following command (only works on Linux) does the same as the above one 
except that it limits the use of CPU and memory.
```
docker run -d \
    --name jupyterhub-ds \
    --log-opt max-size=50m \
    --memory=$(($(head -n 1 /proc/meminfo | awk '{print $2}') * 4 / 5))k \
    --cpus=$((`nproc` - 1)) \
    -p 8000:8000 \
    -p 5006:5006 \
    -v `pwd`:/workdir \
    -v `dirname $HOME`:/home_host \
    dclong/deepin
```

## [Detailed Information](http://www.legendu.net/en/blog/my-docker-images/#list-of-images-and-detailed-information) 

## [Use the JupyterHub Server](http://www.legendu.net/en/blog/my-docker-images/#use-the-jupyterhub-server)

## [Add a New User to the JupyterHub Server](http://www.legendu.net/en/blog/my-docker-images/#add-a-new-user-to-the-jupyterhub-server)

## [Known Issues](http://www.legendu.net/en/blog/my-docker-images/#known-issues)

## [About the Author](http://www.legendu.net/pages/about)
