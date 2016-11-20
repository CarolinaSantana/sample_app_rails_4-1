FROM ruby:2.0-onbuild
RUN apt-get update && apt-get -y install nodejs
CMD ["/bin/bash"]

