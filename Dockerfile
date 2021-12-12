FROM java:8
VOLUME /tmp
ARG WAR_FILE=./tap/target/tap-0.0.1-SNAPSHOT.war
ADD ${WAR_FILE} tap.war
ENTRYPOINT ["java","-jar","/tap.war"]
