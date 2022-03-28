#! /bin/bash
gcloud compute snapshots create $1 \
    --source-disk $1 \
    --source-disk-zone $2
gcloud compute images create $1 \
    --source-snapshot=$1 \

gcloud config set project $3
gcloud compute instances create $1 \
    --image-project concise-rune-302709 \
    --image $1 --zone $2 --machine-type=e2-micro \
    --tags=http-server,https-server
