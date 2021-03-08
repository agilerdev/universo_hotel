-- CLIENTES CON ESTANCIAS ACTIVAS EN EL HOTEL CON SU FECHA DE LLEGADA FECHA DE SALIDA Y EL NUMERO DE HABITACION EN EL QUE ESTAN



 do $$
declare

        tabla record;
        clientes cursor for select cliente.cliente_nombre as cliente,
							estancia.estancia_fecha_llegada as llegada,
							estancia.estancia_fecha_salida as salida,
							habitacion.habitacion_numero as habitacion_numero
							from cliente
							inner join estancia on estancia.cliente_id = cliente.cliente_id
							inner join habitacion on habitacion.habitacion_id = estancia.habitacion_id
							WHERE estancia.estancia_estado_completado = true and estancia.estancia_estado_solicitado =true;
begin
open clientes;
fetch clientes into tabla;
while(found) loop
Raise notice 'Nombre del cliente: %, Fecha de llegada:  %, Fecha de salida: %, Número de habitación: %', tabla.cliente, tabla.llegada, tabla.salida, tabla.habitacion_numero;
fetch clientes into tabla;
end loop;
end $$
language 'plpgsql';