#!/bin/bash
docker build -f 4-dev-app.dockerfile -t my-node-app .
docker run -p 3000:3000 --rm my-node-app