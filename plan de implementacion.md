# 📦 Plan de Implementación: **Parisina. Tienda de Telas y Costura**
> *Documento de arquitectura y flujo de desarrollo multiplataforma (Flutter + Firebase). Sin código, solo procedimiento estructurado.*

---

## 🧰 Fase 1: Preparación del Entorno y Herramientas
**Objetivo:** Configurar el ecosistema de desarrollo y control de versiones.

1. **Instalar SDKs y CLI**
   - Flutter SDK + Dart (última versión estable).
   - Firebase CLI (`npm install -g firebase-tools`) para emuladores y despliegue.
   - Git + cuenta en GitHub/GitLab.

2. **Entorno de Desarrollo (IDE)**
   - VS Code o Android Studio con extensiones oficiales: `Flutter`, `Dart`, `Firebase`, `Awesome Flutter Snippets`.
   - Configurar emuladores/simuladores (Android, iOS, Web).

3. **Herramientas de Diseño y Gestión**
   - Figma / Penpot para UI/UX.
   - Notion / Jira / Trello para seguimiento de tareas.
   - Postman / Insomnia (para probar endpoints si se añaden Cloud Functions).

4. **Nota sobre "Firebase Studio"**
   - Firebase no cuenta con una herramienta llamada oficialmente *Firebase Studio*. Se utiliza **Firebase Console** + **Firebase Emulator Suite** + **Firebase Local CLI**. El plan asume este stack oficial.

---

## 🎨 Fase 2: Diseño UI/UX
**Objetivo:** Definir la experiencia visual y de navegación antes de codificar.

1. **Investigación y Arquitectura de Información**
   - Definir perfiles de usuario: clientes finales, costureras, administradores.
   - Mapear flujos: exploración de telas, detalle de producto, carrito, checkout, historial de pedidos, perfil.

2. **Wireframes (Baja Fidelidad)**
   - Estructura de pantallas: Splash, Login/Registro, Home (categorías, destacados), Catálogo, Detalle de Tela, Carrito, Perfil, Panel Admin (opcional).

3. **Sistema de Diseño (Alta Fidelidad)**
   - Paleta de colores inspirada en textil/costura (tonos neutros, acentos cálidos).
   - Tipografía legible y escalable.
   - Componentes reutilizables: `AppBar`, `BottomNav`, `ProductCard`, `FilterSheet`, `ButtonPrimary`, `LoadingSkeleton`.
   - Diseño responsivo/adaptativo (mobile first, luego tablet/web).

4. **Entregables**
   - Prototipo interactivo en Figma.
   - Guía de estilos exportada (assets, iconos, spacing, tokens).

---

## 🏗️ Fase 3: Arquitectura y Estructura del Proyecto
**Objetivo:** Establecer una base escalable y mantenible.

1. **Patrón Arquitectónico**
   - Capas: `presentation` (UI + Providers), `domain` (entidades + contratos de repositorios), `data` (implementaciones Firebase + modelos).
   - Separación estricta de responsabilidades.

2. **Estructura de Carpetas**
   ```
   lib/
   ├── core/ (constantes, temas, utilidades, enrutador)
   ├── data/ (servicios firebase, modelos, repositorios)
   ├── domain/ (entidades, contratos, casos de uso)
   ├── presentation/ (pantallas, widgets, providers)
   └── main.dart
   ```

3. **Estrategia de Navegación**
   - Definir rutas nombradas o declarativas.
   - Implementar guardias de autenticación (rutas protegidas vs públicas).

---

## 📦 Fase 4: Dependencias (`pubspec.yaml`)
**Objetivo:** Seleccionar paquetes estables y compatibles.

1. **Core & Firebase**
   - `firebase_core`
   - `firebase_auth`
   - `cloud_firestore`
   - `firebase_storage` (si se requieren imágenes de telas optimizadas)

2. **Gestión de Estado**
   - `provider` (gestión reactiva, inyección de dependencias)

3. **UI & Utilidades**
   - `go_router` o `auto_route` (navegación tipo declarativa)
   - `cached_network_image` (carga de imágenes)
   - `flutter_svg` (iconografía)
   - `intl` (formateo de fechas, monedas)
   - `shared_preferences` o `flutter_secure_storage` (tokens, preferencias locales)
   - `fluttertoast` o `another_flushbar` (feedback visual)

4. **Desarrollo & Testing**
   - `flutter_lints`
   - `build_runner`, `freezed` / `json_serializable` (si se genera código para modelos)
   - `flutter_test`, `mockito`

5. **Entregable**
   - Lista definitiva de dependencias en `pubspec.yaml` con restricciones de versión compatibles con el canal `stable`.

---

## 🔐 Fase 5: Autenticación (Email/Password)
**Objetivo:** Implementar flujo seguro de registro, login y recuperación.

1. **Configuración en Firebase Console**
   - Crear proyecto `parisina-telas`.
   - Registrar apps (Android, iOS, Web) con SHA-1/Bundle ID/Package Name.
   - Habilitar método `Email/Password` en Authentication.
   - Configurar verificación por correo (opcional pero recomendado).

2. **Flujo de Autenticación**
   - Registro: validar formato email, fuerza de contraseña, crear usuario en Firebase → guardar perfil en Firestore.
   - Login: verificar credenciales → manejar sesiones persistentes → redirigir a Home.
   - Recuperación: flujo de reseteo por email con enlace seguro.
   - Cierre de sesión: limpiar estado local y proveedor.

3. **Integración con Provider**
   - Crear `AuthProvider` que exponga: `isAuthenticated`, `currentUser`, `isLoading`, `errorMessage`.
   - Suscribir listeners a cambios de estado de autenticación (`authStateChanges()`).

4. **Seguridad UX**
   - Estados de carga, validaciones en tiempo real, manejo de errores (contraseña incorrecta, email duplicado, conexión caída).

---

## 🗃️ Fase 6: Base de Datos Firestore
**Objetivo:** Diseñar esquema escalable, seguro y optimizado para consultas.

1. **Estructura de Colecciones**
   - `users`: `{uid, email, displayName, role, createdAt, favorites[]}`
   - `categories`: `{id, name, slug, imageUrl, description}`
   - `products` (telas/insumos): `{id, name, categoryId, pricePerMeter, stock, colors[], materials[], images[], createdAt, isActive}`
   - `orders`: `{id, userId, items[], total, status, createdAt, shippingAddress}`
   - `reviews` (opcional): `{id, productId, userId, rating, comment, createdAt}`

2. **Reglas de Seguridad**
   - Lectura pública para catálogo activo.
   - Escritura restringida por rol (`admin` o `owner`).
   - Acceso a datos de usuario solo por el propio `uid`.

3. **Optimización de Consultas**
   - Definir índices compuestos para filtros (categoría + precio + stock).
   - Paginación con `startAfterDocument`.
   - Activar persistencia offline para experiencias sin conexión.

4. **Mapeo a Repositorios**
   - Crear interfaz de contrato en `domain/`.
   - Implementar repositorio en `data/` que traduzca documentos Firestore a entidades Dart.
   - Exponer flujos reactivos (`Stream`/`Future`) para el `Provider`.

---

## 🔄 Fase 7: Integración de Provider y Flujo de Datos
**Objetivo:** Conectar UI, estado y servicios de manera predecible.

1. **Proveedores Principales**
   - `AuthProvider`: sesión, perfil, permisos.
   - `CatalogProvider`: carga, filtrado, paginación de productos.
   - `CartProvider`: gestión local de carrito, sincronización opcional con Firestore.
   - `UIProvider`: tema, loader global, navegación contextual.

2. **Ciclo de Vida del Estado**
   - Inicialización en `main.dart` con `MultiProvider`.
   - Suscripción selectiva en widgets (`context.watch`, `context.read`).
   - Limpieza de streams al descartar pantallas.

3. **Manejo de Errores y Estados**
   - Estados: `loading`, `success`, `error`, `empty`.
   - Mensajes amigables y reintentos automáticos donde aplique.
   - Logging estructurado para debugging.

---

## 🧪 Fase 8: Pruebas, Validación y Optimización
**Objetivo:** Garantizar estabilidad, rendimiento y calidad antes del lanzamiento.

1. **Pruebas Automatizadas**
   - Unitarias: lógica de proveedores, validaciones, mapeo de modelos.
   - Widget: renderizado de componentes clave, estados vacíos/cargando.
   - Integración: flujo completo auth → catálogo → carrito → pedido simulado.

2. **Pruebas Manuales Multiplataforma**
   - Android (diversos fabricantes), iOS (simulador + dispositivo físico), Web (Chrome/Firefox).
   - Validar rotación, tamaños de pantalla, modo oscuro, conexiones lentas/sin conexión.

3. **Optimización**
   - Reducir rebuilds innecesarios (`const`, `Provider.of(context, listen: false)`).
   - Compresión de assets, lazy loading de imágenes.
   - Análisis con `flutter devtools` (memoria, CPU, red).

4. **Calidad de Código**
   - Linting estricto (`flutter analyze`).
   - Formateo automático (`dart format`).
   - Revisión de accesibilidad (contraste, escalabilidad de texto, lectores de pantalla).

---

## 🚀 Fase 9: Despliegue y Mantenimiento
**Objetivo:** Publicar en tiendas y web, con monitoreo continuo.

1. **Preparación por Plataforma**
   - Android: iconos adaptativos, firma APK/AAB, `minSdkVersion`, permisos.
   - iOS: bundle ID, provisioning profiles, iconos, `Info.plist` configuraciones.
   - Web: `index.html` optimizado, favicons, SEO básico, hosting configurado.

2. **Build y Publicación**
   - Generar builds de release con optimizaciones.
   - Subir a Google Play Console, Apple App Store Connect, y Firebase Hosting (web).
   - Revisar políticas de tienda (privacidad, datos de usuario, comercio electrónico).

3. **Monitoreo Post-Lanzamiento**
   - Activar Firebase Crashlytics y Performance Monitoring.
   - Configurar alertas de errores críticos.
   - Plan de iteración: backlog de mejoras, recolección de feedback, análisis de uso con Firebase Analytics.

---

## ✅ Checklist de Validación Final
- [ ] Entorno Flutter + Firebase CLI operativo
- [ ] Prototipo UI/UX aprobado y exportado
- [ ] `pubspec.yaml` con dependencias validadas y sin conflictos
- [ ] Autenticación email/password funcional con persistencia de sesión
- [ ] Firestore estructurado, indexado y con reglas de seguridad aplicadas
- [ ] Providers conectados y sin fugas de memoria
- [ ] Pruebas unitarias, widget e integración cubriendo flujos críticos
- [ ] Builds multiplataforma generados y validados
- [ ] Monitoreo y analíticas activas en Firebase

---

📌 **Siguiente paso recomendado:** Una vez aprobado este plan, se puede proceder a la generación de la estructura de carpetas, el `pubspec.yaml` definitivo y los archivos de configuración de Firebase por plataforma. ¿Deseas que avancemos al diseño del esquema Firestore detallado o al flujo de navegación con Provider?
