# Pregunta 1
## Para la gestión de una tienda de ropa como **Parisina**, estas son las entidades principales que necesitamos modelar:Aquí está el resumen de las **12 entidades** y su propósito dentro del sistema:

<img width="542" height="821" alt="image" src="https://github.com/user-attachments/assets/9e9080bc-f4c8-460b-a1bf-238a129d2442" />

Aquí está el diseño de entidades para el **Proyecto Parisina** en una base de datos NoSQL (orientada a documentos, como MongoDB o Firestore).Puedes hacer clic en cualquier tarjeta para ver el documento JSON completo de esa colección. Aquí el resumen de las decisiones de modelado:

**10 colecciones en total** — 6 de catálogo + 4 operativas + 2 de apoyo recomendadas.

**Decisiones clave de modelado NoSQL:**

Las `direcciones` del usuario y los `horarios` de sucursal van **embebidos** porque siempre se consultan junto con su documento padre y rara vez cambian de forma independiente.

Los `items` del Carrito y Pedidos se guardan como **snapshots embebidos** (con precio y nombre capturado al momento de la compra), no como referencias. Esto es fundamental: si el precio de una tela cambia mañana, el historial del pedido debe conservar el precio original.

Las 6 colecciones de productos (Telas, Hilos, Vestir, Accesorios, Máquinas, Hogar) son colecciones separadas —no una sola colección `Productos`— porque sus atributos son muy distintos entre sí (ancho_cm para telas, grosor_nm para hilos, potencia_w para máquinas). Esto evita documentos con decenas de campos nulos.

El campo `coleccion_origen` en el Carrito e Inventario actúa como discriminador, indicando de qué colección viene cada `producto_id`.

**Colecciones recomendadas adicionales:** `Pedidos` es prácticamente obligatoria para no perder el estado entre Carrito y Devoluciones. `Inventario` centraliza el stock de las 6 colecciones de productos y facilita alertas de reabastecimiento por sucursal.

-----------------
## Dame las entidades con sus atributos y su tipo en forma de tabla para cada una de las entidades. De manera organizada.

<img width="744" height="129" alt="image" src="https://github.com/user-attachments/assets/f9a9b6f1-9a01-49a4-8cc9-510d129a6fdc" />
<img width="751" height="595" alt="image" src="https://github.com/user-attachments/assets/e5f39e62-5771-4744-b5cb-cb63be44d1a7" />
<img width="742" height="580" alt="image" src="https://github.com/user-attachments/assets/fa3297a8-4b6e-4a88-b4f4-98c08e28f0cd" />
<img width="734" height="583" alt="image" src="https://github.com/user-attachments/assets/022c65a0-77f9-40ad-8205-69db7e4009bb" />
<img width="730" height="575" alt="image" src="https://github.com/user-attachments/assets/b2add29e-d47d-4f7d-a7bd-fe9bdce15c7f" />
<img width="739" height="581" alt="image" src="https://github.com/user-attachments/assets/55a6a5d2-18b0-492e-aa8d-139e5ddf8f58" />
<img width="734" height="539" alt="image" src="https://github.com/user-attachments/assets/91cdf575-daca-4c2a-8a37-bf74ec59cab3" />
<img width="744" height="551" alt="image" src="https://github.com/user-attachments/assets/6e869b90-1926-472d-9170-416e0de004b9" />
<img width="736" height="552" alt="image" src="https://github.com/user-attachments/assets/e17baaf4-77a5-4143-808f-c42b24acefe0" />
<img width="745" height="507" alt="image" src="https://github.com/user-attachments/assets/3578a847-7b38-4664-bf28-610225ecdf20" />
<img width="746" height="580" alt="image" src="https://github.com/user-attachments/assets/3fc838ad-ae7b-48a4-9a7c-82998526abe4" />
<img width="737" height="583" alt="image" src="https://github.com/user-attachments/assets/6b7dd0a1-d2a5-4079-b2db-0f07cea876b8" />
<img width="743" height="453" alt="image" src="https://github.com/user-attachments/assets/8e403c53-df85-4838-ac0c-e097669ea49d" />
