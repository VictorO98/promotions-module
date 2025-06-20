## Estructura del Proyecto - Diagrama de Clases UML

### **Modelos (Models)**

1. **`Promotion`** - Modelo principal con 32 atributos que mapea promociones:
   - Códigos identificadores (ticododi, cococodi, sucacodi, etc.)
   - Información geográfica (departamento, localidad, municipio)
   - Datos de promoción (descripción, porcentajes, fechas, periodicidad)
   - Métodos getter/setter estándar para todos los atributos

2. **`PromocionActiva`** - Modelo simplificado para promociones activas:
   - 7 atributos principales (placa, código promo, descripción, ubicación)
   - Constructores con y sin parámetros
   - Método `toString()` implementado

3. **`TipoServicio`** - Modelo simple para tipos de servicio:
   - Código y descripción del servicio
   - Constructores y métodos estándar

### **Capa de Acceso a Datos (DAO)**

1. **`PromocionActivaDAO`** - Maneja operaciones CRUD para promociones activas:
   - Búsqueda con paginación
   - Conteo de registros
   - Exportación completa

2. **`TipoServicioDAO`** - Maneja operaciones CRUD para tipos de servicio:
   - CRUD completo (crear, leer, actualizar, eliminar)
   - Verificación de existencia
   - Operaciones por código específico

### **Conexión a Base de Datos**

**`DatabaseConnection`** - Utilidad para conexión Oracle:
- Carga configuración desde properties
- Manejo de conexiones
- Ejecución de procedimientos almacenados

### **Controladores (Controllers)**

Todos heredan de `HttpServlet` y se organizan por funcionalidad:

1. **`FronControllerServlet`** - Servlet principal de enrutamiento
2. **`HomeController`** - Controlador de página principal
3. **`LoadPromotionsController`** - Carga promociones con paginación y filtros
4. **`CreateProductController`** - Crea productos vía procedimientos almacenados
5. **`LoadProductsController`** - Carga productos del sistema
6. **`LoadPromocionesActivasController`** - Gestiona promociones activas
7. **`ExportPromotionsController`** - Exporta datos a CSV/Excel
8. **`LoadProductAssociationsController`** - Maneja asociaciones de productos
9. **`InitialPromotionsController`** - Controlador inicial de promociones

### **Relaciones y Cardinalidades**

- **Herencia**: Todos los controladores extienden `HttpServlet`
- **Composición**: `LoadPromocionesActivasController` contiene una instancia de `PromocionActivaDAO` (1:1)
- **Dependencias**: Los controladores usan los modelos y `DatabaseConnection`
- **Creación**: Los DAOs crean instancias de sus modelos correspondientes (1:*)

### **Patrones de Diseño Identificados**

1. **MVC (Model-View-Controller)**: Separación clara entre modelos, controladores y vista (JSP)
2. **DAO Pattern**: Separación de lógica de acceso a datos
3. **Front Controller**: `FronControllerServlet` actúa como punto único de entrada
4. **Dependency Injection**: Los controladores reciben dependencias como `DatabaseConnection`

Este diagrama muestra la arquitectura completa del sistema de gestión de promociones, con una clara separación de responsabilidades y buenas prácticas de diseño orientado a objetos.