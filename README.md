# AWS S3 Tile Map Server - Google Cloud Kubernetes deployment

## About the Project

- **This is a playground project I've used to to learn some k8s**
- The goal was to create a simple TMS deployed to Kubernetes cluster
- Map tiles are served directly from AWS S3 bucket
- The K8s cluster is managed by Google Cloud

**Disclaimer**: You won't be able to just launch it without some fiddling with the configuration files, as some values are hard-coded.

## Installing

The code comes with a `Vagrantfile` that has all necessary tooling installed, so your system can stay clean.

### .env file

You will need to create an `.env` file with following variables:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `REGISTRY` _= gcr.io/microatlas-203915_

Those are used in `docker-compose.yml` files.

### k8s secrets

You will also have to create a `k8s/secrets/mapsrv-aws.yml` file with secrets required to run the app on a Kubernetes cluster.

## Building

Included `Makefile` has some helpers to build and push all necessary docker images.

Run `make build` to build all necessary docker images.

## Deploying

You can simply use `kubectl apply -f k8s/microatlas.yml`
