Edit update-route53-A.json

update    "Name": "test.susetech.org", to test.{YOURDOMAIN.COM}

Make sure you set the host name via the command below and any other way

sudo hostnamectl set-hostname {hostname}

To update the workstation to the hostname rub:

sh instance_create_route53.sh
