FROM tomcat:9-jdk8-openjdk
VOLUME /tmp
ARG WAR_FILE=./tap/target/tap-0.0.1-SNAPSHOT.war
ADD ${WAR_FILE} /usr/local/tomcat/webapps/tap.war
ENTRYPOINT ["catalina.sh run"]
