FROM java:8-jre

RUN apt-get update && apt-get install -y zip && rm -rf /var/lib/apt/lists/*

RUN mkdir /usr/share/traccar/

WORKDIR /usr/share/traccar/

ADD https://github.com/tananaev/traccar/releases/download/v3.4/traccar-linux-64-3.4.zip /usr/share/traccar/traccar-linux-64-3.4.zip

RUN unzip traccar-linux-64-3.4.zip && rm /usr/share/traccar/traccar-linux-64-3.4.zip

ADD traccar.xml /opt/traccar/conf/traccar.xml

RUN ./traccar.run

EXPOSE 8082

ENTRYPOINT /opt/traccar/bin/traccar start && tail -f /opt/traccar/logs/tracker-server.log
