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
docker run --name mongodb -d --rm  --network multicontainer  mongo
```

<br/>
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
