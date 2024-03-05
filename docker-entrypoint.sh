#!/bin/ash

# Configure default values
FTP_USER=${FTP_USER:-user}
FTP_PASSWORD=${FTP_PASSWORD:-pass}

echo "Creating $FTP_USER..."
# useradd -m -s /bin/bash -p "$(openssl passwd -1 "$FTP_PASSWORD")" "$FTP_USER"
adduser -h "/home/$FTP_USER" -s /usr/sbin/nologin -S "$FTP_USER"
passwd "$FTP_USER" -d "$FTP_PASSWORD"
addgroup "$FTP_USER"
addgroup "$FTP_USER" "$FTP_USER"

touch /etc/vsftpd.chroot_list && echo "$FTP_USER" > /etc/vsftpd.chroot_list

chown -R "$FTP_USER:$FTP_USER" "/opt/ftp-data"

chown root: /etc/vsftpd/*
chown root: /opt/ftp-cert/*

echo "Configuring shells..."
echo "/usr/sbin/nologin" >> /etc/shells

echo "Configuring permissions..."

echo "Starting logging..."
touch /var/log/vsftpd.log && tail -f /var/log/vsftpd.log >> /dev/stdout &

echo "Starting vsftpd..."
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
