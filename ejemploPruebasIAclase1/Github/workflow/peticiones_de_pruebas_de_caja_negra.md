# Documentación de Peticiones API - Pruebas de Caja Negra

**Base URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com`

---

## 1. Transición de Estados

### 1.1. General
#### Listar Ejercicios
- **Método:** `GET`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/ejercicios`
- **Headers:** Ninguno

---

### 1.2. Robot Cafetero Automatizado (Barista Bot)

#### Ver estado actual
- **Método:** `GET`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/barista-bot/estado`
- **Headers:** Ninguno

#### Iniciar Pedido
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/barista-bot/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "Iniciar Pedido"
}
```

#### Terminar Molienda
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/barista-bot/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "Terminar Molienda"
}
```

#### Alcanzar Temperatura
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/barista-bot/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "Alcanzar Temperatura"
}
```

#### Terminar Llenado
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/barista-bot/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "Terminar Llenado"
}
```

#### Sin Ingredientes
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/barista-bot/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "Sin Ingredientes"
}
```

#### Recargar y Reiniciar
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/barista-bot/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "Recargar y Reiniciar"
}
```

#### Reiniciar
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/barista-bot/reiniciar`
- **Headers:** Ninguno

---

### 1.3. Encendido / Apagado

#### Ver estado actual
- **Método:** `GET`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/encendido-apagado/estado`
- **Headers:** Ninguno

#### Encender
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/encendido-apagado/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "encender"
}
```

#### Apagar (inválida)
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/encendido-apagado/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "apagar"
}
```

#### Reiniciar
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/encendido-apagado/reiniciar`
- **Headers:** Ninguno

---

### 1.4. Sistema de Iluminación Inteligente en Auditorio Teatral

#### Ver estado actual
- **Método:** `GET`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/iluminacion-teatro/estado`
- **Headers:** Ninguno

#### Encender
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/iluminacion-teatro/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "Encender"
}
```

#### Iniciar Show
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/iluminacion-teatro/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "Iniciar Show"
}
```

#### Alarma de Humo
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/iluminacion-teatro/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "Alarma de Humo"
}
```

#### Fin Emergencia / Reset
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/iluminacion-teatro/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "Fin Emergencia / Reset"
}
```

#### Reiniciar
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/iluminacion-teatro/reiniciar`
- **Headers:** Ninguno

---

### 1.5. Sistema de Lavandería Industrial Automatizada

#### Ver estado actual
- **Método:** `GET`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/lavanderia/estado`
- **Headers:** Ninguno

#### Cerrar Tapa
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/lavanderia/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "Cerrar Tapa"
}
```

#### Nivel OK
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/lavanderia/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "Nivel OK"
}
```

#### Fin Lavado
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/lavanderia/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "Fin Lavado"
}
```

#### Apertura Forzosa
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/lavanderia/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "Apertura Forzosa"
}
```

#### Reset Operador
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/lavanderia/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "Reset Operador"
}
```

#### Reiniciar
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/lavanderia/reiniciar`
- **Headers:** Ninguno

---

### 1.6. Proceso de Gestión de Reclamos por Garantía en Tienda

#### Ver estado actual
- **Método:** `GET`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/reclamos-garantia/estado`
- **Headers:** Ninguno

#### Asignar Técnico
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/reclamos-garantia/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "Asignar Técnico"
}
```

#### Diagnóstico Concluido [Defecto de Fábrica: sí]
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/reclamos-garantia/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "Diagnóstico Concluido",
  "guardia": true
}
```

#### Diagnóstico Concluido [Defecto de Fábrica: no]
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/reclamos-garantia/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "Diagnóstico Concluido",
  "guardia": false
}
```

#### Reparar
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/reclamos-garantia/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "Reparar"
}
```

#### Reiniciar
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/reclamos-garantia/reiniciar`
- **Headers:** Ninguno

---

### 1.7. Torniquete del Metro Inteligente

#### Ver estado actual
- **Método:** `GET`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/torniquete/estado`
- **Headers:** Ninguno

#### Validar Tarjeta [Saldo Positivo: sí]
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/torniquete/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "Validar Tarjeta",
  "guardia": true
}
```

#### Validar Tarjeta [Saldo Positivo: no] (inválida)
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/torniquete/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "Validar Tarjeta",
  "guardia": false
}
```

#### Empujar (inválida)
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/torniquete/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "Empujar"
}
```

#### Completar Giro
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/torniquete/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "Completar Giro"
}
```

#### Alarma [Falla de Energía: sí]
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/torniquete/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "Alarma",
  "guardia": true
}
```

#### Alarma [Falla de Energía: no] (inválida)
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/torniquete/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "Alarma",
  "guardia": false
}
```

#### Reparar
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/torniquete/evento`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "evento": "Reparar"
}
```

#### Reiniciar
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/torniquete/reiniciar`
- **Headers:** Ninguno

---

## 2. Tablas de Decisión

### 2.1. General
#### Listar ejercicios
- **Método:** `GET`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decisiones`
- **Headers:** Ninguno

---

### 2.2. Controlador de Climatización Inteligente en una Smart Home

#### Ver definición (condiciones + historial)
- **Método:** `GET`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/climatizacion/definicion`
- **Headers:** Ninguno

#### Regla 1: Apagar sistema de climatización y emitir alerta sonora
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/climatizacion/evaluar`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "valores": [
    false,
    false,
    true
  ]
}
```

#### Regla 2: Encender aire acondicionado en modo refrigeración
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/climatizacion/evaluar`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "valores": [
    true,
    true,
    false
  ]
}
```

#### Regla 3: Mantener en modo de bajo consumo energético
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/climatizacion/evaluar`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "valores": [
    true,
    false,
    false
  ]
}
```

#### Regla 4: Mantener sistema apagado
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/climatizacion/evaluar`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "valores": [
    false,
    false,
    false
  ]
}
```

#### Reiniciar historial
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/climatizacion/reiniciar`
- **Headers:** Ninguno

---

### 2.3. Sistema de Navegación de un Dron Agrícola Autónomo

#### Ver definición (condiciones + historial)
- **Método:** `GET`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/dron-agricola/definicion`
- **Headers:** Ninguno

#### Regla 1: Ejecutar maniobra de esquive de emergencia
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/dron-agricola/evaluar`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "valores": [
    false,
    false,
    true
  ]
}
```

#### Regla 2: Abortar misión y activar retorno automático (RTL)
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/dron-agricola/evaluar`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "valores": [
    true,
    false,
    false
  ]
}
```

#### Regla 3: Abortar misión y activar retorno automático (RTL)
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/dron-agricola/evaluar`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "valores": [
    false,
    true,
    false
  ]
}
```

#### Regla 4: Continuar ruta de vuelo planificada
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/dron-agricola/evaluar`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "valores": [
    false,
    false,
    false
  ]
}
```

#### Reiniciar historial
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/dron-agricola/reiniciar`
- **Headers:** Ninguno

---

### 2.4. Validación de Equipaje Automatizada (Tren de Alta Velocidad)

#### Ver definición (condiciones + historial)
- **Método:** `GET`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/equipaje/definicion`
- **Headers:** Ninguno

#### Regla 1: Bloquear compuerta e indicar derivación obligatoria a bodega de carga
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/equipaje/evaluar`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "valores": [
    false,
    true,
    false
  ]
}
```

#### Regla 2: Aprobar embarque automático registrando sobrepeso autorizado
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/equipaje/evaluar`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "valores": [
    true,
    false,
    true
  ]
}
```

#### Regla 3: Bloquear compuerta, emitir tique de cobro por exceso de equipaje y solicitar pago en el módulo de autoservicio
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/equipaje/evaluar`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "valores": [
    true,
    false,
    false
  ]
}
```

#### Regla 4: Permitir el paso directo a la plataforma de abordaje
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/equipaje/evaluar`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "valores": [
    false,
    false,
    false
  ]
}
```

#### Reiniciar historial
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/equipaje/reiniciar`
- **Headers:** Ninguno

---

### 2.5. Automatización de Riego y Nutrientes en Invernadero Hidropónico

#### Ver definición (condiciones + historial)
- **Método:** `GET`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/invernadero/definicion`
- **Headers:** Ninguno

#### Regla 1: Activar calefactores perimetrales y suspender riego por aspersión para evitar congelación
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/invernadero/evaluar`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "valores": [
    false,
    false,
    true
  ]
}
```

#### Regla 2: Iniciar ciclo de riego automático con solución nutritiva estándar
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/invernadero/evaluar`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "valores": [
    true,
    false,
    false
  ]
}
```

#### Regla 3: Bloquear riego y activar bomba de neutralización de pH antes de dispensar agua
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/invernadero/evaluar`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "valores": [
    true,
    true,
    false
  ]
}
```

#### Regla 4: Mantener sistemas en espera
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/invernadero/evaluar`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "valores": [
    false,
    false,
    false
  ]
}
```

#### Reiniciar historial
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/invernadero/reiniciar`
- **Headers:** Ninguno

---

### 2.6. Sistema de Moderación Automática en Foro de E-Sports

#### Ver definición (condiciones + historial)
- **Método:** `GET`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/moderacion-foro/definicion`
- **Headers:** Ninguno

#### Regla 1: Escalar a baneo permanente de la cuenta de usuario
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/moderacion-foro/evaluar`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "valores": [
    false,
    true,
    false
  ]
}
```

#### Regla 2: Eliminar el mensaje instantáneamente y aplicar suspensión temporal de chat por 24 horas
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/moderacion-foro/evaluar`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "valores": [
    true,
    false,
    false
  ]
}
```

#### Regla 3: Ocultar mensaje automáticamente y mostrar advertencia de seguridad al chat
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/moderacion-foro/evaluar`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "valores": [
    false,
    false,
    true
  ]
}
```

#### Regla 4: Publicar mensaje con normalidad en el flujo de la conversación
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/moderacion-foro/evaluar`
- **Headers:** 
  - `Content-Type: application/json`
- **Body:**
```json
{
  "valores": [
    false,
    false,
    false
  ]
}
```

#### Reiniciar historial
- **Método:** `POST`
- **URL:** `https://taller-de-tecnicas-de-prueba-de-caja.onrender.com/api/decision/moderacion-foro/reiniciar`
- **Headers:** Ninguno