# fpm-docker
Docker image with fpm and other build tools.

# Run #

## Interactive mode ##

Example to run interactive shell to use in a project on `host`.

```
docker buid -t sbt-fpm-builder:latest .
docker run -v path_of_project:/var/src/project --rm -it sbt-fpm-builder
```

Where `path_of_project` is path of project in `host` machine

Now you can use `sbt` and/or `fpm`. Remember that with `--rm` option, cache data will be lost.


## Excute sbt ##

Example to run sbt package over project placed physically in  `host`

```
docker build -t sbt-fpm-builder:latest .
docker run -v path_of_project:/var/src/project --rm  sbt-fpm-builder sbt package
```
