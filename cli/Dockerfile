FROM node:12-alpine

LABEL version="1.0.1"
LABEL repository="https://github.com/IllumiDesk/netlify-actions"
LABEL homepage="https://github.com/IllumiDesk/netlify-actions/netlify"
LABEL maintainer="IllumiDesk"
LABEL "com.github.actions.name"="Netlify"
LABEL "com.github.actions.description"="Wraps the Netlify CLI to enable common Netlify commands"
LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="blue"

RUN yarn global add netlify-cli

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
