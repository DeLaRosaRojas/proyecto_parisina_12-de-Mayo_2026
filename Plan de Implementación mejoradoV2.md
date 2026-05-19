# Prompt Mejorado:

Vamos a Mejorar y hacer de forma Profesional nuestro Plan de Implementación. Importante, NO me proporciones el código todavía. Por favor. 
Actúa como un creador de software, diseñador de aplicaciones móviles multiplataforma. 

Quiero crear una Aplicación multiplataforma en Flutter Dart y Firebase utilizando vs Code o Antigravity. Qué herramientas se requieren, ui, ux, dependencias, login autenticación usuario password, base de datos Firestore, privider, dependencias en pubspec.yaml. Lenguaje Dart, Flutter.

Proyecto de Tienda de Telas y Costuras con el nombre "Parisina", el objetivo de esta app es que las personas que accedan al Sitio, puedan comprar los diversos productos que ofrece nuestra tienda. 

La paleta de colores que utilizaremos será: Fondo de página (Blanco), Appbar (Rojo), Iconos AppBar (Blancos), Footer (Negro), Letras fuente Footer (Blanco); Contenido dentro del cuerpo (Subtonos Grises, Amarillos, Negros y Rojo, con detalles Blancos en caso de ser necesario). Como parte de ser diseñador, te encargo que escojas subtonos visualmente atractivos y elegantes. 

El Entorno de trabajo que usaré será la aplicación Antigravity vinculada con una Base de datos en Firebase console, me proporcionarán la lista de dependencias que necesitare para el pubsyec.yaml como ayuda para la generación de este proyecto, te dejaré las tablas que planeo usar para este proyecto con sus campos-tipo y descripción.  

También me vas a generar un árbol de la estructura del proyecto con todos los archivos para saber cómo quedará estructurado. 


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





# 📐 Plan de Implementación Profesional: **Parisina. Tienda de Telas y Costura**
> *Aplicación multiplataforma (Android, iOS, Web) | Flutter + Dart + Firebase | Arquitectura basada en Features + Provider*

---

## 🛠️ Fase 0: Entorno de Desarrollo y Herramientas Requeridas
1. **SDK y Lenguaje**
   - Flutter SDK (canal estable) + Dart SDK
   - Verificar compatibilidad multiplataforma: `flutter doctor`
   - Configurar Git para control de versiones y ramas de trabajo (`main`, `develop`, `feature/*`)

2. **Editor de Código (IDE)**
   - **VS Code** (recomendado por ligereza y ecosistema oficial)
   - Extensiones esenciales: `Flutter`, `Dart`, `Firebase`, `Pubspec Assist`, `Error Lens`, `Material Icon Theme`, `Flutter Snippets`
   - *Nota sobre "Antigravity":* No es un entorno estándar reconocido para desarrollo Flutter. Si se refiere a un editor personalizado o alternativo, asegúrese de que soporte **Dart Language Server Protocol (LSP)**, formateo `dart format`, análisis `dart analyze` y depuración nativa. El plan es agnóstico a IDE, pero se valida en VS Code/Android Studio.

3. **Herramientas Complementarias**
   - Firebase CLI (`npm install -g firebase-tools`)
   - Android Studio (solo para SDK, emuladores y herramientas de compilación nativa)
   - Chrome/Edge + Simulador iOS (macOS) o emuladores Android
   - Figma / Penpot (para validación UI/UX previa)
   - Postman / Insomnia (para pruebas de reglas de seguridad y emuladores)

---

## 🎨 Fase 1: Sistema de Diseño UI/UX y Paleta de Colores
1. **Paleta Oficial (Códigos HEX y Uso)**
   | Elemento | Color | HEX | Comentario UX |
   |---|---|---|---|
   | Fondo principal | Blanco | `#FFFFFF` | Máxima legibilidad y limpieza visual |
   | AppBar | Rojo elegante | `#B71C1C` | Tono profundo, profesional y asociado a la identidad textil |
   | Iconos AppBar | Blanco | `#FFFFFF` | Contraste WCAG AA garantizado |
   | Footer | Negro suave | `#1A1A1A` | Evita fatiga visual vs negro puro |
   | Texto Footer | Blanco | `#F5F5F5` | Legibilidad en modo oscuro parcial |
   | Acentos cuerpo | Rojo secundario | `#D32F2F` | Botones primarios, estados activos |
   | Acentos cuerpo | Amarillo dorado | `#F9A825` | Destacados, promociones, badges |
   | Texto cuerpo | Negro suave | `#212121` | Jerarquía tipográfica principal |
   | Fondos secciones | Gris claro | `#F5F5F5` | Separación visual sin bordes agresivos |
   | Detalles/Bordes | Blanco | `#FFFFFF` | Elevación, cards, sombras suaves |

2. **Tipografía y Componentes**
   - Fuente principal: `Inter` o `Montserrat` (Google Fonts) por legibilidad en móvil/web
   - Escalas tipográficas: `Display (24-28)`, `Title (18-20)`, `Body (14-16)`, `Caption (12)`
   - Componentes clave: `PrimaryButton`, `SecondaryButton`, `ProductCard`, `SearchBar`, `FooterWidget`, `AppBarCustom`, `LoadingShimmer`, `EmptyStateWidget`
   - Accesibilidad: Ratio de contraste ≥ 4.5:1, targets táctiles ≥ 44x44px, navegación por teclado/web optimizada

3. **Flujo de Usuario (UX)**
   - Onboarding → Registro/Inicio Sesión → Catálogo → Filtros/Búsqueda → Detalle Producto → Carrito → Checkout → Confirmación → Perfil/Pedidos
   - Estados críticos: `Cargando`, `Éxito`, `Error`, `Vacío`, `Sin conexión`
   - Microinteracciones: Transiciones suaves entre pantallas, feedback háptico (móvil), indicadores de progreso lineales

---

## 🗃️ Fase 2: Arquitectura de Datos (Relacional → Firestore)
Firestore es NoSQL. Las tablas SQL se transforman en **colecciones y documentos**, priorizando lecturas rápidas, denormalización controlada y transacciones para integridad.

| Colección Firestore | Origen SQL | Estructura Recomendada |
|---|---|---|
| `clients` | CLIENTE | Documento por cliente. Campos planos. `email` único indexado. |
| `products` | PRODUCTO + CATEGORIA + VARIANTE | Documento por producto. `variants` como array embebido o subcolección. `categoryId` como referencia (`DocumentReference`). |
| `categories` | CATEGORIA | Documento por categoría. `parentId` para árbol. `level` calculado o almacenado. |
| `inventory` | INVENTARIO | Documento por `variantId` + `storeId`. `quantity`, `minQuantity`, `updatedAt`. Actualizado vía transacciones. |
| `orders` | VENTA + DETALLE_VENTA | Documento por venta. `items` como array embebido con `variantId`, `quantity`, `price`, `discount`. Evita joins costosos. |
| `stores` | SUCURSAL | Documento por sucursal. `type`, `active`, geolocalización opcional. |
| `employees` | EMPLEADO | Documento por empleado. `role`, `storeId`, `active`. Acceso restringido por reglas. |
| `suppliers` | PROVEEDOR | Documento por proveedor. Campos planos. `active` boolean. |
| `returns` | DEVOLUCION | Documento por devolución. `orderId`, `variantId`, `resolutionType`, `status`. |
| `promotions` | PROMOCION | Documento por campaña. `type`, `value`, `startDate`, `endDate`, `applicableCategories` (array). |

**Notas de Arquitectura NoSQL:**
- Evitar claves foráneas. Usar `DocumentReference` o IDs embebidos según frecuencia de acceso.
- Las ventas deben usar `runTransaction()` para actualizar inventario y crear el documento simultáneamente.
- Habilitar índices compuestos para filtros (categoría + precio + disponibilidad).
- Activar persistencia offline para catálogo y carrito.

---

## 📁 Fase 3: Estructura del Proyecto (Árbol de Directorios)
Arquitectura **Feature-First + Clean-ish** para escalabilidad, mantenibilidad y separación de responsabilidades.

```
parisina_telas_costura/
├── android/                  # Configuración nativa Android
├── ios/                      # Configuración nativa iOS
├── web/                      # Configuración web (index.html, manifest, etc.)
├── assets/
│   ├── images/               # Logos, placeholders, backgrounds
│   ├── icons/                # SVGs personalizados
│   ├── fonts/                # Fuentes locales (si aplica)
│   └── config/               # json de rutas, locales, temas
├── lib/
│   ├── main.dart             # Entry point, inicialización Firebase, runApp
│   └── src/
│       ├── core/
│       │   ├── constants/    # Rutas, claves, límites, strings fijos
│       │   ├── theme/        # ThemeData, paleta, tipografía, componentes globales
│       │   ├── utils/        # Validadores, formateadores, helpers
│       │   ├── router/       # go_router o navegación declarativa
│       │   └── services/     # Firebase init, logging, analytics
│       ├── features/
│       │   ├── auth/
│       │   │   ├── models/
│       │   │   ├── providers/
│       │   │   ├── screens/
│       │   │   ├── widgets/
│       │   │   └── services/
│       │   ├── catalog/
│       │   │   ├── models/
│       │   │   ├── providers/
│       │   │   ├── screens/
│       │   │   ├── widgets/
│       │   │   └── services/
│       │   ├── cart/
│       │   │   ├── models/
│       │   │   ├── providers/
│       │   │   ├── screens/
│       │   │   └── widgets/
│       │   ├── checkout/
│       │   │   ├── models/
│       │   │   ├── providers/
│       │   │   ├── screens/
│       │   │   └── widgets/
│       │   ├── orders/
│       │   │   ├── models/
│       │   │   ├── providers/
│       │   │   ├── screens/
│       │   │   └── widgets/
│       │   └── profile/
│       │       ├── models/
│       │       ├── providers/
│       │       ├── screens/
│       │       └── widgets/
│       └── shared/
│           ├── models/       # Entidades comunes (User, CartItem, etc.)
│           ├── widgets/      # Reutilizables (buttons, inputs, cards, footer)
│           └── guards/       # Auth guards, route interceptors
├── test/                     # Unit, widget, integration tests
├── pubspec.yaml              # Dependencias, assets, metadata
└── firebase.json             # Configuración hosting/emuladores (opcional)
```

---

## 📦 Fase 4: Dependencias Requeridas (`pubspec.yaml`)
Lista curada y profesional. Se recomienda fijar versiones con `^` y verificar compatibilidad antes de `flutter pub get`.

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter

  # Firebase
  firebase_core: ^latest
  firebase_auth: ^latest
  cloud_firestore: ^latest
  firebase_storage: ^latest        # Opcional: subida de imágenes de perfil
  firebase_crashlytics: ^latest    # Reporte de errores
  firebase_analytics: ^latest      # Métricas de uso

  # Estado y Navegación
  provider: ^latest
  go_router: ^latest               # Navegación declarativa + guards

  # UI/UX y Componentes
  cached_network_image: ^latest    # Carga y cacheo de imágenes
  flutter_svg: ^latest             # Iconos SVG
  shimmer: ^latest                 # Estados de carga visuales
  intl: ^latest                    # Formateo de fechas, monedas, números
  google_fonts: ^latest            # Inter/Montserrat

  # Formularios y Validación
  flutter_form_builder: ^latest
  formz: ^latest
  email_validator: ^latest

  # Utilidades
  uuid: ^latest                    # IDs locales (si se requieren offline)
  flutter_dotenv: ^latest          # Variables de entorno (no sensibles)
  equatable: ^latest               # Comparación de modelos
  collection: ^latest              # Operaciones avanzadas en listas
```

*Nota:* Ejecutar `flutter pub get` tras agregar. Usar `dependency_overrides` solo si hay conflictos de resolución. Mantener `pubspec.lock` en control de versiones.

---

## 🔐 Fase 5: Autenticación y Seguridad
1. **Firebase Authentication**
   - Habilitar método `Email/Password` en consola
   - Activar verificación de correo electrónico obligatoria post-registro
   - Configurar flujo de recuperación de contraseña (correo con enlace seguro)
   - Política de contraseñas: mínimo 8 caracteres, 1 mayúscula, 1 número, 1 símbolo
   - Persistencia de sesión: `Persistence.LOCAL` (predeterminado, seguro)

2. **Firestore Security Rules**
   - `clients`: Solo lectura/escritura por el dueño (`request.auth.uid == resource.data.id`)
   - `products`, `categories`, `promotions`, `stores`: Lectura pública, escritura solo para roles `admin`
   - `orders`, `returns`: Lectura por propietario o admin, escritura protegida por transacciones
   - `inventory`: Actualización solo vía backend o reglas estrictas con validación de stock
   - Validar tipos, límites numéricos y campos obligatorios en reglas

3. **App Check (Opcional pero Profesional)**
   - Habilitar reCAPTCHA v3 (Web) y Play Integrity/DeviceCheck (Móvil)
   - Evita abusos de API y lecturas anónimas masivas

---

## 🔄 Fase 6: Gestión de Estado con Provider
1. **Arquitectura de Providers**
   - `AuthProvider`: Sesión, login, registro, logout, estado `isAuthenticated`, `isLoading`
   - `CatalogProvider`: Carga de productos, filtros, búsqueda, paginación, `state` enum (`loading`, `data`, `error`)
   - `CartProvider`: Lógica local + sincronización opcional a Firestore, cálculo de totales, persistencia `SharedPreferences` o `Hive` (si se desea offline)
   - `OrderProvider`: Historial, creación, estado de pedidos, actualización en tiempo real (`StreamProvider`)
   - `ThemeProvider` (opcional): Cambio dinámico de acentos, modo oscuro/claro

2. **Patrones de Uso**
   - `MultiProvider` en `main.dart` como raíz
   - `context.watch<T>()` para UI que debe reaccionar
   - `context.read<T>()` para acciones únicas (botones, callbacks)
   - Evitar providers globales innecesarios; usar scope por feature
   - Separar `ChangeNotifier` puros de lógica asíncrona (usar `FutureBuilder` o `StreamBuilder` cuando corresponda)

3. **Estados y Manejo de Errores**
   - Clase base `Result<T>` o enums `Loading`, `Success(T)`, `Error(String)`
   - Centralizar mensajes de error en `core/constants/`
   - Mostrar `SnackBar` o `AlertDialog` según gravedad
   - Registrar errores en Crashlytics para diagnóstico

---

## 🧭 Fase 7: Procedimiento Paso a Paso para el Desarrollo
1. **Inicialización y Configuración Base**
   - Crear proyecto Flutter multiplataforma
   - Configurar `pubspec.yaml`, assets, y estructura de carpetas
   - Registrar apps en Firebase Console (Android, iOS, Web)
   - Descargar y ubicar credenciales (`google-services.json`, `GoogleService-Info.plist`)
   - Inicializar Firebase en `main.dart` con manejo de errores

2. **Sistema de Diseño y Navegación**
   - Implementar `ThemeData` con paleta definida
   - Configurar `go_router` con rutas públicas y protegidas
   - Crear widgets base: `CustomAppBar`, `CustomFooter`, `PrimaryButton`, `InputField`
   - Validar responsividad en móvil, tablet y web

3. **Módulo de Autenticación**
   - Pantallas de Login, Registro, Recuperación, Verificación
   - Conectar con `firebase_auth` vía `AuthProvider`
   - Implementar guard de rutas: redirigir a `/catalog` si autenticado, a `/login` si no
   - Validar formularios, mostrar estados de carga, manejar excepciones

4. **Catálogo y Firestore**
   - Diseñar modelo `Product` + `Variant`
   - Implementar `CatalogProvider` con `Stream<List<Product>>` o `Future` con paginación
   - Crear vistas: Grid/List, Filtros, Búsqueda con debounce, Detalle
   - Optimizar imágenes con `cached_network_image` y placeholders

5. **Carrito y Checkout**
   - Implementar `CartProvider` con operaciones CRUD locales
   - Validar stock antes de agregar, calcular impuestos/envío
   - Pantalla de checkout: selección de método de pago, dirección, resumen
   - Confirmación: escribir en `orders` vía transacción, limpiar carrito, generar comprobante

6. **Pedidos y Perfil**
   - Historial de compras con estados (`pending`, `processing`, `delivered`, `cancelled`)
   - Edición de datos de usuario, cambio de contraseña, cierre de sesión
   - Notificaciones visuales de cambios de estado (opcional con Cloud Messaging)

7. **Pruebas y Optimización**
   - Unitarias: modelos, validadores, lógica de cálculo
   - Widget: formularios, cards, estados de carga/error
   - Integración: flujo completo Auth → Catálogo → Carrito → Pedido
   - Optimizar rebuilds, habilitar tree-shaking, compilar en modo release

8. **Despliegue y Mantenimiento**
   - Generar AAB/APK, IPA, Web build
   - Publicar en Firebase App Distribution (beta)
   - Configurar CI/CD (GitHub Actions/Codemagic)
   - Documentar reglas de Firestore, arquitectura y guías de despliegue
   - Monitorear con Analytics + Crashlytics

---

## ✅ Checklist de Validación Profesional (Pre-Desarrollo)
- [ ] Entorno Flutter/Dart + VS Code verificado (`flutter doctor -v`)
- [ ] Proyecto Firebase creado con Auth, Firestore y Analytics activos
- [ ] Credenciales descargadas y ubicadas correctamente (no commitadas)
- [ ] `pubspec.yaml` con dependencias resueltas y sin conflictos
- [ ] Estructura de carpetas implementada y vacía lista para módulos
- [ ] Paleta UI/UX definida y validada en prototipo
- [ ] Mapeo SQL → Firestore documentado y reglas de seguridad redactadas
- [ ] Proveedores diseñados (clases, estados, flujos)
- [ ] Navegación declarativa configurada con guards de autenticación
- [ ] Estrategia de pruebas definida por capa y entorno de emulación listo
- [ ] Plan de despliegue y monitoreo estructurado

---

📌 **Próximo paso recomendado:** Validar este plan con tu equipo o stakeholders. Una vez aprobado, se puede proceder a la implementación siguiendo el orden de módulos, asegurando que cada capa (datos → estado → UI) se pruebe antes de avanzar. ¿Deseas que profundice en algún bloque específico (reglas de seguridad, estructura de providers, flujo de checkout, o emulación) antes de comenzar la codificación?
