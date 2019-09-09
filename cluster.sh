#!/bin/sh
set -eu

CLUSTER=k8s
ZONE=asia-northeast1-a

# create cluster
gcloud container clusters create $CLUSTER --zone $ZONE --num-nodes 1

# get credentials
gcloud container clusters get-credentials $CLUSTER --zone $ZONE
