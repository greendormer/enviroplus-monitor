# Traffic Monitor enviroplus-monitor
Pimoroni Enviro+ air quality monitor sensors for Traffic Monitor

Based on the amazing work at https://github.com/roscoe81/enviro-monitor, which was based on https://github.com/pimoroni/enviroplus-python.

# Config settings for TM
Relevant settings for Python script to interact with the Traffic Monitor Node-RED instance.

## MQTT communications settings
- `"enable_send_data_to_homemanager": true` in order to send MQTT payloads to specified broker
- `"mqtt_broker_name": "localhost"` to send to Node-RED MQTT broker (assumes port 1883)
- `"indoor_outdoor_function": "Outdoor"` to utilize `outdoor_mqtt_topic`
- `"enable_display": false` since the AQ sensor will be in an enclosure
- `"outdoor_mqtt_topic": "aq-readings"` for message topic

## Deployment-specific settings
These need to be configured per-deployment for your location.  They are utilized by the [Astral package]([url](https://astral.readthedocs.io/en/stable/index.html)) for calculating the times of various aspects of the sun and phases of the moon.

```
    "altitude": 49,
    "city_name": "Portland",
    "time_zone": "America/Los_Angeles",
    "custom_locations": [
        "Portland, United States of America, America/Los_Angeles, 45.52, -122.681944"
    ]
```
