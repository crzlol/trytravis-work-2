#!/bin/bash
cat <<EOF >> /etc/systemd/system/reddit.service
[Unit]
Description=Reddit service
After=network.target

[Service]
Type=simple
User=appuser
ExecStart=/usr/local/bin/puma
Restart=on-failure
RestartSec=30s
WorkingDirectory=~/reddit/

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl start reddit
systemctl enable reddit
