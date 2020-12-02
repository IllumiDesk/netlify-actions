FROM alpine:latest

LABEL version="1.0.0"
LABEL repository="https://github.com/IllumiDesk/netlify-actions"
LABEL homepage="https://github.com/IllumiDesk/netlify-actions/diff-includes"
LABEL maintainer="IllumiDesk"
LABEL "com.github.actions.name"="Diff includes"
LABEL "com.github.actions.description"="Stop workflow unless changes were made in certain files/directories."
LABEL "com.github.actions.icon"="git-commit"
LABEL "com.github.actions.color"="gray-dark"

RUN apk add --update git jq && rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
