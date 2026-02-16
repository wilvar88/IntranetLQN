# Script para subir la Intranet a GitHub fácilmente

$repoUrl = Read-Host "Pega aquí la URL de tu repositorio de GitHub (ej: https://github.com/usuario/repo.git)"

if (-not $repoUrl) {
    Write-Host "Error: No pegaste ninguna URL." -ForegroundColor Red
    exit
}

Write-Host "Conectando con GitHub..." -ForegroundColor Cyan
git remote add origin $repoUrl
git branch -M main

Write-Host "Subiendo archivos... Esto puede tardar unos segundos." -ForegroundColor Cyan
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n¡ÉXITO! Tu intranet ya está en GitHub." -ForegroundColor Green
    Write-Host "Ahora puedes ir a Settings > Pages en GitHub para activar el link público." -ForegroundColor Yellow
} else {
    Write-Host "`nHubo un problema. Asegúrate de que el repositorio en GitHub esté vacío y que tengas permisos." -ForegroundColor Red
}

Pause
