# docker-dacp (Docker, Alpine, Caddy, PHP)

Created to serve [PHP-SLIM application](https://www.slimframework.com/).

## Usage

Caddy is configured to listen on port 80

### Environment Variables

| variable name  | default value     | description            |
| -------------- | ----------------- | ---------------------- |
| `APP_ROOT`     | `/srv/app`        | application root       |
| `APP_WWW_ROOT` | `/srv/app/public` | caddy and fpm web root |

### Launch
Launch an instance, while mounting current directory to /srv/app (set via `APP_HOME` environmental variable).
```
  docker run -it --rm --name slim -e SLIM_ENV=development -v $(pwd):/srv/app -p 8080:80 anapsix/acp
```

### Building
Build an image with aplication code packaged in.

> NOTE: `ONBUILD COPY . /srv/app/` will be triggered!

```
  docker build -t slim anapsix/acp
```
