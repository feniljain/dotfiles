# docker run -v ~/Projects/work/e6data/delta-play/hudi/data:/data --name spark-playground --detach spark-playground
# docker run -v ~/dockerfiles/spark/spark-data:/data --name spark-playground --detach spark-playground

FROM apache/spark

USER root
RUN <<EOF
apt-get update
apt-get install -y vim
cp /opt/spark/bin/spark-sql /usr/local/bin/spark-sql
mkdir -p /opt/spark/conf/
touch /opt/spark/conf/spark-defaults.conf
EOF

ENTRYPOINT ["tail", "-f", "/dev/null"]

 
# FROM apache/spark
# 
# USER root
# RUN <<EOF
# apt-get update
# apt-get install -y vim
# cp /opt/spark/bin/spark-sql /usr/local/bin/spark-sql
# mkdir /opt/spark/conf
# touch /opt/spark/conf/spark-defaults.conf
# EOF
# 
# ENTRYPOINT ["tail", "-f", "/dev/null"]
# 
# # TODO: Include this in above script itself to add to /opt/spark/conf/spark-defaults.conf
# 
# # spark.jars.packages org.apache.hudi:hudi-spark3.5-bundle_2.12:0.15.0
# # spark.sql.extensions org.apache.spark.sql.hudi.HoodieSparkSessionExtension
# 
# # spark.sql.defaultCatalog spark_catalog
# # spark.serializer org.apache.spark.serializer.KryoSerializer
# # spark.sql.catalog.spark_catalog org.apache.spark.sql.hudi.catalog.HoodieCatalog
# # spark.kryo.registrator org.apache.spark.HoodieSparkKryoRegistrar
# # spark.sql.warehouse.dir /data
