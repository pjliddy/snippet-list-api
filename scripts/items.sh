#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/items"
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo

#TOKEN=BAhJIiU1ZTI5MjJjMjA5ZmZhMTNjZGIxNDIyNGVhNTJhODNhNgY6BkVG--231e15f58b4575d10ab4ac856e0a06765d7316e9 scripts/items.sh
