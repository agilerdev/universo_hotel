-- PASAR EL NOMBRE DEL PAIS Y QUE DEVUELVA LOS HOTELES CON SU RESPECTIVA CIUDAD Y EL NUMERO DE EMPLEADOS QUE TIENE
create or replace function obtener_datos_hotel(
    IN  hotelnombre varchar,
    OUT empleados bigint,
    OUT estancias bigint
)
as $BODY$
begin
select count(distinct empleado.empleado_id), count(distinct estancia.estancia_id) into empleados,estancias
from hotel 
inner join estancia on estancia.hotel_id = hotel.hotel_id
inner join empleado on empleado.hotel_id = hotel.hotel_id
 where hotel.hotel_nombre = hotelnombre;
end
$BODY$ 
language plpgsql;
