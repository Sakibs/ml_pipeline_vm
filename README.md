#NECOMA MATATABI Docker image based on Hadoop 2.2.0

based on sequenceiq/docker-hadoop-ubuntu

It contains Apache Hadoop 2.2.0 with LZO native library, Hive 0.13.1, Presto 0.66 with additional HDFS import script and thread analysis scrips, necoma/matatabi_script.

# Build the image

If you'd like to try directly from the Dockerfile you can build the image as:

```
docker build  -t ksideris/presto .
```
# Run with data persistence and exposed HIVE/ PRESTO ports
```
docker run -t -i -p 8080:8080 -p 10000:10000     -v /shared/hdfs:/tmp/hadoop-root/dfs/data     -v /shared/mysql:/var/lib/mysql ksideris/presto

```

