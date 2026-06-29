# Static site served by Caddy — works on Railway, Render, Fly, or any container host.
FROM caddy:2-alpine
WORKDIR /srv
COPY . /srv
CMD ["caddy", "run", "--config", "/srv/Caddyfile", "--adapter", "caddyfile"]
