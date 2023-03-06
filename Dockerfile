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

FROM liferay/portal:7.4.3.66-ga66

MAINTAINER Thiago Moreira <tmoreira2020@gmail.com>

ENV LIFERAY_HOME="/opt/liferay" \
    TOMCAT_HOME="/opt/liferay/tomcat" \
    DOMAIN_PREFIXES="www=dev-www" \
    DEFAULT_PREFIX="dev" \
    ENVIRONMENT="dev" \
    JDBC_DEBUG_LEAK_CONNECTIONS="true" \
    JAVA_VERSION="zulu11"

ARG TARGETARCH

COPY files /mnt/liferay/files
COPY scripts /mnt/liferay/scripts
COPY dockerize-linux-$TARGETARCH-v0.6.1.tar.gz /tmp/dockerize.tar.gz

USER root

RUN apt-get update -y \
    && apt-get install -y wget curl unzip tar gzip mysql-client

RUN tar -C /usr/local/bin -xzvf /tmp/dockerize.tar.gz \
    && rm /tmp/dockerize.tar.gz \
    && rm -rf /tmp/* /var/cache/apk/* 

USER liferay:liferay