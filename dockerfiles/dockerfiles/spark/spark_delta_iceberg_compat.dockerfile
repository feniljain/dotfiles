FROM apache/spark:3.4.1

USER root
RUN <<EOF
apt-get update
apt-get install -y vim
cp /opt/spark/bin/spark-sql /usr/local/bin/spark-sql
mkdir /opt/spark/conf
touch /opt/spark/conf/spark-defaults.conf
EOF

ENTRYPOINT ["tail", "-f", "/dev/null"]
