// Globale Variablen für das Spiel
let canvas, ctx;
let snake;
let food;
let score;
let gameSpeed;
let gameState;


// Funktion zum Initialisieren des Spiels
function init() {
    canvas = document.getElementById('game-canvas');
    ctx = canvas.getContext('2d');
    canvas.width = 400; // Breite des Spielfelds
    canvas.height = 400; // Höhe des Spielfelds

    // Initialisiere die Schlange
    snake = new Snake();

    // Initialisiere das Lebensmittel
    food = new Food();

    // Setze den Punktestand auf 0
    score = 0;

    // Setze das Spieltempo
    gameSpeed = 100; // Millisekunden pro Schritt

    // Setze den Spielstatus auf gestoppt
    gameState = 'stopped';

    // Zeichne das Spiel
    draw();

    // Starte das Spiel
    main();
}


function main() {
    if (gameState === 'running') {
        update(); // Aktualisiert den Spielzustand, einschließlich der Position der Schlange und Kollisionen
        draw();   // Zeichnet den aktuellen Zustand des Spiels, einschließlich Schlange und Essen
    }
    requestAnimationFrame(main); // Verwende requestAnimationFrame für eine optimierte Animation
}

// Funktion zum Aktualisieren des Spielzustands
function update() {
    snake.update();
    if (snake.eat(food)) {
        food.pickLocation();
        score++;
    }
    if (snake.checkCollision()) {
        gameOver();
    }
}

// Funktion zum Zeichnen des Spiels
function draw() {
    if (!ctx) return; // Check if ctx is defined
    ctx.clearRect(0, 0, canvas.width, canvas.height); // Clear the canvas
    ctx.fillStyle = '#00FF00'; // Farbe der Schlange (Grün)
    snake.body.forEach(segment => {
        ctx.fillRect(segment.x * 20, segment.y * 20, 20, 20); // Zeichne jedes Segment der Schlange
    });
}

// Funktion zum Starten des Spiels
function startGame() {
    console.log('startGame');
    if (gameState === 'stopped') {
        gameState = 'running';
        init();
    }
}

// Funktion zum Anhalten des Spiels
function pauseGame() {
    if (gameState === 'running') {
        gameState = 'paused';
    }
}

// Funktion zum Neustarten des Spiels
function resetGame() {
    gameState = 'stopped';
    init();
}

// Funktion für das Spielende
function gameOver() {
    alert('Game Over! Your score: ' + score);
    gameState = 'stopped';
}

// Klasse für die Schlange
class Snake {
    constructor() {
        this.body = [{ x: 10, y: 10 }];
        this.direction = { x: 0, y: 0 }; // Initial keine Bewegung
    }

    update() {
        // Berechne die neue Kopfposition basierend auf der aktuellen Richtung
        const head = { x: this.body[0].x + this.direction.x, y: this.body[0].y + this.direction.y };

        // Überprüfe, ob der neue Kopf mit dem Rand des Spielfelds
        // oder einem Teil des Schlangenkörpers kollidiert
        if (this.checkCollision(head)) {
            gameOver();  // Beendet das Spiel, wenn eine Kollision erkannt wird
            return;  // Beendet die Update-Methode vorzeitig
        }

        // Füge den neuen Kopf zum Anfang der Schlange hinzu
        this.body.unshift(head);

        // Entferne das letzte Element des Schlangenkörpers,
        // um die Bewegung zu simulieren
        this.body.pop();
    }

    draw() {
        this.body.forEach(segment => {
            ctx.fillStyle = '#00FF00'; // Setze die Farbe der Schlange
            ctx.fillRect(segment.x * 20, segment.y * 20, 20, 20); // Zeichne jedes Segment der Schlange
        });
    }

    // Überprüft Kollision mit den Wänden oder dem eigenen Körper
    checkCollision(head) {
        // Kollisionsprüfung mit den Wänden
        if (head.x < 0 || head.x >= canvas.width / 20 || head.y < 0 || head.y >= canvas.height / 20) {
            return true; // Kollision mit dem Rand des Spielfelds
        }
        // Kollisionsprüfung mit dem eigenen Körper
        for (let i = 4; i < this.body.length; i++) {  // Beginnt bei 4, um den Kopf nicht mit den ersten Segmenten zu überprüfen
            if (head.x === this.body[i].x && head.y === this.body[i].y) {
                return true; // Kollision mit sich selbst
            }
        }
        return false; // Keine Kollision gefunden
    }
}

// Klasse für das Lebensmittel
class Food {
    constructor() {
        this.position = { x: 15, y: 15 };
    }

    draw() {
        const foodElement = document.createElement('div');
        foodElement.style.gridRowStart = this.position.y;
        foodElement.style.gridColumnStart = this.position.x;
        foodElement.classList.add('food');
        document.getElementById('game-container').appendChild(foodElement);
    }

    pickLocation() {
        this.position = {
            x: Math.floor(Math.random() * 20) + 1,
            y: Math.floor(Math.random() * 20) + 1
        };
    }
}


// Eventlistener für die Tastatureingaben
document.addEventListener('keydown', function (event) {
    console.log(`Key pressed: ${event.key}`);  // Zeigt, welche Taste gedrückt wurde.

    let up_keys = ['ArrowUp', 'w', 'W'];
    let down_keys = ['ArrowDown', 's', 'S'];
    let left_keys = ['ArrowLeft', 'a', 'A'];
    let right_keys = ['ArrowRight', 'd', 'D'];

    if (up_keys.includes(event.key)) {
        console.log('Trying to move up');
        if (snake.direction.y !== 1) {
            snake.direction = { x: 0, y: -1 };
        } else {
            console.log('Move blocked: Currently moving down');
        }
    } else if (down_keys.includes(event.key)) {
        console.log('Trying to move down');
        if (snake.direction.y !== -1) {
            snake.direction = { x: 0, y: 1 };
        } else {
            console.log('Move blocked: Currently moving up');
        }
    } else if (left_keys.includes(event.key)) {
        console.log('Trying to move left');
        if (snake.direction.x !== 1) {
            snake.direction = { x: -1, y: 0 };
        } else {
            console.log('Move blocked: Currently moving right');
        }
    } else if (right_keys.includes(event.key)) {
        console.log('Trying to move right');
        if (snake.direction.x !== -1) {
            snake.direction = { x: 1, y: 0 };
        } else {
            console.log('Move blocked: Currently moving left');
        }
    }
});


// Initialisiere das Spiel, wenn das HTML-Dokument geladen wurde
document.addEventListener('DOMContentLoaded', init);
