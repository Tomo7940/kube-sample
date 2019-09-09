#!/bin/sh
set -eu

PROJECT=kube-chiku
CLUSTER=k8s
ZONE=asia-northeast1-a

# set config
gcloud config set project $PROJECT

# create cluster
gcloud container clusters create $CLUSTER --zone $ZONE --num-nodes 1

# get credentials
gcloud container clusters get-credentials $CLUSTER --zone $ZONE
