FROM tomcat:9.0.56-jdk11-openjdk-slim
LABEL maintainer="admin@mainsoft.org"
ENV PYTHONPATH=/temperature_alignment/libs/python
ARG USER=tomcat
RUN apt-get update && apt-get install -y python3 libpython3.9 libpq5 \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd $USER \
    && useradd --shell /bin/sh -g $USER -c "" -m $USER \
    && chown -R $USER:$USER /usr/local/tomcat \
    && mkdir -p /temperature_alignment/libs \
    && chown -R $USER:$USER /temperature_alignment
USER $USER
COPY ./modules/server/target/ROOT.war /usr/local/tomcat/webapps/
COPY --chown=$USER bootstrap.sh config.yaml /temperature_alignment/
EXPOSE 8080
ENTRYPOINT ["/bin/bash", "/temperature_alignment/bootstrap.sh"]
CMD ["run"]
