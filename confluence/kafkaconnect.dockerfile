FROM confluentinc/cp-kafka-connect:6.1.0

ENV MYSQL_DRIVER_VERSION 5.1.45

RUN confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:10.5.0

RUN curl -k -SL "https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-${MYSQL_DRIVER_VERSION}.tar.gz" \
     | tar -xzf - -C /usr/share/confluent-hub-components/confluentinc-kafka-connect-jdbc/lib \
     --strip-components=1 mysql-connector-java-5.1.45/mysql-connector-java-${MYSQL_DRIVER_VERSION}-bin.jar