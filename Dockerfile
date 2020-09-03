FROM nginx:latest
MAINTAINER marcelo.foss.rj@gmail.com

# Install dependencies
RUN apt-get update -qq \
    && apt-get -y install apache2-utils

# establish where Nginx should look for files
ENV RAILS_ROOT /app
RUN mkdir -p $RAILS_ROOT

# Set our working directory inside the image
WORKDIR $RAILS_ROOT

# create log directory
RUN mkdir log/

# Copy Nginx config
COPY docker-nginx.conf /etc/nginx/conf.d/default.conf

# Use the "exec" form of CMD so Nginx shuts down gracefully on SIGTERM (i.e. `docker stop`)
CMD [ "nginx", "-g", "daemon off;" ]
