DROP TABLE D_TIEMPO;
CREATE TABLE D_TIEMPO 
(
  id_d_tiempo		number(10)	not null,
  fecha			date		not null,
  anio			varchar2(10)	not null,
  mes			varchar2(20)	not null,
  dia			number(10)	not null,
  CONSTRAINT D_TIEMPO_PK PRIMARY KEY 
  (
    id_d_tiempo 
  )
  ENABLE 
);

DROP TABLE D_INVENTARIO;
CREATE TABLE D_INVENTARIO 
(
  id_d_inventario		number(10)	not null,
  color			varchar2(20)	not null,
  tipo			varchar2(40)	not null,
  precio_lista		number(10,2)	not null,
  status			varchar(30)	not null,
  catalogo_modelo	varchar2(50)	not null,
  catalogo_anio		varchar2(4)	not null,
  id_inventario		number(10)	not null,
  id_catalogo		number(10)	not null,
  CONSTRAINT D_INVENTARIO_PK PRIMARY KEY 
  (
    id_d_inventario 
  )
  ENABLE 
);

DROP TABLE D_DEFECTO;
CREATE TABLE D_DEFECTO
(
  id_d_defecto		number(10)	not null,
  descripcion		varchar2(300)	not null,
  id_tipo_defecto		number(10)	not null,
  CONSTRAINT D_DEFECTO_PK PRIMARY KEY 
  (
    id_d_defecto 
  )
  ENABLE
);

DROP TABLE D_VENDEDOR;
CREATE TABLE D_VENDEDOR
(
  id_d_vendedor		number(10)	not null,
  nombre			varchar2(40),
  id_vendedor		number(10)	not null,
  CONSTRAINT D_VENDEDOR_PK PRIMARY KEY 
  (
    id_d_vendedor 
  )
  ENABLE
);

DROP TABLE H_VENTA_VEHICULO;
CREATE TABLE H_VENTA_VEHICULO
(
  id_h_venta		number(10)	not null,
  id_d_inventario		number(10)	not null,
  id_d_tiempo		number(10)	not null,
  ingresos_totales	number(10)	not null,
  cantidad_ventas	number(10)	not null,
  CONSTRAINT H_VENTA_VEHICULO_PK PRIMARY KEY 
  (
    id_h_venta 
  )
  ENABLE
);

DROP TABLE x;
CREATE TABLE H_VEHICULO_DEFECTOS
(
  id_h_defecto		number(10)	not null,
  id_d_defecto		number(10)	not null,
  id_d_tiempo		number(10)	not null,
  id_d_inventario		number(10)	not null,
  total_defectos		number(10)	not null,
  CONSTRAINT H_VEHICULO_DEFECTOS_PK PRIMARY KEY 
  (
    id_h_defecto 
  )
  ENABLE
);

DROP TABLE H_VENTA_VENDEDOR;
CREATE TABLE H_VENTA_VENDEDOR
(
  id_h_venta		number(10)	not null,
  id_d_vendedor		number(10)	not null,
  id_d_tiempo		number(10)	not null,
  venta_total		number(10)	not null,
  comision_total		number(10)	not null,
  cantidad_vehiculos	number(10)	not null,
  CONSTRAINT H_VENTA_VENDEDOR_PK PRIMARY KEY 
  (
    id_h_venta 
  )
  ENABLE
);
-- creación de FOREIGN KEYs
-- CONSTRAINTS for H_VENTA_VEHICULO
ALTER TABLE H_VENTA_VEHICULO
ADD CONSTRAINT H_VENTA_VEHICULO_FK1
   FOREIGN KEY (id_d_inventario)
   REFERENCES D_INVENTARIO(id_d_inventario);
   
ALTER TABLE H_VENTA_VEHICULO
ADD CONSTRAINT H_VENTA_VEHICULO_FK2
   FOREIGN KEY (id_d_tiempo)
   REFERENCES D_TIEMPO(id_d_tiempo);

-- CONSTRAINTS for H_VEHICULO_DEFECTOS
ALTER TABLE H_VEHICULO_DEFECTOS
ADD CONSTRAINT H_VEHICULO_DEFECTOS_FK1
   FOREIGN KEY (id_d_tiempo)
   REFERENCES D_TIEMPO(id_d_tiempo);
   
ALTER TABLE H_VEHICULO_DEFECTOS
ADD CONSTRAINT H_VEHICULO_DEFECTOS_FK2
   FOREIGN KEY (id_d_inventario)
   REFERENCES D_INVENTARIO(id_d_inventario);
   
ALTER TABLE H_VEHICULO_DEFECTOS
ADD CONSTRAINT H_VEHICULO_DEFECTOS_FK3
   FOREIGN KEY (id_d_defecto)
   REFERENCES D_DEFECTO(id_d_defecto);   

-- CONSTRAINTS for H_VENTA_VENDEDOR
ALTER TABLE H_VENTA_VENDEDOR
ADD CONSTRAINT H_VENTA_VENDEDOR_FK1
   FOREIGN KEY (id_d_tiempo)
   REFERENCES D_TIEMPO(id_d_tiempo);
   
ALTER TABLE H_VENTA_VENDEDOR
ADD CONSTRAINT H_VENTA_VENDEDOR_FK2
   FOREIGN KEY (id_d_vendedor)
   REFERENCES D_VENDEDOR(id_d_vendedor); 
-- fin creación de FOREIGN KEYs

-- creación de índices:
CREATE INDEX D_TIEMPO_INDEX1 ON D_TIEMPO (fecha);
CREATE INDEX D_TIEMPO_INDEX2 ON D_TIEMPO (anio);
CREATE INDEX D_TIEMPO_INDEX3 ON D_TIEMPO (mes);

CREATE INDEX D_INVENTARIO_INDEX1 ON D_INVENTARIO (id_inventario);
CREATE INDEX D_INVENTARIO_INDEX2 ON D_INVENTARIO (id_catalogo);

CREATE INDEX D_DEFECTO_INDEX1 ON D_DEFECTO (id_tipo_defecto);

CREATE INDEX D_VENDEDOR_INDEX1 ON D_VENDEDOR (id_vendedor);

CREATE INDEX H_VENTA_VEHICULO_INDEX1 ON H_VENTA_VEHICULO (id_d_inventario);
CREATE INDEX H_VENTA_VEHICULO_INDEX2 ON H_VENTA_VEHICULO (id_d_tiempo);
CREATE INDEX H_VENTA_VEHICULO_INDEX3 ON H_VENTA_VEHICULO (ingresos_totales);
CREATE INDEX H_VENTA_VEHICULO_INDEX4 ON H_VENTA_VEHICULO (cantidad_ventas);

CREATE INDEX H_VEHICULO_DEFECTOS_INDEX1 ON H_VEHICULO_DEFECTOS (id_d_defecto);
CREATE INDEX H_VEHICULO_DEFECTOS_INDEX2 ON H_VEHICULO_DEFECTOS (id_d_tiempo);
CREATE INDEX H_VEHICULO_DEFECTOS_INDEX3 ON H_VEHICULO_DEFECTOS (id_d_inventario);
CREATE INDEX H_VEHICULO_DEFECTOS_INDEX4 ON H_VEHICULO_DEFECTOS (total_defectos);

CREATE INDEX H_VENTA_VENDEDOR_INDEX1 ON H_VENTA_VENDEDOR (id_d_vendedor);
CREATE INDEX H_VENTA_VENDEDOR_INDEX2 ON H_VENTA_VENDEDOR (id_d_tiempo);
CREATE INDEX H_VENTA_VENDEDOR_INDEX3 ON H_VENTA_VENDEDOR (venta_total);
CREATE INDEX H_VENTA_VENDEDOR_INDEX4 ON H_VENTA_VENDEDOR (comision_total);
CREATE INDEX H_VENTA_VENDEDOR_INDEX5 ON H_VENTA_VENDEDOR (cantidad_vehiculos);
-- fin creación de índices:

commit;

