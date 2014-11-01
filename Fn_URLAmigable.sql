

CREATE DEFINER=`root`@`localhost` FUNCTION `Fn_URLAmigable`(
  `var` varchar(255)
) RETURNS varchar(255) CHARSET latin1
    DETERMINISTIC
begin
declare URL varchar(255) default '';
declare caracter char(1);
declare aux char(1);
declare i int(3) default 1;
declare texto varchar(255) default lower(Fn_HTML_UnEncode(var));
declare primercaracter TINYINT default 1;
while  (i < length(texto) + 1)
do
    set caracter = SUBSTRing(texto,i,1);
    IF ((ASCII(caracter) NOT BETWEEN 48 AND 57) and (ASCII(caracter) NOT BETWEEN 97 AND 122)) 
  then 
              set aux = case 
            when caracter = 'ñ' then 'n'
            when caracter = 'á' then 'a'
            when caracter = 'é' then 'e'
            when caracter = 'í' then 'i'
            when caracter = 'ó' then 'o'
            when caracter = 'ú' then 'u'
            when caracter = '-' then '-'
            when caracter = '+' then '-'
            when caracter = ' ' then '-'
            when caracter = '' then '-'
            when caracter = '_' then '_'
            else ''
       end;
              if ((ASCII(aux) NOT BETWEEN 48 AND 57) and (ASCII(aux) NOT BETWEEN 97 AND 122) and primercaracter=1)
       then
           set aux='';
       else
           set primercaracter = 0;
       end if;
  else
              set primercaracter = 0;
       set aux=caracter;
  end if;
  set URL= concat(URL,aux);
  set i = i + 1;
END while;
set primercaracter = 1;
REPEAT 
              set aux = SUBSTRing(URL,-1,1);
       if ((ASCII(aux) NOT BETWEEN 48 AND 57) and (ASCII(aux) NOT BETWEEN 97 AND 122))
       then
                      set URL = SUBSTRing(URL,1,length(URL)-1);
       else
           set primercaracter = 0;
       end if;
UNTIL primercaracter = 0 
END REPEAT;

return URL;
end$$