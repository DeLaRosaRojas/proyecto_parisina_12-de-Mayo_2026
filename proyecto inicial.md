## Pregunta 1
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

## Pregunta 2
Las entidades con sus atributos y su tipo en forma de tabla para cada una de las entidades .

<img width="868" height="417" alt="image" src="https://github.com/user-attachments/assets/b24032d2-8fd5-4625-80f6-7b371992aae6" />
<img width="870" height="489" alt="image" src="https://github.com/user-attachments/assets/1c1f5f72-f5d9-4325-963e-e59526e41673" />
<img width="865" height="379" alt="image" src="https://github.com/user-attachments/assets/54a306cb-1fc2-4c3c-a1ca-f818de1a9726" />
<img width="871" height="483" alt="image" src="https://github.com/user-attachments/assets/97845cdf-ef6b-4a23-a30c-ff4b91018979" />
<img width="868" height="662" alt="image" src="https://github.com/user-attachments/assets/be803a22-97a7-4314-9b4f-5f248ca8e8d6" />
<img width="863" height="698" alt="image" src="https://github.com/user-attachments/assets/c65c8999-1d04-4d00-a437-756c43880f48" />
<img width="864" height="846" alt="image" src="https://github.com/user-attachments/assets/43d8c5ea-b5d8-4724-ad85-d1e91f1ffb15" />
<img width="863" height="808" alt="image" src="https://github.com/user-attachments/assets/42ad785e-b7a9-427d-8dcf-27c76a985dcd" />





