# Script para generar archivos LaTeX nativos (.tex) desde Markdown
# Ejecutar: .\generar_latex.ps1

$archivos = @(
    "HOMOLOGACION_DOCUMENTOS_COMERCIALIZACION.md",
    "PLAN_PROPUESTA_COMA.md", 
    "CADENA_DISTRIBUCION_COMPLETA.md",
    "ANALISIS_PRECIOS_WALMART_ACTUALIZADO.md",
    "ESTRUCTURA_COMERCIAL_COMISIONISTA.md", 
    "ANALISIS_COMERCIALIZACION_SLP_MERIDA.md",
    "PROTOCOLO_COMERCIAL_GRANOS_BASICOS.md"
)

Write-Host "=== GENERANDO ARCHIVOS LATEX NATIVOS ===" -ForegroundColor Green

foreach ($archivo in $archivos) {
    if (Test-Path $archivo) {
        $nombre_base = [System.IO.Path]::GetFileNameWithoutExtension($archivo)
        $tex_file = "${nombre_base}.tex"
        
        Write-Host "• Procesando: $archivo -> $tex_file" -ForegroundColor Cyan
        
        try {
            # Generar archivo LaTeX nativo
            pandoc "$archivo" -o "$tex_file" --to=latex `
                --variable=mainfont:"Times New Roman" `
                --variable=geometry:"margin=1in" `
                --variable=fontsize:"12pt" `
                --variable=linestretch:"1.3" `
                --toc --number-sections
            
            Write-Host "  ✓ Generado: $tex_file" -ForegroundColor Green
        }
        catch {
            Write-Host "  ✗ Error en: $archivo" -ForegroundColor Red
        }
    }
    else {
        Write-Host "  ⚠ No existe: $archivo" -ForegroundColor Yellow
    }
}

Write-Host "`n=== PROCESO COMPLETADO ===" -ForegroundColor Green
Write-Host "Archivos .tex generados en la carpeta actual" -ForegroundColor White

# Mostrar archivos .tex generados
Write-Host "`nArchivos LaTeX generados:" -ForegroundColor Cyan
Get-ChildItem "*.tex" | ForEach-Object {
    Write-Host "  • $($_.Name) - $([math]::Round($_.Length/1024, 1)) KB" -ForegroundColor White
}