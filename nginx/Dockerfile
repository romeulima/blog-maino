FROM nginx

RUN apt-get update -qq && apt-get -y install apache2-utils
                                        
ENV RAILS_ROOT /var/www/app

WORKDIR $RAILS_ROOT

RUN mkdir -p log

COPY nginx/app.conf /tmp/app_container.nginx

RUN envsubst '$RAILS_ROOT' < /tmp/app_container.nginx > /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]