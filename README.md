#NECOMA MATATABI Docker image based on Hadoop 2.2.0

based on sequenceiq/docker-hadoop-ubuntu

It contains Apache Hadoop 2.2.0 with LZO native library, Hive 0.13.1, Presto 0.66 with additional HDFS import script and thread analysis scrips, necoma/matatabi_script.

# Build the image

If you'd like to try directly from the Dockerfile you can build the image as:

```
docker build  -t necoma/matatabi
```
# Pull the image

The image is also released as an official Docker image from Docker's automated build repository - you can always pull or refer the image when launching containers.

```
docker pull necoma/matatabi
```

# Start a container

In order to use the Docker image you have just build or pulled use:

```
docker run -i -t necoma/matatabi /etc/bootstrap.sh -bash
```

## Testing

You can run one of the stock examples:

```
# run presto CLI
presto
presto:default> select * from sys.node;
```

## Automate everything

As we have mentioned previously, a Docker file was created and released in the official [Docker repository](https://registry.hub.docker.com/u/necoma/matatabi/)
