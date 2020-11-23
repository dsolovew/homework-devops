FROM ubuntu:20.04
RUN apt-get update  
RUN apt-get install default-jdk -y
RUN apt-get install tomcat9 -y
RUN apt-get install git -y
RUN apt-get install maven -y
RUN mkdir /home/javapp
RUN cd /home/javapp
RUN git clone https://github.com/spring-projects/spring-petclinic.git
RUN cd ./spring-petclinic/ && mvn package && cp ./target/*.jar /var/lib/tomcat9/webapps
EXPOSE 8080
CMD ["/usr/share/tomcat9/bin/catalina.sh", "run"]
