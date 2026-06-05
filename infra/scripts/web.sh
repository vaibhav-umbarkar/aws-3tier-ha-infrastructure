#!/bin/bash
apt update -y
apt install -y apache2

# Get IMDSv2 token
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/instance-id)

AZ=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/placement/availability-zone)

PRIVATE_IP=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/local-ipv4)


cat <<EOF > /var/www/html/index.html
<h1>Web Tier</h1>
<p><b>Instance ID:</b>$INSTANCE_ID</p>
<p><b>Availability Zone:</b>$AZ</p>
<p></b>Private IP:</b>$PRIVATE_IP</p>
EOF

echo "OK" > /var/www/html/health

systemctl start apache2
systemctl enable apache2
