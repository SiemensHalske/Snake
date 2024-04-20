<?php
include 'db_connect.php'; // Stellt die Datenbankverbindung her

// SQL-Abfrage für die Highscore-Daten
$sql = "SELECT 
            spi.Username
            , sco.Punkte
        FROM
            Spieler spi
        JOIN
            Spielteilnahme st ON
                spi.SpielerID = st.SpielerID
        JOIN
            Score sco ON
                st.TeilnahmeID = sco.TeilnahmeID
        ORDER BY
            sco.Punkte DESC
        ";


try {
    $stmt = $pdo->query($sql);
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
    http_response_code(200);
    header('Content-Type: application/json');
    echo json_encode($rows);
} catch (PDOException $e) {
    // Fehlerbehandlung
    http_response_code(500);
    echo json_encode(['message' => 'Datenbankfehler: ' . $e->getMessage()]);
}
