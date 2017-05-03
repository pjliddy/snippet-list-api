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
      "body": "'"${BODY}"'"
    }
  }'

echo


# TOKEN=BAhJIiVlNmE5YTA0ZGFiODBmZGMwNGJhMDcyYmVlYzQ4MjE4YQY6BkVG--4dd9367916929b0e0909df4ae90808dd4b40dabe TITLE='Test Snippet' BODY='Lorem ipsum dolor sit amet, consectetur adipiscing elit.' scripts/create-item.sh
