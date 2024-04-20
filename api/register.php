<?php
include 'db_connect.php';  // Stellt die Verbindung zur Datenbank her

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $inputData = json_decode(file_get_contents("php://input"), true);
    $username = $inputData['username'] ?? '';
    $email = $inputData['email'] ?? '';
    $password = $inputData['password'] ?? '';

    // Überprüfen, ob Benutzername, E-Mail und Passwort angegeben wurden
    if (empty($username) || empty($email) || empty($password)) {
        http_response_code(400);
        echo json_encode(['message' => 'Benutzername, E-Mail und Passwort müssen angegeben werden.']);
        exit;
    }

    // Validierung der E-Mail-Adresse
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        http_response_code(400);
        echo json_encode(['message' => 'Ungültige E-Mail-Adresse.']);
        exit;
    }

    // Überprüfen, ob Benutzername oder E-Mail bereits vorhanden sind
    $stmt = $pdo->prepare("SELECT * FROM Spieler WHERE Username = :username OR Email = :email");
    $stmt->bindParam(':username', $username);
    $stmt->bindParam(':email', $email);
    $stmt->execute();

    if ($stmt->rowCount() > 0) {
        http_response_code(400);
        echo json_encode(['message' => 'Benutzername oder E-Mail bereits vorhanden.']);
        exit;
    }

    // Bereinigen der Eingabedaten (let's use da fancy regex...because f**** you, that's why)
    $username = preg_replace('/[^a-zA-Z0-9_]/', '', $username);
    $email = filter_var($email, FILTER_SANITIZE_EMAIL);


    // Passwort hashen
    $passwordHash = password_hash($password, PASSWORD_ARGON2I);

    $sql = "INSERT INTO Spieler (Username, Email, Password) VALUES (:username, :email, :password)";

    /*
        * Versuchen, den Benutzer in der Datenbank zu registrieren.
        * Wenn ein Fehler auftritt, wird eine Fehlermeldung zurückgegeben.
    */
    try {
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':username', $username);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':password', $passwordHash);

        $stmt->execute();

        http_response_code(201);
        echo json_encode(['message' => 'Nutzer erfolgreich registriert.']);
    } catch (PDOException $e) {
        http_response_code(500);
        echo json_encode(['message' => 'Fehler bei der Registrierung. Bitte versuchen Sie es später erneut.', 'error' => $e->getMessage()]);
    }
} else {
    // Nur POST-Anfragen sind erlaubt
    http_response_code(405);
    echo json_encode(['message' => 'Methode nicht erlaubt']);
}
