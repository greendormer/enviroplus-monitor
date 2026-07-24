# sudo systemctl restart airquality_server

echo "==> Setting up air quality systemd service…"

# install depednecies from pimoroni/enviroplus-python
# this is an interactive install
#  this will create a python virtual environment at ~/.virtualenvs/pimoroni/
git clone https://github.com/pimoroni/enviroplus-python $HOME/enviroplus-python
cd $HOME/enviroplus-python
bash $HOME/enviroplus-python/install.sh -f

sudo mkdir -p /var/lib/airquality/
sudo cp -rp $HOME/enviroplus-monitor/* /var/lib/airquality/ 

sudo $HOME/.virtualenvs/pimoroni/bin/python -m pip install -r /var/lib/airquality/requirements.txt

echo \
  "# /etc/systemd/system/airquality_server.service
# to run: sudo systemctl stop/start/restart/enable/disable airquality_server

[Unit]
Description=airQualityDaemon
After=network.target rc-local.service

[Service]
Restart=always
WorkingDirectory=/var/lib/airquality/
ExecStart=sudo $HOME/.virtualenvs/pimoroni/bin/python enviro.py

[Install]
WantedBy=multi-user.target" | \
  sudo tee /etc/systemd/system/airquality_server.service > /dev/null
sudo chmod 644 /etc/systemd/system/airquality_server.service

sudo systemctl daemon-reload

sudo systemctl start airquality_server
sudo systemctl enable airquality_server
