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

FROM liferay/portal:7.4.3.14-ga14

MAINTAINER Thiago Moreira <tmoreira2020@gmail.com>

ENV DOCKERIZE_VERSION="v0.6.1" \
    LIFERAY_HOME="/opt/liferay" \
    TOMCAT_HOME="/opt/liferay/tomcat" \
    DOMAIN_PREFIXES="www=dev-www" \
    DEFAULT_PREFIX="dev" \
    ENVIRONMENT="dev" \
    JDBC_DEBUG_LEAK_CONNECTIONS="true" \
    JAVA_VERSION="zulu11"

COPY files /mnt/liferay/files
COPY scripts /mnt/liferay/scripts

USER root

RUN apt-get install -y wget curl unzip tar gzip mysql-client

RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm -rf /tmp/* /var/cache/apk/* 

USER liferay:liferay