FROM jetpackio/devbox:latest AS base
WORKDIR /code
USER root:root
RUN mkdir -p /code && chown ${DEVBOX_USER}:${DEVBOX_USER} /code
USER ${DEVBOX_USER}:${DEVBOX_USER}

FROM base as dev
CMD ["devbox", "shell"]

FROM base as build
WORKDIR /code
COPY --chown=${DEVBOX_USER}:${DEVBOX_USER} . .
RUN devbox run build

FROM caddy:2-alpine as serve
COPY --from=build /code/frontend/build/ /usr/share/caddy/
