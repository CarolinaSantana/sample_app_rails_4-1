##################################################
# Dockerfile to build a sample_app_rails_4 image #
# Version 0.1                                    #
##################################################
FROM ruby:2.0-onbuild
LABEL sample_app_image_0_1.version="0.1" sample_app_image_0_1.release-date="2016-12-10"
MAINTAINER Carolina Santana "c.santanamartel@gmail.com"
RUN apt-get update && apt-get -y install nodejs && \
    apt-get autoclean && apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f /tmp/* /var/tmp/*
CMD ["/bin/bash"]
