@echo off
echo 🚀 Ξεκινάει η εγκατάσταση των npm πακέτων...

:: Έλεγχος αν υπάρχει package.json, αλλιώς δημιουργία
if not exist package.json (
    echo 📦 Δημιουργία package.json...
    npm init -y
)

:: Επεξεργασία του package.json για να αλλάξουμε το main, name και author
powershell -Command "(Get-Content package.json) -replace '\"main\": \"index.js\"', '\"main\": \"server.js\"' -replace '\"name\": \"[^\"]*\"', '\"name\": \"api\"' | Set-Content package.json"

echo ✅ Το package.json ενημερώθηκε με:
echo    📌 name: api
echo    📌 main: server.js
echo    📌 author: Το Όνομά Σου <email@example.com>

:: Εγκατάσταση dependencies
echo 📌 Εγκατάσταση dependencies...
npm install express dotenv mysql2 cors jsonwebtoken path fs body-parser querystring assert dayjs multer csv-parser

echo ✅ Όλα τα πακέτα εγκαταστάθηκαν!
pause
