<?php
include 'db_connect.php';  // Stellt die Verbindung zur Datenbank her

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $username = $_GET['username'] ?? '';

    // Überprüfen, ob der Benutzername angegeben wurde
    if (empty($username)) {
        http_response_code(400);
        echo json_encode(['message' => 'Benutzername muss angegeben werden.']);
        exit;
    }

    try {
        // Spielerinformationen abrufen
        $sql = "SELECT * FROM Spieler WHERE Username = :username";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':username', $username);
        $stmt->execute();
        $spieler = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$spieler) {
            http_response_code(404);
            echo json_encode(['message' => 'Spieler nicht gefunden.']);
            exit;
        }

        // Spiele und Scores abrufen
        $sql = "SELECT s.SpielID, s.Startzeit, s.Endzeit, sc.ScoreID, sc.Punkte 
                FROM Spiel s
                JOIN Spielteilnahme st ON s.SpielID = st.SpielID
                JOIN Score sc ON st.TeilnahmeID = sc.TeilnahmeID
                WHERE st.SpielerID = :spielerID";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':spielerID', $spieler['SpielerID']);
        $stmt->execute();
        $spiele_scores = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Ergebnisse zusammenführen
        $result = [
            'Spieler' => $spieler,
            'Spiele_Scores' => $spiele_scores
        ];

        // Ergebnis zurückgeben
        http_response_code(200);
        echo json_encode($result);
    } catch (PDOException $e) {
        http_response_code(500);
        echo json_encode(['message' => 'Datenbankfehler: ' . $e->getMessage()]);
    }
} else {
    // Nur GET-Anfragen sind erlaubt
    http_response_code(405);
    echo json_encode(['message' => 'Methode nicht erlaubt']);
}
