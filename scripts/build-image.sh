#!/usr/env bash

# Build the Docker image for the application
docker build -t anguspllg/mcdocalorietracker:latest .
# Tag the image with the latest tag
docker tag anguspllg/mcdocalorietracker:latest anguspllg/mcdocalorietracker:latest
# Push the image to the Docker registry
docker push anguspllg/mcdocalorietracker:latest
