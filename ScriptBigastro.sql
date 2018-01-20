drop table LineaLugar;
drop table LineaProducto;
drop table Contrato;
drop table LugarDeVenta;
drop table Producto;
drop table Infraccion;
drop table Autorizacion;
drop table Persona;

create table Persona (
  NIF char(10),
  nombre char(20) not null,
  domicilio char(50) not null,
  carnetManipulador bit(1) not null,
  primary key (NIF)
  );

create table Autorizacion (
  auID char(10),
  NIF char(10),
  fechaValidez date not null,
  fechaUltimaVisita date,
  tipoventa bit(3) not null,
  extincion char(2),
  diasDeVenta bit(7) not null,
  primary key (auID),
  foreign key (NIF) references Persona(NIF)
);

create table Infraccion (
  inID char(10),
  auID char(10),
  tipoInf integer not null,
  motivo char(140) not null,
  refContrato char(100),
  fechaSuspension date,
  primary key (inID),
  foreign key (auID) references Autorizacion(auID)
);

create table Producto (
  nombre char(20),
  alimento boolean,
  precio real not null,
  primary key (nombre)
);

create table LugarDeVenta (
  direccion char(50),
  primary key (direccion)
);

create table Contrato (
  NIFa char(10),
  NIFb char(10),
  primary key (NIFa, NIFb),
  foreign key (NIFa) references Persona(NIF),
  foreign key (NIFb) references Persona(NIF)
);

create table LineaProducto (
  nombre char(20),
  auID char(10),
  primary key (nombre, auID),
  foreign key (nombre) references Producto(nombre),
  foreign key (auID) references Autorizacion(auID)
);

create table LineaLugar (
  direccion char(50),
  auID char(10),
  primary key (direccion, auID),
  foreign key (direccion) references LugarDeVenta(direccion),
  foreign key (auID) references Autorizacion(auID)
);

insert into Persona values ('12509000J','persona1','calle1', 0);
insert into Persona values ('12509001Z','persona2','calle1', 0);
insert into Persona values ('12509002S','persona3','calle1', 1);
insert into Persona values ('12509003Q','persona4','calle2', 1);
insert into Persona values ('12509004V','persona5','calle2', 0);
insert into Persona values ('12509005H','persona6','calle2', 1);
insert into Persona values ('12509006L','persona7','calle3', 0);
insert into Persona values ('12509007C','persona8','calle3', 1);
insert into Persona values ('12509008K','persona9','calle3', 1);
insert into Persona values ('12509009E','persona10','calle4', 1);
insert into Persona values ('12509010T','persona11','calle4', 0);
insert into Persona values ('1259000A','persona12','calle4', 1);
insert into Persona values ('1259001G','persona13','calle5', 1);
insert into Persona values ('1259002M','persona14','calle5', 0);
insert into Persona values ('1259003Y','persona15','calle5', 1);
insert into Persona values ('1259004F','persona16','calle6', 0);

insert into Autorizacion values ('auID1', '12509000J', '2018-12-12', '2017-11-10', b'001', null, b'0011011');
insert into Autorizacion values ('auID2', '12509001Z', '2018-11-23', '2017-11-9', b'010', null, b'1010101');
insert into Autorizacion values ('auID3', '12509002S', '2018-10-18', '2017-11-8', b'011', null, b'1101100');
insert into Autorizacion values ('auID4', '12509003Q', '2018-09-04', '2017-11-7', b'100', 'f', b'1110111');
insert into Autorizacion values ('auID5', '12509004V', '2018-08-06', '2017-11-6', b'101', null, b'1111111');
insert into Autorizacion values ('auID6', '12509005H', '2018-07-08', '2017-11-5', b'110', null, b'0101111');
insert into Autorizacion values ('auID7', '1259000A', '2018-05-13', '2017-11-4', b'111', null, b'0011111');
insert into Autorizacion values ('auID8', '1259001G', '2018-04-27', '2017-11-3', b'100', null, b'0111110');
insert into Autorizacion values ('auID9', '1259002M', '2018-03-19', '2017-11-2', b'100', null, b'0000011');
insert into Autorizacion values ('auID10', '1259003Y', '2018-12-15', null ,  b'101', null, b'0111011');
insert into Autorizacion values ('auID11', '1259004F', '2018-01-24', '2017-11-1', b'111', null, b'0011111');

insert into Infraccion values ('inID1', 'auID1', 1, 'Mala higiene personal', null, null);
insert into Infraccion values ('inID2', 'auID3', 2, 'Escandalo publico', null, null);
insert into Infraccion values ('inID3', 'auID4', 3, 'Documentacion falsa', 'refContrato3','2017-2-15');
insert into Infraccion values ('inID4', 'auID6', 1, 'Incumplimiento de horario', null, null);
insert into Infraccion values ('inID5', 'auID7', 1, 'Mala higiene personal', null, null);
insert into Infraccion values ('inID6', 'auID7', 2, 'Reincidencia de falta leve', null, null);

insert into Producto values ('Melon',"1",1.05);
insert into Producto values ('Pan',"1",5.00);
insert into Producto values ('Biblias',"0",2.00);
insert into Producto values ('Bollicao',"1",1.00);
insert into Producto values ('Katanas',"0",105.00);
insert into Producto values ('Patatas',"1",3.00);

insert into LugarDeVenta values ('Plaza Mayor');
insert into LugarDeVenta values ('Plaza Espania');
insert into LugarDeVenta values ('Calle Santiago');
insert into LugarDeVenta values ('Calle Manteria');
insert into LugarDeVenta values ('Calle Morena');

insert into Contrato values ('1259000A','12509000J');
insert into Contrato values ('1259003Y','12509001Z');
insert into Contrato values ('1259002M','12509001Z');
insert into Contrato values ('12509004V','12509005H');
insert into Contrato values ('12509004V','12509006L');
insert into Contrato values ('12509004V','12509002S');
insert into Contrato values ('12509003Q','12509009E');
insert into Contrato values ('12509010T','12509009E');

insert into LineaProducto values ('Melon','auID1');
insert into LineaProducto values ('Pan','auID2');
insert into LineaProducto values ('Biblias','auID3');
insert into LineaProducto values ('Bollicao','auID5');
insert into LineaProducto values ('Katanas','auID6');
insert into LineaProducto values ('Patatas','auID7');
insert into LineaProducto values ('Katanas','auID8');
insert into LineaProducto values ('Katanas','auID9');
insert into LineaProducto values ('Biblias','auID4');
insert into LineaProducto values ('Biblias','auID10');
insert into LineaProducto values ('Biblias','auID11');
insert into LineaProducto values ('Pan','auID11');
insert into LineaProducto values ('Patatas','auID1');
insert into LineaProducto values ('Bollicao','auID1');

insert into LineaLugar values ('Plaza Mayor','auID1');
insert into LineaLugar values ('Plaza Espania','auID2');
insert into LineaLugar values ('Plaza Mayor','auID3');
insert into LineaLugar values ('Plaza Mayor','auID4');
insert into LineaLugar values ('Plaza Espania','auID5');
insert into LineaLugar values ('Plaza Espania','auID6');
insert into LineaLugar values ('Calle Santiago','auID7');
insert into LineaLugar values ('Calle Santiago','auID8');
insert into LineaLugar values ('Calle Manteria','auID9');
insert into LineaLugar values ('Calle Morena','auID10');
insert into LineaLugar values ('Calle Manteria','auID11');
insert into LineaLugar values ('Calle Manteria','auID1');
insert into LineaLugar values ('Calle Manteria','auID4');

/* ---------------Consultas----------------------------*/

/*Personas juridicas*/
select P.nombre, P.NIF
from Persona P
where LENGTH(P.NIF) = 8;

/*Personas fisicas*/
select P.nombre, P.NIF
from Persona P
where LENGTH(P.NIF) = 9;

/*Dado un nif, obtener los productos que este puede vender*/
select LP.nombre
from Autorizacion A, LineaProducto LP
where A.NIF = '12509000J' and
   A.auid = LP.auid;

/*Las Autorizaciones con mas lugares de venta*/
select NL.auid, NL.nlu
from (select LL.auid, count(*) as nlu
       from LineaLugar LL
       group by LL.auid) NL
where NL.nlu >= ALL(select count(*) as nlu
                       from LineaLugar LL
                       group by LL.auid);

/*Dada una autorizacion se devuelve la cadena de bits que indica
los dias que se puede vender*/
select A.auID, BIN(A.diasDeVenta)
from Autorizacion A
where A.auID = 'auID1';

/*Personas contratadas por una persona*/
select C.NIFb
from Contrato C
where C.NIFa = '1259003Y';

/*Numero de productos que venden las personas juridicas ordenadas en orden descendente*/
select P.NIF, count(*) as nProductos
from Persona P, Autorizacion A, LineaProducto LP, Producto Pr
where LP.nombre = Pr.nombre and LP.auId = A.auId and A.NIF = P.NIF and Length(P.NIF)=8
group by P.NIF
order by nProductos desc;
