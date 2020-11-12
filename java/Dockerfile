FROM openjdk:8-slim AS builder

RUN apt-get update \
    && apt-get install tesseract-ocr -y
RUN mkdir -p /usr/share/tessdata/

ADD https://github.com/tesseract-ocr/tessdata/raw/master/por.traineddata /usr/share/tessdata/ 
ADD https://github.com/tesseract-ocr/tessdata/raw/master/eng.traineddata /usr/share/tessdata/

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
 && locale-gen "en_US.UTF-8"
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

ARG APP_HOME=/tmp/app

COPY src $APP_HOME/src

COPY --from=intersystemscommunity/jgw:latest /jgw/*.jar $APP_HOME/jgw/

WORKDIR $APP_HOME/jar/
ADD https://repo1.maven.org/maven2/net/sourceforge/tess4j/tess4j/4.5.3/tess4j-4.5.3.jar .
ADD https://repo1.maven.org/maven2/org/ghost4j/ghost4j/1.0.1/ghost4j-1.0.1.jar .
ADD https://repo1.maven.org/maven2/log4j/log4j/1.2.17/log4j-1.2.17.jar .
ADD https://repo1.maven.org/maven2/commons-beanutils/commons-beanutils/1.9.2/commons-beanutils-1.9.2.jar .
ADD https://repo1.maven.org/maven2/commons-collections/commons-collections/3.2.1/commons-collections-3.2.1.jar .
ADD https://repo1.maven.org/maven2/org/apache/xmlgraphics/xmlgraphics-commons/1.4/xmlgraphics-commons-1.4.jar .
ADD https://repo1.maven.org/maven2/com/lowagie/itext/2.1.7/itext-2.1.7.jar .
ADD https://repo1.maven.org/maven2/org/apache/pdfbox/pdfbox-tools/2.0.21/pdfbox-tools-2.0.21.jar .
ADD https://repo1.maven.org/maven2/org/apache/pdfbox/pdfbox-debugger/2.0.21/pdfbox-debugger-2.0.21.jar .
ADD https://repo1.maven.org/maven2/org/apache/pdfbox/jbig2-imageio/3.0.3/jbig2-imageio-3.0.3.jar .
ADD https://repo1.maven.org/maven2/commons-io/commons-io/2.7/commons-io-2.7.jar .
ADD https://repo1.maven.org/maven2/org/jboss/jboss-vfs/3.2.15.Final/jboss-vfs-3.2.15.Final.jar .
ADD https://repo1.maven.org/maven2/org/jboss/logging/jboss-logging/3.1.4.GA/jboss-logging-3.1.4.GA.jar .
ADD https://repo1.maven.org/maven2/ch/qos/logback/logback-classic/1.2.3/logback-classic-1.2.3.jar .
ADD https://repo1.maven.org/maven2/ch/qos/logback/logback-core/1.2.3/logback-core-1.2.3.jar .
ADD https://repo1.maven.org/maven2/org/slf4j/slf4j-api/1.7.30/slf4j-api-1.7.30.jar .
ADD https://repo1.maven.org/maven2/net/java/dev/jna/jna/5.6.0/jna-5.6.0.jar .
ADD https://repo1.maven.org/maven2/net/sourceforge/lept4j/lept4j/1.10.0/lept4j-1.10.0.jar .
ADD https://repo1.maven.org/maven2/org/apache/tika/tika-parsers/1.14/tika-parsers-1.14.jar .
ADD https://repo1.maven.org/maven2/org/apache/tika/tika-core/1.14/tika-core-1.14.jar .
ADD https://repo1.maven.org/maven2/org/gagravarr/vorbis-java-tika/0.8/vorbis-java-tika-0.8.jar .
ADD https://repo1.maven.org/maven2/com/healthmarketscience/jackcess/jackcess/2.1.4/jackcess-2.1.4.jar .
ADD https://repo1.maven.org/maven2/commons-lang/commons-lang/2.6/commons-lang-2.6.jar .
ADD https://repo1.maven.org/maven2/com/healthmarketscience/jackcess/jackcess-encrypt/2.1.1/jackcess-encrypt-2.1.1.jar .
ADD https://repo1.maven.org/maven2/org/tallison/jmatio/1.2/jmatio-1.2.jar .
ADD https://repo1.maven.org/maven2/org/apache/james/apache-mime4j-core/0.7.2/apache-mime4j-core-0.7.2.jar .
ADD https://repo1.maven.org/maven2/org/apache/james/apache-mime4j-dom/0.7.2/apache-mime4j-dom-0.7.2.jar .
ADD https://repo1.maven.org/maven2/org/apache/commons/commons-compress/1.12/commons-compress-1.12.jar .
ADD https://repo1.maven.org/maven2/org/tukaani/xz/1.5/xz-1.5.jar .
ADD https://repo1.maven.org/maven2/commons-codec/commons-codec/1.10/commons-codec-1.10.jar .
ADD https://repo1.maven.org/maven2/org/apache/pdfbox/jempbox/1.8.12/jempbox-1.8.12.jar .
ADD https://repo1.maven.org/maven2/org/bouncycastle/bcmail-jdk15on/1.54/bcmail-jdk15on-1.54.jar .
ADD https://repo1.maven.org/maven2/org/bouncycastle/bcpkix-jdk15on/1.54/bcpkix-jdk15on-1.54.jar .
ADD https://repo1.maven.org/maven2/org/bouncycastle/bcprov-jdk15on/1.54/bcprov-jdk15on-1.54.jar .
ADD https://repo1.maven.org/maven2/org/apache/poi/poi/3.15/poi-3.15.jar .
ADD https://repo1.maven.org/maven2/org/apache/commons/commons-collections4/4.1/commons-collections4-4.1.jar .
ADD https://repo1.maven.org/maven2/org/apache/poi/poi-scratchpad/3.15/poi-scratchpad-3.15.jar .
ADD https://repo1.maven.org/maven2/org/apache/poi/poi-ooxml/3.15/poi-ooxml-3.15.jar .
ADD https://repo1.maven.org/maven2/org/apache/poi/poi-ooxml-schemas/3.15/poi-ooxml-schemas-3.15.jar .
ADD https://repo1.maven.org/maven2/org/apache/xmlbeans/xmlbeans/2.6.0/xmlbeans-2.6.0.jar .
ADD https://repo1.maven.org/maven2/com/github/virtuald/curvesapi/1.04/curvesapi-1.04.jar .
ADD https://repo1.maven.org/maven2/org/ccil/cowan/tagsoup/tagsoup/1.2.1/tagsoup-1.2.1.jar .
ADD https://repo1.maven.org/maven2/org/ow2/asm/asm/5.0.4/asm-5.0.4.jar .
ADD https://repo1.maven.org/maven2/com/googlecode/mp4parser/isoparser/1.1.18/isoparser-1.1.18.jar .
ADD https://repo1.maven.org/maven2/com/drewnoakes/metadata-extractor/2.9.1/metadata-extractor-2.9.1.jar .
ADD https://repo1.maven.org/maven2/com/adobe/xmp/xmpcore/5.1.2/xmpcore-5.1.2.jar .
ADD https://repo1.maven.org/maven2/de/l3s/boilerpipe/boilerpipe/1.1.0/boilerpipe-1.1.0.jar .
ADD https://repo1.maven.org/maven2/com/rometools/rome/1.5.1/rome-1.5.1.jar .
ADD https://repo1.maven.org/maven2/com/rometools/rome-utils/1.5.1/rome-utils-1.5.1.jar .
ADD https://repo1.maven.org/maven2/org/gagravarr/vorbis-java-core/0.8/vorbis-java-core-0.8.jar .
ADD https://repo1.maven.org/maven2/com/googlecode/juniversalchardet/juniversalchardet/1.0.3/juniversalchardet-1.0.3.jar .
ADD https://repo1.maven.org/maven2/org/codelibs/jhighlight/1.0.2/jhighlight-1.0.2.jar .
ADD https://repo1.maven.org/maven2/com/pff/java-libpst/0.8.1/java-libpst-0.8.1.jar .
ADD https://repo1.maven.org/maven2/com/github/junrar/junrar/0.7/junrar-0.7.jar .
ADD https://repo1.maven.org/maven2/commons-logging/commons-logging-api/1.1/commons-logging-api-1.1.jar .
ADD https://repo1.maven.org/maven2/org/apache/commons/commons-vfs2/2.0/commons-vfs2-2.0.jar .
ADD https://repo1.maven.org/maven2/org/apache/maven/scm/maven-scm-api/1.4/maven-scm-api-1.4.jar .
ADD https://repo1.maven.org/maven2/org/codehaus/plexus/plexus-utils/1.5.6/plexus-utils-1.5.6.jar .
ADD https://repo1.maven.org/maven2/org/apache/maven/scm/maven-scm-provider-svnexe/1.4/maven-scm-provider-svnexe-1.4.jar .
ADD https://repo1.maven.org/maven2/org/apache/maven/scm/maven-scm-provider-svn-commons/1.4/maven-scm-provider-svn-commons-1.4.jar .
ADD https://repo1.maven.org/maven2/regexp/regexp/1.3/regexp-1.3.jar .
ADD https://repo1.maven.org/maven2/org/apache/cxf/cxf-rt-rs-client/3.0.3/cxf-rt-rs-client-3.0.3.jar .
ADD https://repo1.maven.org/maven2/org/apache/cxf/cxf-rt-transports-http/3.0.3/cxf-rt-transports-http-3.0.3.jar ;
ADD https://repo1.maven.org/maven2/org/apache/cxf/cxf-core/3.0.3/cxf-core-3.0.3.jar .
ADD https://repo1.maven.org/maven2/org/codehaus/woodstox/woodstox-core-asl/4.4.1/woodstox-core-asl-4.4.1.jar .
ADD https://repo1.maven.org/maven2/org/codehaus/woodstox/stax2-api/3.1.4/stax2-api-3.1.4.jar .
ADD https://repo1.maven.org/maven2/org/apache/ws/xmlschema/xmlschema-core/2.1.0/xmlschema-core-2.1.0.jar .
ADD https://repo1.maven.org/maven2/org/apache/cxf/cxf-rt-frontend-jaxrs/3.0.3/cxf-rt-frontend-jaxrs-3.0.3.jar .
ADD https://repo1.maven.org/maven2/javax/ws/rs/javax.ws.rs-api/2.0.1/javax.ws.rs-api-2.0.1.jar .
ADD https://repo1.maven.org/maven2/javax/annotation/javax.annotation-api/1.2/javax.annotation-api-1.2.jar .
ADD https://repo1.maven.org/maven2/org/apache/commons/commons-exec/1.3/commons-exec-1.3.jar .
ADD https://repo1.maven.org/maven2/org/apache/opennlp/opennlp-tools/1.5.3/opennlp-tools-1.5.3.jar .
ADD https://repo1.maven.org/maven2/org/apache/opennlp/opennlp-maxent/3.0.3/opennlp-maxent-3.0.3.jar .
ADD https://repo1.maven.org/maven2/net/sf/jwordnet/jwnl/1.3.3/jwnl-1.3.3.jar .
ADD https://repo1.maven.org/maven2/com/googlecode/json-simple/json-simple/1.1.1/json-simple-1.1.1.jar .
ADD https://repo1.maven.org/maven2/org/json/json/20140107/json-20140107.jar .
ADD https://repo1.maven.org/maven2/com/google/code/gson/gson/2.2.4/gson-2.2.4.jar .
ADD https://repo1.maven.org/maven2/edu/ucar/netcdf4/4.5.5/netcdf4-4.5.5.jar .
ADD https://repo1.maven.org/maven2/net/jcip/jcip-annotations/1.0/jcip-annotations-1.0.jar .
ADD https://repo1.maven.org/maven2/edu/ucar/grib/4.5.5/grib-4.5.5.jar .
ADD https://repo1.maven.org/maven2/com/google/protobuf/protobuf-java/2.5.0/protobuf-java-2.5.0.jar .
ADD https://repo1.maven.org/maven2/org/jdom/jdom2/2.0.4/jdom2-2.0.4.jar .
ADD https://repo1.maven.org/maven2/org/jsoup/jsoup/1.7.2/jsoup-1.7.2.jar .
ADD https://repo1.maven.org/maven2/edu/ucar/jj2000/5.2/jj2000-5.2.jar .
ADD https://repo1.maven.org/maven2/org/itadaki/bzip2/0.9.1/bzip2-0.9.1.jar .
ADD https://repo1.maven.org/maven2/edu/ucar/cdm/4.5.5/cdm-4.5.5.jar .
ADD https://repo1.maven.org/maven2/edu/ucar/udunits/4.5.5/udunits-4.5.5.jar .
ADD https://repo1.maven.org/maven2/org/apache/httpcomponents/httpcore/4.2.5/httpcore-4.2.5.jar .
ADD https://repo1.maven.org/maven2/joda-time/joda-time/2.2/joda-time-2.2.jar .
ADD https://repo1.maven.org/maven2/org/quartz-scheduler/quartz/2.2.0/quartz-2.2.0.jar .
ADD https://repo1.maven.org/maven2/c3p0/c3p0/0.9.1.1/c3p0-0.9.1.1.jar .
ADD https://repo1.maven.org/maven2/net/sf/ehcache/ehcache-core/2.6.2/ehcache-core-2.6.2.jar .
ADD https://repo1.maven.org/maven2/com/google/guava/guava/17.0/guava-17.0.jar .
ADD https://repo1.maven.org/maven2/com/beust/jcommander/1.35/jcommander-1.35.jar .
ADD https://repo1.maven.org/maven2/edu/ucar/httpservices/4.5.5/httpservices-4.5.5.jar .
ADD https://repo1.maven.org/maven2/org/apache/httpcomponents/httpclient/4.2.6/httpclient-4.2.6.jar .
ADD https://repo1.maven.org/maven2/org/apache/httpcomponents/httpmime/4.2.6/httpmime-4.2.6.jar .
ADD https://repo1.maven.org/maven2/org/apache/commons/commons-csv/1.0/commons-csv-1.0.jar .
ADD https://repo1.maven.org/maven2/org/apache/sis/core/sis-utility/0.6/sis-utility-0.6.jar .
ADD https://repo1.maven.org/maven2/org/apache/sis/storage/sis-netcdf/0.6/sis-netcdf-0.6.jar .
ADD https://repo1.maven.org/maven2/org/apache/sis/storage/sis-storage/0.6/sis-storage-0.6.jar .
ADD https://repo1.maven.org/maven2/org/apache/sis/core/sis-referencing/0.6/sis-referencing-0.6.jar .
ADD https://repo1.maven.org/maven2/org/apache/sis/core/sis-metadata/0.6/sis-metadata-0.6.jar .
ADD https://repo1.maven.org/maven2/org/opengis/geoapi/3.0.0/geoapi-3.0.0.jar .
ADD https://repo1.maven.org/maven2/javax/measure/jsr-275/0.9.3/jsr-275-0.9.3.jar .
ADD https://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-core/2.8.1/jackson-core-2.8.1.jar .
ADD https://repo1.maven.org/maven2/com/levigo/jbig2/levigo-jbig2-imageio/1.6.5/levigo-jbig2-imageio-1.6.5.jar .
ADD https://repo1.maven.org/maven2/com/github/jai-imageio/jai-imageio-core/1.3.1/jai-imageio-core-1.3.1.jar .
ADD https://repo1.maven.org/maven2/com/github/jai-imageio/jai-imageio-jpeg2000/1.3.0/jai-imageio-jpeg2000-1.3.0.jar .
ADD https://repo1.maven.org/maven2/org/apache/pdfbox/pdfbox/2.0.19/pdfbox-2.0.19.jar .
ADD https://repo1.maven.org/maven2/org/apache/pdfbox/fontbox/2.0.19/fontbox-2.0.19.jar .
ADD https://repo1.maven.org/maven2/commons-logging/commons-logging/1.2/commons-logging-1.2.jar .

WORKDIR $APP_HOME/src

RUN javac -classpath $APP_HOME/jar/*:$APP_HOME/jgw/* main/java/community/intersystems/pex/ocr/OcrOperation.java && \
    jar -cvf $APP_HOME/jar/ocr-pex-1.0.0.jar main/java/community/intersystems/pex/ocr/OcrOperation.class


FROM intersystemscommunity/jgw:latest

COPY --from=builder /tmp/app/jar/*.jar $GWDIR/
