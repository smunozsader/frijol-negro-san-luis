# WORKFLOW COMPLETO: Markdown → LaTeX → PDF
# Tres pasos: 1) MD→TEX, 2) Personalizar TEX, 3) TEX→PDF

$archivos_base = @(
    "HOMOLOGACION_DOCUMENTOS_COMERCIALIZACION",
    "PLAN_PROPUESTA_COMA", 
    "CADENA_DISTRIBUCION_COMPLETA",
    "ANALISIS_PRECIOS_WALMART_ACTUALIZADO",
    "ESTRUCTURA_COMERCIAL_COMISIONISTA", 
    "ANALISIS_COMERCIALIZACION_SLP_MERIDA",
    "PROTOCOLO_COMERCIAL_GRANOS_BASICOS"
)

Write-Host "=== WORKFLOW MARKDOWN → LATEX → PDF ===" -ForegroundColor Green
Write-Host "Paso 1: Generando archivos LaTeX (.tex)" -ForegroundColor Cyan

# PASO 1: Generar archivos LaTeX con configuración profesional
foreach ($base in $archivos_base) {
    $md_file = "${base}.md"
    $tex_file = "${base}_PROFESIONAL.tex"
    
    if (Test-Path $md_file) {
        Write-Host "• MD→TEX: $md_file" -ForegroundColor White
        
        try {
            pandoc "$md_file" -o "$tex_file" --to=latex `
                --variable=documentclass:"article" `
                --variable=mainfont:"Times New Roman" `
                --variable=geometry:"margin=2cm" `
                --variable=fontsize:"12pt" `
                --variable=linestretch:"1.2" `
                --variable=lang:"es-MX" `
                --toc --number-sections `
                --highlight-style=tango
            
            Write-Host "  ✓ LaTeX: $tex_file" -ForegroundColor Green
        }
        catch {
            Write-Host "  ✗ Error: $md_file" -ForegroundColor Red
        }
    }
}

Write-Host "`nPaso 2: Personalizando archivos LaTeX" -ForegroundColor Cyan

# PASO 2: Personalizar encabezados LaTeX para profesionalización
foreach ($base in $archivos_base) {
    $tex_file = "${base}_PROFESIONAL.tex"
    
    if (Test-Path $tex_file) {
        # Leer contenido actual
        $contenido = Get-Content $tex_file -Raw
        
        # Personalizar encabezado LaTeX
        $encabezado_personalizado = @"
\documentclass[12pt,a4paper]{article}
\usepackage[utf8]{inputenc}
\usepackage[spanish]{babel}
\usepackage[margin=2cm]{geometry}
\usepackage{fontspec}
\usepackage{fancyhdr}
\usepackage{graphicx}
\usepackage{booktabs}
\usepackage{longtable}
\usepackage{array}
\usepackage{multirow}
\usepackage{wrapfig}
\usepackage{float}
\usepackage{colortbl}
\usepackage{pdflscape}
\usepackage{tabu}
\usepackage{threeparttable}
\usepackage{threeparttablex}
\usepackage{xcolor}
\usepackage{hyperref}

% Configuración de fuentes
\setmainfont{Times New Roman}

% Configuración de encabezados y pies de página
\pagestyle{fancy}
\fancyhf{}
\rhead{Frijol Negro San Luis Potosí}
\lhead{Comercialización COMA}
\cfoot{\thepage}

% Configuración de hyperlinks
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    filecolor=magenta,      
    urlcolor=cyan,
    pdftitle={$base},
    pdfauthor={Gabriel Negrete / Sergio Muñoz},
    pdfsubject={Comercialización Frijol Negro},
    pdfkeywords={frijol, comercialización, COMA, San Luis Potosí}
}

% Configuración de títulos
\usepackage{titlesec}
\titleformat{\section}{\Large\bfseries\color{blue!70!black}}{\thesection}{1em}{}
\titleformat{\subsection}{\large\bfseries\color{blue!50!black}}{\thesubsection}{1em}{}

\title{$base}
\author{Gabriel Negrete Cervantes \\ Sergio Muñoz de Alba Medrano}
\date{\today}

\begin{document}
"@

        # Reemplazar encabezado existente
        $contenido = $contenido -replace '\\documentclass.*?\\begin{document}', $encabezado_personalizado, 'Singleline'
        
        # Guardar archivo personalizado
        Set-Content -Path $tex_file -Value $contenido -Encoding UTF8
        
        Write-Host "  ✓ Personalizado: $tex_file" -ForegroundColor Green
    }
}

Write-Host "`nPaso 3: Compilando LaTeX → PDF" -ForegroundColor Cyan

# PASO 3: Compilar LaTeX a PDF usando XeLaTeX
foreach ($base in $archivos_base) {
    $tex_file = "${base}_PROFESIONAL.tex"
    $pdf_file = "${base}_FINAL.pdf"
    
    if (Test-Path $tex_file) {
        Write-Host "• TEX→PDF: $tex_file" -ForegroundColor White
        
        try {
            # Compilar con XeLaTeX (soporta mejor las fuentes)
            xelatex -interaction=nonstopmode "$tex_file" | Out-Null
            xelatex -interaction=nonstopmode "$tex_file" | Out-Null  # Segunda pasada para TOC
            
            if (Test-Path $pdf_file) {
                Write-Host "  ✓ PDF Final: $pdf_file" -ForegroundColor Green
            }
        }
        catch {
            Write-Host "  ✗ Error compilación: $tex_file" -ForegroundColor Red
        }
    }
}

Write-Host "`n=== WORKFLOW COMPLETADO ===" -ForegroundColor Green

# Mostrar resumen de archivos generados
Write-Host "`nArchivos LaTeX (.tex):" -ForegroundColor Cyan
Get-ChildItem "*_PROFESIONAL.tex" | ForEach-Object {
    Write-Host "  • $($_.Name) - $([math]::Round($_.Length/1024, 1)) KB" -ForegroundColor White
}

Write-Host "`nPDFs Finales:" -ForegroundColor Cyan
Get-ChildItem "*_FINAL.pdf" | ForEach-Object {
    Write-Host "  • $($_.Name) - $([math]::Round($_.Length/1024, 1)) KB" -ForegroundColor White
}

Write-Host "`nWorkflow: MD → TEX (editable) → PDF (final)" -ForegroundColor Yellow
Write-Host "Los archivos .tex pueden editarse manualmente antes de compilar" -ForegroundColor Yellow