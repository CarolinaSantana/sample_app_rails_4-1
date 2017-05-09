##################################################
# Dockerfile to build a sample_app_rails_4 image #
# Version 0.1                                    #
##################################################
FROM ruby:2.0-onbuild
LABEL sample_app_rails_4_image.version="0.1" sample_app_rails_4_image.release-date="2016-12-10"
MAINTAINER Carolina Santana "c.santanamartel@gmail.com"
RUN apt-get update && apt-get -y install nodejs && \
    apt-get -y install netcat && \
    apt-get autoclean && apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f /tmp/* /var/tmp/* && 
COPY /setup.sh /

