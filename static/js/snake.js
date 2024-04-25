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


// Hauptspielschleife
function main() {
    // Aktualisiere das Spiel nur, wenn es läuft
    if (gameState === 'running') {
        update();
    }
    if (snake) {
        draw();
    }
    setTimeout(main, gameSpeed);
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
        this.direction = { x: 1, y: 0 };
    }

    update() {
        const head = { x: this.body[0].x + this.direction.x, y: this.body[0].y + this.direction.y };
        this.body.unshift(head);
        this.body.pop();
    }

    draw() {
        this.body.forEach(segment => {
            const snakeElement = document.createElement('div');
            snakeElement.style.gridRowStart = segment.y;
            snakeElement.style.gridColumnStart = segment.x;
            snakeElement.classList.add('snake');
            document.getElementById('game-container').appendChild(snakeElement);
        });
    }

    eat(food) {
        const head = { x: this.body[0].x + this.direction.x, y: this.body[0].y + this.direction.y };
        if (head.x === food.position.x && head.y === food.position.y) {
            this.body.push({ ...head });
            food.pickLocation();
        }
    }

    checkCollision() {
        const head = this.body[0];
        return (
            this.body.some((segment, index) => index !== 0 && segment.x === head.x && segment.y === head.y) ||
            head.x >= 20 || head.x <= 0 || head.y >= 20 || head.y <= 0
        );
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
    switch (event.key) {
        case 'ArrowUp':
            if (snake.direction.y !== 1) {
                snake.direction = { x: 0, y: -1 };
            }
            break;
        case 'ArrowDown':
            if (snake.direction.y !== -1) {
                snake.direction = { x: 0, y: 1 };
            }
            break;
        case 'ArrowLeft':
            if (snake.direction.x !== 1) {
                snake.direction = { x: -1, y: 0 };
            }
            break;
        case 'ArrowRight':
            if (snake.direction.x !== -1) {
                snake.direction = { x: 1, y: 0 };
            }
            break;
    }
});

// Initialisiere das Spiel, wenn das HTML-Dokument geladen wurde
document.addEventListener('DOMContentLoaded', init);
