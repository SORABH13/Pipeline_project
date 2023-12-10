# Pipeline_project
# Iris API AWS Deployment

This repository contains the AWS CloudFormation template for deploying the Iris Classifier application using various AWS services.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Customization](#customization)
- [Contributing](#contributing)
- [License](#license)

## Overview

This CloudFormation template automates the deployment of the Iris application on AWS. It utilizes AWS CodePipeline for continuous integration and delivery, AWS CodeBuild for building artifacts, Amazon ECS for containerized deployment, AWS Lambda for additional functionality, and API Gateway for exposing the Iris Classifier API.

## Prerequisites

Before you begin, ensure you have the following prerequisites:

- An AWS account with the necessary permissions.
- A GitHub account for source code management.

## Getting Started

Follow these steps to deploy the Iris Classifier:

1. **GitHub Parameters:**
   - Fork this repository to your GitHub account.
   - Clone the forked repository to your local machine.

2. **AWS CloudFormation:**
   - Open the AWS CloudFormation console.
   - Create a new stack using the provided CloudFormation template (`iris-classifier-template.yaml`).

3. **Configure Parameters:**
   - Provide the necessary parameters such as GitHub owner, repository, and AWS account roles.

4. **Deploy Stack:**
   - Complete the stack creation process and wait for the deployment to finish.

5. **Access the Iris Classifier API:**
   - Once the stack is deployed, access the Iris Classifier API through the provided URL.
