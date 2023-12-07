#!/bin/bash

set -e

# Checking for dependencies eg. jq
if [ -z $(which jq) ]; then echo "JQ not installed" && break; else echo "All dependencies met, deploying"; fi

SERVICE_NAME=`cat pipeline_config.json | jq -r '.commonConfig.serviceName'`
PLATFORM=`cat pipeline_config.json | jq -r '.commonConfig.platform'`

export AWS_DEFAULT_PROFILE=dev

ACCOUNT_ID=`aws sts get-caller-identity --query "Account" --output text`

read -e -p "Release Type [release]: " TYPE
TYPE=${TYPE:-release}

read -e -p "Release Version: " VERSION


aws \
cloudformation \
deploy \
--role-arn arn:aws:iam::${ACCOUNT_ID}:role/CloudFormationRole \
--template-file release_pipeline.yml \
--stack-name ${PLATFORM}-${SERVICE_NAME}-release-pipeline \
--no-fail-on-empty-changeset \
--capabilities CAPABILITY_NAMED_IAM \
--parameter-overrides \
ServiceName=${SERVICE_NAME} \
GithubRepo=${PLATFORM}-${SERVICE_NAME} \
GithubToken=`aws ssm get-parameter --name GithubToken --with-decryption --query "Parameter.Value" --output text` \
CyclingSecret=`openssl rand -base64 32` \
Version=${VERSION} \
Type=${TYPE}

unset AWS_DEFAULT_PROFILE