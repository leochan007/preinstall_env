#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from pyspark.sql import SparkSession

if __name__ == '__main__':

    #.config('spark.kubernetes.container.image', 'leochan007/spark-py:v2.4.3') \

    spark = SparkSession.builder \
        .master('spark://stg-b1:7077') \
        .appName('demo') \
        .config('spark.kubernetes.pyspark.pythonVersion', '3') \
        .config('spark.cores.max', 2) \
        .config('spark.kubernetes.namespace', 'bigdata') \
        .config('spark.executor.instances', 1) \
        .config('spark.mongodb.input.uri', 'mongodb://demo:demo@dev.luomuxinxi.com:31017/spark.test?authSource=admin') \
        .config('spark.jars.packages', 'org.mongodb.spark:mongo-spark-connector_2.11:2.4.1') \
        .getOrCreate()

    df = spark.read.format('com.mongodb.spark.sql.DefaultSource').load()

    df.createOrReplaceTempView('spark')

    resDf = spark.sql('select * from spark.test')

    resDf.show()

    spark.stop()

    exit(0)
    