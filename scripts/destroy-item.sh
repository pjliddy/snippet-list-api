#!/bin/bash

# DELETE	/items/:id	items#destroy

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/items"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \

echo


# ID=7 TOKEN=BAhJIiU1ZTI5MjJjMjA5ZmZhMTNjZGIxNDIyNGVhNTJhODNhNgY6BkVG--231e15f58b4575d10ab4ac856e0a06765d7316e9 scripts/destroy-item.sh
