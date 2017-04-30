#!/bin/bash

# PATCH	/items/:id	items#update

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/items"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "item": {
      "title": "'"${TITLE}"'",
      "body": "'"${BODY}"'",
      "user_id": "'"${USER_ID}"'"
    }
  }'

echo


# ID=4 USER_ID=1 TOKEN=BAhJIiU1ZTI5MjJjMjA5ZmZhMTNjZGIxNDIyNGVhNTJhODNhNgY6BkVG--231e15f58b4575d10ab4ac856e0a06765d7316e9 TITLE='Modified Snippet' BODY='Lorem ipsum dolor sit amet, consectetur adipiscing elit.' scripts/update-item.sh
