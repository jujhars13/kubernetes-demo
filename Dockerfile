FROM nginx:latest

ADD public /public
ADD build/nginx/conf.d/gke.conf /etc/nginx/conf.d/default.conf
ADD build/nginx/tls-certs /etc/nginx/certs