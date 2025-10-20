#!/bin/bash
docker build -f 4-dev-app.dockerfile -t my-node-app .
docker run --rm my-node-app