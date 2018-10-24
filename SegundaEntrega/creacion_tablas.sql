DROP TABLE D_TIEMPO;
CREATE TABLE D_TIEMPO 
(
  id_d_tiempo		number(10)	not null,
  fecha			date		not null,
  anio			number(10)	not null,
  mes			number(10)	not null,
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
  descripción		varchar2(300)	not null,
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

DROP TABLE H_VEHICULO_DEFECTOS;
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
/*
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
*/
commit;


