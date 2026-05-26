-- =========================================
-- BASE DE DATOS: BD PARISINA
-- Archivo: bdparisina.sql
-- Motor: MySQL 8.0+ / MariaDB 10.3+
-- Tablas: 12
-- Notas: 
--   - Arrays y objetos embebidos mapeados a JSON nativo.
--   - Tipos monetarios y medidas usan DECIMAL para precisión.
--   - Orden de creación respeta restricciones FOREIGN KEY.
-- =========================================

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
