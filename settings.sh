#/bin/bash

# Create the settings.ini file containing sensitive info
# that should not to be published on GitHub

source .env
cat <<EOF > settings.ini
[ingest_settings]
debug = True
sim_token = ${SIM_TOKEN}
ingest_endpoint = ${INGEST_ENDPOINT}
splunk_hec_ip = ${SPLUNK_HEC_IP}
splunk_hec_port = 8088
splunk_hec_token = ${SPLUNK_HEC_TOKEN}

[telemetry_settings]
motion = True
telemetry = True
lap = True
status = True
EOF
