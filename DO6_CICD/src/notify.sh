#!/bin/bash
TELEGRAM_BOT_TOKEN="6786861858:AAFV5dI8N5vmIS_tZABB9si_-dlqvbQqelI"
TELEGRAM_USER_ID="1269715379"
URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"
TEXT="Project:+$CI_PROJECT_NAME%0AJob name: $CI_JOB_NAME%0AStatus:+$CI_JOB_STATUS"

curl -s -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null