[Unit]
Description=Gopls Server(language protocol server for golang)
After=network.target

[Service]
Type=simple
PIDFile=/var/run/gopls.pid
User=$USER
EnvironmentFile=/home/$USER/.go.env
ExecStart=/home/$USER/.local/gobin/gopls serve -listen=127.0.0.1:19191
ExecStop=/bin/kill -TERM $MAINPID
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
