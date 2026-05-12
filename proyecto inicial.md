Para la gestión de una tienda de ropa como **Parisina**, estas son las entidades principales que necesitamos modelar:Aquí está el resumen de las **12 entidades** y su propósito dentro del sistema:

<img width="542" height="821" alt="image" src="https://github.com/user-attachments/assets/9e9080bc-f4c8-460b-a1bf-238a129d2442" />

**Núcleo comercial**
- `CLIENTE` — datos de compradores, historial de compras, programa de lealtad
- `VENTA` — cada transacción con fecha, método de pago y estatus (pagada, cancelada, etc.)
- `DETALLE_VENTA` — los renglones de cada venta (qué producto, cuántas piezas, a qué precio)

**Catálogo**
- `PRODUCTO` — ficha maestra de cada artículo (nombre, SKU, precio base)
- `VARIANTE` — combinaciones de talla y color de cada producto, con su propio stock
- `CATEGORIA` — árbol de categorías (Mujer > Vestidos > Casual)

**Operación y logística**
- `INVENTARIO` — stock por variante y por sucursal (permite multi-tienda)
- `SUCURSAL` — cada punto de venta o bodega
- `EMPLEADO` — personal asignado a cada sucursal

**Abastecimiento y posventa**
- `PROVEEDOR` — fabricantes o distribuidores que surten la mercancía
- `DEVOLUCION` — registro de devoluciones ligadas a una venta con motivo y estatus
- `PROMOCION` — descuentos o campañas aplicables en el detalle de venta

¿Quieres que profundice en alguna entidad, agregue campos específicos (como programa de puntos o tallas especiales), o genere el script SQL de creación?
