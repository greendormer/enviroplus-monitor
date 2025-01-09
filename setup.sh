# sudo systemctl restart airquality_server

echo "==> Setting up air quality systemd service…"

sudo cp -rp ~/code/enviroplus-monitor/* /var/lib/airquality/ 

echo \
  "# /etc/systemd/system/airquality_server.service
# to run: sudo systemctl stop/start/restart/enable/disable airquality_server

[Unit]
Description=airQualityDaemon
After=network.target rc-local.service

[Service]
Restart=always
WorkingDirectory=/var/lib/airquality/
ExecStart=/usr/bin/python3 -u enviro.py

[Install]
WantedBy=multi-user.target" | \
  sudo tee /etc/systemd/system/airquality_server.service > /dev/null
sudo chmod 644 /etc/systemd/system/airquality_server.service

sudo systemctl start airquality_server
sudo systemctl enable airquality_server
