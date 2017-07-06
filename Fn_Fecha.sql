
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
