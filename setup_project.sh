#!/bin/bash

# Erstellen der Hauptverzeichnisse
mkdir -p api public/css public/js src/config vendor

# Erstellen von Standarddateien
touch api/db_connect.php
touch public/index.html
touch public/css/style.css
touch public/js/script.js
touch src/config/config.php