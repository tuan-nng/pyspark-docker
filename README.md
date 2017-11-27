# pyspark-docker
This build extends [pyspark-notebook](https://github.com/jupyter/docker-stacks/tree/master/pyspark-notebook) to add graphframes.

## What It Gives You
* All the features from [pyspark-notebook](https://github.com/jupyter/docker-stacks/tree/master/pyspark-notebook)
* graphframes pre-installed

## Basic Use
`docker build -t "pyspark-notebook"` to build the image.

`docker run -it -p 8888:8888 --name my-pyspark-notebook pyspark-notebook` to start a container with the Notebook server.
