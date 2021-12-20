# ELK Stack Dockerfile with UDP
from sebp/elk

WORKDIR ${LOGSTASH_HOME}

# Plugins to install
RUN gosu logstash bin/logstash-plugin install logstash-input-udp
RUN gosu logstash bin/logstash-plugin install logstash-codec-json_lines
