#!/bin/bash

docker compose up -d && docker start my_jenkins

cd TCC_NginX_API_Aggregator && docker compose up -d
