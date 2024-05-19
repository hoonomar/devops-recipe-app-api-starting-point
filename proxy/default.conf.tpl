server {
    listen ${LISTEN_PORT};

    location /static {
        alias /vol/static;
    }

       location /media {
        alias /vol/media;
    }

    location / {
        include gunicorn_headers;
        porxy_redirect off;
        proxy_pass http://${APP_HOST}:${APP_PORT}
        client_max_body_size    10M;
    }
}
