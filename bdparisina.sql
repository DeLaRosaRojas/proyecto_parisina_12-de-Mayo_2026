
CREATE DATABASE IF NOT EXISTS bdparisina;
USE bdparisina;

-- =========================================
-- TABLA: CLIENTE
-- =========================================
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    direccion VARCHAR(200),
    fecha_nacimiento DATE,
    puntos_lealtad INT DEFAULT 0,
    fecha_registro DATE,
    activo BOOLEAN DEFAULT TRUE
);

-- =========================================
-- TABLA: SUCURSAL
-- =========================================
CREATE TABLE sucursal (
    id_sucursal INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200),
    ciudad VARCHAR(80),
    estado VARCHAR(60),
    telefono VARCHAR(20),
    tipo VARCHAR(20),
    activo BOOLEAN DEFAULT TRUE
);

-- =========================================
-- TABLA: EMPLEADO
-- =========================================
CREATE TABLE empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    id_sucursal INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    puesto VARCHAR(60),
    email VARCHAR(120),
    telefono VARCHAR(20),
    salario DECIMAL(10,2),
    fecha_ingreso DATE,
    activo BOOLEAN DEFAULT TRUE,

    CONSTRAINT fk_empleado_sucursal
        FOREIGN KEY (id_sucursal)
        REFERENCES sucursal(id_sucursal)
);

-- =========================================
-- TABLA: PROVEEDOR
-- =========================================
CREATE TABLE proveedor (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    contacto VARCHAR(100),
    email VARCHAR(120),
    telefono VARCHAR(20),
    pais VARCHAR(60),
    ciudad VARCHAR(80),
    condiciones_pago VARCHAR(100),
    activo BOOLEAN DEFAULT TRUE
);

-- =========================================
-- TABLA: CATEGORIA
-- =========================================
CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    id_categoria_padre INT NULL,
    descripcion VARCHAR(200),
    nivel INT,
    activo BOOLEAN DEFAULT TRUE,

    CONSTRAINT fk_categoria_padre
        FOREIGN KEY (id_categoria_padre)
        REFERENCES categoria(id_categoria)
);

-- =========================================
-- TABLA: PRODUCTO
-- =========================================
CREATE TABLE producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT NOT NULL,
    id_proveedor INT NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    sku VARCHAR(40) NOT NULL UNIQUE,
    descripcion TEXT,
    precio_base DECIMAL(10,2) NOT NULL,
    costo DECIMAL(10,2),
    imagen_url VARCHAR(255),
    activo BOOLEAN DEFAULT TRUE,
    fecha_alta DATE,

    CONSTRAINT fk_producto_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categoria(id_categoria),

    CONSTRAINT fk_producto_proveedor
        FOREIGN KEY (id_proveedor)
        REFERENCES proveedor(id_proveedor)
);

-- =========================================
-- TABLA: VARIANTE
-- =========================================
CREATE TABLE variante (
    id_variante INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    talla VARCHAR(10),
    color VARCHAR(40),
    codigo_barras VARCHAR(50),
    precio_diferencial DECIMAL(10,2) DEFAULT 0.00,
    activo BOOLEAN DEFAULT TRUE,

    CONSTRAINT fk_variante_producto
        FOREIGN KEY (id_producto)
        REFERENCES producto(id_producto)
);

-- =========================================
-- TABLA: PROMOCION
-- =========================================
CREATE TABLE promocion (
    id_promocion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(200),
    tipo VARCHAR(30),
    descuento_valor DECIMAL(10,2),
    fecha_inicio DATE,
    fecha_fin DATE,
    activo BOOLEAN DEFAULT TRUE
);

-- =========================================
-- TABLA: INVENTARIO
-- =========================================
CREATE TABLE inventario (
    id_inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_variante INT NOT NULL,
    id_sucursal INT NOT NULL,
    cantidad INT DEFAULT 0,
    cantidad_minima INT DEFAULT 0,
    ultima_actualizacion DATE,

    CONSTRAINT fk_inventario_variante
        FOREIGN KEY (id_variante)
        REFERENCES variante(id_variante),

    CONSTRAINT fk_inventario_sucursal
        FOREIGN KEY (id_sucursal)
        REFERENCES sucursal(id_sucursal)
);

-- =========================================
-- TABLA: VENTA
-- =========================================
CREATE TABLE venta (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_empleado INT NOT NULL,
    id_sucursal INT NOT NULL,
    fecha DATE,
    subtotal DECIMAL(10,2),
    impuesto DECIMAL(10,2),
    total DECIMAL(10,2),
    metodo_pago VARCHAR(30),
    estatus VARCHAR(20),
    folio VARCHAR(30),

    CONSTRAINT fk_venta_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente),

    CONSTRAINT fk_venta_empleado
        FOREIGN KEY (id_empleado)
        REFERENCES empleado(id_empleado),

    CONSTRAINT fk_venta_sucursal
        FOREIGN KEY (id_sucursal)
        REFERENCES sucursal(id_sucursal)
);

-- =========================================
-- TABLA: DETALLE_VENTA
-- =========================================
CREATE TABLE detalle_venta (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    id_variante INT NOT NULL,
    id_promocion INT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2),
    descuento DECIMAL(10,2),
    subtotal DECIMAL(10,2),

    CONSTRAINT fk_detalle_venta
        FOREIGN KEY (id_venta)
        REFERENCES venta(id_venta),

    CONSTRAINT fk_detalle_variante
        FOREIGN KEY (id_variante)
        REFERENCES variante(id_variante),

    CONSTRAINT fk_detalle_promocion
        FOREIGN KEY (id_promocion)
        REFERENCES promocion(id_promocion)
);

-- =========================================
-- TABLA: DEVOLUCION
-- =========================================
CREATE TABLE devolucion (
    id_devolucion INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    id_variante INT NOT NULL,
    id_empleado INT NOT NULL,
    fecha DATE,
    cantidad INT,
    motivo VARCHAR(200),
    tipo_resolucion VARCHAR(30),
    monto_reembolso DECIMAL(10,2),
    estatus VARCHAR(20),

    CONSTRAINT fk_devolucion_venta
        FOREIGN KEY (id_venta)
        REFERENCES venta(id_venta),

    CONSTRAINT fk_devolucion_variante
        FOREIGN KEY (id_variante)
        REFERENCES variante(id_variante),

    CONSTRAINT fk_devolucion_empleado
        FOREIGN KEY (id_empleado)
        REFERENCES empleado(id_empleado)
);

-- =========================================
-- ÍNDICES ADICIONALES
-- =========================================
CREATE INDEX idx_producto_nombre ON producto(nombre);
CREATE INDEX idx_cliente_email ON cliente(email);
CREATE INDEX idx_venta_fecha ON venta(fecha);
CREATE INDEX idx_inventario_stock ON inventario(cantidad);
