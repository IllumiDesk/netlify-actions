#!/bin/sh -l
echo "Publishing"

deploy_id=`curl -s \
  https://api.netlify.com/api/v1/sites/$NETLIFY_SITE_ID/deploys\?branch=$BRANCH\&per_page=1 \
  -H "Authorization: Bearer $NETLIFY_ACCESS_TOKEN" | jq -r '.[0].id'`

if [ -z "$deploy_id" ]; then
  echo "Unable to find latest build"
  exit 1
fi

echo "Processing deploy $deploy_id"

code=$(curl \
  --silent \
  --show-error \
  --output /dev/stderr \
  --write-out "%{http_code}" \
  -X POST \
  -H "Authorization: Bearer $NETLIFY_ACCESS_TOKEN" \
  -H 'Content-Type: application/json' \
  "https://api.netlify.com/api/v1/sites/$NETLIFY_SITE_ID/deploys/$deploy_id/restore"
) 2>&1

if [ ! 201 -eq "$code" ] && [ ! 200 -eq "$code" ]; then
  echo "Unable to publish deploy $deploy_id"
  exit 1
fi

echo "Published Deploy $deploy_id"

code=$(curl \
  --silent \
  --show-error \
  --output /dev/stderr \
  --write-out "%{http_code}" \
  -X POST \
  -H "Authorization: Bearer $NETLIFY_ACCESS_TOKEN" \
  -H 'Content-Type: application/json' \
  "https://api.netlify.com/api/v1/deploys/$deploy_id/lock"
) 2>&1

if [ ! 201 -eq "$code" ] && [ ! 200 -eq "$code" ]; then
  echo "Unable to lock on deploy $deploy_id"
  exit 1
fi

echo "Locked on Deploy $deploy_id. Process complete"