FROM java:8-jre
MAINTAINER Fan Yang <Fan_Yang@sjtu.edu.cn>

ADD ./target/*.jar /app/app.jar
CMD ["java", "-jar", "/app/app.jar"]

EXPOSE 8888