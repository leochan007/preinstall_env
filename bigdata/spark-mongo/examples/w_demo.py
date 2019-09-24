#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from pyspark.sql import SparkSession
from pyspark.sql.types import StructType, StructField, StringType, IntegerType

host_ip = 'spark-ui.luomuxinxi.com'

spark = SparkSession.builder \
        .master('spark://%s:7077' % host_ip) \
        .appName('demo') \
        .config('spark.cores.max', 2) \
        .config('spark.mongodb.output.uri', 'mongodb://demo:demo@%s:31017/spark.test?authSource=admin' % host_ip) \
        .config('spark.jars.packages', 'org.mongodb.spark:mongo-spark-connector_2.11:2.4.1') \
        .getOrCreate()

schema = StructType([
    StructField("name", StringType()),
    StructField("age", IntegerType()),
    StructField("sex", StringType())
])

df = spark.createDataFrame([('caocao', 36, 'male'), ('sunquan', 26, 'male'), ('zhugeliang', 26, 'male')], schema)

df.show()

df.write.format('com.mongodb.spark.sql.DefaultSource').mode("append").save()

spark.stop()

exit(0)
