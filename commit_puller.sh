#!/bin/bash

cd /home/qiross/code/TCC

./down_local.sh

for submodule_dir in TCC_Dummy_GPS_API TCC_Ambulance_Interface TCC_Voice_Processing; do
    echo "Checking for updates in submodule: $submodule_dir"
    cd "$submodule_dir"

    git fetch origin main
    changes=$(git rev-list HEAD...origin/main --count)

    if [ "$changes" -gt 0 ]; then
        echo "Found $changes new commit(s) in $submodule_dir. Pulling changes and restarting containers..."

        git pull origin main

        lowercase=$(echo "$submodule_dir" | tr '[:upper:]' '[:lower:]')

        cd ..

        docker compose up --build -d "$lowercase"
    else
        echo "No updates found in $submodule_dir."
        cd ..
    fi
done

./down_local.sh
./run_local.sh
