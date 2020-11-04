FROM openjdk:8
#--------------------------------------------------------------------------#
#--------------------------------------------------------------------------#
#                      W I L D F L Y  v18.0.1  I M A G E                   #
#--------------------------------------------------------------------------#
#--------------------------------------------------------------------------#   
LABEL maintainer="mwsong@rockplace.co.kr"

ENV JBOSS_HOME=/usr/local/wildfly-18.0.1.Final
ENV JBOSS_MODULEPATH=${JBOSS_HOME}/modules:/app/modules.ext/

ADD https://download.jboss.org/wildfly/18.0.1.Final/wildfly-18.0.1.Final.zip /usr/local

RUN cd /usr/local && unzip wildfly-18.0.1.Final.zip && rm -f wildfly-18.0.1.Final.zip
RUN cd ${JBOSS_HOME}/bin && ./add-user.sh admin rplinux 
 
RUN mkdir -p /app
ADD session.war /app/session.war 
ADD jpetstore.war /app/jpetstore.war 
ADD jpetstore-jdbc.war /app/jpetstore-jdbc.war
ADD modules.ext /app/modules.ext
ADD wildfly/*.xml ${JBOSS_HOME}/domain/configuration/
 
WORKDIR $JBOSS_HOME

EXPOSE 8080
EXPOSE 8009
EXPOSE 9990
  
CMD [ "/usr/local/wildfly-18.0.1.Final/bin/standalone.sh"]