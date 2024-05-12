FROM confluentinc/cp-kafka-connect:6.1.0
ENV MYSQL_DRIVER_VERSION 5.1.45
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:10.5.0
RUN curl -k -SL "https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-${MYSQL_DRIVER_VERSION}.tar.gz" \
     | tar -xzf - -C /usr/share/confluent-hub-components/confluentinc-kafka-connect-jdbc/lib \
     --strip-components=1 mysql-connector-java-5.1.45/mysql-connector-java-${MYSQL_DRIVER_VERSION}-bin.jar

USER appuser

WORKDIR /
COPY jdbc-connect.properties .
COPY file-sink-connector.properties .

WORKDIR /etc/schema-registry/
COPY connect-avro-standalone.properties /etc/schema-registry/

WORKDIR /usr/bin/
COPY kafka-avro-console-consumer /usr/bin/

USER root
RUN chmod +x kafka-avro-console-consumer

RUN curl -k -SL "https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-${MYSQL_DRIVER_VERSION}.tar.gz" \
     | tar -xzf - -C /usr/share/java/kafka/ --strip-components=1 mysql-connector-java-5.1.45/mysql-connector-java-${MYSQL_DRIVER_VERSION}-bin.jar

WORKDIR /usr/share/confluent-hub-components/confluentinc-kafka-connect-jdbc/lib
RUN cp kafka-connect-jdbc-10.5.0.jar /usr/share/java/kafka/

USER appuser