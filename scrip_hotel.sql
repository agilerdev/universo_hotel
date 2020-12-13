--Antonio Andres Giler Macias 5 A
/*==============================================================*/
/* Table: ACTO_VANDALICO                                        */
/*==============================================================*/
create table ACTO_VANDALICO (
   ACTO_VANDALICO_ID    SERIAL               not null,
   CLIENTE_ID           INT4                 not null,
   MOBILIARIO_ID        INT4                 not null,
   HOTEL_ID             INT4                 not null,
   ACTO_VANDALICO_FECHA DATE                 not null,
   ACTO_VANDALICO_DESCRIPCION TEXT                 not null,
   constraint PK_ACTO_VANDALICO primary key (ACTO_VANDALICO_ID)
);

/*==============================================================*/
/* Table: APARCAMIENTO                                          */
/*==============================================================*/
create table APARCAMIENTO (
   APARCAMIENTO_ID      SERIAL               not null,
   HABITACION_ID        INT4                 not null,
   HOTEL_ID             INT4                 not null,
   APARCAMIENTO_NUMERO  NUMERIC              not null,
   constraint PK_APARCAMIENTO primary key (APARCAMIENTO_ID)
);

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD (
   CIUDAD_ID            SERIAL               not null,
   PROVINCIA_ID         INT4                 not null,
   CIUDAD_NOMBRE        TEXT                 not null,
   constraint PK_CIUDAD primary key (CIUDAD_ID)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   CLIENTE_ID           SERIAL               not null,
   TIPO_CLIENTE_ID      INT4                 not null,
   CLIENTE_DOCUMENTO_IDENTIDAD_ID TEXT                 not null,
   CLIENTE_NOMBRE       TEXT                 not null,
   CLIENTE_APELLIDO     TEXT                 not null,
   constraint PK_CLIENTE primary key (CLIENTE_ID)
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO (
   EMPLEADO_ID          SERIAL               not null,
   TIPO_EMPLEADO_ID     INT4                 not null,
   HOTEL_ID             INT4                 not null,
   EMPLEADO_NOMBRE      TEXT                 not null,
   EMPLEADO_APELLIDO    TEXT                 not null,
   EMPLEADO_DOCUMENTO_IDENTIDAD TEXT                 not null,
   EMPLEADO_INICIO_CONTRATO DATE                 not null,
   constraint PK_EMPLEADO primary key (EMPLEADO_ID)
);

/*==============================================================*/
/* Table: ESTANCIA                                              */
/*==============================================================*/
create table ESTANCIA (
   ESTANCIA_ID          SERIAL               not null,
   CLIENTE_ID           INT4                 not null,
   HABITACION_ID        INT4                 not null,
   EMPLEADO_ID          INT4                 not null,
   HOTEL_ID             INT4                 not null,
   ESTANCIA_FECHA_LLEGADA DATE                 not null,
   ESTANCIA_FECHA_SALIDA DATE                 not null,
   ESTANCIA_PRECIO      MONEY                not null,
   ESTANCIA_ESTADO_COMPLETADO BOOL                 not null,
   ESTANCIA_ESTADO_SOLICITADO BOOL                 not null,
   constraint PK_ESTANCIA primary key (ESTANCIA_ID)
);

/*==============================================================*/
/* Table: HABITACION                                            */
/*==============================================================*/
create table HABITACION (
   HABITACION_ID        SERIAL               not null,
   HOTEL_ID             INT4                 not null,
   TIPO_HABITACION_ID   INT4                 not null,
   APARCAMIENTO_ID      INT4                 null,
   HABITACION_NUMERO    NUMERIC              not null,
   HABITACION_ESTADO_HABILITADA BOOL                 not null,
   HABITACION_ESTADO_DISPONIBLE BOOL                 not null,
   constraint PK_HABITACION primary key (HABITACION_ID)
);

/*==============================================================*/
/* Table: HOTEL                                                 */
/*==============================================================*/
create table HOTEL (
   HOTEL_ID             SERIAL               not null,
   CIUDAD_ID            INT4                 not null,
   HOTEL_DIRECCION      TEXT                 not null,
   HOTEL_TELEFONO       NUMERIC              not null,
   HOTEL_NOMBRE         TEXT                 not null,
   constraint PK_HOTEL primary key (HOTEL_ID)
);

/*==============================================================*/
/* Table: MOBILIARIO                                            */
/*==============================================================*/
create table MOBILIARIO (
   MOBILIARIO_ID        SERIAL               not null,
   TIPO_MUEBLE_ID       INT4                 not null,
   HABITACION_ID        INT4                 null,
   HOTEL_ID             INT4                 not null,
   MOBILIARIO_DESCRIPCION TEXT                 not null,
   MOBILIARIO_PRECIO    MONEY                null,
   MOBILIARIO_ESTADO    BOOL                 not null,
   constraint PK_MOBILIARIO primary key (MOBILIARIO_ID)
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS (
   PAIS_ID              SERIAL               not null,
   PAIS_NOMBRE          TEXT                 not null,
   constraint PK_PAIS primary key (PAIS_ID)
);

/*==============================================================*/
/* Table: PROVINCIA                                             */
/*==============================================================*/
create table PROVINCIA (
   PROVINCIA_ID         SERIAL               not null,
   PAIS_ID              INT4                 not null,
   PROVINCIA_NOMBRE     TEXT                 not null,
   constraint PK_PROVINCIA primary key (PROVINCIA_ID)
);

/*==============================================================*/
/* Table: SERVICIO                                              */
/*==============================================================*/
create table SERVICIO (
   SERVICIO_ID          SERIAL               not null,
   SERVICIO_DESCRIPCION TEXT                 not null,
   constraint PK_SERVICIO primary key (SERVICIO_ID)
);

/*==============================================================*/
/* Table: SOLICITUD_SERVICIO                                    */
/*==============================================================*/
create table SOLICITUD_SERVICIO (
   SOLICITUD_SERVICIO_ID SERIAL               not null,
   SERVICIO_ID          INT4                 not null,
   ESTANCIA_ID          INT4                 not null,
   EMPLEADO_ID          INT4                 not null,
   SOLICITUD_SERVICIO_EST_HAB BOOL                 not null,
   SOLICITUD_SERVICIO_EST_COMP BOOL                 not null,
   constraint PK_SOLICITUD_SERVICIO primary key (SOLICITUD_SERVICIO_ID)
);

/*==============================================================*/
/* Table: TIPO_CLIENTE                                          */
/*==============================================================*/
create table TIPO_CLIENTE (
   TIPO_CLIENTE_ID      SERIAL               not null,
   TIPO_CLIENTE_DESCRIPCION TEXT                 not null,
   constraint PK_TIPO_CLIENTE primary key (TIPO_CLIENTE_ID)
);

/*==============================================================*/
/* Table: TIPO_EMPLEADO                                         */
/*==============================================================*/
create table TIPO_EMPLEADO (
   TIPO_EMPLEADO_ID     SERIAL               not null,
   TIPO_EMPLEADO_DESCRIPCION TEXT                 not null,
   constraint PK_TIPO_EMPLEADO primary key (TIPO_EMPLEADO_ID)
);

/*==============================================================*/
/* Table: TIPO_HABITACION                                       */
/*==============================================================*/
create table TIPO_HABITACION (
   TIPO_HABITACION_ID   SERIAL               not null,
   TIPO_HABITACION_DESCRIPCION TEXT                 not null,
   constraint PK_TIPO_HABITACION primary key (TIPO_HABITACION_ID)
);

/*==============================================================*/
/* Table: TIPO_MUEBLE                                           */
/*==============================================================*/
create table TIPO_MUEBLE (
   TIPO_MUEBLE_ID       SERIAL               not null,
   TIPO_MUEBLE_DESCRIPCION TEXT                 not null,
   constraint PK_TIPO_MUEBLE primary key (TIPO_MUEBLE_ID)
);

alter table ACTO_VANDALICO
   add constraint FK_ACTO_VAN_RELATIONS_HOTEL foreign key (HOTEL_ID)
      references HOTEL (HOTEL_ID)
      on delete restrict on update restrict;

alter table ACTO_VANDALICO
   add constraint FK_ACTO_VAN_RELATIONS_CLIENTE foreign key (CLIENTE_ID)
      references CLIENTE (CLIENTE_ID)
      on delete restrict on update restrict;

alter table ACTO_VANDALICO
   add constraint FK_ACTO_VAN_RELATIONS_MOBILIAR foreign key (MOBILIARIO_ID)
      references MOBILIARIO (MOBILIARIO_ID)
      on delete restrict on update restrict;

alter table APARCAMIENTO
   add constraint FK_APARCAMI_RELATIONS_HOTEL foreign key (HOTEL_ID)
      references HOTEL (HOTEL_ID)
      on delete restrict on update restrict;

alter table APARCAMIENTO
   add constraint FK_APARCAMI_RELATIONS_HABITACI foreign key (HABITACION_ID)
      references HABITACION (HABITACION_ID)
      on delete restrict on update restrict;

alter table CIUDAD
   add constraint FK_CIUDAD_RELATIONS_PROVINCI foreign key (PROVINCIA_ID)
      references PROVINCIA (PROVINCIA_ID)
      on delete restrict on update restrict;

alter table CLIENTE
   add constraint FK_CLIENTE_RELATIONS_TIPO_CLI foreign key (TIPO_CLIENTE_ID)
      references TIPO_CLIENTE (TIPO_CLIENTE_ID)
      on delete restrict on update restrict;

alter table EMPLEADO
   add constraint FK_EMPLEADO_RELATIONS_TIPO_EMP foreign key (TIPO_EMPLEADO_ID)
      references TIPO_EMPLEADO (TIPO_EMPLEADO_ID)
      on delete restrict on update restrict;

alter table EMPLEADO
   add constraint FK_EMPLEADO_RELATIONS_HOTEL foreign key (HOTEL_ID)
      references HOTEL (HOTEL_ID)
      on delete restrict on update restrict;

alter table ESTANCIA
   add constraint FK_ESTANCIA_RELATIONS_EMPLEADO foreign key (EMPLEADO_ID)
      references EMPLEADO (EMPLEADO_ID)
      on delete restrict on update restrict;

alter table ESTANCIA
   add constraint FK_ESTANCIA_RELATIONS_HOTEL foreign key (HOTEL_ID)
      references HOTEL (HOTEL_ID)
      on delete restrict on update restrict;

alter table ESTANCIA
   add constraint FK_ESTANCIA_RELATIONS_CLIENTE foreign key (CLIENTE_ID)
      references CLIENTE (CLIENTE_ID)
      on delete restrict on update restrict;

alter table ESTANCIA
   add constraint FK_ESTANCIA_RELATIONS_HABITACI foreign key (HABITACION_ID)
      references HABITACION (HABITACION_ID)
      on delete restrict on update restrict;

alter table HABITACION
   add constraint FK_HABITACI_RELATIONS_APARCAMI foreign key (APARCAMIENTO_ID)
      references APARCAMIENTO (APARCAMIENTO_ID)
      on delete restrict on update restrict;

alter table HABITACION
   add constraint FK_HABITACI_RELATIONS_HOTEL foreign key (HOTEL_ID)
      references HOTEL (HOTEL_ID)
      on delete restrict on update restrict;

alter table HABITACION
   add constraint FK_HABITACI_RELATIONS_TIPO_HAB foreign key (TIPO_HABITACION_ID)
      references TIPO_HABITACION (TIPO_HABITACION_ID)
      on delete restrict on update restrict;

alter table HOTEL
   add constraint FK_HOTEL_RELATIONS_CIUDAD foreign key (CIUDAD_ID)
      references CIUDAD (CIUDAD_ID)
      on delete restrict on update restrict;

alter table MOBILIARIO
   add constraint FK_MOBILIAR_RELATIONS_HOTEL foreign key (HOTEL_ID)
      references HOTEL (HOTEL_ID)
      on delete restrict on update restrict;

alter table MOBILIARIO
   add constraint FK_MOBILIAR_RELATIONS_TIPO_MUE foreign key (TIPO_MUEBLE_ID)
      references TIPO_MUEBLE (TIPO_MUEBLE_ID)
      on delete restrict on update restrict;

alter table MOBILIARIO
   add constraint FK_MOBILIAR_RELATIONS_HABITACI foreign key (HABITACION_ID)
      references HABITACION (HABITACION_ID)
      on delete restrict on update restrict;

alter table PROVINCIA
   add constraint FK_PROVINCI_RELATIONS_PAIS foreign key (PAIS_ID)
      references PAIS (PAIS_ID)
      on delete restrict on update restrict;

alter table SOLICITUD_SERVICIO
   add constraint FK_SOLICITU_RELATIONS_SERVICIO foreign key (SERVICIO_ID)
      references SERVICIO (SERVICIO_ID)
      on delete restrict on update restrict;

alter table SOLICITUD_SERVICIO
   add constraint FK_SOLICITU_RELATIONS_ESTANCIA foreign key (ESTANCIA_ID)
      references ESTANCIA (ESTANCIA_ID)
      on delete restrict on update restrict;

alter table SOLICITUD_SERVICIO
   add constraint FK_SOLICITU_RELATIONS_EMPLEADO foreign key (EMPLEADO_ID)
      references EMPLEADO (EMPLEADO_ID)
      on delete restrict on update restrict;




INSERT INTO PAIS VALUES(DEFAULT, 'ECUADOR');


 INSERT INTO PROVINCIA VALUES (DEFAULT, 1, 'MANABI' );


INSERT INTO CIUDAD VALUES (DEFAULT, 1, 'MANTA');


INSERT INTO HOTEL VALUES (DEFAULT, 1, 'CIUDADELA LOS ELECTRICOS CALLE U', 0998751124, 'HOTEL MANTA');


INSERT INTO TIPO_HABITACION VALUES(DEFAULT, 'PRESIDENCIAL');
INSERT INTO TIPO_HABITACION VALUES(DEFAULT, 'GRANDE');
INSERT INTO TIPO_HABITACION VALUES(DEFAULT, 'MEDIANA');
INSERT INTO TIPO_HABITACION VALUES(DEFAULT, 'PEQUENA');


 INSERT INTO servicio VALUES (DEFAULT, 'LIMPIEZA');
 INSERT INTO servicio VALUES (DEFAULT, 'MANTENIMIENTO');
 INSERT INTO servicio VALUES (DEFAULT, 'RESTAURANTE');


INSERT INTO tipo_empleado VALUES(DEFAULT, 'RECEPCION');
INSERT INTO tipo_empleado VALUES(DEFAULT, 'MANTENIMIENTO');
INSERT INTO tipo_empleado VALUES(DEFAULT, 'CHEFS');
INSERT INTO tipo_empleado VALUES(DEFAULT, 'LIMPIEZA');


INSERT INTO tipo_mueble VALUES(DEFAULT, 'SILLON');
INSERT INTO tipo_mueble VALUES(DEFAULT, 'CAMA');
INSERT INTO tipo_mueble VALUES(DEFAULT, 'TELEVISOR');
INSERT INTO tipo_mueble VALUES(DEFAULT, 'ESCRITORIO');
INSERT INTO tipo_mueble VALUES(DEFAULT, 'SILLA');
INSERT INTO tipo_mueble VALUES(DEFAULT, 'LAMPARAS');
INSERT INTO tipo_mueble VALUES(DEFAULT, 'TELEFONO');
INSERT INTO tipo_mueble VALUES(DEFAULT, 'SECADOR');
INSERT INTO tipo_mueble VALUES(DEFAULT, 'ROUTER');
INSERT INTO tipo_mueble VALUES(DEFAULT, 'COMODA');
INSERT INTO tipo_mueble VALUES(DEFAULT, 'MESA');
INSERT INTO tipo_mueble VALUES(DEFAULT, 'VELADOR');


INSERT INTO tipo_cliente VALUES(DEFAULT, 'NORMAL');
INSERT INTO tipo_cliente VALUES(DEFAULT, 'FRECUENTE');


INSERT INTO CLIENTE VALUES(DEFAULT, 2,'1316933058','ANTONIO ANDRES', 'GILER MACIAS');


INSERT INTO EMPLEADO VALUES(DEFAULT,1,1, 'MARCELA', 'GOZO','1234567891', CURRENT_DATE);
INSERT INTO EMPLEADO VALUES(DEFAULT,2,1, 'LORENZO', 'PARRALES','9876543210', CURRENT_DATE);
INSERT INTO EMPLEADO VALUES(DEFAULT,3,1, 'ANDRES', 'MENDOZA','45612378900', CURRENT_DATE);
INSERT INTO EMPLEADO VALUES(DEFAULT,3,1, 'LEONARDO', 'TOALA','7891234560', CURRENT_DATE);
INSERT INTO EMPLEADO VALUES(DEFAULT,4,1, 'CARLOS', 'MOYA','1472583690', CURRENT_DATE);


INSERT INTO HABITACION VALUES(DEFAULT,1,1,NULL,'1',TRUE,FALSE);
INSERT INTO HABITACION VALUES(DEFAULT,1,1,NULL,'2',FALSE,TRUE);
INSERT INTO HABITACION VALUES(DEFAULT,1,2,NULL,'3',FALSE,TRUE);
INSERT INTO HABITACION VALUES(DEFAULT,1,3,NULL,'4',TRUE,TRUE);
INSERT INTO HABITACION VALUES(DEFAULT,1,4,NULL,'5',TRUE,TRUE);


INSERT INTO aparcamiento VALUES (DEFAULT, 1,1,1);
UPDATE HABITACION SET aparcamiento_ID = 1 WHERE habitacion_id = 1;

INSERT INTO MOBILIARIO VALUES(DEFAULT,1,1,1,'SILLON GRANDE', 1000, TRUE);
INSERT INTO MOBILIARIO VALUES(DEFAULT,2,1,1,'CAMA KING SIZE', 2000, TRUE);
INSERT INTO MOBILIARIO VALUES(DEFAULT,3,1,1,'PANTALLA PLANA 45"', 1500, TRUE);
INSERT INTO MOBILIARIO VALUES(DEFAULT,4,1,1,'ESCRITORIO DE LUJO', 450, TRUE);
INSERT INTO MOBILIARIO VALUES(DEFAULT,5,1,1,'SILLA DE MADERA PREMIUM', 250, TRUE);
INSERT INTO MOBILIARIO VALUES(DEFAULT,6,1,1,'LAMPARA DE LUJO', 170, TRUE);
INSERT INTO MOBILIARIO VALUES(DEFAULT,7,1,1,'TELEFONO CONVENCIONAL', 40, TRUE);
INSERT INTO MOBILIARIO VALUES(DEFAULT,8,1,1,'SECADOR DE PELO 2000', 100, TRUE);
INSERT INTO MOBILIARIO VALUES(DEFAULT,9,1,1,'ROUTER DLINK 5G 100GB', 125, TRUE);

INSERT INTO MOBILIARIO VALUES(DEFAULT,2,2,1,'CAMA 2 PLAZAS', 500, TRUE);
INSERT INTO MOBILIARIO VALUES(DEFAULT,3,2,1,'PANTALLA LCD 25"', 300, TRUE);
INSERT INTO MOBILIARIO VALUES(DEFAULT,4,2,1,'ESCRITORIO MEDIANO', 250, TRUE);
INSERT INTO MOBILIARIO VALUES(DEFAULT,5,2,1,'SILLA DE MADERA NORMAL', 100, TRUE);
INSERT INTO MOBILIARIO VALUES(DEFAULT,6,2,1,'LAMPARA PARA NOCHE', 50, TRUE);
INSERT INTO MOBILIARIO VALUES(DEFAULT,12,2,1,'VELADOR COMUN', 130, TRUE);
INSERT INTO MOBILIARIO VALUES(DEFAULT,10,2,1,'COMODA COMUN', 50, TRUE);
INSERT INTO MOBILIARIO VALUES(DEFAULT,11,2,1,'MESA DE MADERA',60, TRUE);

INSERT INTO MOBILIARIO VALUES(DEFAULT,2,NULL,1,'CAMA KING SIZE', 2000, FALSE);
INSERT INTO MOBILIARIO VALUES(DEFAULT,3,NULL,1,'PANTALLA PLANA 45"', 1500, FALSE);
INSERT INTO MOBILIARIO VALUES(DEFAULT,4,NULL,1,'ESCRITORIO DE LUJO', 450, FALSE);
INSERT INTO MOBILIARIO VALUES(DEFAULT,5,NULL,1,'SILLA DE MADERA PREMIUM', 250, FALSE);
INSERT INTO MOBILIARIO VALUES(DEFAULT,6,NULL,1,'LAMPARA DE LUJO', 170, FALSE);
INSERT INTO MOBILIARIO VALUES(DEFAULT,7,NULL,1,'SILLA DE MADERA PREMIUM', 40, FALSE);
INSERT INTO MOBILIARIO VALUES(DEFAULT,8,NULL,1,'SECADOR DE PELO 2000', 100, FALSE);
INSERT INTO MOBILIARIO VALUES(DEFAULT,9,NULL,1,'ROUTER DLINK 5G 100GB', 125, FALSE);


INSERT INTO acto_vandalico VALUES(DEFAULT, 1, 4,1,CURRENT_DATE, 'SE RAYO LA MESA CON UNA NAVAJA');
INSERT INTO acto_vandalico VALUES(DEFAULT, 1, 3,1,CURRENT_DATE, 'SE ROMPIO LA TELEVISION');


INSERT INTO estancia VALUES(DEFAULT,1,1,1,1,'2020/12/05 13:00','2021/01/15 15:00', 3000, TRUE, TRUE);
INSERT INTO estancia VALUES(DEFAULT,1,2,1,1,'2018/12/05 15:00','2018/12/20 18:00', 1500, TRUE, FALSE);
INSERT INTO estancia VALUES(DEFAULT,1,3,1,1,'2019/04/05 14:00','2019/05/15 20:00', 1000, FALSE, FALSE);
INSERT INTO estancia VALUES(DEFAULT,1,1,1,1,'2021/02/05 09:00','2021/04/25 08:00', 4000, FALSE, TRUE);
INSERT INTO estancia VALUES(DEFAULT,1,1,1,1,'2019/01/03 09:00','2019/03/14 08:00', 2000, TRUE, FALSE);


INSERT INTO solicitud_servicio VALUES(DEFAULT,1,1,5,FALSE,TRUE);
INSERT INTO solicitud_servicio VALUES(DEFAULT,2,1,2,FALSE,FALSE);
INSERT INTO solicitud_servicio VALUES(DEFAULT,3,1,4,FALSE,TRUE);
INSERT INTO solicitud_servicio VALUES(DEFAULT,3,1,3,FALSE,TRUE);
INSERT INTO solicitud_servicio VALUES(DEFAULT,3,4,4,FALSE,TRUE);
INSERT INTO solicitud_servicio VALUES(DEFAULT,3,4,4,FALSE,TRUE);
INSERT INTO solicitud_servicio VALUES(DEFAULT,2,2,2,FALSE,TRUE);




SELECT
    cliente.cliente_nombre as nombre,
    cliente.cliente_apellido as apellido,
    habitacion.habitacion_numero as numero_habitacion,
    estancia.estancia_fecha_llegada as fecha_llegada,
    estancia.estancia_fecha_salida as fecha_salida
from estancia
inner join cliente on cliente.cliente_id = estancia.cliente_id
inner join habitacion on habitacion.habitacion_id = estancia.habitacion_id
WHERE estancia.estancia_estado_completado = true and estancia.estancia_estado_solicitado = true;



SELECT
    cliente.cliente_nombre as nombre,
    cliente.cliente_apellido as apellido,
    count(estancia) as estancias_completadas

from estancia
    inner join cliente on cliente.cliente_id = estancia.cliente_id
    inner join habitacion on habitacion.habitacion_id = estancia.habitacion_id
    WHERE estancia.estancia_estado_completado = true and estancia.estancia_estado_solicitado = false
    group by cliente.cliente_nombre, cliente.cliente_apellido 
    order by estancias_completadas limit 1;

SELECT 
    HOTEL.hotel_nombre AS NOMBRE_HOTEL,
    COUNT(mobiliario) as mobiliarios_bodega,
    sum(mobiliario.mobiliario_precio) as valor_total_mobiliarios
FROM mobiliario
    INNER JOIN HOTEL ON HOTEL.hotel_id  = mobiliario.hotel_id
    WHERE mobiliario.mobiliario_estado =false
    group by hotel.hotel_nombre;

SELECT 
   empleado.empleado_nombre AS NOMBRE,
   empleado.empleado_apellido AS APELIIDO,
    servicio.servicio_descripcion AS SERVICIO,
   COUNT(solicitud_servicio) AS VECES_REALIZADAS

FROM solicitud_servicio
    INNER JOIN EMPLEADO ON empleado.empleado_id = solicitud_servicio.empleado_id
    INNER JOIN SERVICIO ON servicio.servicio_id = solicitud_servicio.servicio_id
    WHERE solicitud_servicio.solicitud_servicio_est_comp= TRUE 

    GROUP BY  empleado.empleado_nombre, empleado.empleado_apellido, servicio.servicio_descripcion
    order by VECES_REALIZADAS DESC LIMIT 1
    


