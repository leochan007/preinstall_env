#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from pyspark.sql import SparkSession

host_ip = 'spark-ui.luomuxinxi.com'

if __name__ == '__main__':

    #.config('spark.kubernetes.container.image', 'leochan007/spark-py:v2.4.3') \

        #.config('spark.kubernetes.pyspark.pythonVersion', '3') \
        #.config('spark.kubernetes.namespace', 'bigdata') \
        #.config('spark.executor.instances', 1) \
        #

    spark = SparkSession.builder \
        .master('spark://%s:7077' % host_ip) \
        .appName('demo') \
        .config('spark.cores.max', 2) \
        .config('spark.jars.packages', 'org.mongodb.spark:mongo-spark-connector_2.11:2.4.1') \
        .config('spark.mongodb.input.uri', 'mongodb://demo:demo@%s:31017/spark.test?authSource=admin' % host_ip) \
        .getOrCreate()

    df = spark.read.format('com.mongodb.spark.sql.DefaultSource').load()

    df.createOrReplaceTempView('test')

    resDf = spark.sql('select * from test')

    resDf.show()

    spark.stop()

    exit(0)
    