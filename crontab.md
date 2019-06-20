# Crontab Commands

Create the backup (export):

`sudo crontab -l > /some/shared/location/crontab.bak`

Import it:

`sudo crontab /some/shared/location/crontab.bak`
