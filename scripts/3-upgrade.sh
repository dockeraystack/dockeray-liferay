#!/usr/bin/env bash
#
# Copyright © 2022 Thiago Moreira (tmoreira2020@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


echo
echo 'Starting upgrade process'
echo

sleep 30

set -o errexit

DB_UPGRADE_CLIENT_FOLDER="$LIFERAY_HOME/tools/portal-tools-db-upgrade-client"

if [ "$LIFERAY_RUN_UPGRADE" = true ]; then
    LOCK_FILE="$LIFERAY_HOME/data/upgrade-$ENVIRONMENT.lock"
    if [ ! -f "$LOCK_FILE" ]; then
        echo $HOSTNAME > "$LOCK_FILE"
        "$DB_UPGRADE_CLIENT_FOLDER/db_upgrade.sh"
        rm "$LOCK_FILE"
    else
        while [ -f "$LOCK_FILE" ]; do
            UPGRADE_HOSTNAME=$(cat "$LOCK_FILE")
            echo "Upgrade is already in progress on the following host: $UPGRADE_HOSTNAME"
            sleep 60
        done
    fi
fi