#!/bin/bash

export GOOGLE_APPLICATION_CREDENTIALS=$(pwd)/creds.json
if [ -f $1.yaml ]; then
  yq eval -o=j -P $1.yaml | curl -X POST \
    -H "Authorization: Bearer "$(gcloud auth application-default print-access-token) \
    -H "Content-Type: application/json; charset=utf-8" \
    -d @- "https://texttospeech.googleapis.com/v1/text:synthesize" \
    | jq -r  .audioContent | base64 -d > "./$1.mp3"
else
  cat $1.json | curl -X POST \
    -H "Authorization: Bearer "$(gcloud auth application-default print-access-token) \
    -H "Content-Type: application/json; charset=utf-8" \
    -d @- "https://texttospeech.googleapis.com/v1/text:synthesize" \
    | jq -r  .audioContent | base64 -d > "./$1.mp3"
fi
