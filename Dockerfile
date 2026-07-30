# Blueprint for docker image 

FROM mysql: 8.0

ENV MYSQL_ROOT_PASSWORD=P@$Sw0Rd321
ENV MYSQL_DATABASE=mydb 

# Allow LOAD DATA INFILE to work
RUN echo "[mysqld]" >> /etc/mysql/my.cnf && \
    echo "secure_file_priv=/var/lib/mysql-files" >> /etc/mysql/my.cnf && \
    echo "local_infile=1" >> /etc/mysql/my.cnf

# copy CSV into the location MySQL in allowed to read from
COPY data/yourfile.csv /var/lib/mysql-files/yourfile.csv

# Scripts in docker-entrypoint-initdb.d run automaticlly on first startup
COPY init/01-import.sql /docker-entrypoint-initdb.d/
