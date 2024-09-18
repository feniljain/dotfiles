FROM apache/spark

USER root
RUN <<EOF
apt-get update
apt-get install -y vim
cp /opt/spark/bin/spark-sql /usr/local/bin/spark-sql
EOF

VOLUME . /data

ENTRYPOINT ["tail", "-f", "/dev/null"]
