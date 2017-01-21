# Ruby on Rails Tutorial: sample application

This is the sample application for
[*Ruby on Rails Tutorial: Learn Web Development with Rails*](http://railstutorial.org/)
by [Michael Hartl](http://michaelhartl.com/). You can use this reference implementation to help track down errors if you end up having trouble with code in the tutorial. In particular, as a first debugging check I suggest getting the test suite to pass on your local machine:

    cd /tmp
    git clone https://github.com/railstutorial/sample_app_rails_4.git
    cd sample_app_rails_4
    cp config/database.yml.example config/database.yml
    bundle install --without production
    bundle exec rake db:migrate
    bundle exec rake db:test:prepare
    bundle exec rspec spec/

If the tests don't pass, it means there may be something wrong with your system. If they do pass, then you can debug your code by comparing it with the reference implementation.

## Get Started in seconds on Nitrous.IO

[Nitrous.IO](https://www.nitrous.io/?utm_source=github.com&utm_campaign=railstutorial-sample_app_rails_4&utm_medium=hackonnitrous) is a cloud-based platform that will let you start working on this project in a matter of seconds.

Click on the button below to get started:

[![Hack railstutorial/sample_app_rails_4 on
Nitrous.IO](https://d3o0mnbgv6k92a.cloudfront.net/assets/hack-l-v1-3cc067e71372f6045e1949af9d96095b.png)](https://www.nitrous.io/hack_button?source=embed&runtime=rails&repo=railstutorial%2Fsample_app_rails_4&file_to_open=README.nitrous.md)

## Adapting sample application to a service model implemented with Docker containers

The main idea is deploy the next structure, automatically:

![Alt text](https://github.com/carmelocuenca/csantana_project/tfm_doc/images/figures/iteration1.png "Conversión de una aplicación Ruby on Rails a una arquitectura de microservicios")
![alt tag](https://github.com/carmelocuenca/csantana_project/tfm_doc/images/figures/iteration1.png)

From this repository, the Docker image of the application, *sample_app_rails_4_image*, is built. Then, the Docker container, *some-postgres*, that refers to the database is created. The Docker volume, *volume-public*, allows you to have a shared space between the application Docker container and the *some-nginx* Docker container, that represent the web proxy. Thus, the container of the application is composed of a first executable Docker container, *app-job*, that creates, migrates and populates the database and for other Docker container, *app-task*, that will be running with the web server puma launched.


First, to get this you need to export the PostgreSQL user and password environment variables to the main directory:

    . ~/.postgres/credentials

Then, you can do the deployment of the discussed infraestructure by running the following script:

    ./docker-microservices.sh
