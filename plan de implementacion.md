# 📐 Plan de Implementación: **Parisina. Tienda de Telas y Costura**
> *Aplicación multiplataforma (iOS, Android, Web) con Flutter + Dart + Firebase*

---

## 🧰 Fase 0: Preparación del Entorno y Herramientas
1. **Instalar SDK y Herramientas Base**
   - Descargar e instalar Flutter SDK y Dart estable.
   - Configurar variables de entorno (`PATH`) para terminal.
   - Verificar instalación con comandos de diagnóstico oficial.

2. **Configurar IDE (VS Code)**
   - Instalar extensiones oficiales: `Flutter`, `Dart`, `Firebase`, `Pubspec Assist`, `Error Lens`, `Material Icon Theme`.
   - *(Nota: "Antigravity" no es un IDE estándar para Flutter. Se recomienda VS Code o Android Studio. Este plan se basa en VS Code por su ligereza y ecosistema de extensiones).*
   - Configurar atajos, formateador (`dart format`), linter (`dart analyze`) y depurador.

3. **Preparar Emuladores y Dispositivos Físicos**
   - Instalar Android Studio (solo para SDK, emuladores y herramientas de compilación).
   - Crear AVD (Android Virtual Device) y/o habilitar simulador iOS (requiere macOS).
   - Configurar Chrome/Edge para pruebas web.
   - Habilitar depuración USB en dispositivos físicos si aplica.

4. **Configurar Firebase CLI**
   - Instalar Firebase CLI globalmente.
   - Autenticar con `firebase login`.
   - Verificar acceso a consola y proyectos.

---

## 🎨 Fase 1: Diseño UI/UX y Arquitectura de la App
1. **Definir Flujo de Usuario y Wireframes**
   - Mapear pantallas: Bienvenida → Login/Registro → Catálogo → Detalle de Tela → Carrito → Checkout → Perfil/Pedidos.
   - Diseñar prototipos interactivos en Figma/Adobe XD.
   - Validar navegación, accesibilidad y jerarquía visual.

2. **Establecer Guía de Estilos (Design System)**
   - Paleta de colores inspirada en textil, costura y elegancia.
   - Tipografía legible para móviles y web.
   - Componentes reutilizables: cards de telas, botones de selección por metros, badges de stock, formularios de autenticación.
   - Definir estados de carga, error y vacío.

3. **Definir Arquitectura de Código**
   - Adoptar arquitectura modular/capas: `core`, `features`, `shared`, `data`, `domain`, `presentation`.
   - Separar lógica de negocio, gestión de estado y UI.
   - Planificar navegación declarativa (rutas protegidas vs públicas).

---

## 📦 Fase 2: Configuración del Proyecto y Dependencias
1. **Inicializar Proyecto Flutter**
   - Crear proyecto con nombre `parisina_telas_costura`.
   - Configurar soporte multiplataforma (`--platforms=android,ios,web`).
   - Eliminar código boilerplate innecesario.

2. **Gestionar Dependencias en `pubspec.yaml`**
   - Agregar librerías oficiales de Firebase: `firebase_core`, `firebase_auth`, `cloud_firestore`.
   - Agregar gestión de estado: `provider`.
   - Agregar utilidades UI/UX: `cached_network_image`, `intl`, `flutter_localizations`, `flutter_svg`, `go_router` (navegación).
   - Agregar validación y formularios: `flutter_form_builder`, `email_validator`.
   - Ejecutar `flutter pub get` y verificar resolución de dependencias.
   - Configurar versiones semánticas y pin para estabilidad.

3. **Organizar Estructura de Carpetas**
   - `lib/src/core/` (config, constants, utils, theme)
   - `lib/src/features/auth/` (login, register, models, providers, screens)
   - `lib/src/features/catalog/` (products, filters, providers, screens)
   - `lib/src/features/cart/` (cart logic, providers, screens)
   - `lib/src/shared/` (widgets reutilizables, guards, services)
   - `assets/` (imágenes, íconos, fuentes, configuraciones locales)

---

## 🔐 Fase 3: Integración con Firebase
1. **Registrar Aplicaciones en Firebase Console**
   - Crear proyecto `parisina-telas`.
   - Registrar app Android (paquete, SHA-1/256 para login social futuro si aplica).
   - Registrar app iOS (Bundle ID).
   - Registrar app Web (dominios autorizados).

2. **Configurar Archivos de Credenciales**
   - Descargar `google-services.json` y ubicar en `android/app/`.
   - Descargar `GoogleService-Info.plist` y ubicar en `ios/Runner/`.
   - Configurar variables de entorno web en `firebase-config.js` o mediante variables de compilación segura.
   - **Nunca** subir credenciales a control de versiones.

3. **Inicializar Firebase en Flutter**
   - Configurar inicialización segura en `main.dart`.
   - Manejar errores de inicialización (red, configuración inválida).
   - Validar conexión antes de cargar UI principal.

4. **Configurar Authentication (Email/Password)**
   - Habilitar método Email/Password en consola Firebase.
   - Definir políticas de contraseña (mínimo caracteres, complejidad).
   - Configurar verificación de correo electrónico (opcional pero recomendado).
   - Definir flujo de recuperación de contraseña.
   - Implementar persistencia de sesión y manejo de tokens.

5. **Configurar Firestore Database**
   - Diseñar esquema de colecciones:
     - `users` (perfil, roles, historial)
     - `fabrics` (nombre, categoría, precio/metro, stock, imágenes, especificaciones)
     - `orders` (estado, items, total, fecha, usuario)
     - `cart` (temporal o persistido por usuario)
   - Crear índices compuestos para búsquedas y filtros.
   - Configurar reglas de seguridad (RLS): lectura pública para catálogo, escritura solo autenticada, aislamiento de datos por usuario.
   - Habilitar modo offline para cacheo local.

6. **Validar con Firebase Emulator Suite**
   - Levantar emuladores de Auth y Firestore localmente.
   - Probar flujos sin consumir cuotas reales.
   - Validar reglas de seguridad y comportamientos offline.

---

## 🔄 Fase 4: Gestión de Estado con Provider
1. **Diseñar Modelos de Datos**
   - Definir clases inmutables para: `User`, `Fabric`, `CartItem`, `Order`.
   - Incluir métodos `fromJson`/`toJson` y validación interna.
   - Separar modelos de dominio de los de presentación si es necesario.

2. **Crear ChangeNotifiers/Providers**
   - `AuthProvider`: manejo de sesión, login, registro, logout, estado de autenticación.
   - `CatalogProvider`: carga de telas, paginación, filtros, búsqueda, manejo de errores de red.
   - `CartProvider`: agregar, modificar cantidades, eliminar, calcular totales, sincronizar con Firestore.
   - `UserProfileProvider`: datos personales, historial de pedidos, preferencias.

3. **Inyectar Estado en el Árbol de Widgets**
   - Configurar `MultiProvider` en la raíz de la app.
   - Definir alcance (scope) de cada provider según necesidad de recomposición.
   - Evitar rebuilds innecesarios usando `context.watch` vs `context.read`.

4. **Definir Estados y Flujos**
   - Implementar enums o clases para: `Loading`, `Success`, `Error`, `Empty`.
   - Centralizar manejo de errores y mensajes de usuario.
   - Garantizar que la UI responda sincronizadamente a cambios de estado.

---

## 🧩 Fase 5: Desarrollo por Módulos (Orden de Implementación)
1. **Módulo de Autenticación**
   - Pantallas de Login y Registro con validación en tiempo real.
   - Conexión con `firebase_auth` vía `AuthProvider`.
   - Guardado seguro de sesión y redirección condicional.
   - Recuperación de contraseña y verificación de correo.

2. **Módulo de Catálogo**
   - Listado paginado de telas desde Firestore.
   - Filtros por categoría, precio, material, disponibilidad.
   - Búsqueda por texto con debounce.
   - Carga progresiva y manejo de imágenes optimizado.

3. **Módulo de Detalle de Producto**
   - Vista con galería, descripción técnica, precio por metro, selector de cantidad.
   - Validación de stock antes de agregar.
   - Compartir producto y agregar a favoritos (opcional).

4. **Módulo de Carrito y Checkout**
   - Lista de items seleccionados, edición de metros, eliminación.
   - Cálculo dinámico de totales, impuestos, envío.
   - Confirmación de pedido y escritura en Firestore (`orders`).
   - Limpieza de carrito y generación de comprobante.

5. **Módulo de Perfil y Pedidos**
   - Visualización de datos de usuario.
   - Historial de pedidos con estados (pendiente, en proceso, entregado).
   - Edición de datos personales y cierre de sesión.

6. **Módulo Administrativo (Escalable)**
   - Panel CRUD para gestión de telas, precios y stock.
   - Control de acceso basado en roles (`admin` vs `user`).
   - Reportes básicos y exportación de datos.

7. **Navegación y Rutas**
   - Configurar rutas públicas vs protegidas.
   - Implementar guards de autenticación.
   - Transiciones suaves y manejo de botón back.

---

## 🧪 Fase 6: Pruebas, Optimización y Despliegue
1. **Estrategia de Pruebas**
   - Unitarias: modelos de datos, lógica de cálculo, validadores.
   - Widget: componentes UI, flujos de formulario, estados de carga.
   - Integración: Auth + Firestore + UI completa.
   - Ejecutar en CI local o pipeline antes de merge.

2. **Optimización y Rendimiento**
   - Implementar lazy loading y paginación real.
   - Caché de imágenes y datos estáticos.
   - Minimizar rebuilds con `const` widgets y `Provider.of(context, listen: false)`.
   - Configurar `flutter build` con tree-shaking y minificación.

3. **Build y Despliegue**
   - Generar APK/AAB para Android (firmado con keystore).
   - Generar IPA para iOS (requiere cuenta Apple Developer y provisioning).
   - Compilar versión web con optimizaciones de assets y rutas.
   - Publicar en Firebase App Distribution para pruebas beta.
   - Preparar para tiendas oficiales (Google Play, App Store, Web Hosting).

---

## 📖 Fase 7: Mantenimiento y Documentación
1. **Documentación Técnica**
   - Diagrama de arquitectura y flujos de datos.
   - Guía de dependencias y versión mínima de Flutter/Dart.
   - Reglas de Firestore y configuración de Auth.
   - Instrucciones de entorno y despliegue.

2. **Monitoreo y Analítica**
   - Integrar Firebase Crashlytics para reporte de errores.
   - Configurar Analytics para métricas de uso, conversión y retención.
   - Definir alertas de rendimiento y caídas.

3. **CI/CD y Ciclo de Vida**
   - Automatizar builds con GitHub Actions o Codemagic.
   - Configurar linters, formatters y pruebas automáticas en PRs.
   - Planificar releases semánticos y notas de versión.
   - Establecer canal de feedback y backlog de mejoras.

---

## ✅ Checklist de Validación Pre-Código
- [ ] Entorno Flutter/Dart + VS Code funcional y verificado
- [ ] Proyecto Firebase creado con Auth y Firestore habilitados
- [ ] `pubspec.yaml` con dependencias resueltas y versionadas
- [ ] Estructura de carpetas alineada a arquitectura modular
- [ ] Prototipos UI/UX validados y design system definido
- [ ] Proveedores diseñados antes de implementar pantallas
- [ ] Reglas de seguridad de Firestore redactadas y probadas en emuladores
- [ ] Flujo de autenticación completo mapeado (login → sesión → logout)
- [ ] Estrategia de pruebas definida por capa
- [ ] Pipeline de despliegue y monitoreo configurado

---

📌 **Siguiente paso recomendado:** Una vez validado este plan, se puede proceder a la fase de codificación siguiendo el orden de módulos, asegurando que cada capa (datos → estado → UI) se implemente y pruebe antes de pasar a la siguiente. ¿Deseas que profundice en algún bloque específico del plan antes de comenzar la implementación?
