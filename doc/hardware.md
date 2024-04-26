# Hardware

## Inhaltsverzeichnis

1. [Raspberry Pi 4 Model B](#raspberry-pi-4-model-b)
   - [Stromversorgung](#stromversorgung)
   - [Built-In-Speicher](#built-in-speicher)
   - [Kühlung](#kühlung)
   - [Netzwerk](#netzwerk)
   - [GPIO Header](#gpio-header)

## Einleitung

In diesem Abschnitt wird die Hardware beschrieben, die für das SnakeGame-Projekt verwendet wird. Dazu gehören der Raspberry Pi 4 Model B, der als Server für das Spiel fungiert, sowie die Kühlung, die Stromversorgung und das Netzwerk, die für den Betrieb des Raspberry Pi 4 Model B benötigt werden.

### Verwendete Hardware

Für das SnakeGame-Projekt wird folgende Hardware verwendet:

    - 1 x Raspberry Pi 4 Model B
    - 1 x 32GB USB 3.0 Flash Drive
    - 1 x 5V 3A USB-C Power Supply
    - 1 x Vollmetallgehäuse für Raspberry Pi 4
    - 2 x Lüfter für Raspberry Pi 4 auf Gehäuse montiert
    - 1 x 1m Ethernet Kabel

## Raspberry Pi 4 Model B

Das Projekt läuft aktuell auf einem Raspberry Pi 4 B, den ich (H) noch zuhause liegen hatte und der zu verstauben drohte. 
Der Raspberry Pi 4 B ist ein Einplatinencomputer, der von der Raspberry Pi Foundation entwickelt wurde. Er hat einen 1,5 GHz Quad-Core ARM Cortex-A72 Prozessor, 4 GB RAM, 2 USB 3.0 Ports, 2 USB 2.0 Ports, 2 HDMI Ports, Gigabit Ethernet, Bluetooth 5.0, WLAN 802.11ac und einen 40-poligen GPIO Header.

### Stromversorgung

Der Raspberry Pi 4 B benötigt eine Stromversorgung von 5V und mindestens 3A. Verwendet wird ein Netzteil, welches eigentlich für einen Dell-Laptop gedacht ist. Macht aber im Grunde nichts, da es sich um ein USB-C Netzteil handelt, welches 5V und 3A liefern kann.

### Built-In-Speicher

Der Raspberry Pi 4 B hat keinen internen Speicher. Zu Informationen über den Speicher siehe [Speicher](#speicher).

### Kühlung

Die Kühlung ist ein entscheidender Faktor, wenn es um die Lebensdauer eines Raspberry Pi geht. Der Raspberry Pi 4 B wird in einem Vollmetallgehäuse betrieben, welches die Wärme des Prozessors besser abführen kann. Zudem sind zwei Lüfter auf dem Gehäuse montiert, die die Wärme zusätzlich abführen.

Die Lüfter werden über den GPIO Header des Raspberry Pi 4 B mit Strom versorgt. Angeschlossen sind sie an den 5V und GND Pin des GPIO Headers. Die Lüfter sind so konfiguriert, dass sie immer laufen, wenn der Raspberry Pi 4 B eingeschaltet ist und die Kühlung des Systems gewährleisten. Für weitere Informationen über den GPIO Header siehe [GPIO Header](#gpio-header).

### Netzwerk

Der Raspberry Pi 4 B hat einen Gigabit Ethernet Port, über den er mit dem Netzwerk verbunden ist. Der Raspberry Pi 4 B ist über ein 1m langes Ethernet Kabel mit der WLAN-Brücke verbunden, die den Zugang zum Internet über eine weitere WLAN-Verbindung und schließlich über ein Ethernet-Kabel zum Router herstellt.

### GPIO Header

Der Raspberry Pi 4 B hat einen 40-poligen GPIO Header, über den er mit anderen Geräten verbunden werden kann. Der GPIO Header hat verschiedene Pins, die für verschiedene Zwecke verwendet werden können. Die Pins sind wie folgt belegt:

Funktion | Pin | Pin | Funktion
-------- | --- | --- | --------
<span style="color:red">3.3V</span>     |  1  |  2  | <span style="color:red">5V</span>
<span style="color:green">GPIO2</span>    |  3  |  4  | <span style="color:red">5V</span>
<span style="color:green">GPIO3</span>    |  5  |  6  | <span style="color:blue">GND</span>
<span style="color:green">GPIO4</span>    |  7  |  8  | <span style="color:green">GPIO14</span>
<span style="color:blue">GND</span>      |  9  | 10  | <span style="color:green">GPIO15</span>
<span style="color:green">GPIO17</span>   | 11  | 12  | <span style="color:green">GPIO18</span>
<span style="color:green">GPIO27</span>   | 13  | 14  | <span style="color:blue">GND</span>
<span style="color:green">GPIO22</span>   | 15  | 16  | <span style="color:green">GPIO23</span>
<span style="color:red">3.3V</span>     | 17  | 18  | <span style="color:green">GPIO24</span>
<span style="color:green">GPIO10</span>   | 19  | 20  | <span style="color:blue">GND</span>
<span style="color:green">GPIO9</span>    | 21  | 22  | <span style="color:green">GPIO25</span>
<span style="color:green">GPIO11</span>   | 23  | 24  | <span style="color:green">GPIO8</span>
<span style="color:blue">GND</span>      | 25  | 26  | <span style="color:green">GPIO7</span>
<span style="color:green">ID_SD</span>    | 27  | 28  | <span style="color:green">ID_SC</span>
<span style="color:green">GPIO5</span>    | 29  | 30  | <span style="color:blue">GND</span>
<span style="color:green">GPIO6</span>    | 31  | 32  | <span style="color:green">GPIO12</span>
<span style="color:green">GPIO13</span>   | 33  | 34  | <span style="color:blue">GND</span>
<span style="color:green">GPIO19</span>   | 35  | 36  | <span style="color:green">GPIO16</span>
<span style="color:green">GPIO26</span>   | 37  | 38  | <span style="color:green">GPIO20</span>
<span style="color:blue">GND</span>      | 39  | 40  | <span style="color:green">GPIO21</span>

Für die Lüfter in unserem Projekt werden die Pins 4 (5V) und 6 (GND) verwendet, weil sie nebeneinander liegen und so die Verkabelung einfacher ist.

### Speicher

Da die Himbeer-Familie von Hause aus keinen internen Speicher hat, wird ein USB-Stick verwendet, um das Betriebssystem und die Daten zu speichern. Der USB-Stick ist ein 32GB USB 3.0 Flash Drive, der über einen USB 3.0 Port an den Raspberry Pi 4 B angeschlossen ist.

Auf dem USB-Stick ist das Betriebssystem Raspbian installiert, welches das "Standard"-OS für Raspberry Pi ist. Es ist eine speziell angepasste Version von Debian, die für den Raspberry Pi optimiert ist. Das Betriebssystem wird von der Raspberry Pi Foundation bereitgestellt und wurde von der offiziellen Website heruntergeladen und auf den USB-Stick geschrieben mittels [Raspberry Pi Imager](https://www.raspberrypi.org/software/).

### Überlegungen

Der Raspberry Pi 4 B ist ein leistungsstarker Einplatinencomputer, der für das SnakeGame-Projekt gut geeignet ist. Er bietet genügend Rechenleistung, Speicher und Anschlussmöglichkeiten für das Spiel. Die Kühlung und Stromversorgung sind ebenfalls ausreichend, um den Raspberry Pi 4 B stabil und zuverlässig zu betreiben.

Unter Vollast erreicht der Raspberry Pi 4 B eine Temperatur von ca. 60°C, was im normalen Bereich liegt. Die Kühlung des Raspberry Pi 4 B ist ausreichend, um die Temperatur im Betrieb stabil zu halten und Überhitzung zu vermeiden. Weiterhin hat der Raspberry Pi 4B unter Vollast einen Leistungsbedarf von 15 Watt, was für den Betrieb mit einem 5V 3A Netzteil ausreichend ist.

Der Raspberry Pi 4 B ist eine kostengünstige und leistungsstarke Lösung für das SnakeGame-Projekt und bietet genügend Ressourcen, um das Spiel zu hosten und zu betreiben. Die Verwendung von Standardkomponenten wie USB-Stick, Netzteil und Gehäuse macht den Raspberry Pi 4 B einfach zu konfigurieren und zu betreiben.