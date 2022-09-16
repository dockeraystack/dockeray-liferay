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



CATALINA_OPTS_BASIC=${CATALINA_OPTS_BASIC:-"-server -XX:+AlwaysPreTouch -Dfile.encoding=UTF-8 -Djava.net.preferIPv4Stack=true -Duser.country=US -Duser.language=en -Duser.timezone=GMT -Djava.awt.headless=true "}

CATALINA_OPTS_ENVIRONMENT=${CATALINA_OPTS_ENVIRONMENT:-"-Dvirtual.host.mapping=$DOMAIN_PREFIXES -Dvirtual.host.default.prefix=$DEFAULT_PREFIX -Dtarget.environment=$ENVIRONMENT -Dspring.profiles.active=$ENVIRONMENT -Djdbc.debug.leak.connections=$JDBC_DEBUG_LEAK_CONNECTIONS "}

CATALINA_OPTS_TOMCAT=${CATALINA_OPTS_TOMCAT:-"-Djava.security.auth.login.config=$CATALINA_HOME/conf/jaas.config -Dorg.apache.catalina.loader.WebappClassLoader.ENABLE_CLEAR_REFERENCES=false -Dorg.apache.xerces.xni.parser.XMLParserConfiguration=org.apache.xerces.parsers.XIncludeAwareParserConfiguration "}

CATALINA_OPTS_GC_LOGGING_FILE=${CATALINA_OPTS_GC_LOGGING_FILE:-"-Xlog:gc*,gc+ref=debug,gc+heap=debug,gc+age=trace:file=$CATALINA_HOME/logs/gc-%p-%t.log:tags,uptime,time,level:filecount=5,filesize=20m "}

CATALINA_OPTS_HEAP=${CATALINA_OPTS_HEAP:-"-Xmx4096m "}

CATALINA_OPTS_JAVAAGENT=${CATALINA_OPTS_JAVAAGENT:-"-javaagent:/opt/liferay/tomcat/bin/glowroot/glowroot.jar "} 

CATALINA_OPTS="$CATALINA_OPTS_BASIC $CATALINA_OPTS_ENVIRONMENT $CATALINA_OPTS_TOMCAT $CATALINA_OPTS_GC_LOGGING_FILE $CATALINA_OPTS_HEAP $CATALINA_OPTS_JAVAAGENT"