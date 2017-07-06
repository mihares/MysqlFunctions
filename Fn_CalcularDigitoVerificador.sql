
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

