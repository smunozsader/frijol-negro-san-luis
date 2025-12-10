# Script para generar PDFs profesionales CORREGIDOS
# Ejecutar: .\generar_pdfs_corregidos.ps1

$archivos = @(
    "HOMOLOGACION_DOCUMENTOS_COMERCIALIZACION.md",
    "PLAN_PROPUESTA_COMA_LIMPIO.md", 
    "CADENA_DISTRIBUCION_COMPLETA.md",
    "ANALISIS_PRECIOS_WALMART_ACTUALIZADO.md",
    "ESTRUCTURA_COMERCIAL_COMISIONISTA.md", 
    "ANALISIS_COMERCIALIZACION_SLP_MERIDA.md",
    "PROTOCOLO_COMERCIAL_GRANOS_BASICOS.md"
)

Write-Host "=== GENERANDO PDFs PROFESIONALES CORREGIDOS ===" -ForegroundColor Green

foreach ($archivo in $archivos) {
    if (Test-Path $archivo) {
        $nombre_base = [System.IO.Path]::GetFileNameWithoutExtension($archivo)
        $pdf_file = "${nombre_base}_FINAL.pdf"
        
        Write-Host "• Procesando: $archivo -> $pdf_file" -ForegroundColor Cyan
        
        try {
            # Generar PDF profesional con configuración corregida
            pandoc "$archivo" -o "$pdf_file" --pdf-engine=xelatex `
                --variable=mainfont:"Times New Roman" `
                --variable=geometry:"margin=1in" `
                --variable=fontsize:"12pt" `
                --variable=linestretch:"1.3" `
                --variable=colorlinks:true `
                --variable=linkcolor:blue `
                --variable=urlcolor:blue `
                --toc --number-sections `
                --highlight-style=tango `
                --filter=pandoc-crossref
            
            Write-Host "  ✓ PDF generado: $pdf_file" -ForegroundColor Green
        }
        catch {
            Write-Host "  ✗ Error en: $archivo" -ForegroundColor Red
            Write-Host "    Detalle: $($_.Exception.Message)" -ForegroundColor Yellow
        }
    }
    else {
        Write-Host "  ⚠ No existe: $archivo" -ForegroundColor Yellow
    }
}

Write-Host "`n=== PROCESO COMPLETADO ===" -ForegroundColor Green
Write-Host "Archivos PDF generados:" -ForegroundColor White

# Mostrar archivos PDF generados
Get-ChildItem "*_FINAL.pdf" | ForEach-Object {
    Write-Host "  • $($_.Name) - $([math]::Round($_.Length/1024, 1)) KB" -ForegroundColor White
}