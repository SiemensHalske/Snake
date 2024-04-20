#!/bin/bash

# Erstellen der Hauptverzeichnisse
mkdir -p api public/css public/js src/config vendor

# Erstellen von Standarddateien
touch api/db_connect.php
touch public/index.html
touch public/css/style.css
touch public/js/script.js
touch src/config/config.php

# Beispielinhalt für index.html hinzufügen
echo '<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mein Projekt</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h1>Hallo Welt!</h1>
    <script src="js/script.js"></script>
</body>
</html>' > public/index.html
