#!/bin/bash

# Setup directory for project work and set permissions
echo "Setting up project directory..."
sudo mkdir -p /opt/Snake
sudo chown root:developers /opt/Snake
sudo chmod 775 /opt/Snake

# Configure Apache Virtual Hosts
echo "Configuring Apache Virtual Hosts..."
# HTTP
sudo bash -c 'cat > /etc/apache2/sites-available/000-default.conf << EOF
<VirtualHost *:80>
    DocumentRoot /opt/Snake
    <Directory /opt/Snake>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
EOF'

# HTTPS
sudo bash -c 'cat > /etc/apache2/sites-available/default-ssl.conf << EOF
<VirtualHost *:443>
    DocumentRoot /opt/Snake
    SSLEngine on
    SSLCertificateFile /etc/ssl/certs/ssl-cert-snakeoil.pem
    SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key
    <Directory /opt/Snake>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
EOF'

# Enable SSL module and site
sudo a2enmod ssl
sudo a2ensite default-ssl.conf

# Restart Apache to apply changes
sudo systemctl restart apache2
