#!/bin/bash

docker compose up -d

cd TCC_NginX_API_Aggregator && docker compose up -d
