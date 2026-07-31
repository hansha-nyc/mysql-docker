# Blueprint for Docker image 
FROM mysql:8.0

ENV MYSQL_DATABASE=mydb

RUN echo "[mysqld]" >> /etc/mysql/my.cnf && \
    echo "secure_file_priv=/var/lib/mysql-files" >> /etc/mysql/my.cnf && \
    echo "local_infile=1" >> /etc/mysql/my.cnf

COPY data/dataset.csv /var/lib/mysql-files/dataset.csv
COPY init/01-import.sql /docker-entrypoint-initdb.d/
