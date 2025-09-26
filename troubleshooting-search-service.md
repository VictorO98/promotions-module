# Guía de Troubleshooting - Problema de Búsqueda en SearchService

## Problema Reportado
El cliente no puede ejecutar búsquedas desde su máquina, pero desde tu máquina funciona correctamente.

## Diagnóstico Realizado

### ✅ Código Revisado
- ✅ Frontend JavaScript: Correcto, tiene `response.json()`
- ✅ Backend SearchServiceController: Funcional con logging detallado
- ✅ Autenticación: Los logs muestran que el usuario "promo" se autentica correctamente

### 🔍 Mejoras Implementadas
- ✅ Logging extensivo en el frontend para diagnosticar peticiones AJAX
- ✅ Logging detallado en el backend para tracking completo de requests
- ✅ URL absoluta con context path para evitar problemas de routing
- ✅ Mejor manejo de errores con información específica

## Pasos de Diagnóstico para el Cliente

### 1. Verificar Logs del Navegador
Pide al cliente que:
1. Abra las herramientas de desarrollador (F12)
2. Vaya a la pestaña "Console"
3. Intente realizar una búsqueda
4. Copie TODOS los mensajes de la consola, especialmente:
   - `=== INICIANDO BÚSQUEDA DESDE FRONTEND ===`
   - `=== ENVIANDO PETICIÓN AJAX ===`
   - `=== RESPUESTA RECIBIDA ===` o `=== ERROR EN LA PETICIÓN ===`

### 2. Verificar Logs del Servidor
Cuando el cliente intente buscar, verifica si aparecen estos logs en el servidor:
- `=== INICIANDO PROCESAMIENTO SearchService ===`
- `Timestamp:` con fecha actual
- `Remote Address:` con IP del cliente
- `=== PARÁMETROS RECIBIDOS ===`

**Si NO aparecen estos logs** = La petición no llega al servlet
**Si SÍ aparecen estos logs** = El problema está en el procesamiento backend

### 3. Verificar Conectividad de Red
```bash
# Desde la máquina del cliente, probar:
curl -X POST "http://[IP_SERVIDOR]:[PUERTO]/promotions-module/SearchService" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     -d "numeroServicio=TEST123" \
     -v
```

### 4. Verificar Configuración del Navegador
- Deshabilitar extensiones/bloqueadores
- Probar en modo incógnito
- Probar en otro navegador
- Verificar configuración de proxy

### 5. Verificar Firewall/Antivirus
- Temporalmente deshabilitar firewall corporativo
- Verificar que no bloquee peticiones AJAX
- Revisar configuración de antivirus

## Posibles Soluciones Según el Diagnóstico

### Si el problema es de RED/CONECTIVIDAD:
```javascript
// Cambiar timeout en el frontend
const controller = new AbortController();
const timeoutId = setTimeout(() => controller.abort(), 30000); // 30 segundos

fetch(url, {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: 'numeroServicio=' + encodeURIComponent(numeroServicio),
    signal: controller.signal
})
```

### Si el problema es de CORS:
```java
// Agregar al SearchServiceController (en doPost, antes del procesamiento)
response.setHeader("Access-Control-Allow-Origin", "*");
response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
response.setHeader("Access-Control-Allow-Headers", "Content-Type");
```

### Si el problema es de AUTENTICACIÓN:
- Verificar que la sesión no expire
- Revisar configuración de cookies
- Verificar filtros de autenticación

### Si el problema es de NAVEGADOR OBSOLETO:
```javascript
// Alternativa con XMLHttpRequest para navegadores viejos
function searchServiceLegacy() {
    var xhr = new XMLHttpRequest();
    xhr.open('POST', url, true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                var data = JSON.parse(xhr.responseText);
                // Procesar respuesta...
            } else {
                console.error('Error HTTP:', xhr.status, xhr.statusText);
            }
        }
    };
    
    xhr.send('numeroServicio=' + encodeURIComponent(numeroServicio));
}
```

## Herramientas de Diagnóstico Adicionales

### Test de Conectividad Simple
```html
<!-- Agregar botón de test en la interfaz -->
<button onclick="testConnectivity()" style="background: orange; color: white;">
    🔍 Test Conectividad
</button>

<script>
function testConnectivity() {
    console.log('=== INICIANDO TEST DE CONECTIVIDAD ===');
    
    // Test 1: Ping simple
    fetch('<%= request.getContextPath() %>/LoadTiposServicio')
        .then(response => {
            console.log('✅ Conectividad básica OK:', response.status);
            return fetch('<%= request.getContextPath() %>/SearchService', {
                method: 'OPTIONS'
            });
        })
        .then(response => {
            console.log('✅ SearchService endpoint accesible:', response.status);
            alert('Test de conectividad exitoso');
        })
        .catch(error => {
            console.error('❌ Error de conectividad:', error);
            alert('Error de conectividad: ' + error.message);
        });
}
</script>
```

## Checklist de Verificación

- [ ] Logs del navegador (consola JavaScript)
- [ ] Logs del servidor (SearchServiceController)
- [ ] Test de conectividad con curl
- [ ] Verificar firewall/antivirus
- [ ] Probar en otro navegador
- [ ] Verificar configuración de proxy
- [ ] Revisar configuración de red corporativa
- [ ] Verificar tiempo de respuesta del servidor
- [ ] Comprobar versión del navegador del cliente

## Contacto para Soporte
Si después de seguir estos pasos el problema persiste, proporciona:
1. Logs completos de la consola del navegador
2. Logs del servidor durante el intento de búsqueda
3. Información del entorno del cliente (OS, navegador, red)
4. Resultados de las pruebas de conectividad
