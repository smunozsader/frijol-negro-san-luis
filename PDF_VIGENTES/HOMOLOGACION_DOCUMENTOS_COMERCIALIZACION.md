# HOMOLOGACIÓN DE DOCUMENTOS DE COMERCIALIZACIÓN
**Análisis de Consistencia y Propuesta de Unificación**

---

## INCONSISTENCIAS IDENTIFICADAS

### 1. PRECIOS - MÚLTIPLES VERSIONES CONFLICTIVAS

**Problema:** Los documentos presentan 4 estructuras de precios diferentes:

| Documento | Precio Base | Término | Precio Final |
|-----------|-------------|---------|--------------|
| `ANALISIS_COMERCIALIZACION_SLP_MERIDA.md` | $25,000/ton | No especifica | Variable |
| `ESTRUCTURA_COMERCIAL_COMISIONISTA.md` | $25,000/ton | Implícito FOB | $25,000 + comisión 6% |
| `PROTOCOLO_COMERCIAL_GRANOS_BASICOS.md` | $28,930/ton (EXW) | EXW/DDP definidos | $31,441/ton (DDP) |
| `PLAN_PROPUESTA_COMA.md` | $28,930/ton | LAB almacén COMA | $28,930/ton |

**Impacto:** Confusión en negociaciones, falta de credibilidad comercial, márgenes indefinidos.

### 2. CADENA DE DISTRIBUCIÓN - ESTRUCTURAS DIFERENTES

**Inconsistencia en niveles:**

- **ANALISIS_COMERCIALIZACION:** Estructura básica de 3 niveles
- **CADENA_DISTRIBUCION_COMPLETA:** Estructura completa de 6 niveles
- **PLAN_PROPUESTA_COMA:** Asume venta directa a COMA (nivel mayorista)

**Márgenes dispares:**
- Algunos documentos no especifican márgenes por nivel
- CADENA_DISTRIBUCION usa 20% uniforme
- Otros documentos no definen estructura de márgenes

### 3. TÉRMINOS COMERCIALES (INCOTERMS) - USO INCONSISTENTE

**Problemas identificados:**
- **ANALISIS_COMERCIALIZACION:** No especifica INCOTERMS
- **ESTRUCTURA_COMERCIAL:** Uso implícito de términos no definidos
- **PROTOCOLO_COMERCIAL:** Uso correcto de EXW/DDP
- **PLAN_PROPUESTA_COMA:** Usa "LAB" (término inexistente) en lugar de EXW

### 4. AGENTES Y COMISIONES - ESTRUCTURAS CONFLICTIVAS

**Rol de Sergio:**
- Algunos documentos: Comisionista independiente (6%)
- Otros documentos: Representante comercial directo
- Plan COMA: Agente comercial con precio ya incluido

---

## PROPUESTA DE HOMOLOGACIÓN

### ESTÁNDAR UNIFICADO PROPUESTO

#### A) ESTRUCTURA DE PRECIOS BASE (OFICIAL)

**Precio Productor (DARIO/Gabriel):**
- **Base:** $27,290/tonelada EXW San Luis Potosí
- **Calidad:** NMX-FF-038 Grado Primera certificado
- **Empaque:** Costales polipropileno 50kg incluidos

**Estructura de Costos y Márgenes:**
```
PRODUCTOR (DARIO/Gabriel): $27,290/ton (Base EXW)
│
├── COMISIONISTA (Sergio): +6% = $28,928/ton
│   └── [Precio a MAYORISTA/COMA]
│
├── MAYORISTA (COMA): +20% = $34,714/ton
│   └── [Precio a DISTRIBUIDOR]
│
├── DISTRIBUIDOR: +20% = $41,657/ton
│   └── [Precio a SUB-DISTRIBUIDOR]
│
├── SUB-DISTRIBUIDOR: +15% = $47,905/ton
│   └── [Precio a DETALLISTA]
│
├── DETALLISTA: +15% = $55,091/ton
│   └── [Precio al CONSUMIDOR FINAL]
│
└── CONSUMIDOR FINAL: $55.09/kg
```

#### B) TÉRMINOS COMERCIALES ESTÁNDAR

**INCOTERMS 2020 - Opciones Oficiales:**

1. **EXW (Ex Works) San Luis Potosí:**
   - Precio: $28,928/tonelada (incluye comisión Sergio)
   - Comprador asume: Transporte, seguros, trámites
   - Recomendado para: Compradores con logística propia

2. **DDP (Delivered Duty Paid) Mérida:**
   - Precio: $31,441/tonelada
   - Incluye: Transporte + seguros + comisión Sergio
   - Recomendado para: COMA y mayoristas sin logística

#### C) ESTRUCTURA COMERCIAL UNIFICADA

**Roles Definidos:**
- **DARIO/Gabriel:** Productores/Acopiadores (origen)
- **Sergio Muñoz de Alba:** Comisionista comercial (6% sobre precio productor)
- **COMA:** Mayorista objetivo (nivel 2 en cadena de 6)

**Volúmenes y Compromisos:**
- Disponibilidad total: 1,000 toneladas
- Pedido mínimo COMA: 40 toneladas (1 tractocamión)
- Meta anual con COMA: 500-800 toneladas

#### D) ESPECIFICACIONES TÉCNICAS UNIFICADAS

**Calidad Estándar:**
- Clasificación: NMX-FF-038-SCFI-2016 Grado Primera
- Humedad máxima: 13% (por debajo del estándar ≤14%)
- Impurezas máximas: 0.5% (Grado Primera)
- Granos dañados: ≤2%
- Color: Negro uniforme brillante

---

## DOCUMENTOS A ACTUALIZAR

### PRIORIDAD 1 - ACTUALIZACIÓN INMEDIATA REQUERIDA

#### 1. `ANALISIS_COMERCIALIZACION_SLP_MERIDA.md`
**Cambios necesarios:**
- ❌ Precio $25,000/ton → ✅ $27,290/ton (productor) + $28,928/ton (con comisión)
- ❌ Términos indefinidos → ✅ EXW/DDP especificados
- ❌ Estructura simple → ✅ Cadena 6 niveles integrada
- ❌ Costos estimados → ✅ Costos reales de transporte ($2,513/ton SLP-Mérida)

#### 2. `ESTRUCTURA_COMERCIAL_COMISIONISTA.md`
**Cambios necesarios:**
- ✅ Mantener: Comisión 6% Sergio (correcto)
- ❌ Precio base $25,000 → ✅ $27,290/ton base + comisión = $28,928/ton
- ❌ Términos implícitos → ✅ INCOTERMS explícitos
- ❌ Estructura simple → ✅ Posicionamiento en cadena 6 niveles

#### 3. `PLAN_PROPUESTA_COMA.md`
**Cambios necesarios:**
- ✅ Mantener: Estructura de presentación (excelente)
- ❌ Precio $28,930/ton → ✅ $28,928/ton (consistencia matemática)
- ❌ Término "LAB" → ✅ EXW o DDP según negociación
- ❌ Slide precios inconsistentes → ✅ Estructura unificada

### PRIORIDAD 2 - VALIDACIÓN Y MEJORAS

#### 4. `CADENA_DISTRIBUCION_COMPLETA.md`
**Validaciones necesarias:**
- ✅ Estructura 6 niveles (correcta, mantener)
- ❌ Precio inicial $28.93 → ✅ $28,928 (corrección menor)
- ✅ Márgenes 20%/15% por nivel (mantener)
- ✅ Precio final ~$55/kg (validado con mercado Walmart)

#### 5. `PROTOCOLO_COMERCIAL_GRANOS_BASICOS.md`
**Validaciones necesarias:**
- ✅ INCOTERMS EXW/DDP (correcto, mantener)
- ❌ Precios base → ✅ Actualizar con estructura unificada
- ✅ Scripts comerciales (excelentes, mantener)
- ✅ Marco regulatorio (mantener)

---

## CRONOGRAMA DE HOMOLOGACIÓN

### FASE 1: Corrección de Precios (HOY)
- [ ] Actualizar `ANALISIS_COMERCIALIZACION_SLP_MERIDA.md`
- [ ] Actualizar `ESTRUCTURA_COMERCIAL_COMISIONISTA.md`
- [ ] Corregir `PLAN_PROPUESTA_COMA.md`

### FASE 2: Validación de Cadena (HOY)
- [ ] Verificar `CADENA_DISTRIBUCION_COMPLETA.md`
- [ ] Actualizar precios en `PROTOCOLO_COMERCIAL_GRANOS_BASICOS.md`

### FASE 3: Documento Maestro (HOY)
- [ ] Crear `RESUMEN_EJECUTIVO_UNIFICADO.md` con toda la información homologada

---

## BENEFICIOS DE LA HOMOLOGACIÓN

### Comerciales:
- **Credibilidad:** Información consistente en todas las presentaciones
- **Eficiencia:** Negociaciones sin contradicciones internas
- **Escalabilidad:** Estructura replicable para otros clientes mayoristas

### Operativos:
- **Claridad:** Todos los participantes entienden precios y márgenes
- **Control:** Seguimiento preciso de rentabilidad por nivel
- **Proyección:** Análisis financiero confiable para expansión

### Estratégicos:
- **Profesionalización:** Imagen de empresa organizada y confiable  
- **Flexibilidad:** Opciones EXW/DDP según perfil del cliente
- **Crecimiento:** Base sólida para 1,000 toneladas anuales

---

## PRÓXIMOS PASOS INMEDIATOS

1. **Aprobar estructura de precios unificada** (decisión DARIO/Gabriel/Sergio)
2. **Actualizar documentos según prioridades** (ejecución técnica)
3. **Generar PDFs actualizados** para presentaciones comerciales
4. **Implementar con COMA** usando documentación homologada

**TIEMPO ESTIMADO DE HOMOLOGACIÓN: 2-3 horas de trabajo técnico**

---

*Este documento establece las bases para una comercialización profesional y consistente del frijol negro de San Luis Potosí, eliminando contradicciones y maximizando las probabilidades de éxito comercial.*