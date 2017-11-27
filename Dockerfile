FROM jupyter/pyspark-notebook

LABEL maintainer="tuan-nng<tuannn.bk@gmail.com>"

USER root

RUN apt update && apt install zip

# spark graphframes
ENV GRAPH_FRAMES_VERSION 0.5.0-spark2.1-s_2.11
RUN wget http://dl.bintray.com/spark-packages/maven/graphframes/graphframes/${GRAPH_FRAMES_VERSION}/graphframes-${GRAPH_FRAMES_VERSION}.jar && \
	unzip graphframes-${GRAPH_FRAMES_VERSION}.jar  && \
	cd graphframes && zip graphframes.zip -r * && \
	mv graphframes.zip ${SPARK_HOME} && \
	cd .. && rm graphframes-${GRAPH_FRAMES_VERSION}.jar

ENV PYTHONPATH ${SPARK_HOME}/graphframes.zip:${PYTHONPATH}
ENV PYSPARK_SUBMIT_ARGS "--packages graphframes:graphframes:${GRAPH_FRAMES_VERSION} pyspark-shell"

USER $NB_USER