FROM ubuntu:latest
MAINTAINER Bluescape Operations <ops@bluescape.com>

# TODO: Tag our built version with a different label?
ENV TIKA_VERSION 1.22

RUN apt-get update \
    && apt-get install gnupg openjdk-11-jre-headless curl gdal-bin tesseract-ocr \
       tesseract-ocr-eng tesseract-ocr-ita tesseract-ocr-fra tesseract-ocr-spa tesseract-ocr-deu -y \
	    && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 9998
ENTRYPOINT java -jar /tika-server-${TIKA_VERSION}.jar -enableUnsecureFeatures -enableFileUrl -h 0.0.0.0

COPY tika-server-${TIKA_VERSION}.jar /tika-server-${TIKA_VERSION}.jar

# TODO: Switch to non-root user
# USER 1001

LABEL \
  org.label-schema.name="apache-tika" \
  org.label-schema.description="Bluescape apache-tika" \
  vendor="Apache Tika" \
  maintainer="ops@bluescape.com" \
  version=${TIKA_VERSION} \
  summary="Custom Docker image with Apache Tika Server for Openshift" \
  description="The Apache Tika toolkit detects and extracts metadata and text from over a thousand different file types (such as PPT, XLS, and PDF)"
