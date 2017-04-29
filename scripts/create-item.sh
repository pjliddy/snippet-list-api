#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/items"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "item": {
      "title": "'"${TITLE}"'",
      "body": "'"${BODY}"'",
      "user_id": "'"${ID}"'"
    }
  }'

echo


# ID=1 TOKEN=BAhJIiU5NjJlNjJhOTE0ZTQ2OGE1MzRhYzJhODg0YjEyYTAxOQY6BkVG--1f182488579ceb59772931e78553b1f4630c69a5 TITLE='Created Snippet' BODY='Lorem ipsum dolor sit amet, consectetur adipiscing elit.' scripts/create-item.sh
