FROM alpine:latest

LABEL version="1.0.0"
LABEL repository="https://github.com/IllumiDesk/netlify-actions"
LABEL homepage="https://github.com/IllumiDesk/netlify-actions/netlify"
LABEL maintainer="IllumiDesk"
LABEL "com.github.actions.name"="Netlify Publish"
LABEL "com.github.actions.description"="Publish a deploy on Netlify"
LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="blue"

RUN apk add --update curl jq && rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
