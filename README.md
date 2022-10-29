# Docker Commands Used for assignment

1. To build image for our node app and python app from the same dockerfile.

```
 docker build -t nodejsimage --target image1 .
```

```
 docker build -t pythonimage --target image2 .
```

note: we didnt use ':tag' for our images.hence by default, the tag will be 'latest'

2. To Build containers

```
docker run -p 3000:3000 --name nodejscontainer nodejsimage
```

```
docker run -i -t --name pythoncontainer pythonimage
```

3. To Delete a Container

```
docker rm nodejscontainer

```

4. To Delete an image

```
docker image rm nodejsimage

```
