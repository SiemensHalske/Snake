<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

require __DIR__ . '/../vendor/autoload.php';

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

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
        $stmt = $pdo->prepare($sql);  // SQL-Statement vorbereiten
        $stmt->bindParam(':username', $username);  // Username-Parameter binden
        $stmt->execute();  // SQL-Statement ausführen
        $user = $stmt->fetch();  // Benutzerdaten abrufen

        /*
            * Überprüfen, ob der Benutzer existiert und das Passwort korrekt ist.
            * password_verify() überprüft, ob das übergebene Passwort mit dem gehashten Passwort übereinstimmt.
        */
        if ($user && password_verify($password, $user['Password'])) {
            // JWT Token erstellen
            $issuedAt = time();
            $expirationTime = $issuedAt + 3600;  // Token gültig für 1 Stunde
            $payload = [
                'iat' => $issuedAt,
                'exp' => $expirationTime,
                'username' => $username
            ];

            $jwt = JWT::encode($payload, 'dein_sehr_geheimer_schlüssel', 'HS256');

            // Erfolgreiche Anmeldung
            http_response_code(200);
            echo json_encode([
                'message' => 'Login erfolgreich.',
                'token' => $jwt
            ]);
        } else {
            // Fehler bei der Anmeldung
            http_response_code(401);
            echo json_encode(['message' => 'Login fehlgeschlagen. Überprüfen Sie Ihre Anmeldedaten.']);
        }
    } catch (PDOException $e) {
        // generelle Fehlerbehandlung
        http_response_code(500);
        echo json_encode(['message' => 'Datenbankfehler: ' . $e->getMessage()]);
    }
} else {
    // Nicht unterstützte Anfragemethode
    http_response_code(405);
    echo json_encode(['message' => 'Methode nicht erlaubt']);
}
