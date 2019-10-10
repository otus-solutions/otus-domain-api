FROM jboss/wildfly:14.0.1.Final AS api

ARG DEPLOY_USER=admin
ARG DEPLOY_PASS=admin
ARG EAR_FILE=source/otus-domain-ear/target/otus-domain-ear.ear

ENV DATABASE_NAME="otus-domain"
ENV DATABASE_HOST="otus-database"
ENV DATABASE_PORT="27017"
ENV DATABASE_USER="domain"
ENV DATABASE_PASS="domain"

USER root

ADD server/api/standalone-custom.xml /opt/jboss/wildfly/standalone/configuration/
ADD ${EAR_FILE} /opt/jboss/wildfly/standalone/deployments/
RUN /opt/jboss/wildfly/bin/add-user.sh ${DEPLOY_USER} ${DEPLOY_PASS} --silent
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-c", "standalone-custom.xml", "-b", "0.0.0.0", "-bmanagement", "127.0.0.1"]
EXPOSE 8080 9990
