# sudo systemctl restart aqimonitor

# https://projects-raspberry.com/indoor-air-quality-monitor/#Script_auto-run


#     Script auto-run
#     In order to make the python script auto-load when the RaspberryPi restart, we can create a simple service to run the python script:

#     1) Create a “airquality.service” file with the following content:

#     [Unit]
#     Description=airQualityDaemon
#     After=network.target
#     [Service]
#     ExecStart=/usr/bin/python3 -u serialtoinflux.py
#     WorkingDirectory=/home/pi/air-quality
#     StandardOutput=inherit
#     StandardError=inherit
#     Restart=always
#     User=pi
#     [Install]
#     WantedBy=multi-user.target
#     2) Copy this file into /etc/systemd/system as root:

#     sudo cp airquality.service /etc/systemd/system/airquality.service
#     Once this has been copied, you can attempt to start the service using:

#     sudo systemctl start airquality.service
#     3) When you are happy that this starts the app, you can have it start automatically on reboot by using this command:

#     sudo systemctl enable airquality.service