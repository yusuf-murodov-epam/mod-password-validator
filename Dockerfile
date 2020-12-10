FROM folioci/alpine-jre-openjdk11:latest

USER root

# Copy your fat jar to the container
ENV APP_FILE mod-password-validator-fat.jar

# - should be a single jar file
ARG JAR_FILE=./target/*.jar
# - copy
COPY ${JAR_FILE} ${JAVA_APP_DIR}/${APP_FILE}

ARG RUN_ENV_FILE=run-env.sh

RUN ls -l

COPY ${RUN_ENV_FILE} ${JAVA_APP_DIR}/
RUN chmod 755 ${JAVA_APP_DIR}/${RUN_ENV_FILE}

# Expose this port locally in the container.
EXPOSE 8081

#ENV DB_URL="jdbc:postgresql://${DB_HOST}:${DB_PORT}/${DB_DATABASE}"
#
#ENV APP_OPTS="--spring.datasource.username=${DB_USERNAME} \
#--spring.datasource.password=${DB_PASSWORD} \
#--spring.datasource.url=${DB_URL}"

#ENTRYPOINT ["sh", "-c", "./run-java.sh ${APP_OPTS}"]
