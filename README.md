# Traffic Monitor enviroplus-monitor
[Pimoroni Enviro+ air quality monitor sensors](https://shop.pimoroni.com/products/enviro-plus) for the open source [Traffic Monitor](https://www.trafficmonitor.ai) project at [glossyio/traffic-monitor](https://github.com/glossyio/traffic-monitor).

Based on the amazing work at [roscoe81/enviro-monitor](https://github.com/roscoe81/enviro-monitor) (cloned from 
[73a8e02](https://github.com/roscoe81/enviro-monitor/commit/73a8e02923434d8c7555ff91899c8f04f73aaf47), version `8.2 Gen`) and the manufactuer's repo at [pimoroni/enviroplus-python](https://github.com/pimoroni/enviroplus-python).

# Config settings for TM
Relevant settings for Python script to interact with the Traffic Monitor Node-RED instance.

See [config_readme.md](config_readme.md) for table with full description and TM defaults.  Minimum required TM config fields also listed below:

## Configure MQTT communications settings
- `"enable_send_data_to_homemanager": true` in order to send MQTT payloads to specified broker
- `"mqtt_broker_name": "localhost"` to send to Node-RED MQTT broker (assumes port 1883)
- `"indoor_outdoor_function": "Outdoor"` to utilize `outdoor_mqtt_topic`
- `"enable_display": false` since the AQ sensor will be in an enclosure
- `"outdoor_mqtt_topic": "aq/readings"` for message topic

## Configure deployment-specific settings
These need to be configured per-deployment for your location.  They are utilized by the [Astral package]([url](https://astral.readthedocs.io/en/stable/index.html)) for calculating the times of various aspects of the sun and phases of the moon.

```
    "altitude": 49,
    "city_name": "Portland",
    "time_zone": "America/Los_Angeles",
    "custom_locations": [
        "Portland, United States of America, America/Los_Angeles, 45.52, -122.681944"
    ]
```
