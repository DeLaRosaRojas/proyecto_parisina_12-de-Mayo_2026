# Prompt Mejorado:

Vamos a Mejorar y hacer de forma Profesional nuestro Plan de Implementación. Importante, NO me proporciones el código todavía. Por favor. 
Actúa como un creador de software, diseñador de aplicaciones móviles multiplataforma. Proporcionandome Paso a Paso cada requerimiento. 

Quiero crear una Aplicación multiplataforma en Flutter Dart y Firebase utilizando Firebase Studio ( en el navegador, Google). Qué herramientas se requieren, ui, ux, dependencias, login autenticación usuario password, base de datos Firestore, privider, dependencias en pubspec.yaml. Lenguaje Dart, Flutter.

Proyecto de Tienda de Telas y Costuras con el nombre "Parisina", el objetivo de esta app es que las personas que accedan al Sitio, puedan comprar los diversos productos que ofrece nuestra tienda. 

La paleta de colores que utilizaremos será: Fondo de página (Blanco), Appbar (Rojo), Iconos AppBar (Blancos), Footer (Negro), Letras fuente Footer (Blanco); Contenido dentro del cuerpo (Subtonos Grises, Amarillos, Negros y Rojo, con detalles Blancos en caso de ser necesario). Como parte de ser diseñador, te encargo que escojas subtonos visualmente atractivos y elegantes. 

El Entorno de trabajo que usaré será "Firebase Studio" vinculada con una Base de datos en "Firebase Console", me proporcionarán la lista de dependencias que necesitare para el pubsyec.yaml como ayuda para la generación de este proyecto, te dejaré las tablas que planeo usar para este proyecto con sus campos-tipo y descripción.  

También me vas a generar un árbol de la estructura del proyecto con todos los archivos para saber cómo quedará estructurado. Importante proporcionar la información lo más completa y organizada posible. Sin evitar detalles IMPORTANTES, pero que sea sencillo de entender.

CLIENTE
Compradores registrados en la tienda
01 / 12
Campo	Tipo	Llave	Descripción
id_cliente	INT	PK	Identificador único del cliente
nombre	VARCHAR(100)		Nombre completo
email	VARCHAR(120)		Correo electrónico (único)
telefono	VARCHAR(20)		Número de contacto
direccion	VARCHAR(200)		Dirección de envío principal
fecha_nacimiento	DATE		Para segmentación y cumpleaños
puntos_lealtad	INT		Saldo del programa de fidelidad
fecha_registro	DATE		Cuándo se registró por primera vez
activo	BOOLEAN		Indica si la cuenta está habilitada

VENTA
Transacciones de compra
02 / 12
Campo	Tipo	Llave	Descripción
id_venta	INT	PK	Identificador único de la venta
id_cliente	INT	FK	Referencia al cliente que compró
id_empleado	INT	FK	Empleado que procesó la venta
id_sucursal	INT	FK	Sucursal donde se realizó
fecha	DATE		Fecha y hora de la transacción
subtotal	DECIMAL(10,2)		Importe antes de impuestos
impuesto	DECIMAL(10,2)		IVA aplicado
total	DECIMAL(10,2)		Importe total cobrado
metodo_pago	VARCHAR(30)		Efectivo, tarjeta, transferencia…
estatus	VARCHAR(20)		Pagada, cancelada, pendiente
folio	VARCHAR(30)		Número de ticket o factura

DETALLE_VENTA
Renglones de cada transacción
03 / 12
Campo	Tipo	Llave	Descripción
id_detalle	INT	PK	Identificador del renglón
id_venta	INT	FK	Venta a la que pertenece
id_variante	INT	FK	Variante específica (talla/color)
id_promocion	INT	FK	Promoción aplicada (si aplica)
cantidad	INT		Número de piezas vendidas
precio_unitario	DECIMAL(10,2)		Precio al momento de la venta
descuento	DECIMAL(10,2)		Monto descontado en el renglón
subtotal	DECIMAL(10,2)		Importe final del renglón

PRODUCTO
Catálogo maestro de artículos
04 / 12
Campo	Tipo	Llave	Descripción
id_producto	INT	PK	Identificador único del producto
id_categoria	INT	FK	Categoría a la que pertenece
id_proveedor	INT	FK	Proveedor que lo suministra
nombre	VARCHAR(150)		Nombre comercial del artículo
sku	VARCHAR(40)		Código de referencia interno (único)
descripcion	TEXT		Descripción detallada
precio_base	DECIMAL(10,2)		Precio de lista sin descuentos
costo	DECIMAL(10,2)		Costo de adquisición
imagen_url	VARCHAR(255)		URL de la foto principal
activo	BOOLEAN		Si el producto está en catálogo activo
fecha_alta	DATE		Fecha en que se incorporó al catálogo

VARIANTE
Combinaciones de talla y color por producto
05 / 12
Campo	Tipo	Llave	Descripción
id_variante	INT	PK	Identificador único de la variante
id_producto	INT	FK	Producto al que pertenece
talla	VARCHAR(10)		XS, S, M, L, XL, XXL, numérica…
color	VARCHAR(40)		Nombre o código hex del color
codigo_barras	VARCHAR(50)		EAN-13 o código interno
precio_diferencial	DECIMAL(10,2)		Sobreprecio respecto al base (si aplica)
activo	BOOLEAN		Si la variante está disponible

CATEGORIA
Árbol de clasificación de productos
06 / 12
Campo	Tipo	Llave	Descripción
id_categoria	INT	PK	Identificador único
nombre	VARCHAR(80)		Nombre de la categoría (Vestidos, Blusas…)
id_categoria_padre	INT	FK	Referencia a sí misma para subcategorías
descripcion	VARCHAR(200)		Descripción opcional de la categoría
nivel	INT		Profundidad en el árbol (1=raíz)
activo	BOOLEAN		Si la categoría está visible

INVENTARIO
Stock por variante y sucursal
07 / 12
Campo	Tipo	Llave	Descripción
id_inventario	INT	PK	Identificador del registro
id_variante	INT	FK	Variante de producto
id_sucursal	INT	FK	Sucursal o bodega
cantidad	INT		Piezas disponibles actualmente
cantidad_minima	INT		Punto de reorden para alertas
ultima_actualizacion	DATE		Fecha del último movimiento

SUCURSAL
Puntos de venta y bodegas
08 / 12
Campo	Tipo	Llave	Descripción
id_sucursal	INT	PK	Identificador único de la sucursal
nombre	VARCHAR(100)		Nombre o alias de la tienda
direccion	VARCHAR(200)		Dirección física completa
ciudad	VARCHAR(80)		Ciudad donde opera
estado	VARCHAR(60)		Estado / provincia
telefono	VARCHAR(20)		Teléfono de contacto
tipo	VARCHAR(20)		Tienda, bodega, outlet…
activo	BOOLEAN		Si la sucursal está en operación

EMPLEADO
Personal de la empresa
09 / 12
Campo	Tipo	Llave	Descripción
id_empleado	INT	PK	Identificador único del empleado
id_sucursal	INT	FK	Sucursal donde trabaja
nombre	VARCHAR(100)		Nombre completo
puesto	VARCHAR(60)		Gerente, vendedor, cajero…
email	VARCHAR(120)		Correo corporativo
telefono	VARCHAR(20)		Teléfono de contacto
salario	DECIMAL(10,2)		Salario base mensual
fecha_ingreso	DATE		Fecha de contratación
activo	BOOLEAN		Si el empleado está activo

PROVEEDOR
Fabricantes y distribuidores
10 / 12
Campo	Tipo	Llave	Descripción
id_proveedor	INT	PK	Identificador único
nombre	VARCHAR(120)		Razón social o nombre comercial
contacto	VARCHAR(100)		Nombre del representante
email	VARCHAR(120)		Correo de contacto
telefono	VARCHAR(20)		Teléfono principal
pais	VARCHAR(60)		País de origen
ciudad	VARCHAR(80)		Ciudad de la empresa proveedora
condiciones_pago	VARCHAR(100)		Crédito a 30 días, contado…
activo	BOOLEAN		Si el proveedor sigue activo

DEVOLUCION
Registro de devoluciones posventa
11 / 12
Campo	Tipo	Llave	Descripción
id_devolucion	INT	PK	Identificador único
id_venta	INT	FK	Venta original relacionada
id_variante	INT	FK	Variante devuelta
id_empleado	INT	FK	Empleado que gestionó la devolución
fecha	DATE		Fecha en que se realizó
cantidad	INT		Piezas devueltas
motivo	VARCHAR(200)		Razón declarada por el cliente
tipo_resolucion	VARCHAR(30)		Reembolso, cambio, nota de crédito
monto_reembolso	DECIMAL(10,2)		Importe devuelto al cliente
estatus	VARCHAR(20)		Pendiente, aprobada, rechazada

PROMOCION
Descuentos y campañas comerciales
12 / 12
Campo	Tipo	Llave	Descripción
id_promocion	INT	PK	Identificador único
nombre	VARCHAR(100)		Nombre de la campaña
descripcion	VARCHAR(200)		Detalle de la promoción
tipo	VARCHAR(30)		Porcentaje, monto fijo, 2x1…
descuento_valor	DECIMAL(10,2)		Valor del descuento (% o $)
fecha_inicio	DATE		Inicio de vigencia
fecha_fin	DATE

Envía en una sola respuesta completa, unificiando toda la infrmación que te proporcioné y las mejoras de redacción y especificación que te pedí. Necesito el prompt mejorado.  NO OLVIDES NINGUNA INFORMACiÖN ANTERIOR PUESTA. Evita usar el idioma Inglés y además las tablas necesito que las especifiques MUY BIEN (para Firestore console).

Además, agrega estos requisitos: 
**CONTEXTO DEL PROYECTO:**
- **Nombre:** Parisina (Tienda de telas y costuras).
- **Plataforma:** Android (Prioridad), compilación en dispositivo físico.
- **Modo:** Simulación (E-commerce educativo). No se procesan pagos reales, pero se debe simular el flujo completo.
- **Idioma:** Español.

**REQUERIMIENTOS TÉCNICOS:**
1. **Stack:** Flutter (Dart) + Firebase (Auth + Firestore).
5. **Imágenes:** Las imágenes se cargarán vía URLs públicas (GitHub).
6. **Pagos:** Simulación. Calcular Subtotal + IVA (16%). Opciones visuales de MercadoPago/PayPal, pero al confirmar, mostrar un `Dialog` de "Compra Exitosa".


------------------------------------------------------

# 📘 PLAN DE IMPLEMENTACIÓN PROFESIONAL: PARISINA. TIENDA DE TELAS Y COSTURAS
> *Arquitectura documental, diseño de interfaz, estructura de datos y flujo de desarrollo. Optimizado para compilación en Android físico, modo simulación educativa y gestión 100% en español.*

---

## 🎯 1. CONTEXTO Y ALCANCE DEL PROYECTO
- **Nombre oficial:** Parisina (Tienda de telas y costuras)
- **Plataforma objetivo:** Android (prioridad), con compilación y pruebas en dispositivo físico.
- **Modo de operación:** Simulación educativa. No se integra pasarela de pagos real. Se replica el flujo completo de comercio electrónico (catálogo, carrito, checkout, confirmación).
- **Idioma de la aplicación:** Español (localización predeterminada `es_MX`).
- **Stack tecnológico:** Flutter (Dart) + Firebase (Autenticación por correo/contraseña + Firestore como base de datos documental).
- **Gestión de imágenes:** Carga dinámica mediante URLs públicas (almacenadas en repositorios de GitHub o similar).
- **Flujo de pagos:** Cálculo automático de `Subtotal + IVA (16%)`. Selección visual de métodos (Mercado Pago, PayPal, Transferencia). Al confirmar, se muestra un diálogo modal con el mensaje `Compra Exitosa` y se simula el registro en historial.

---

## 🛠️ 2. ENTORNO DE DESARROLLO Y HERRAMIENTAS REQUERIDAS
- **Kit de desarrollo:** Flutter SDK (canal estable) + Dart SDK. Verificación con `flutter doctor`.
- **Editor de código:** Visual Studio Code (recomendado por ligereza y ecosistema oficial). Extensiones obligatorias: `Flutter`, `Dart`, `Firebase`, `Pubspec Assist`, `Error Lens`, `Material Icon Theme`.
- **Consola de Firebase:** Se utiliza la interfaz web (Firebase Console) para configuración de proyectos, autenticación, Firestore, reglas de seguridad y analíticas. Si se hace referencia a `Firebase Studio`, se entiende como la consola web + flujo de integración local.
- **Compilación física Android:** Activación de `Opciones de desarrollador`, `Depuración USB` y perfil de compilación `debug`/`profile` para pruebas en terminal real.
- **Control de versiones:** Git con ramas `main` (estable), `develop` (integración) y `feature/*` (módulos por funcionalidad).
- **Diseño y prototipado:** Figma o herramienta equivalente para validar componentes antes de maquetar.
- **Pruebas de flujo:** Insomnia o Postman (opcional) para validar reglas de seguridad y respuestas de Firestore sin interferir con la interfaz.

---

## 🎨 3. SISTEMA DE DISEÑO UI/UX (PALETA Y COMPONENTES)
| Elemento | Color | Código Hexadecimal | Uso y Comportamiento UX |
|---|---|---|---|
| Fondo principal | Blanco puro | `#FFFFFF` | Lienzo base. Garantiza legibilidad y limpieza visual. |
| Barra superior (AppBar) | Rojo elegante | `#C41E3A` | Identidad de marca. Tono profundo y profesional para textiles. |
| Iconos AppBar | Blanco | `#FFFFFF` | Contraste óptimo y accesible sobre el fondo rojo. |
| Pie de página (Footer) | Negro mate | `#121212` | Reduce fatiga visual frente al negro absoluto. Contiene enlaces legales y contacto. |
| Texto Footer | Blanco suave | `#F2F2F2` | Lectura cómoda en modo oscuro parcial. |
| Texto principal | Negro grafito | `#212121` | Jerarquía tipográfica para títulos, descripciones y precios. |
| Fondos de sección | Gris perla | `#F5F5F7` | Separación visual entre bloques sin usar bordes agresivos. |
| Acento promocional | Amarillo dorado | `#F9A825` | Destaca descuentos, insignias de ofertas y botones secundarios. |
| Acento interactivo | Rojo ladrillo | `#B71C1C` | Botones de acción principal, estados activos y alertas críticas. |
| Detalles/Elevación | Blanco nieve | `#FAFAFA` | Tarjetas, sombras suaves y contenedores flotantes. |

**Tipografía y Escalas:**
- Títulos: `Montserrat` (pesos 600-700). Escala: 28px, 22px.
- Cuerpo y navegación: `Inter` (pesos 400-500). Escala: 16px, 14px, 12px.
- Accesibilidad: Relación de contraste mínima 4.5:1. Áreas táctiles mínimas 44x44 puntos.

**Componentes Base Reutilizables:**
- `BarraSuperiorPersonalizada`, `PieDePaginaTextil`, `BotonPrimario`, `CampoEntrada`, `TarjetaProducto`, `IndicadorCarga`, `EstadoVacio`, `FiltroCategoria`, `SelectorCantidad`, `ResumenCompra`.

---

## 🗃️ 4. ARQUITECTURA DE DATOS EN FIRESTORE (CONFIGURACIÓN PARA CONSOLA)
Firestore es una base de datos documental. Las tablas relacionales se adaptan a **colecciones** y **documentos**. A continuación, se detalla la estructura exacta para crearla manualmente en la consola, con nombres de campo en notación camello, tipos nativos, descripciones y notas de configuración.

### 4.1. `clientes`
- **Estrategia de identificador:** Usar el identificador único de Firebase Autenticación (`uid`) como identificador del documento.
- **Campos:**
  - `nombre` → Cadena | Nombre completo del comprador.
  - `correo` → Cadena | Único por documento. Validar en reglas de seguridad.
  - `telefono` → Cadena | Número de contacto.
  - `direccion` → Mapa | `calle`, `numero`, `colonia`, `ciudad`, `estado`, `codigoPostal`, `pais`.
  - `fechaNacimiento` → Marca de tiempo | Para segmentación y campañas de cumpleaños.
  - `puntosLealtad` → Número entero | Saldo acumulado en programa de fidelidad.
  - `fechaRegistro` → Marca de tiempo | Asignar automáticamente al crear el documento.
  - `activo` → Booleano | Indica si la cuenta está habilitada para compras.
- **Índices compuestos:** `correo` (asc), `activo` (asc).
- **Nota de acceso:** Solo lectura/escritura por el propietario (`auth.uid == documento.id`) o administradores.

### 4.2. `ventas`
- **Estrategia de identificador:** Generado automáticamente por Firestore.
- **Campos:**
  - `idCliente` → Referencia | Vinculación al documento en `clientes`.
  - `idEmpleado` → Referencia | Empleado que procesó la transacción.
  - `idSucursal` → Referencia | Punto de venta donde se realizó.
  - `fecha` → Marca de tiempo | Momento exacto de la transacción.
  - `subtotal` → Número (decimales) | Importe antes de impuestos.
  - `impuesto` → Número (decimales) | IVA calculado (16% del subtotal en simulación).
  - `total` → Número (decimales) | `subtotal + impuesto`.
  - `metodoPago` → Cadena | `efectivo`, `tarjeta`, `transferencia`, `simulado`.
  - `estatus` → Cadena | `pagada`, `pendiente`, `cancelada`, `enviada`.
  - `folio` → Cadena | Número visible en comprobante.
  - `articulos` → Arreglo de mapas | Cada elemento contiene: `idVariante` (referencia), `cantidad` (número), `precioUnitario` (número), `descuento` (número), `subtotalRenglon` (número).
- **Índices compuestos:** `idCliente` + `fecha` (desc), `estatus` + `fecha` (desc).
- **Nota de acceso:** Cliente solo ve sus propias ventas. Administrador ve todas. Crear con transacciones para validar stock.

### 4.3. `productos`
- **Estrategia de identificador:** Generado automáticamente.
- **Campos:**
  - `idCategoria` → Referencia | Categoría a la que pertenece.
  - `idProveedor` → Referencia | Proveedor suministrador.
  - `nombre` → Cadena | Nombre comercial.
  - `sku` → Cadena | Código interno único.
  - `descripcion` → Cadena | Detalles técnicos o de uso.
  - `precioBase` → Número (decimales) | Precio de lista sin descuentos.
  - `costo` → Número (decimales) | Costo de adquisición (solo visible internamente).
  - `imagenUrl` → Cadena | URL pública de la imagen principal (GitHub).
  - `activo` → Booleano | Si aparece en catálogo visible.
  - `fechaAlta` → Marca de tiempo | Fecha de incorporación.
- **Índices compuestos:** `idCategoria` + `activo`, `activo` + `fechaAlta` (desc).
- **Nota de acceso:** Lectura pública. Escritura restringida a administradores.

### 4.4. `variantes`
- **Estrategia de identificador:** Generado automáticamente.
- **Campos:**
  - `idProducto` → Referencia | Producto maestro asociado.
  - `talla` → Cadena | `XS`, `S`, `M`, `L`, `XL`, `32`, `34`, etc.
  - `color` → Cadena | Nombre o código hexadecimal.
  - `codigoBarras` → Cadena | `EAN-13` o identificador interno.
  - `precioDiferencial` → Número (decimales) | Ajuste sobre el precio base.
  - `activo` → Booleano | Disponibilidad de la combinación.
- **Índices compuestos:** `idProducto` + `activo`, `codigoBarras` (asc).
- **Nota de acceso:** Lectura pública. No modificar directamente en producción sin validación de catálogo.

### 4.5. `categorias`
- **Estrategia de identificador:** Generado automáticamente.
- **Campos:**
  - `nombre` → Cadena | Título de la categoría (Ej: `Telas`, `Hilos`, `Accesorios`).
  - `idCategoriaPadre` → Referencia | Apunta a otra categoría para crear subcategorías, o nulo si es raíz.
  - `descripcion` → Cadena | Texto opcional de clasificación.
  - `nivel` → Número entero | Profundidad en el árbol (`1` = raíz, `2` = subcategoría).
  - `activo` → Booleano | Visibilidad en filtros.
- **Índices compuestos:** `activo` + `nivel`, `idCategoriaPadre` (asc).
- **Nota de acceso:** Lectura pública. Escritura solo administradores.

### 4.6. `inventarios`
- **Estrategia de identificador:** Compuesto recomendado `"{idVariante}_{idSucursal}"` o generado con validación de unicidad.
- **Campos:**
  - `idVariante` → Referencia | Variante específica.
  - `idSucursal` → Referencia | Ubicación física.
  - `cantidad` → Número entero | Piezas disponibles actualmente.
  - `cantidadMinima` → Número entero | Umbral para alertas de reorden.
  - `ultimaActualizacion` → Marca de tiempo | Último movimiento registrado.
- **Índices compuestos:** `idVariante` (asc), `cantidad` ≤ `cantidadMinima` (para consultas de alerta).
- **Nota de acceso:** Lectura pública (stock visible). Escritura solo mediante transacciones seguras o rol `almacen`.

### 4.7. `sucursales`
- **Estrategia de identificador:** Generado automáticamente.
- **Campos:**
  - `nombre` → Cadena | Alias o nombre comercial del punto.
  - `direccion` → Mapa | Dirección física completa.
  - `ciudad` → Cadena | Localidad de operación.
  - `estado` → Cadena | Provincia o entidad federativa.
  - `telefono` → Cadena | Línea de contacto.
  - `tipo` → Cadena | `tienda`, `bodega`, `outlet`.
  - `activo` → Booleano | Operatividad actual.
- **Índices compuestos:** `tipo` + `activo`.
- **Nota de acceso:** Lectura pública. Datos casi estáticos, cachear en dispositivo.

### 4.8. `empleados`
- **Estrategia de identificador:** Identificador de autenticación o generado.
- **Campos:**
  - `idSucursal` → Referencia | Ubicación asignada.
  - `nombre` → Cadena | Nombre completo.
  - `puesto` → Cadena | `gerente`, `vendedor`, `cajero`, `almacen`.
  - `correo` → Cadena | Contacto corporativo.
  - `telefono` → Cadena | Número directo.
  - `salario` → Número (decimales) | Base mensual (solo visible internamente).
  - `fechaIngreso` → Marca de tiempo | Contratación.
  - `activo` → Booleano | Estado laboral.
- **Índices compuestos:** `idSucursal` + `activo`, `puesto` (asc).
- **Nota de acceso:** Acceso restringido. Solo administradores ven `salario`.

### 4.9. `proveedores`
- **Estrategia de identificador:** Generado automáticamente.
- **Campos:**
  - `nombre` → Cadena | Razón social o marca.
  - `contacto` → Cadena | Representante comercial.
  - `correo` → Cadena | Canal de comunicación.
  - `telefono` → Cadena | Línea principal.
  - `pais` → Cadena | Origen geográfico.
  - `ciudad` → Cadena | Sede operativa.
  - `condicionesPago` → Cadena | `contado`, `crédito 30 días`, etc.
  - `activo` → Booleano | Vigencia comercial.
- **Índices compuestos:** `activo` (asc).
- **Nota de acceso:** Exclusivo gestión interna. No exponer en app cliente.

### 4.10. `devoluciones`
- **Estrategia de identificador:** Generado automáticamente.
- **Campos:**
  - `idVenta` → Referencia | Transacción original vinculada.
  - `idVariante` → Referencia | Artículo devuelto.
  - `idEmpleado` → Referencia | Personal que gestionó el proceso.
  - `fecha` → Marca de tiempo | Fecha de solicitud/aceptación.
  - `cantidad` → Número entero | Piezas regresadas.
  - `motivo` → Cadena | Razón declarada (`defectuoso`, `talla incorrecta`, etc.).
  - `tipoResolucion` → Cadena | `reembolso`, `cambio`, `nota_credito`.
  - `montoReembolso` → Número (decimales) | Importe a devolver.
  - `estatus` → Cadena | `pendiente`, `aprobada`, `rechazada`, `completada`.
- **Índices compuestos:** `idVenta` + `estatus`, `fecha` (desc).
- **Nota de acceso:** Cliente crea solicitud. Solo administradores cambian `estatus` y `montoReembolso`. Validar que `cantidad` no supere lo comprado.

### 4.11. `promociones`
- **Estrategia de identificador:** Generado automáticamente.
- **Campos:**
  - `nombre` → Cadena | Título de la campaña.
  - `descripcion` → Cadena | Detalle de beneficios.
  - `tipo` → Cadena | `porcentaje`, `monto_fijo`, `2x1`, `combo`.
  - `descuentoValor` → Número (decimales) | Valor aplicable.
  - `fechaInicio` → Marca de tiempo | Inicio de vigencia.
  - `fechaFin` → Marca de tiempo | Fin de vigencia.
  - `activo` → Booleano | Publicación activa.
  - `categoriasAplicables` → Arreglo de referencias | Si está vacío, aplica a todo el catálogo.
- **Índices compuestos:** `activo` + `fechaInicio` + `fechaFin`.
- **Nota de acceso:** Lectura pública. Filtrar por rango de fechas y estado activo en la aplicación.

---

## 📁 5. ESTRUCTURA DEL PROYECTO (ORGANIZACIÓN DE CARPETAS)
```
parisina_app/
├── android/                  # Configuración nativa y perfiles de compilación
├── ios/                      # Configuración nativa (mínima requerida)
├── web/                      # Manifiesto y configuración web
├── recursos/
│   ├── imagenes/             # Logotipos, texturas, imágenes por defecto
│   ├── iconos/               # Archivos vectoriales para navegación
│   └── tipografias/          # Archivos de fuente locales (si se requieren)
├── lib/
│   ├── principal.dart        # Punto de entrada, inicialización de Firebase, proveedores y enrutador
│   └── nucleo/
│       ├── constantes/       # Rutas, cadenas fijas, formatos de moneda, límites
│       ├── tema/             # Definición de paleta, tipografía, espaciados y componentes globales
│       ├── utilidades/       # Validadores, formateadores de fecha/precio, helpers
│       ├── enrutador/        # Configuración de navegación declarativa y protecciones de ruta
│       └── servicios/        # Inicialización de Firebase, registros, analíticas
├── modulos/
│   ├── autenticacion/        # Modelos, proveedores, pantallas, componentes, servicios de login/registro
│   ├── catalogo/             # Modelos, proveedores, pantallas de lista/detalle, filtros
│   ├── carrito/              # Lógica local, persistencia ligera, interfaz de revisión
│   ├── checkout/             # Cálculos de IVA, selección de método, diálogo de éxito
│   ├── pedidos/              # Historial, estados de envío, simulación de seguimiento
│   └── perfil/               # Datos de usuario, direcciones, cierre de sesión
└── compartido/
    ├── modelos/              # Entidades transversales (articulo_carrito, direccion, usuario)
    ├── componentes/          # Botones, campos, tarjetas, pies de página, indicadores reutilizables
    └── guardas/              # Interceptores de navegación, validación de permisos
```

---

## 📦 6. DEPENDENCIAS REQUERIDAS (CONFIGURACIÓN DEL MANIFIESTO)
Lista curada para incluir en el archivo de configuración del proyecto. Cada paquete tiene un propósito definido para este flujo simulado.

| Paquete | Propósito en Parisina |
|---|---|
| `firebase_core` | Inicialización segura de la conexión con Firebase. |
| `firebase_auth` | Gestión de registro, inicio de sesión, verificación de correo y recuperación de contraseña. |
| `cloud_firestore` | Consultas, flujos en tiempo real, transacciones y persistencia local automática. |
| `firebase_storage` | (Opcional) Si se requieren subidas de imágenes de perfil o comprobantes. |
| `firebase_analytics` | Métricas de uso y comportamiento dentro de la simulación. |
| `firebase_crashlytics` | Reporte silencioso de fallos para diagnóstico posterior. |
| `provider` | Gestión de estado reactivo por módulo (autenticación, catálogo, carrito, pedidos). |
| `go_router` | Navegación declarativa, protección de rutas privadas y enlaces profundos. |
| `cached_network_image` | Carga eficiente de imágenes desde URLs públicas (GitHub) con caché local. |
| `flutter_svg` | Renderizado de iconos y logotipos vectoriales. |
| `shimmer` | Indicadores de carga visuales (esqueletos) para mejorar percepción de rendimiento. |
| `intl` | Formateo automático de moneda (`$MXN`), fechas y números según localización `es_MX`. |
| `google_fonts` | Integración directa de `Montserrat` e `Inter` sin archivos locales. |
| `flutter_form_builder` | Construcción y validación de formularios de registro, dirección y checkout. |
| `email_validator` | Verificación estricta de formato de correo electrónico. |
| `formz` | Estados de validación de formularios (`puro`, `válido`, `enviando`, `inválido`). |
| `uuid` | Generación de identificadores locales para artículos en carrito sin conexión. |
| `equatable` | Comparación eficiente de modelos y estados para evitar reconstrucciones innecesarias. |
| `shared_preferences` | Persistencia ligera de preferencias de usuario, última sucursal visitada y borrador de carrito. |
| `collection` | Operaciones avanzadas sobre listas y mapas (filtrado, ordenamiento, agrupación). |

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter

  # 🔥 Firebase (Núcleo y servicios)
  firebase_core: ^3.8.0
  firebase_auth: ^5.3.3
  cloud_firestore: ^5.5.0
  firebase_storage: ^12.3.6
  firebase_analytics: ^11.3.5
  firebase_crashlytics: ^4.2.0

  # 🔄 Gestión de estado y navegación
  provider: ^6.1.2
  go_router: ^14.6.0

  # 🎨 Interfaz, imágenes y tipografía
  cached_network_image: ^3.4.1
  flutter_svg: ^2.0.10+1
  shimmer: ^3.0.0
  google_fonts: ^6.2.1
  intl: ^0.19.0

  # 📝 Formularios y validación
  flutter_form_builder: ^9.4.0
  email_validator: ^3.0.0
  formz: ^0.7.0

  # 🛠️ Utilidades y persistencia ligera
  uuid: ^4.5.1
  equatable: ^2.0.5
  shared_preferences: ^2.3.3
  collection: ^1.18.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^4.0.0
  mocktail: ^1.0.4
  build_runner: ^2.4.13
  flutter_launcher_icons: ^0.14.1
  flutter_native_splash: ^2.4.2
```
---

## 🔄 7. GESTIÓN DE ESTADO, NAVEGACIÓN Y FLUJO DE PAGO SIMULADO
- **Arquitectura de proveedores:** Se utilizará `MultiProvider` en el punto de entrada. Cada módulo tendrá su propio proveedor:
  - `ProveedorAutenticacion`: Controla sesión, estado de carga, y redirección según validez de credenciales.
  - `ProveedorCatalogo`: Maneja carga paginada, filtros por categoría/precio, búsqueda con retraso (debounce) y estado de disponibilidad.
  - `ProveedorCarrito`: Opera localmente con sincronización opcional. Calcula subtotales parciales, valida stock y aplica promociones activas.
  - `ProveedorCheckout`: Centraliza cálculo de `IVA (16%)`, selección visual de método de pago, validación de dirección y generación del diálogo de confirmación.
- **Navegación:** Declarativa mediante `go_router`. Rutas públicas: `inicio`, `catalogo`, `detalle`, `login`, `registro`. Rutas protegidas: `carrito`, `checkout`, `perfil`, `pedidos`. Si el usuario no está autenticado, se redirige automáticamente a la pantalla de acceso.
- **Simulación de pago:**
  1. El usuario revisa el resumen. Se calcula automáticamente: `Subtotal`, `IVA (16%)`, `Total`.
  2. Se muestran botones visuales con logotipos de `Mercado Pago`, `PayPal` y `Transferencia`.
  3. Al tocar `Confirmar Compra`, no se envía dinero real. Se muestra un diálogo modal centrado con mensaje `Compra Exitosa`, folio generado y opción `Ver pedido`.
  4. Se limpia el carrito local, se registra la transacción en `ventas` (modo simulado) y se redirige al historial.


---

## 🧭 8. HOJA DE RUTA PASO A PASO
1. **Configuración base:** Crear proyecto Flutter, registrar aplicación en Firebase Console, descargar configuraciones, inicializar `firebase_core` y verificar compilación en dispositivo Android físico.
2. **Sistema de diseño:** Definir tema visual exacto, tipografías, componentes reutilizables y configurar el enrutador con protecciones básicas.
3. **Módulo de autenticación:** Implementar pantallas de acceso, registro y recuperación. Conectar con Firebase Auth. Validar formularios y gestionar persistencia de sesión.
4. **Estructura de datos:** Crear manualmente las colecciones en Firestore Console siguiendo la especificación del apartado 4. Configurar índices compuestos solicitados por la consola. Aplicar reglas de seguridad conceptuales.
5. **Catálogo interactivo:** Conectar `ProveedorCatalogo` con Firestore. Implementar cuadrícula de productos, filtros, búsqueda y pantalla de detalle con selección de talla/color y carga de imágenes por URL.
6. **Carrito y checkout:** Lógica de agregado, eliminación y cálculo de cantidades. Implementar resumen con desglose de IVA 16%. Integrar diálogo de confirmación simulada.
7. **Historial y perfil:** Pantalla de pedidos con estados. Edición de datos personales, gestión de direcciones y cierre de sesión.
8. **Pruebas y optimización:** Validar flujo completo en dispositivo físico. Verificar reconstrucciones de interfaz, caché de imágenes y comportamiento sin conexión. Ajustar rendimiento antes de compilación final.
9. **Entrega educativa:** Generar paquete `APK` o `AAB`. Documentar arquitectura, reglas de seguridad y flujo de simulación para fines académicos o demostrativos.

---

## 🛡️ 9. VALIDACIÓN, SEGURIDAD Y COMPILACIÓN FÍSICA
- **Reglas de Firestore:** Configurar en la consola para que `clientes` solo permita lectura/escritura al dueño. `productos`, `categorias`, `sucursales`, `promociones` permiten lectura pública. `ventas` e `inventarios` requieren transacciones y validación de permisos por rol.
- **Validación en interfaz:** Todos los formularios deben rechazar entradas vacías, formatos de correo inválidos, teléfonos sin longitud mínima y contraseñas menores a ocho caracteres.
- **Cálculo de impuestos:** Implementar redondeo a dos decimales. Fórmula: `total = subtotal + (subtotal * 0.16)`. Validar que no existan diferencias por redondeo en el resumen.
- **Compilación física Android:** Usar `flutter build apk --target-platform android-arm,android-arm64` o `flutter run --release` conectado por USB. Verificar permisos de red, orientación y consumo de memoria.
- **Manejo de imágenes:** Validar URLs antes de renderizar. Usar imagen por defecto en caso de fallo de red o enlace roto. No descargar imágenes mayores a un megabyte en catálogo.

---

## ✅ 10. LISTA DE VERIFICACIÓN FINAL (ANTES DE IMPLEMENTACIÓN)
- [ ] Entorno Flutter/Dart verificado y dispositivo Android conectado con depuración USB.
- [ ] Proyecto Firebase creado con Autenticación, Firestore y Analíticas activados.
- [ ] Colecciones creadas en consola con nombres, tipos y campos exactos según especificación.
- [ ] Índices compuestos generados y propagados.
- [ ] Reglas de seguridad redactadas y validadas en simulador de consola.
- [ ] Manifiesto de dependencias actualizado y resuelto sin conflictos.
- [ ] Estructura de carpetas implementada y lista para módulos.
- [ ] Paleta visual validada con contraste accesible y componentes reutilizables definidos.
- [ ] Proveedores de estado diseñados con flujos claros de carga, éxito y error.
- [ ] Enrutador configurado con protecciones y redirecciones automáticas.
- [ ] Lógica de cálculo de IVA 16% y diálogo de compra exitosa documentada en flujo de checkout.
- [ ] Estrategia de compilación física definida y lista para ejecución.

---
📌 **Siguiente paso:** Este documento constituye el plano maestro completo. Una vez validado, se procederá a la generación modular del código fuente, iniciando por la configuración del tema, la inicialización de Firebase, la estructura de proveedores y la navegación protegida, respetando estrictamente este diseño y sin desviarse de la simulación educativa solicitada. ¿Deseas que se inicie la implementación por el bloque `nucleo/tema` y `principal.dart`, o prefieres ajustar algún detalle de las colecciones o del flujo de checkout antes de comenzar?
