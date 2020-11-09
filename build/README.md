# Docker Build

```
git clone https://github.com/nationminu/jboss-demo.git
```

## JBoss EAP 빌드/실행
```
docker build -t local/jboss-eap:7.3.0 .
docker run --rm -p 8080:8080 -p 9990:9990 local/jboss-eap:7.3.0
```

## JBoss EAP Dockerfile
> 사전에 JBoss EAP 7.3 패키지 다운로드가 필요합니다.
```
FROM openjdk:8
#--------------------------------------------------------------------------#
#--------------------------------------------------------------------------#
#                      J B O S S E A P  v7.3.0  I M A G E                  #
#--------------------------------------------------------------------------#
#--------------------------------------------------------------------------#   
LABEL maintainer="mwsong@rockplace.co.kr"

RUN apt -y update && apt -y install vim

ENV JBOSS_HOME=/usr/local/jboss-eap-7.3
ENV JBOSS_MODULEPATH=${JBOSS_HOME}/modules:/app/modules.ext/

COPY jboss-eap-7.3.0.zip /usr/local/

RUN cd /usr/local && unzip jboss-eap-7.3.0.zip && rm -f jboss-eap-7.3.0.zip
RUN cd ${JBOSS_HOME}/bin && ./add-user.sh admin admin 

RUN mkdir -p /app
COPY session.war /app/session.war 
COPY jpetstore.war /app/jpetstore.war 
COPY jpetstore-jdbc.war /app/jpetstore-jdbc.war
COPY modules.ext /app/modules.ext
COPY eap/*.xml /usr/local/jboss-eap-7.3/domain/configuration/
COPY entrypoint.sh ${JBOSS_HOME}

RUN chmod +x ${JBOSS_HOME}/entrypoint.sh 
 
WORKDIR $JBOSS_HOME

EXPOSE 8080
EXPOSE 8009
EXPOSE 9990
  
ENTRYPOINT ["./entrypoint.sh"] 
``` 

## 서비스 확인
```
http://localhost:8080
http://localhost:9990
```


## Wildfly EAP 빌드/실행
```
docker build -t local/wildlfly:18.0.1 -f Dockerfile.wildfly .
docker run --rm -p 8080:8080 -p 9990:9990 local/wildlfly:18.0.1
```

## Wildfly Dockerfile
```
FROM openjdk:8
#--------------------------------------------------------------------------#
#--------------------------------------------------------------------------#
#                      W I L D F L Y  v18.0.1  I M A G E                   #
#--------------------------------------------------------------------------#
#--------------------------------------------------------------------------#   
LABEL maintainer="mwsong@rockplace.co.kr"

RUN apt -y update && apt -y install vim

ENV JBOSS_HOME=/usr/local/wildfly-18.0.1.Final
ENV JBOSS_MODULEPATH=${JBOSS_HOME}/modules:/app/modules.ext/

ADD https://download.jboss.org/wildfly/18.0.1.Final/wildfly-18.0.1.Final.tar.gz /usr/local

RUN cd /usr/local && tar -zxvf wildfly-18.0.1.Final.tar.gz && rm -f wildfly-18.0.1.Final.tar.gz
RUN cd ${JBOSS_HOME}/bin && ./add-user.sh admin admin 
 
RUN mkdir -p /app
COPY session.war /app/session.war 
COPY jpetstore.war /app/jpetstore.war 
COPY jpetstore-jdbc.war /app/jpetstore-jdbc.war
COPY modules.ext /app/modules.ext
COPY wildfly/*.xml ${JBOSS_HOME}/domain/configuration/
COPY entrypoint.sh ${JBOSS_HOME}

RUN chmod +x ${JBOSS_HOME}/entrypoint.sh 
 
WORKDIR $JBOSS_HOME

EXPOSE 8080
EXPOSE 8009
EXPOSE 9990
 
#CMD ["./bin/standalone.sh"]
ENTRYPOINT ["./entrypoint.sh"] 
```

## 서비스 확인
```
http://localhost:8080
http://localhost:9990
```