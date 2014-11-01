


DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_CantidadAlumnos`(
  OUT  `cantidadalumnos`  int,
  OUT  `alumnos`          int
)
begin
set cantidadalumnos:=1;
set alumnos:= (select count(*) from alumno);
end$$



CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Entidad`(IN `id_identidad` VARCHAR(20))
begin
     if (isnumeric(id_identidad)) or IFNULL(id_identidad,true)
     then
        select @rownum:=@rownum+1 as 'Nro', `Razon Social` ,RUC,Direccion,Telefono,`Cantidad Transaccion`,
          `Cantidad Producto Diferente`,`Primera Transaccion`,`Ultima Transaccion`,
          Fn_SeparadorMiles(Monto) as Monto,Fn_MontoLetras(Monto,'guaranies') as Letras 
          from (
          select en.nroentidad as NroEntidad,razonsocial as 'Razon Social',ruc as RUC,direccion as Direccion,telefono as Telefono,
          count(tr.nrotransaccion) as 'Cantidad Transaccion',
          count(distinct detr.nroitem) as 'Cantidad Producto Diferente',
          Fn_Fecha(min(tr.fecha),0) as 'Primera Transaccion',
          Fn_Fecha(max(tr.fecha),0) as 'Ultima Transaccion',
          `Fn_Monto`(en.nroentidad) as Monto
          from entidad en
          left outer join transaccion tr on en.nroentidad=tr.nroentidad
          left outer join detalletransaccion detr on detr.nroentidad=tr.nroentidad 
          and detr.nrotransaccion=tr.nrotransaccion
          group by RazonSocial,RUC,Direccion,Telefono) as tabla, (SELECT @rownum:=0) R  
          where NroEntidad=IFNULL(id_identidad,NroEntidad);
          
     elseif (upper(id_identidad)= 'ENTIDAD')
     then
          select * from entidad en order by en.razonsocial;
     end if;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_IngresoUsuario`(
  IN   `Usuario`  varchar(20),
  IN   `Clave`    varchar(20),
  OUT  `id`       smallint(5),
  OUT  `mensaje`  varchar(50),
  OUT  `retorno`  tinyint
)
begin
     set id = -1;
     set mensaje = '';
     set retorno = 0;
     
     if ifnull(Usuario,True) = true  or ifnull(Clave,true) = true
     then
         
         set Mensaje='El usuario o la contrasenia son nulos. Verifique';
     else
         
         set ID:=(ifnull((select u.id from usuarios u where u.usuario=Usuario and u.clave=md5(Clave) and estado=1),-1));
        
        if (ID = -1)
        then
            set Mensaje='Controle su usuario y contrasenia';
        else
            set Mensaje='Logueado';
            set Retorno = 1;
        end if;
     end if;
     
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_InsAlumno`(IN Nombre varchar(20),IN Apellido varchar(20), IN Comentario varchar(250),
IN Profecion varchar(20), IN Mail varchar(30), IN Programar bool, IN Sexo char(1))
insert into alumno(Nombre,Apellido,Comentario,Profecion,Mail,Programar,Sexo) 
	values (Nombre,Apellido,Comentario,Profecion,Mail,Programar,Sexo)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_InsUsuario`(
  IN  `Usuario`  varchar(20),
  IN  `Clave`    varchar(20)
)
begin
     
     declare Mensaje varchar(50) default '';
     declare ID SMALLINT(5) default -1;
     declare Retorno TINYINT default 0;
     
     if ifnull(Usuario,True) = true or ifnull(Clave,true)=true
     then
         set Mensaje='El usuario o la contrasenia son nulos. Verifique';
     else
         
        if (select id from usuarios u where u.usuario=Usuario) is not null
        then
            set Mensaje='Otro usuario con esa descripcion ya existe';
        else
            
            insert into usuarios (usuario,clave) values (Usuario,Clave);
            
            set ID= `last_insert_id`();
            set Retorno = 1;
            set Mensaje='Insertado';
        end if;
     end if;
     select ID,Mensaje,Retorno;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_ProcedimientoTransaccion`(in value int,out value2 int)
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION rollback;
declare exit handler for not found rollback;
declare exit handler for sqlwarning rollback;
START TRANSACTION;

set value2 ='-1';
INSERT INTO  `prueba`.`alumno` (`NroAlumno` ,`Nombre` ,`Apellido` ,`Comentario` ,`Profecion` ,`Mail` ,`Programar` ,`Sexo`)
VALUES (NULL ,  'prueba',  'prueba1',  'dasfsdfsdsdf',  'sdlfkjskdjfh',  'mihares@gmail.com',  '1',  'h');

INSERT INTO  `prueba`.`alumno` (`NroAlumno` ,`Nombre` ,`Apellido` ,`Comentario` ,`Profecion` ,`Mail` ,`Programar` ,`Sexo`)
VALUES (2,  'prueba',  'prueba1',  'dasfsdfsdsdf',  'sdlfkjskdjfh',  'mihares@gmail.com',  '1',  'h');
set value2 ='1';


COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_SlcAlumno`(
  IN `NroAlumno` int
)
begin
select * from alumno as a where a.NroAlumno=nroalumno;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_SlcEvento`()
begin

select * from evento;


end$$




CREATE DEFINER=`root`@`localhost` FUNCTION `Fn_Monto`( NroEntidad INT) RETURNS decimal(20,5)
    DETERMINISTIC
BEGIN
   	      return (select IFNULL(round(sum(tabla.monto)),0) from (select dt.nroentidad,dt.nroitem,ifnull(sum(cantidad)* it.costo,0) as monto
          from detalletransaccion dt join item it on it.nroentidad=dt.nroentidad and it.nroitem=dt.nroitem
          group by dt.nroitem,dt.nroentidad) as tabla where tabla.nroentidad=NroEntidad);
 
    END$$


-- --------------------------------------------------------

