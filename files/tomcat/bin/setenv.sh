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

TOMCAT_HOME=/opt/liferay/tomcat
CATALINA_HOME=$TOMCAT_HOME

CATALINA_OPTS="$CATALINA_OPTS -Dcompany-id-properties=true -Dfile.encoding=UTF-8 -Duser.timezone=GMT -Djava.net.preferIPv4Stack=true -Dvirtual.host.mapping=$DOMAIN_PREFIXES -Dvirtual.host.default.prefix=$DEFAULT_PREFIX -Dtarget.environment=$ENVIRONMENT -Dspring.profiles.active=$ENVIRONMENT -Djdbc.debug.leak.connections=$JDBC_DEBUG_LEAK_CONNECTIONS"
CATALINA_OPTS="$CATALINA_OPTS -Djava.security.auth.login.config=$CATALINA_HOME/conf/jaas.config -Djava.awt.headless=true -Dorg.apache.catalina.loader.WebappClassLoader.ENABLE_CLEAR_REFERENCES=false -Dorg.apache.xerces.xni.parser.XMLParserConfiguration=org.apache.xerces.parsers.XIncludeAwareParserConfiguration"
CATALINA_OPTS="$CATALINA_OPTS -server -Xmx4096m"
CATALINA_OPTS="$CATALINA_OPTS -Xlog:gc=trace:file=/opt/liferay/tomcat/logs/gc.log:uptimemillis,pid:filecount=5,filesize=1m "