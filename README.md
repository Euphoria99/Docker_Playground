# Multi-Container Apps

## Cross Connection accross Containers using host machine

1)MongoDB

```
docker run --name mongodb --rm -d -p 27017:27017 mongo
```

2)Backend

use `host.docker.internal` in the nodejs app and build the image.

```
docker run --name multibackendC  -d  --rm -p 80:80  multibackend
```

3)Frontend

```
docker run --name multifrontendC  --rm -p 3000:3000   -it multifrontend
```

## Cross Connection accross Containers using Networks

1)MongoDB

```
docker run --name mongodb -d --rm -v data:/data/db  -e MONGO_INITDB_ROOT_USERNAME=pavan -e MONGO_INITDB_ROOT_PASSWORD=pavan --network multicontainer  mongo
```

Exposing port -p 27017:27017 is optional

<br/>

2)Backend

```
docker run --name multibackendC  -d  --rm -p 80:80 --network multicontainer  multibackend
```

React needs the ports of the nodejs app to be exposed inorder to communicate

3)Frontend

```
docker run --name multifrontendC  -p 3000:3000 --rm --network multicontainer  -it multifrontend
```

## With all options like networks, environment variables , volumes and bind mounts.

1)MongoDB

```
docker run --name mongodb \
        -d \
        --rm \
        -v data:/data/db \
        -e MONGO_INITDB_ROOT_USERNAME=pavan \
        -e MONGO_INITDB_ROOT_PASSWORD=pavan \
        --network multicontainer  \
        mongo
```

2)Backend

```
docker run
   --name multibackendC  \
   -d \
   --rm \
   -v F:/projects/Docker/docker_playground/backend/:/app \
   -v logsmultibackend:/app/logs -v /app/node_modules
   -p 80:80 \
   --network multicontainer \
   -e MONGODB_PASSWORD=pavan \
   -e MONGODB_USERNAME=pavan \
    multibackend \
```

3)Frontend

```
docker run
    --name multifrontendC \
    -v F:/projects/Docker/docker_playground/frontend/src/:/app/src \
    -p 3000:3000 \
    --rm \
    --network multicontainer \
    -it multifrontend \
```

Stop all containers

```
docker stop mongodb multibackendC multifrontendC
```
