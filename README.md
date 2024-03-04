# VSFTPD Docker

## Generate certificates

Run `gen-cert.sh` script and generate certificates. Place the files inside `./cert` directory and name them `ftp.crt` and `ftp.key`.

## Before starting the container

Change the `./conf/vsftpd.conf` according to your needs. By default, the configuration is made to run on a docker bridge network.

If you want to run it as is. Please change the `pasv_address=<your-host-ip>` to match your host IP in order to enable the passive mode.

If you want to run the container in `host` network mode. Please comment out the `pasv_address=<your-host-ip>` setting.
