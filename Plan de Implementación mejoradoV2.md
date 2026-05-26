# 📦 Plan de Implementación Profesional: **Parisina. Tienda de Telas y Costura**
> *Documento técnico y de arquitectura para desarrollo multiplataforma (Flutter + Firebase). Basado en diseños Figma aprobados. Enfoque procedural, sin código fuente. Estructurado para ejecución secuencial y escalable.*

---

## 🎯 1. Alcance & Especificaciones Técnicas
- **Nombre:** Parisina. Tienda de Telas y Costura
- **Objetivo:** Plataforma e-commerce educativa para consulta, selección y compra simulada de productos de costura, divididos por categorías.
- **Plataforma Prioritaria:** Android (compilación en dispositivo físico)
- **Modo de Operación:** Simulación educativa. No se integran pasarelas reales. Flujo de checkout completo con cálculo automático de IVA (16%) y diálogo de confirmación.
- **Idioma de Interfaz:** Español (todos los textos visibles, validaciones y mensajes)
- **Gestión de Estado:** `Provider` (reactivo, inyección de dependencias, separación lógica/UI)
- **Base de Datos:** Firestore (NoSQL, tiempo real, escalable)
- **Autenticación:** Firebase Auth (Email/Contraseña) con roles: `admin` y `cliente`
- **Imágenes:** URLs públicas (GitHub Raw/Releases). Caché local para rendimiento.
- **Nota sobre "Firebase Studio":** Firebase no posee un producto oficial con ese nombre. Se refiere a la combinación de **Firebase Console** + **Firestore Web UI** + **Firebase Emulator Suite**. El plan utiliza esta stack oficial para diseño, pruebas locales y despliegue.

---

## ️ 2. Herramientas & Entorno de Desarrollo
| Categoría | Herramienta | Propósito |
|-----------|-------------|-----------|
| **SDK & CLI** | Flutter SDK (canal stable) + Dart | Motor de compilación y lenguaje base |
| | Firebase CLI (`firebase-tools`) | Emuladores, despliegue, gestión de reglas |
| **IDE & Extensiones** | VS Code / Android Studio | Entorno principal de desarrollo |
| | Extensiones: `Flutter`, `Dart`, `Firebase`, `Awesome Snippets` | Autocompletado, debugging, linting |
| **Diseño UI/UX** | Figma / Penpot | Wireframes, prototipado, sistema de diseño (diseños aprobados proporcionados) |
| **Control de Versiones** | Git + GitHub/GitLab | Historial, ramas, colaboración |
| **Pruebas & Simulación** | Android SDK + ADB | Compilación y ejecución en dispositivo físico |
| | Firebase Emulator Suite (Auth + Firestore) | Pruebas locales sin consumo de cuotas |
| **Gestión de Proyecto** | Notion / Trello / Jira | Backlog, sprints, seguimiento de tareas |

---

## 🎨 3. Diseño UI/UX (Basado en Diseños Figma Aprobados)
### 🎨 Paleta de Colores (Extraída de Diseños)
| Elemento | Hex | Uso en Diseños |
|----------|-----|----------------|
| Fondo Principal | `#FFFFFF` | Todas las pantallas, cards, contenedores base |
| AppBar | `#B71C1C` (Rojo intenso) | Encabezado superior en todas las pantallas internas |
| Logo AppBar | Blanco sobre rojo | Imagen "Parisina" centrada o izquierda en AppBar |
| Iconos AppBar | `#FFFFFF` | Carrito, perfil, menú hamburguesa sobre AppBar rojo |
| Footer | `#000000` (Negro puro) | Barra inferior fija en todas las pantallas |
| Texto Footer | `#FFFFFF` | Logo Parisina + "• 2026" centrado |
| Botones Primarios | `#1A1A1A` (Negro carbón) | "Inicio Sesión", "Comprar", "Registrarse" |
| Texto Botones | `#FFFFFF` | Contraste sobre botones negros |
| Links/Texto Secundario | `#6B6B6B` (Gris medio) | "Buscar ayuda", textos auxiliares |
| Inputs | `#E8E8E8` (Gris claro) | Fondo de campos de formulario |
| Texto Labels | `#333333` (Gris oscuro) | Títulos de campos, nombres de productos |
| Badges/Precios | `#000000` | Precios destacados en cards |
| Acento Verde | `#4CAF50` | Badges promocionales ("30% Off en línea") |

### 📐 Componentes UI (Según Diseños Figma)
#### 🏠 MainPage (Pantalla de Bienvenida)
- **Logo:** Imagen "Parisina" grande centrada en fondo blanco, con borde rojo superior
- **Texto:** "Bienvenido" (grande) + "A la mejor tienda de telas y costuras en Cd-Juarez" (subtítulo)
- **Botones:** Dos botones negros apilados: "Inicio Sesión Cliente" e "Inicio Sesión Administrador"
- **Link:** "Buscar ayuda" centrado debajo de botones

####  App Interna (Estructura Común)
- **AppBar:** Rojo fijo con:
  - Logo "Parisina" (izquierda o centrado)
  - Icono carrito (derecha)
  - Icono perfil/usuario (derecha)
  - Icono menú hamburguesa (derecha)
- **Footer:** Negro fijo con logo Parisina pequeño + "• 2026" centrado

#### 🏠 HomeScreen
- **Banner Superior:** Cuadro con borde azul/gris, texto "Bienvenido a la mejor tienda de telas y costuras !!" + botón negro "Ver Telas"
- **Banner Promocional:** Imagen rectangular con overlay, texto "30% Off en línea" + botón verde "COMPRAR"
- **Sección "PRODUCTOS":** Título centrado con flecha decorativa arriba
- **Grid de Categorías:** 6 círculos con imágenes: Hilos, Telas, Vestir, Accesorios, Máquinas, Hogar

#### 📂 Navigation Drawer (Menú Lateral)
- **Header:** "Navegación" centrado
- **Items:** Hilos, Telas, Vestir, Accesorios, Maquinas, Hogar (línea separadora), Nosotros, Sucursales, Contactanos
- **Footer:** Botón negro "Cerrar Sesión"

#### 📦 Category Screens (Vestir, Accesorios, Maquinas, etc.)
- **Header:** Título de categoría centrado con flecha arriba/abajo decorativas
- **Vestir:** Imagen hero grande + lista vertical de cards (imagen producto, nombre, precio, botón "Comprar", botón menú "...")
- **Accesorios/Maquinas:** Cards horizontales con imagen izquierda, texto derecha (nombre, precio, botón "Comprar", botón "...")

#### 📝 Registro Screen
- **Título:** "REGISTRARSE" con flecha arriba decorativa
- **Campos:** Nombre, Apellido, Correo Electronico, Contraseña, Confirmar Contraseña (todos con iconos placeholder y fondo gris)
- **Botón:** "REGISTRARSE" negro grande

#### 📞 Contactanos Screen
- **Título:** "Contactanos" con flecha atrás
- **Lista:** Iconos redes sociales (Facebook, Instagram, X, TikTok, Telegram) + handles "@Parisina Oficial Mx", etc.

####  Sucursales Screen
- **Título:** "Sucursales" con flecha atrás
- **Items:** Cards verticales con nombre sucursal, dirección, horario (verde "Abierto - Cierra a las 7 p.m."), teléfono

#### 📖 Nosotros Screen
- **Título:** "Nosotros" con flecha atrás
- **Contenido:** Imagen cuadrada + texto "Te Contamos Nuestra Historia" + párrafo descriptivo histórico

#### 🔍 Product Detail (Popup/Modal)
- **Overlay:** Cuadro gris claro flotante
- **Campos:** "Detalles Del Producto", Nombre, Precio (Pesos), Proveedor, Unidad
- **Botones:** "Comprar" negro + botón "X" para cerrar

---

## 🏗️ 4. Arquitectura & Gestión de Estado (Provider)
### Patrón: Capas + Provider
| Capa | Responsabilidad |
|------|-----------------|
| `presentation` | Pantallas, widgets UI, `ChangeNotifierProvider`, routing, temas |
| `domain` | Entidades puras (sin Firebase), contratos de repositorios, casos de uso |
| `data` | Servicios Firebase, DTOs (Data Transfer Objects), mapeo a entidades, implementación de repos |

### Proveedores Principales
- `AuthProvider`: Estado de sesión, rol (`admin`/`cliente`), perfil usuario, validación credenciales, persistencia local
- `CatalogProvider`: Carga, paginación, filtrado y tiempo real de productos por categoría. Exposición de `Stream<List<ProductEntity>>`
- `CartProvider`: Gestión local del carrito, cálculo subtotal/IVA, sincronización opcional con Firestore, limpieza post-compra
- `UIProvider`: Estado global de carga, snackbars/dialogs, tema, navegación segura (guards), control de Drawer

### Reglas de Uso de Provider
- `context.watch<T>()` solo en widgets que deben reconstruirse
- `context.read<T>()` para acciones puntuales (callbacks, botones)
- Limpieza explícita de `StreamSubscription` al descartar pantallas
- Inicialización única en `main.dart` con `MultiProvider`

---

## ️ 5. Adaptación de Tablas SQL a Firestore (NoSQL)
Firestore es orientado a documentos. Se elimina la normalización estricta, se desnormaliza para lecturas rápidas, y se usan `DocumentReference` o IDs embebidos. Los tipos se mapean a los nativos de Dart/Firestore.

### 📂 Colecciones & Estructura de Documentos
| Colección | ID Documento | Campos Principales (Tipo Firestore) | Adaptación Respecto a SQL |
|-----------|--------------|-------------------------------------|---------------------------|
| `branches` | `auto-id` | `nombre`(String), `ciudad`(String), `estado`(String), `direccion`(String), `telefono`(String), `email`(String), `horario`(Map), `coordenadas`(Map), `activa`(bool), `gerente`(String), `createdAt`(Timestamp), `updatedAt`(Timestamp) | Eliminación PK autoincremental. JSON → Map. Coordenadas → Map `{lat, lng}` |
| `users` | `Firebase Auth UID` | `nombre`(String), `apellido`(String), `email`(String), `telefono`(String), `rol`(String: `cliente`/`vendedor`/`admin`/`superadmin`), `direcciones`(Array de Maps), `puntosFidelidad`(int), `sucursalRef`(DocumentReference), `activo`(bool), `verificado`(bool), `ultimoAcceso`(Timestamp), `createdAt`(Timestamp) | `id_usuario` → UID. `password_hash` → Gestionado por Firebase Auth. FK → Reference. ENUM → String. Añadido campo `apellido` según diseño de registro |
| `telas` | `auto-id` | `nombre`(String), `tipo`(String), `composicion`(String), `anchoCm`(double), `precioMetro`(double), `colores`(Array<String>), `estampado`(bool), `descripcion`(String), `imagenUrls`(Array<String>), `stockMetros`(double), `activo`(bool), `sucursalRef`(Reference), `createdAt`(Timestamp), `updatedAt`(Timestamp) | DECIMAL → double. JSON arrays → Array. FK → Reference |
| `hilos` | `auto-id` | `nombre`(String), `marca`(String), `material`(String), `grosorNm`(double), `longitudM`(double), `colores`(Array), `usos`(Array), `precioUnidad`(double), `stock`(int), `imagenUrls`(Array), `activo`(bool), `sucursalRef`(Reference), `createdAt`(Timestamp), `updatedAt`(Timestamp) | Misma adaptación estructural |
| `vestir` | `auto-id` | `nombre`(String), `tipo`(String), `subtipo`(String), `material`(String), `tallas`(Array), `colores`(Array), `medidas`(String), `precio`(double), `unidadVenta`(String), `stock`(int), `imagenUrls`(Array), `activo`(bool), `sucursalRef`(Reference), `createdAt`(Timestamp), `updatedAt`(Timestamp) | Desnormalización lista para UI |
| `accesorios` | `auto-id` | `nombre`(String), `subcategoria`(String), `marca`(String), `descripcion`(String), `colores`(Array), `medidas`(String), `precio`(double), `unidadVenta`(String), `stock`(int), `imagenUrls`(Array), `activo`(bool), `sucursalRef`(Reference), `createdAt`(Timestamp), `updatedAt`(Timestamp) | Idem |
| `maquinas` | `auto-id` | `nombre`(String), `marca`(String), `modelo`(String), `tipo`(String), `descripcion`(String), `precioVenta`(double), `precioRentaDia`(double), `enVenta`(bool), `enRenta`(bool), `stock`(int), `numSerie`(String), `imagenUrls`(Array), `activo`(bool), `sucursalRef`(Reference), `createdAt`(Timestamp), `updatedAt`(Timestamp) | Idem |
| `hogar` | `auto-id` | `nombre`(String), `tipo`(String), `material`(String), `medidas`(String), `colores`(Array), `estampado`(bool), `precio`(double), `stock`(int), `imagenUrls`(Array), `activo`(bool), `sucursalRef`(Reference), `createdAt`(Timestamp), `updatedAt`(Timestamp) | Idem |
| `carts` | `UID_usuario` | `items`(Array de Maps: `{productId, coleccion, nombre, precio, cantidad, imagenUrl}`), `subtotal`(double), `estado`(String: `activo`/`en_proceso`/`pagado`/`abandonado`), `sucursalRef`(Reference), `updatedAt`(Timestamp), `createdAt`(Timestamp) | PK → UID. FK → Reference. Items serializados para sync real-time |
| `orders` | `auto-id` | `folio`(String), `userRef`(Reference), `sucursalRef`(Reference), `items`(Array de Maps), `subtotal`(double), `descuento`(double), `total`(double), `metodoPago`(String), `estado`(String), `entrega`(Map), `notas`(String), `createdAt`(Timestamp), `updatedAt`(Timestamp) | Snapshots de precios para auditoría. Folio único generado en cliente |
| `returns` | `auto-id` | `orderRef`(Reference), `userRef`(Reference), `sucursalRef`(Reference), `items`(Array), `motivo`(String), `descripcion`(String), `estado`(String), `tipoResolucion`(String), `montoReembolso`(double), `evidenciaUrls`(Array), `atendidoPor`(Reference), `createdAt`(Timestamp), `updatedAt`(Timestamp) | FKs → References. Estado como string controlado por reglas |
| `inventory` | `productoRef_sucursalRef` | `cantidad`(double), `unidad`(String), `umbralMinimo`(double), `ultimaEntrada`(Timestamp), `ultimaSalida`(Timestamp), `alertaActiva`(bool), `updatedAt`(Timestamp) | Se mantiene como colección separada para control multi-sucursal sin duplicar productos. ID compuesto para unicidad |

### 🔒 Reglas de Seguridad (Firestore)
- Lectura pública solo para documentos con `activo == true`
- Escritura restringida a `admin`/`superadmin` o dueño del recurso (`request.auth.uid == resource.data.userRef.id`)
- `carts`: solo lectura/escritura por `uid` propietario
- `orders`: escritura solo por usuario autenticado, lectura por usuario + admin
- Validación de tipos y rangos en reglas (`request.resource.data.matches(...)`)

### 📊 Índices Compuestos (Requeridos en Firestore Console)
- `telas`, `hilos`, `vestir`, `accesorios`, `maquinas`, `hogar`: `(activo ASC, precio ASC)` + `(activo ASC, createdAt DESC)`
- `orders`: `(userRef ASC, estado ASC)` + `(createdAt DESC)`
- `inventory`: `(sucursalRef ASC, alertaActiva ASC)`

---

## 📦 6. Dependencias (`pubspec.yaml`)
```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^3.6.0
  firebase_auth: ^5.3.1
  cloud_firestore: ^5.4.4
  provider: ^6.1.2
  go_router: ^14.2.1
  cached_network_image: ^3.4.1
  intl: ^0.20.1
  flutter_svg: ^2.0.10+1
  fluttertoast: ^9.0.0
  shared_preferences: ^2.3.3
  uuid: ^4.5.1
  equatable: ^2.0.5

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
  build_runner: ^2.4.13
  json_serializable: ^6.8.0
  mocktail: ^1.0.4
```
*Notas:* Versiones alineadas al canal `stable` actual. `json_serializable` + `build_runner` para generación de código de DTOs. `uuid` para folios de pedido simulados. `equatable` para comparaciones limpias en entities.

---

##  7. Estructura del Proyecto (Árbol Completo)
```
lib/
├── core/
│   ├── constants/
│   │   ├── colors.dart
│   │   ├── routes.dart
│   │   ├── strings.dart
│   │   └── firestore_collections.dart
│   ├── theme/
│   │   ├── app_theme.dart
│   │   └── text_styles.dart
│   ├── utils/
│   │   ├── formatters.dart
│   │   ├── validators.dart
│   │   └── price_calculator.dart
│   ── widgets/
│       ├── custom_appbar.dart
│       ├── footer_bar.dart
│       ├── product_card.dart
│       ├── loading_overlay.dart
│       └── error_state.dart
├── data/
│   ├── models/
│   │   ├── user_dto.dart
│   │   ├── product_dto.dart
│   │   ├── cart_dto.dart
│   │   ├── order_dto.dart
│   │   └── branch_dto.dart
│   ├── repositories/
│   │   ├── auth_repository_interface.dart
│   │   ├── product_repository_interface.dart
│   │   ├── cart_repository_interface.dart
│   │   └── order_repository_interface.dart
│   └── services/
│       ├── firebase_auth_service.dart
│       ├── firestore_service.dart
│       └── image_cache_service.dart
├── domain/
│   ├── entities/
│   │   ├── user_entity.dart
│   │   ├── product_entity.dart
│   │   ├── cart_item_entity.dart
│   │   ├── order_entity.dart
│   │   └── branch_entity.dart
│   ├── repositories/
│   │   ├── auth_repository.dart
│   │   ├── catalog_repository.dart
│   │   ├── cart_repository.dart
│   │   └── order_repository.dart
│   └── usecases/
│       ├── calculate_checkout.dart
│       └── generate_order_folio.dart
├── presentation/
│   ├── providers/
│   │   ├── auth_provider.dart
│   │   ├── catalog_provider.dart
│   │   ├── cart_provider.dart
│   │   └── ui_provider.dart
│   ├── screens/
│   │   ├── main_page/
│   │   │   └── main_page_screen.dart
│   │   ├── auth/
│   │   │   ├── login_cliente_screen.dart
│   │   │   ├── login_admin_screen.dart
│   │   │   ├── register_screen.dart
│   │   │   └── reset_password_screen.dart
│   │   ├── home/
│   │   │   ├── home_screen.dart
│   │   │   └── category_grid.dart
│   │   ├── catalog/
│   │   │   ├── hilos_screen.dart
│   │   │   ├── telas_screen.dart
│   │   │   ├── vestir_screen.dart
│   │   │   ├── accesorios_screen.dart
│   │   │   ├── maquinas_screen.dart
│   │   │   └── hogar_screen.dart
│   │   ├── product/
│   │   │   └── product_detail_modal.dart
│   │   ├── cart/
│   │   │   └── cart_screen.dart
│   │   ├── checkout/
│   │   │   ├── checkout_simulation_screen.dart
│   │   │   └── success_dialog.dart
│   │   ├── profile/
│   │   │   └── profile_screen.dart
│   │   └── info/
│   │       ├── nosotros_screen.dart
│   │       ├── sucursales_screen.dart
│   │       ├── contactanos_screen.dart
│   │       └── ayuda_screen.dart
│   └── widgets/
│       ├── navigation_drawer.dart
│       ├── category_filter_bar.dart
│       ├── payment_method_buttons.dart
│       └── order_summary_widget.dart
└── main.dart
```

---

## 🔄 8. Flujo de Implementación Paso a Paso

### ✅ Fase 1: Configuración Inicial & Firebase
1. Instalar Flutter SDK, Dart, Android SDK y habilitar modo desarrollador en dispositivo físico.
2. Crear proyecto Flutter: `flutter create parisina_app --org com.parisina`.
3. Configurar Firebase Console: crear proyecto `parisina-telas`, registrar app Android con SHA-1, descargar `google-services.json`.
4. Instalar Firebase CLI, iniciar emuladores (`firebase init emulators`) para Auth y Firestore.
5. Configurar `pubspec.yaml` con dependencias listadas, ejecutar `flutter pub get`.
6. Importar assets del diseño Figma: logo Parisina, iconos de redes sociales, imágenes de categorías y productos.

### ✅ Fase 2: Diseño UI & Sistema de Temas (Basado en Figma)
1. Crear archivo `colors.dart` con paleta exacta extraída de diseños (rojo `#B71C1C`, negro footer, grises inputs, etc.).
2. Implementar `AppTheme` con `ThemeData`:
   - `AppBarTheme`: fondo rojo, iconos blancos, logo centrado
   - `Scaffold`: fondo blanco
   - `Footer`: widget fijo negro con logo y año
3. Construir `CustomAppBar` según diseño: logo Parisina + iconos carrito/perfil/menú.
4. Implementar `FooterBar` fijo en todas las pantallas internas.
5. Diseñar `NavigationDrawer` con estructura exacta del Figma (items + botón cerrar sesión).
6. Validar contraste, espaciado, tamaños de fuente y alineación con diseños Figma en emulador y dispositivo físico.

### ✅ Fase 3: MainPage & Autenticación
1. Crear `MainPageScreen`:
   - Logo grande + texto bienvenida + dos botones negros + link "Buscar ayuda"
   - Navegación: botón cliente → LoginCliente, botón admin → LoginAdmin, link → AyudaScreen
2. Implementar `FirebaseAuthService` con métodos: `register`, `login`, `logout`, `resetPassword`, `getCurrentUser`.
3. Crear `AuthProvider` con `ChangeNotifier`, exponer `isAuthenticated`, `userRole`, `isLoading`, `errorMessage`.
4. Desarrollar `LoginClienteScreen` y `LoginAdminScreen` con validaciones en tiempo real.
5. Implementar `RegisterScreen` exacto al Figma: campos Nombre, Apellido, Correo, Contraseña, Confirmar Contraseña, botón REGISTRARSE.
6. Implementar guardias de rutas: MainPage → Auth → Home según rol.

### ✅ Fase 4: Estructura Firestore & Reglas de Seguridad
1. Crear colecciones en Firestore Console según esquema adaptado (Sección 5).
2. Subir datos de prueba manualmente o vía script de seeding (usar imágenes de GitHub como URLs).
3. Configurar reglas de seguridad (`firestore.rules`) según roles y visibilidad.
4. Crear índices compuestos requeridos.
5. Probar reglas con emuladores antes de integrar en app.

### ✅ Fase 5: HomeScreen & Catálogo
1. Implementar `HomeScreen`:
   - Banner superior con texto + botón "Ver Telas"
   - Banner promocional con imagen + "30% Off en línea" + botón verde "COMPRAR"
   - Sección "PRODUCTOS" con grid de 6 categorías circulares
2. Implementar `CatalogProvider`: inicialización de streams por colección, paginación, filtros.
3. Crear `FirestoreService` con métodos genéricos: `getStreamCollection`, `getDocument`, `updateDocument`, `listenChanges`.
4. Construir pantallas por categoría (`hilos_screen.dart`, `telas_screen.dart`, etc.):
   - `VestirScreen`: imagen hero + lista vertical de cards
   - `AccesoriosScreen`/`MaquinasScreen`: cards horizontales con imagen, nombre, precio, botón "Comprar", botón "..."
5. Implementar `ProductCard` según diseño exacto de Figma.
6. Validar sincronización en tiempo real: cambios en Firestore reflejados instantáneamente en UI.

### ✅ Fase 6: Product Detail & Carrito
1. Implementar `ProductDetailModal`:
   - Popup gris claro flotante con campos: Nombre, Precio, Proveedor, Unidad
   - Botones "Comprar" y "X" para cerrar
2. Implementar `CartProvider`: métodos `addItem`, `removeItem`, `updateQuantity`, `clearCart`, `calculateSubtotal`, `calculateTotal` (subtotal * 1.16).
3. Diseñar `CartScreen` con lista editable, resumen financiero, botón "Ir a Pagar".
4. Validar que badge del carrito en AppBar se actualice dinámicamente.

### ✅ Fase 7: Checkout Simulado
1. Crear `CheckoutSimulationScreen`: formulario de dirección simulada, selección visual de método de pago (MercadoPago/PayPal/Efectivo).
2. Al confirmar: mostrar `SuccessDialog`, guardar orden en Firestore con estado `simulado/pagado`, vaciar carrito local.
3. Validar que `Order` se cree con snapshot de precios, folio único y referencia a usuario.

### ✅ Fase 8: Pantallas Informativas
1. `NosotrosScreen`: imagen + texto histórico exacto al Figma.
2. `SucursalesScreen`: listado de cards con nombre, dirección, horario (verde "Abierto"), teléfono.
3. `ContactanosScreen`: iconos redes sociales + handles exactos al Figma.
4. `AyudaScreen`: contenido de soporte y FAQ.
5. Todas accesibles vía Drawer o navegación interna.

### ✅ Fase 9: Perfil, Admin & Rutas Secundarias
1. `ProfileScreen`: mostrar datos usuario, historial de órdenes simuladas, puntos de fidelidad, botón cerrar sesión.
2. Panel Admin (acceso restringido): vista simplificada para modificar stock, precios, activar/desactivar productos. Cambios reflejados en tiempo real vía streams.
3. Implementar `UIProvider` para manejo global de loaders, snackbars y navegación segura.

### ✅ Fase 10: Pruebas & Optimización Android
1. Pruebas unitarias: cálculos de precio, validaciones, mapeo DTO→Entity.
2. Pruebas de integración: flujo MainPage → Auth → Home → Catálogo → Carrito → Checkout → Orden guardada.
3. Pruebas en dispositivo físico: conexión USB, `flutter run -d <device_id>`, rotación, modo avión (persistencia offline), rendimiento de scroll.
4. Optimizar: `const` widgets, `listen: false` en callbacks, lazy loading, compresión de assets, limpieza de streams.
5. Ejecutar `flutter analyze` y `dart format .` para cumplir estándares.

### ✅ Fase 11: Compilación & Despliegue Simulado
1. Configurar `android/app/build.gradle` (minSdk 21, multidex si aplica, permisos internet).
2. Generar build debug para pruebas finales: `flutter build apk --debug`.
3. Instalar APK en dispositivo físico, validar flujo completo.
4. Preparar estructura para release futuro: firmas, iconos adaptativos, políticas de privacidad.
5. Documentar manual de uso, guía de administración Firestore y notas de simulación.

---

## ✅ 9. Validación Final & Notas Técnicas
- [ ] Entorno Flutter + Firebase CLI + Emuladores operativo
- [ ] Paleta de colores implementada exactamente según diseños Figma
- [ ] MainPage con logo, botones cliente/admin y link ayuda
- [ ] AppBar rojo con logo + iconos carrito/perfil/menú en todas las pantallas internas
- [ ] Footer negro con logo + "• 2026" en todas las pantallas internas
- [ ] Navigation Drawer con estructura exacta del Figma
- [ ] Autenticación con roles (admin/cliente) funcional y persistente
- [ ] Firestore con colecciones adaptadas, reglas de seguridad activas, índices creados
- [ ] Providers conectados sin fugas de memoria ni rebuilds innecesarios
- [ ] HomeScreen con banners, grid de categorías circulares
- [ ] Pantallas de categoría con cards exactas al diseño (Vestir hero + lista, Accesorios/Maquinas horizontales)
- [ ] ProductDetail como modal popup según diseño
- [ ] Carrito con cálculo automático IVA 16%, checkout simulado, diálogo de éxito
- [ ] Pantallas Nosotros, Sucursales, Contactanos con contenido exacto al Figma
- [ ] RegisterScreen con campos Nombre, Apellido, Correo, Contraseña, Confirmar
- [ ] Pruebas en Android físico completadas, flujo end-to-end validado
- [ ] Código formateado, linting sin errores, estructura modular mantenida

---

## 📝 Nota sobre Adaptaciones de Base de Datos (SQL → Firestore)
| Aspecto SQL | Adaptación Firestore | Justificación |
|-------------|----------------------|---------------|
| `INT AUTO_INCREMENT` PK | `auto-id` de Firestore o `Auth UID` | Elimina conflictos de concurrencia, escalabilidad horizontal |
| `FOREIGN KEY` | `DocumentReference` o `String ID` | Firestore no soporta FK nativas; se usa referencia explícita |
| `JSON` campos | `Map` o `List` nativos | Deserialización directa en Dart, sin parseo manual |
| `DECIMAL(10,2)` | `double` | Compatible con precios y métricas; se formatea en UI con `intl` |
| `ENUM` | `String` con validación en reglas/uso | Más flexible para evolución del esquema |
| Tabla `inventario` separada | Mantener colección `inventory` | Evita duplicación masiva de productos por sucursal; permite alertas centralizadas |
| `password_hash` | Gestionado por Firebase Auth | Seguridad nativa, sin almacenamiento local de credenciales |
| `carrito.items` como JSON | `Array<Map>` en documento por usuario | Sincronización en tiempo real, edición granular, persistencia offline |
| Campo `apellido` en usuarios | Añadido según diseño de Registro | El formulario Figma solicita Nombre y Apellido por separado |

> **Recomendación de Mantenimiento:** Usar Firebase Emulator Suite para todas las pruebas de escritura/lectura antes de tocar producción. Mantener un script de seeding para recrear datos de prueba tras reseteos. Documentar cambios de esquema en `FIRESTORE_MIGRATION.md`. Asegurar que todas las imágenes de productos estén alojadas en URLs públicas estables (GitHub Raw/Releases) y usar `cached_network_image` para evitar recargas innecesarias.

---
📌 **Siguiente paso estratégico:** Validar este plan actualizado con los diseños Figma, aprobar estructura de carpetas y esquema Firestore, y proceder a la generación de la base del proyecto con `flutter create`, integración de Firebase y configuración de `main.dart`. ¿Deseas que profundice en el diseño de las reglas de seguridad de Firestore o en el flujo exacto de `Provider` para el carrito antes de iniciar la codificación?


---

# Prompt 

Vamos a Mejorar y hacer Profesional nuestro Plan de Implementación. Actúa como un creador de software, diseñador de aplicaciones móviles multiplataforma.  Proporcionandome paso a paso cada requerimiento sin evitar detalles. Nota: NO me proporciones el código todavía.  

Quiero crear una Aplicación multiplataforma Flutter Dart y Firebase, utilizando la herramienta Firebase Studio ( desde el Navegador de Google). Qué herramientas se requieren, ui, ux, dependencias, login autenticación usuario password, base de datos Firestore (Importante), privider, dependencias en pubspec.yaml. Lenguaje Dart, Flutter; para el proyecto en Firebase Studio, Mobile, flutter. 

El proyecto será: una Tienda de Telas y Costuras con el nombre "Parisina". El objetivo de esta app es que las personas que accedan al Sitio (Usuarios), puedan comprar los diversos productos que ofrece nuestra tienda, dividido por categorías.

La paleta de colores que utilizaremos será: Fondo de página (Blanco), Appbar (Rojo), Iconos AppBar (Blancos), Footer (Negro), Letras fuente Footer (Blanco); Contenido dentro del cuerpo (Subtonos Grises, Amarillos, Negros y Rojo, con detalles Blancos en caso de ser necesario). Como parte de ser diseñador, te encargo que escojas subtonos visualmente atractivos y elegantes, para una página profesional y seria. 

Habrá: Inicio de sesión (Administrador y Usuario/Comprador) y Registro, Ayuda, Inicio, Nav dentro de Appbar (Con las siguientes páginas a seleccionar: Hilos, Telas, Vestir, Accesorios, Maquinas y Hogar, además, Nosotros, Sucursales y Nosotros) perfil de usuario, por ultimo, carrito. 

El Entorno de trabajo que usaré será "Firebase Studio" vinculada con una Base de datos NO relacional en "Firebase Console", me proporcionarán la lista de dependencias  para el pubsyec.yaml como ayuda para la generación de este proyecto, te dejaré las tablas que planeo usar para este proyecto con sus campos-tipo y descripción. T

Además, vas a generar un árbol de la estructura del proyecto con todos los archivos para saber cómo quedará estructurado. Importante proporcionar la información lo más completa y organizada posible. Sin evitar detalles IMPORTANTES. 

Aquí te van las tablas (que adaparás a Firestore Console). Las opciones para el tipo de variable dentro de las tablas son: String, int64, double, boolean, map, array, reference, null y Timestamp.
CREATE DATABASE IF NOT EXISTS bdparisina CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE bdparisina;

SET FOREIGN_KEY_CHECKS=0;

-- =========================================
-- 1. SUCURSALES
-- =========================================
CREATE TABLE sucursal (
    id_sucursal INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100),
    estado VARCHAR(50),
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    email VARCHAR(120) UNIQUE,
    horario JSON COMMENT 'Objeto con horarios por día: {lunes:{apertura, cierre}, ...}',
    coordenadas JSON COMMENT 'GeoJSON: {type:"Point", coordinates:[lng, lat]}',
    activa BOOLEAN DEFAULT TRUE,
    gerente VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- =========================================
-- 2. USUARIOS
-- =========================================
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    password_hash VARCHAR(255) NOT NULL,
    rol ENUM('cliente', 'vendedor', 'admin', 'superadmin') DEFAULT 'cliente',
    direcciones JSON COMMENT 'Array de objetos: [{calle, colonia, ciudad, cp, estado, es_principal}]',
    puntos_fidelidad INT DEFAULT 0,
    sucursal_id INT,
    activo BOOLEAN DEFAULT TRUE,
    verificado BOOLEAN DEFAULT FALSE,
    ultimo_acceso TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (sucursal_id) REFERENCES sucursal(id_sucursal) ON DELETE SET NULL,
    INDEX idx_usuario_email (email),
    INDEX idx_usuario_rol (rol)
) ENGINE=InnoDB;

-- =========================================
-- 3. TELAS
-- =========================================
CREATE TABLE tela (
    id_tela INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    tipo VARCHAR(50),
    composicion VARCHAR(255),
    ancho_cm DECIMAL(5,2),
    precio_metro DECIMAL(10,2) NOT NULL,
    colores JSON COMMENT 'Array de strings',
    estampado BOOLEAN DEFAULT FALSE,
    descripcion TEXT,
    imagen_urls JSON COMMENT 'Array de strings',
    stock_metros DECIMAL(10,2) DEFAULT 0,
    activo BOOLEAN DEFAULT TRUE,
    sucursal_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (sucursal_id) REFERENCES sucursal(id_sucursal) ON DELETE CASCADE,
    INDEX idx_tela_sucursal (sucursal_id),
    INDEX idx_tela_activo (activo)
) ENGINE=InnoDB;

-- =========================================
-- 4. HILOS
-- =========================================
CREATE TABLE hilo (
    id_hilo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    marca VARCHAR(100),
    material VARCHAR(50),
    grosor_nm DECIMAL(5,2),
    longitud_m DECIMAL(8,2),
    colores JSON COMMENT 'Array de strings',
    usos JSON COMMENT 'Array de strings',
    precio_unidad DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    imagen_urls JSON COMMENT 'Array de strings',
    activo BOOLEAN DEFAULT TRUE,
    sucursal_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (sucursal_id) REFERENCES sucursal(id_sucursal) ON DELETE CASCADE,
    INDEX idx_hilo_sucursal (sucursal_id),
    INDEX idx_hilo_activo (activo)
) ENGINE=InnoDB;

-- =========================================
-- 5. VESTIR
-- =========================================
CREATE TABLE vestir (
    id_vestir INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    subtipo VARCHAR(50),
    material VARCHAR(50),
    tallas JSON COMMENT 'Array de strings',
    colores JSON COMMENT 'Array de strings',
    medidas VARCHAR(50),
    precio DECIMAL(10,2) NOT NULL,
    unidad_venta VARCHAR(30),
    stock INT DEFAULT 0,
    imagen_urls JSON COMMENT 'Array de strings',
    activo BOOLEAN DEFAULT TRUE,
    sucursal_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (sucursal_id) REFERENCES sucursal(id_sucursal) ON DELETE CASCADE,
    INDEX idx_vestir_sucursal (sucursal_id),
    INDEX idx_vestir_activo (activo)
) ENGINE=InnoDB;

-- =========================================
-- 6. ACCESORIOS
-- =========================================
CREATE TABLE accesorio (
    id_accesorio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    subcategoria VARCHAR(50),
    marca VARCHAR(100),
    descripcion TEXT,
    colores JSON COMMENT 'Array de strings',
    medidas VARCHAR(50),
    precio DECIMAL(10,2) NOT NULL,
    unidad_venta VARCHAR(30),
    stock INT DEFAULT 0,
    imagen_urls JSON COMMENT 'Array de strings',
    activo BOOLEAN DEFAULT TRUE,
    sucursal_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (sucursal_id) REFERENCES sucursal(id_sucursal) ON DELETE CASCADE,
    INDEX idx_accesorio_sucursal (sucursal_id),
    INDEX idx_accesorio_activo (activo)
) ENGINE=InnoDB;

-- =========================================
-- 7. MÁQUINAS
-- =========================================
CREATE TABLE maquina (
    id_maquina INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    marca VARCHAR(100),
    modelo VARCHAR(100),
    tipo VARCHAR(50),
    descripcion TEXT,
    precio_venta DECIMAL(10,2),
    precio_renta_dia DECIMAL(10,2),
    en_venta BOOLEAN DEFAULT FALSE,
    en_renta BOOLEAN DEFAULT FALSE,
    stock INT DEFAULT 0,
    num_serie VARCHAR(50) UNIQUE,
    imagen_urls JSON COMMENT 'Array de strings',
    activo BOOLEAN DEFAULT TRUE,
    sucursal_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (sucursal_id) REFERENCES sucursal(id_sucursal) ON DELETE CASCADE,
    INDEX idx_maquina_sucursal (sucursal_id),
    INDEX idx_maquina_activo (activo)
) ENGINE=InnoDB;

-- =========================================
-- 8. HOGAR
-- =========================================
CREATE TABLE hogar (
    id_hogar INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    material VARCHAR(100),
    medidas VARCHAR(50),
    colores JSON COMMENT 'Array de strings',
    estampado BOOLEAN DEFAULT FALSE,
    precio DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    imagen_urls JSON COMMENT 'Array de strings',
    activo BOOLEAN DEFAULT TRUE,
    sucursal_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (sucursal_id) REFERENCES sucursal(id_sucursal) ON DELETE CASCADE,
    INDEX idx_hogar_sucursal (sucursal_id),
    INDEX idx_hogar_activo (activo)
) ENGINE=InnoDB;

-- =========================================
-- 9. CARRITO
-- =========================================
CREATE TABLE carrito (
    id_carrito INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    items JSON COMMENT 'Array de objetos: [{producto_id, coleccion_origen, nombre_snap, precio_snap, cantidad, imagen_url}]',
    subtotal DECIMAL(10,2) DEFAULT 0.00,
    estado ENUM('activo', 'en_proceso_pago', 'pagado', 'abandonado') DEFAULT 'activo',
    sucursal_id INT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (sucursal_id) REFERENCES sucursal(id_sucursal) ON DELETE SET NULL,
    INDEX idx_carrito_usuario (usuario_id),
    INDEX idx_carrito_estado (estado)
) ENGINE=InnoDB;

-- =========================================
-- 10. PEDIDOS
-- =========================================
CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    folio VARCHAR(50) UNIQUE NOT NULL,
    usuario_id INT NOT NULL,
    sucursal_id INT NOT NULL,
    items JSON COMMENT 'Snapshot de compra: [{producto_id, coleccion_origen, nombre_snap, precio_snap, cantidad}]',
    subtotal DECIMAL(10,2) NOT NULL,
    descuento DECIMAL(10,2) DEFAULT 0.00,
    total DECIMAL(10,2) NOT NULL,
    metodo_pago ENUM('efectivo', 'tarjeta', 'transferencia', 'puntos'),
    estado ENUM('pendiente', 'confirmado', 'en_preparacion', 'listo', 'entregado', 'cancelado') DEFAULT 'pendiente',
    entrega JSON COMMENT 'Objeto: {tipo, direccion, fecha_estimada, guia}',
    notas TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (sucursal_id) REFERENCES sucursal(id_sucursal) ON DELETE CASCADE,
    INDEX idx_pedido_folio (folio),
    INDEX idx_pedido_usuario (usuario_id),
    INDEX idx_pedido_estado (estado)
) ENGINE=InnoDB;

-- =========================================
-- 11. DEVOLUCIONES
-- =========================================
CREATE TABLE devolucion (
    id_devolucion INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    usuario_id INT NOT NULL,
    sucursal_id INT,
    items JSON COMMENT 'Array: [{producto_id, coleccion_origen, cantidad, precio_pagado}]',
    motivo VARCHAR(100),
    descripcion TEXT,
    estado ENUM('pendiente', 'en_revision', 'aprobada', 'rechazada', 'reembolsada') DEFAULT 'pendiente',
    tipo_resolucion VARCHAR(50),
    monto_reembolso DECIMAL(10,2),
    evidencia_urls JSON COMMENT 'Array de strings',
    atendido_por INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (pedido_id) REFERENCES pedido(id_pedido) ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (sucursal_id) REFERENCES sucursal(id_sucursal) ON DELETE SET NULL,
    FOREIGN KEY (atendido_por) REFERENCES usuario(id_usuario) ON DELETE SET NULL,
    INDEX idx_devolucion_pedido (pedido_id),
    INDEX idx_devolucion_estado (estado)
) ENGINE=InnoDB;

-- =========================================
-- 12. INVENTARIO
-- =========================================
CREATE TABLE inventario (
    id_inventario INT AUTO_INCREMENT PRIMARY KEY,
    producto_id INT NOT NULL COMMENT 'ID del producto en su tabla correspondiente (tela, hilo, etc.)',
    coleccion_origen ENUM('telas', 'hilos', 'vestir', 'accesorios', 'maquinas', 'hogar') NOT NULL COMMENT 'Tabla de referencia polimórfica',
    sucursal_id INT NOT NULL,
    cantidad DECIMAL(10,2) NOT NULL DEFAULT 0,
    unidad VARCHAR(30),
    umbral_minimo DECIMAL(10,2) DEFAULT 0,
    ultima_entrada DATE,
    ultima_salida DATE,
    alerta_activa BOOLEAN DEFAULT FALSE,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (sucursal_id) REFERENCES sucursal(id_sucursal) ON DELETE CASCADE,
    UNIQUE KEY uk_inventario_prod_suc (producto_id, coleccion_origen, sucursal_id),
    INDEX idx_inventario_alerta (alerta_activa)
) ENGINE=InnoDB;

SET FOREIGN_KEY_CHECKS=1;

Envía en una sola respuesta completa sin quitar información, unificiando toda la información que te proporcioné y las mejoras de redacción y especificación que te pedí. Necesito el prompt mejorado.  Por último, ten en cuenta lo suguiente:

Plataforma: Android (Prioridad), compilación en dispositivo físico.
Modo: Simulación (E-commerce educativo). No se procesan pagos reales, pero se debe simular el flujo completo. Las tablas Si deberán funcionar y conectar con la base de datos, para que cuando el Admin modifique alguna tabla se actualice correctamente. 
Idioma de interfaz página visible: Español.

REQUERIMIENTOS TÉCNICOS:
Stack: Flutter (Dart) + Firebase (Auth + Firestore).
Imágenes: Las imágenes de los productos de las tablas se cargarán vía URLs públicas (GitHub). 
Pagos: Simulación. Calcular Subtotal + IVA (16%). Opciones visuales de MercadoPago/PayPal, pero al confirmar, mostrar un Dialog de "Compra Exitosa".

En caso de ser necesario modificar las tablas, hacerlo y notificar los cambios o actualización. 
