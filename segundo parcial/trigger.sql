-- Trigger que no permita a un cliente tener mas estancias en el hotel si ha cometido mas de 2 vandalismos

create or replace function clientePermitido() returns trigger
as
$clientePermitido$
    declare
        instanciasVandalismo int;
begin

		select count(*) into instanciasVandalismo from acto_vandalico where cliente_id = new.cliente_id;
        if(instanciasVandalismo > 2) then
            raise exception 'Este cliente ha cometido más de dos vandalismos y no puede volver a tener estancias en el hotel';
        end if;
        return new;
end;
$clientePermitido$
language plpgsql;

create trigger clientePermitido before insert
on estancia for each row
execute procedure clientePermitido();