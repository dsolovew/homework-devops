FROM ubuntu:20.04
RUN apt-get update  
RUN apt-get install default-jdk -y
RUN apt-get install git -y
RUN apt-get install maven -y
RUN apt-get install wget -y
RUN mkdir /home/javapp && mkdir /usr/local/tomcat
RUN wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.40/bin/apache-tomcat-9.0.40.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.40/* /usr/local/tomcat/
RUN cd /home/javapp
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd ./boxfuse-sample-java-war-hello/ && mvn package && cp ./target/*.war /usr/local/tomcat/webapps
EXPOSE 8080
RUN chmod +x /usr/local/tomcat/bin/catalina.sh
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
