// Funktion zum Abrufen der Highscores und Aktualisieren der Tabelle
function fetchHighscores() {
    fetch('get_highscores.php')
        .then(response => response.json())
        .then(data => {
            // Leert die vorhandene Tabelle
            document.getElementById('highscore-table').innerHTML = '';

            // Durchläuft die abgerufenen Highscores und fügt sie der Tabelle hinzu
            data.forEach((score, index) => {
                const row = document.createElement('tr');
                row.innerHTML = `
                        <td>${index + 1}</td>
                        <td>${score.Username}</td>
                        <td>${score.Punkte}</td>
                    `;
                document.getElementById('highscore-table').appendChild(row);
            });
        })
        .catch(error => console.error('Error fetching highscores:', error));
}

// Ruft die Highscores beim Laden der Seite auf
fetchHighscores();

// Aktualisiert die Highscores alle 30 Sekunden
setInterval(fetchHighscores, 30000);