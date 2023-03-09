FROM java:8
MAINTAINER metalion
VOLUME /tmp
COPY target/*.jar app.jar
EXPOSE 5762
ENTRYPOINT ["java","-jar","app.jar"]