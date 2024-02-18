#!/bin/bash

docker compose down

cd TCC_NginX_API_Aggregator && docker compose down && docker stop my_jenkins