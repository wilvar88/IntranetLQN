# Script para subir la Intranet a GitHub facilmente

$repoUrl = Read-Host "Pega aqui la URL CORRECTA de GitHub (ej: https://github.com/usuario/repo.git)"

# Validacion de URL
if ($repoUrl -match "github.io" -or $repoUrl -match "/settings" -or $repoUrl -match "/pages") {
    Write-Host "`nERROR: Estas pegando el link de la WEB, no del CODIGO." -ForegroundColor Red
    Write-Host "El link correcto debe empezar por https://github.com/ y NO tener '.io'" -ForegroundColor Red
    Write-Host "Ejemplo correcto: https://github.com/wilvar88/IntranetLQN.git" -ForegroundColor Yellow
    Pause
    exit
}

if (-not $repoUrl) {
    Write-Host "Error: No pegaste ninguna URL." -ForegroundColor Red
    exit
}

Write-Host "Conectando con GitHub..." -ForegroundColor Cyan

# Eliminar el remoto si ya existe para evitar errores
if (git remote | Select-String "origin") {
    git remote remove origin
}

git remote add origin $repoUrl
git branch -M main

Write-Host "Subiendo archivos... Esto puede tardar unos segundos." -ForegroundColor Cyan
git push -u origin main --force

if ($LASTEXITCODE -eq 0) {
    Write-Host "`nEXITO! Tu intranet ya esta en GitHub." -ForegroundColor Green
    Write-Host "Ahora puedes ir a Settings > Pages en GitHub para activar el link publico." -ForegroundColor Yellow
}
else {
    Write-Host "`nHubo un problema. Asegurate de que el repositorio en GitHub este vacio y que tengas permisos." -ForegroundColor Red
}

Pause
