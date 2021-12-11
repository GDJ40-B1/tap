FROM java:8
VOLUME /tmp
ARG JAR_FILE=./exec/tap-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} tap.jar
ENTRYPOINT ["java","-jar","/tap.jar"]
