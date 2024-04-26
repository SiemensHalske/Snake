# SnakeGame

- [Ordnerstruktur](#ordnerstruktur)
    - [doc](#doc)
    - [api](#api)
    - [main](#main)
    - [migrations](#migrations)
    - [Scripts](#scripts)
    - [static](#static)
    - [vendor](#vendor)
- [Technologien](#technologien)
    - [PHP](#php)
        - [PDO (Datenbankverbindung)](#pdo-datenbankverbindung)
            - [DSN](#dsn)
            - [Benutzername und Passwort](#benutzername-und-passwort)
    - [MariaDB (MySQL)](#mariadb-mysql)
    - [Apache](#apache)
    - [JavaScript](#javascript)
    - [HTML/CSS](#htmlcss)
    - [Composer](#composer)
        - [Externe Bibliotheken](#externe-bibliotheken)
- [Dokumentation](doc/doc.md)

## Ordnerstruktur
```
SnakeGame
│   README.md
│
└───doc
│   │   README.md
│    
└───api
│ 
└───api
│
└───main
|
└───migrations
|
└───Scripts
|
└───static
|
└───vendor
```

- **doc**: Enthält die Dokumentation des Projekts.
- **api**: Enthält die API-Dateien für die Kommunikation zwischen Frontend und bspw. der Datenbank.
- **main**: Enthält die meisten HTML-Dateien, die für das Spiel benötigt werden.
- **auth**: Enthält die Dateien für die Authentifizierung und Registrierung von Benutzern.
- **migrations**: Enthält SQL-Dateien, die verwendet werden, um die Datenbank zu initialisieren und zu aktualisieren.
- **Scripts**: Enthält Skripte, die für die Entwicklung und das Testen des Spiels verwendet werden.
- **static**: Enthält statische Dateien wie JavaScript, CSS und Bilder.
- **vendor**: Enthält externe Bibliotheken und Abhängigkeiten, die für das Spiel benötigt werden. Hauptsächlich für Composer-Pakete.

### doc

Der `doc`-Ordner enthält die Dokumentation des Projekts.

Hier finden sich Informationen zur Installation, Verwendung und Konfiguration des Spiels. Die Dokumentation ist in Markdown-Dateien verfasst, die im `doc`-Ordner gespeichert sind.

### api

Der `api`-Ordner enthält die API-Dateien für die Kommunikation zwischen Frontend und Backend.

Hier finden sich PHP-Dateien, die die Datenbankverbindung herstellen, Benutzerdaten verarbeiten und das Spiel steuern.

### main

Der `main`-Ordner enthält die meisten HTML-Dateien, die für das Spiel benötigt werden.

Hier finden sich die die meisten der verwendeten HTML-Pages, die für das Spiel benötigt werden und die Benutzeroberfläche darstellen.

### migrations

Der `migrations`-Ordner enthält SQL-Dateien, die verwendet werden, um die Datenbank zu initialisieren und zu aktualisieren.

Hier finden sich SQL-Dateien, welche die Tabellen und Datenbankstruktur für das Spiel erstellen und aktualisieren können.
`migrations` wurde der Ordner genannt, da er SQL-Dateien enthält, die verwendet werden, um die Datenbank zu migrieren.

### Scripts

Der `Scripts`-Ordner enthält Skripte, die für die Entwicklung und das Testen des Spiels verwendet werden.

Im Grunde ist das nur eine Art Spielwiese für uns, um Skripte zu schreiben, die uns bei der Entwicklung und dem Testen des Spiels helfen.

### static

Der `static`-Ordner enthält statische Dateien wie JavaScript, CSS und Bilder.

Hier finden sich die Dateien, die für das Design und die Funktionalität des Spiels benötigt werden. Dazu gehören JavaScript-Dateien für die Spiellogik, CSS-Dateien für das Design und Bilder für die Benutzeroberfläche.

### vendor

Der `vendor`-Ordner enthält externe Bibliotheken und Abhängigkeiten, die für das Spiel benötigt werden.

In diesem Ordner befinden sich hauptsächlich Composer-Pakete, die für das Spiel benötigt werden. Für Informationen über `composer` siehe den Abschnitt [Technologien](#technologien).

## Technologien

Unser Projekt verwendet eine Reihe von Technologien, um das Spiel zu entwickeln und bereitzustellen. Hier sind einige der wichtigsten Technologien, die wir verwenden:

- **PHP**: Die Hauptprogrammiersprache, die für die Backend-Logik des Spiels verwendet wird.
    - **PDO (Datenbankverbindung)**: Eine PHP-Erweiterung, die eine Datenbankverbindung herstellt und Abfragen an die Datenbank sendet.
    - **JSON Web Tokens (Authentifizierung)**: Eine Methode zur Authentifizierung von Benutzern, die auf sicheren Token basiert.
    - **Login und Nutzerregistrierung**: Funktionen, die es Benutzern ermöglichen, sich anzumelden und zu registrieren.

- **MariaDB (MySQL)**: Eine relationale Datenbank, die für die Speicherung von Benutzerdaten und Punktzahlen verwendet wird.

- **Apache**: Ein Webserver, der für die Bereitstellung des Spiels verwendet wird.

- **JavaScript**: Eine Programmiersprache, die für die Spiellogik und die Benutzeroberfläche verwendet wird.
    - **Spiellogik und Benutzeroberfläche**: Funktionen, die das Spiel steuern und die Benutzeroberfläche interaktiv gestalten.
    - **Laden von Elementen in die HTML-Seiten**: JavaScript wird verwendet, um Elemente in die HTML-Seiten zu laden und zu aktualisieren. Das soll der Übersichtlichkeit und Wartbarkeit des Codes dienlich sein.

- **HTML/CSS**: Markup-Sprache und Stylesheet-Sprache, die für die Benutzeroberfläche und das Design des Spiels verwendet werden.
    - **Benutzeroberfläche und Design**: HTML wird verwendet, um die Struktur der Seiten zu definieren, während CSS für das Design und die Darstellung der Seiten verwendet wird.
    - **Responsives Design**: CSS wird verwendet, um das Design der Seiten für verschiedene Bildschirmgrößen und Geräte zu optimieren.

- **Composer**: Ein Paketmanager für PHP, der für die Verwaltung von Abhängigkeiten und Bibliotheken verwendet wird.
    - **Externe Bibliotheken**: Composer wird verwendet, um externe Bibliotheken und Abhängigkeiten zu installieren, die für das Spiel benötigt werden.
    - **Automatisches Laden von Klassen**: Composer ermöglicht das automatische Laden von Klassen, was die Entwicklung und Wartung des Codes erleichtert.
    - **Pakete und Abhängigkeiten**: Composer wird verwendet, um Pakete und Abhängigkeiten zu verwalten, die für das Spiel benötigt werden.
    - **Autoloading von Klassen**: Composer ermöglicht das automatische Laden von Klassen, was die Entwicklung und Wartung des Codes erleichtert.

### PHP

PHP ist die Hauptprogrammiersprache, die für die Backend-Logik des Spiels verwendet wird. PHP ist eine serverseitige Skriptsprache, die für die Erstellung dynamischer Webseiten und Anwendungen verwendet wird. In unserem Projekt wird PHP verwendet, um die Datenbankverbindung herzustellen, Benutzerdaten zu verarbeiten und das Spiel zu steuern.

#### PDO (Datenbankverbindung)

PDO (PHP Data Objects) ist eine Erweiterung von PHP, die Datenbankverbindungen herstellt und Abfragen an die Datenbank sendet. Es bietet eine einheitliche Methode zum Zugriff auf verschiedene Datenbanken und ist sicherer und effizienter als die älteren MySQL- und MySQLi-Erweiterungen.

In unserem Projekt wird PDO verwendet, um eine Verbindung zur MariaDB-Datenbank herzustellen. Hier ist ein Beispiel, wie wir PDO verwenden, um eine Datenbankverbindung herzustellen:

```php
<?php
require_once '/home/hendrik/SnakeGame/api/config/config.php';

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (\PDOException $e) {
    throw new \PDOException($e->getMessage(), (int)$e->getCode());
}

?>
```

In diesem Code wird zuerst die Konfigurationsdatei eingebunden, die die Datenbankverbindungsinformationen enthält (DSN, Benutzername und Passwort). Dann wird versucht, eine neue PDO-Instanz zu erstellen, die die Datenbankverbindung repräsentiert. Wenn beim Herstellen der Verbindung ein Fehler auftritt, wird eine Ausnahme geworfen, die den Fehlercode und die Fehlermeldung enthält.

##### DSN

DSN (Data Source Name) ist eine Zeichenfolge, die die Datenbankverbindungsinformationen enthält.
Es enthält:
- den Datenbanktyp (z. B. `mysql`)
- den Hostnamen (z. B. `localhost`)
- den Datenbanknamen (z. B. `snakegame`) und
- den Zeichensatz (z. B. `utf8mb4`).

Hier ist ein Beispiel für einen DSN:

```php
$dsn = 'mysql:host=localhost;dbname=snakegame;charset=utf8mb4';
```

In diesem DSN wird der Datenbanktyp (`mysql`), der Hostname (`localhost`), der Datenbankname (`snakegame`) und der Zeichensatz (`utf8mb4`) angegeben.

##### Benutzername und Passwort

Der Benutzername und das Passwort werden verwendet, um sich bei der Datenbank anzumelden und auf die Daten zuzugreifen. In unserem Projekt verwenden wir einen Benutzernamen und ein Passwort, um die Datenbankverbindung herzustellen.

Hier ist ein Beispiel für einen Benutzernamen und ein Passwort:

```php
$user = 'root
$pass = 'password
```

In diesem Beispiel wird der Benutzername (`root`) und das Passwort (`password`) verwendet, um sich bei der Datenbank anzumelden.
Aus Sicherheitsgründen sollten Benutzername und Passwort in einer separaten Konfigurationsdatei gespeichert und nicht im Quellcode fest codiert werden.

### MariaDB (MySQL)

MariaDB ist eine relationale Datenbank, die für die Speicherung von Benutzerdaten und Punktzahlen verwendet wird. MariaDB ist eine Abspaltung von MySQL, die von den ursprünglichen Entwicklern von MySQL erstellt wurde. In unserem Projekt verwenden wir MariaDB, um Benutzerdaten, Punktzahlen und andere Spielinformationen zu speichern.

MariaDB wird auf Linux-Servern häufig als Standarddatenbank verwendet, da es eine freie und quelloffene Alternative zu kommerziellen Datenbanken wie Oracle und Microsoft SQL Server ist. In unserem Projekt verwenden wir MariaDB, um die Datenbank für das Spiel zu hosten und zu verwalten.

### Apache

Apache ist ein Webserver, der für die Bereitstellung des Spiels verwendet wird. Apache ist einer der beliebtesten Webserver der Welt und wird auf Millionen von Websites und Anwendungen eingesetzt. In unserem Projekt verwenden wir Apache, um das Spiel auf einem Linux-Server bereitzustellen und den Datenverkehr zwischen dem Frontend und dem Backend zu verwalten.

Zudem ist Apache ebenfalls kostenfrei und quelloffen, was es zu einer beliebten Wahl für Entwickler und Unternehmen macht, die eine zuverlässige und leistungsstarke Webserverlösung suchen.

### JavaScript

JavaScript ist eine Programmiersprache, die für die Spiellogik und die Benutzeroberfläche verwendet wird. JavaScript ist eine clientseitige Skriptsprache, die in Webbrowsern ausgeführt wird und es ermöglicht, interaktive Webseiten und Anwendungen zu erstellen. In unserem Projekt verwenden wir JavaScript, um die Spiellogik zu steuern, die Benutzeroberfläche zu interaktiv zu gestalten und Elemente in die HTML-Seiten zu laden.

JavaScript wird häufig in Kombination mit HTML und CSS verwendet, um dynamische Webseiten und Anwendungen zu erstellen. In unserem Projekt verwenden wir JavaScript, um die Spiellogik zu steuern, die Benutzeroberfläche zu interaktiv zu gestalten und Elemente in die HTML-Seiten zu laden.
Außerdem wird JavaScript verwendet um Teile der Benutzerobefläche wiederverwendbar zu machen, indem sie in externe Dateien ausgelagert werden und über JS in die HTML-Seiten geladen werden.

### HTML/CSS

HTML (Hypertext Markup Language) und CSS (Cascading Style Sheets) sind Markup-Sprache und Stylesheet-Sprache, die für die Benutzeroberfläche und das Design des Spiels verwendet werden. HTML wird verwendet, um die Struktur der Seiten zu definieren, während CSS für das Design und die Darstellung der Seiten verwendet wird. In unserem Projekt verwenden wir HTML und CSS, um die Benutzeroberfläche zu erstellen und das Design des Spiels zu definieren.

HTML wird verwendet, um die Struktur der Seiten zu definieren, während CSS für das Design und die Darstellung der Seiten verwendet wird.

### Composer

Composer ist ein Paketmanager für PHP, der für die Verwaltung von Abhängigkeiten und Bibliotheken verwendet wird. Composer ermöglicht es Entwicklern, externe Bibliotheken und Abhängigkeiten zu installieren, zu aktualisieren und zu verwalten, die für die Entwicklung von PHP-Anwendungen benötigt werden. In unserem Projekt verwenden wir Composer, um externe Bibliotheken und Abhängigkeiten zu installieren, die für das Spiel benötigt werden.

#### Externe Bibliotheken

Aktuell verwenden wir keine externen Bibliotheken, die über Composer installiert werden. In Zukunft könnten wir jedoch externe Bibliotheken verwenden, um die Funktionalität des Spiels zu erweitern und die Entwicklung zu beschleunigen.

