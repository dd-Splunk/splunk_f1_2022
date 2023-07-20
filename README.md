# splunk_f1_2022

## Raspberry preparation

Launch the [Raspberry Pi Imager](https://www.raspberrypi.com/software/)

![md-bfd602be71b2c1099b91877aed3b41f0](assets/md-bfd602be71b2c1099b91877aed3b41f0.png)

## Ingest script for O11y and Core/Enterprise

```sh
#!/bin/bash
python3 -m venv venv
. /venv/bin/activate
pip3 install -r requirements.txt
```

Edit `settings.ini`

```ini
[ingest_settings]
debug = True
sim_token = xxx
ingest_endpoint = https://ingest.{REALM}.signalfx.com
splunk_hec_ip = https://hec_endpoint
splunk_hec_port = 8088
splunk_hec_token = xxx

[telemetry_settings]
motion = True
telemetry = True
lap = True
status = True
```

```sh
usage: F1_2022_Conference_ingest.py [-h] [--hostname HOSTNAME]
                                    [--player PLAYER] [--port PORT]
                                    [--o11y {yes,no}] [--splunk {yes,no}]
                                    [--mode {spectator,solo}]
example: python3 F1_2022_Conference_ingest.py --o11y yes --mode solo --player ex_test

Splunk DataDrivers

options:
  -h, --help            show this help message and exit
  --hostname HOSTNAME   Hostname
  --player PLAYER       Player Name
  --port PORT           UDP Port
  --o11y {yes,no}       Send data to O11y Cloud
  --splunk {yes,no}     Send data to Splunk Enterprise/Cloud
  --mode {spectator,solo}
                        Spectator or Solo Mode
```
