
--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `Fn_CalcularDigitoVerificador`(
  `p_numero` varchar(20)
) RETURNS decimal(20,0)
    DETERMINISTIC
begin

declare v_total int default 0;
declare v_resto int(2);
declare p_basemax int(2) default 11;

declare k int(2) default 2;
declare v_numero_aux int(1);
declare v_numero_al VARCHAR(30) default '';
declare v_caracter CHAR(1);
declare v_digit int(2) default 0;
declare i int default 1;

while  (i < length(p_numero) + 1)
do
	set v_caracter = UPPER(SUBSTRing(p_numero,i,1));
	IF ASCII(v_caracter) NOT BETWEEN 48 AND 57 
	then
				set v_numero_al = concat(v_numero_al,ASCII(v_caracter));
	ELSE
		set v_numero_al = concat(v_numero_al,v_caracter);
	end if;
	
	set i = i + 1;
END while;
set i = LENgth(v_numero_al);
while (i > 0)
do
    IF (k > p_basemax)
	then
		set k = 2;
	end if;
   
    set v_numero_aux = SUBSTRing(v_numero_al,i,1);
    set v_total = v_total + (v_numero_aux * k);
    set k = k + 1;
	set i = i - 1;
end while;

set v_resto = (v_total % p_basemax);
IF v_resto > 1
then
	set v_digit = p_basemax - v_resto;
eND if;

RETURN v_digit;

end$$

CREATE DEFINER=`root`@`localhost` FUNCTION `Fn_Fecha`(
  `Fecha`  datetime,
  `tipo`   tinyint(1)
) RETURNS varchar(50) CHARSET latin1
    DETERMINISTIC
begin
     declare Dia int;
     declare LetrasDia varchar(15);
     declare LetrasMes varchar(15);
     declare Anio int;
     declare FormatoFecha varchar(50);
     
     if Tipo = 1
     then
         
         set Dia = date_format(Fecha,'%d');
         set LetrasMes = date_format(Fecha,'%M');
         set Anio = date_format(Fecha,'%Y');
         set LetrasDia= date_format(Fecha,'%W');
         
         set FormatoFecha= concat_ws(' ',LetrasDia,',',Dia,LetrasMes,Anio);
     else
         
         set Dia= date_format(Fecha,'%d');
         set Anio= date_format(Fecha,'%Y');
         
         case date_format(Fecha,'%w')
              when 4 then set LetrasDia = 'Jueves';
              when 3 then set LetrasDia = 'Miercoles';
              when 2 then set LetrasDia = 'Martes';
              when 1 then set LetrasDia = 'Lunes';
              when 0 then set LetrasDia = 'Domingo';
              when 6 then set LetrasDia = 'Sabado';
              when 5 then set LetrasDia = 'Viernes';
         else
              
              set LetrasDia = null;
         end case;
         
         case date_format(Fecha,'%c')
              when 1 then set LetrasMes = 'Enero';
              when 2 then set LetrasMes = 'Febrero';
              when 3 then set LetrasMes = 'Marzo';
              when 4 then set LetrasMes = 'Abril';
              when 5 then set LetrasMes = 'Mayo';
              when 6 then set LetrasMes = 'Junio';
              when 7 then set LetrasMes = 'Julio';
              when 8 then set LetrasMes = 'Agosto';
              when 9 then set LetrasMes = 'Setiembre';
              when 10 then set LetrasMes = 'Octubre';
              when 11 then set LetrasMes = 'Noviembre';
              when 12 then set LetrasMes = 'Diciembre';
         else
              
              set LetrasMes = null;
         end case;
         
         set FormatoFecha= concat_ws(' ',LetrasDia,',',Dia,'de',LetrasMes,'de',Anio);
     end if;
     
     if ifnull(LetrasDia,true) or ifnull(LetrasMes,true)
     then
         return 'Sin Fecha';
     else
         return FormatoFecha;
     end if;
end$$