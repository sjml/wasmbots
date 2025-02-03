FROM jetpackio/devbox:latest AS builder

# Installing your devbox project
WORKDIR /code
USER root:root
RUN mkdir -p /code && chown ${DEVBOX_USER}:${DEVBOX_USER} /code 
USER ${DEVBOX_USER}:${DEVBOX_USER}
COPY --chown=${DEVBOX_USER}:${DEVBOX_USER} devbox.json devbox.json
COPY --chown=${DEVBOX_USER}:${DEVBOX_USER} devbox.lock devbox.lock

RUN devbox run -- echo "Installed Packages."

COPY --chown=${DEVBOX_USER}:${DEVBOX_USER} . /code/

WORKDIR /code
RUN devbox run build

FROM caddy:2-alpine

COPY --from=builder /code/frontend/build/ /usr/share/caddy/
