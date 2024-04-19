<?php
include 'db_connect.php'; // Stellt die Datenbankverbindung her

// Überprüfen, ob die Anfrage vom Typ POST ist
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Input-Daten aus dem POST-Request lesen
    $inputData = json_decode(file_get_contents("php://input"), true);
    $username = $inputData['username'] ?? '';
    $password = $inputData['password'] ?? '';

    // Einfache Validierung der Eingaben
    if (empty($username) || empty($password)) {
        http_response_code(400);
        echo json_encode(['message' => 'Benutzername und Passwort müssen angegeben werden.']);
        exit;
    }

    // SQL-Statement vorbereiten
    $sql = "SELECT Password FROM Spieler WHERE Username = :username LIMIT 1";

    try {
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':username', $username);
        $stmt->execute();
        $user = $stmt->fetch();

        if ($user && password_verify($password, $user['Password'])) {
            // Erfolgsmeldung
            http_response_code(200);
            echo json_encode(['message' => 'Login erfolgreich.']);
        } else {
            // Fehler bei der Anmeldung
            http_response_code(401);
            echo json_encode(['message' => 'Login fehlgeschlagen. Überprüfen Sie Ihre Anmeldedaten.']);
        }
    } catch (PDOException $e) {
        // Fehlerbehandlung
        http_response_code(500);
        echo json_encode(['message' => 'Datenbankfehler: ' . $e->getMessage()]);
    }
} else {
    // Nicht unterstützte Anfragemethode
    http_response_code(405);
    echo json_encode(['message' => 'Methode nicht erlaubt']);
}
