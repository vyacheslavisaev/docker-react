#!/bin/bash

docker build -t frontend .
docker run -p 3030:80 frontend
