FROM ghost:latest
RUN apt-get update -y && \
    apt-get install -y default-mysql-client
COPY ./wait-for-it.sh /usr/local/bin/wait-for-it.sh
RUN chmod +x /usr/local/bin/wait-for-it.sh

COPY ./prepare.sh ./prepare.sh
RUN chmod +x ./prepare.sh

COPY ./posts.sql ./posts.sql
RUN chmod +x ./posts.sql