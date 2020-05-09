FROM docker.state.genazt.me/doublechins/http2-push-to-link-header as files

FROM nginx:alpine

COPY --from=files /http2-linker /http2-linker
COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/nginx.vh.frontend.conf /etc/nginx/conf.d/frontend.conf
COPY misc/crontab /etc/crontabs/root
COPY misc/start.sh /start.sh
COPY misc/dhparam.pem /etc/ssl/certs/dhparam.pem
COPY misc/rand /etc/ssl/certs/random.key

EXPOSE 80
EXPOSE 443

RUN chmod +x /start.sh

CMD ["/start.sh"]
