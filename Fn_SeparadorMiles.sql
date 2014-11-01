

CREATE DEFINER=`root`@`localhost` FUNCTION `Fn_SeparadorMiles`(
  `numero` numeric(12,0)
) RETURNS varchar(15) CHARSET latin1
    DETERMINISTIC
begin
     
     declare var varchar(15);
     
     declare nuevonumero varchar(50);
     
     declare result varchar(15);
     
     set nuevonumero:=numero;
     
     set result:=0;
     
     IF(length(nuevonumero)>3 && length(nuevonumero)<=12)
     then
         
         WHILE length(nuevonumero) > 3 DO
               
               set var:= substring(nuevonumero,-3,3);
               
               set nuevonumero:= substring(nuevonumero,length(nuevonumero) * -1,length(nuevonumero)-3);
                        
               set result:= concat('.',var,result);
         end while;
         
         set result:= concat(nuevonumero,result);
     else
         
         set result:=nuevonumero;
     end if;    
     RETURN result;  
end$$