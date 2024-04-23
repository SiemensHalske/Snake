document.addEventListener('DOMContentLoaded', function () {
    fetch('/main/navbar.html')
        .then(response => response.text())
        .then(html => {
            document.getElementById('navbar-placeholder').innerHTML = html;
        })
        .catch(error => {
            console.error('Fehler beim Laden der Navbar:', error);
        });
});
