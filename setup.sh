# sudo systemctl restart airquality_server

echo "==> Setting up air quality systemd service…"

# install depednecies from pimoroni/enviroplus-python
#  this will create a python virtual environment at ~/.virtualenvs/pimoroni/
mkdir -p ~/code
git clone https://github.com/pimoroni/enviroplus-python ~/code
cd ~/code/enviroplus-python
./install.sh

sudo mkdir -p /var/lib/airquality/
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
ExecStart=sudo ~/.virtualenvs/pimoroni/bin/python enviro.py

[Install]
WantedBy=multi-user.target" | \
  sudo tee /etc/systemd/system/airquality_server.service > /dev/null
sudo chmod 644 /etc/systemd/system/airquality_server.service

sudo systemctl start airquality_server
sudo systemctl enable airquality_server
