
CREATE DEFINER=`root`@`localhost` FUNCTION `Fn_MontoLetras`(
  `xNumero`  numeric(20,2),
  `XMoneda`  varchar(100)
) RETURNS varchar(512) CHARSET latin1
    DETERMINISTIC
BEGIN 
DECLARE XlnEntero INT default FLOOR(XNumero); 
DECLARE XlcRetorno VARCHAR(512) default ''; 
DECLARE XlnTerna INT default 1; 
DECLARE XlcMiles VARCHAR(512); 
DECLARE XlcCadena VARCHAR(512); 
DECLARE XlnUnidades INT; 
DECLARE XlnDecenas INT; 
DECLARE XlnCentenas INT; 
DECLARE XlnFraccion INT default (XNumero - XlnEntero) * 100; 
DECLARE Xresultado varchar(512);

WHILE( XlnEntero > 0) DO 
              SET XlcCadena = '';
       SET XlnUnidades = MOD(XlnEntero,10); 
       SET XlnEntero = FLOOR(XlnEntero/10); 
       SET XlnDecenas = MOD(XlnEntero,10); 
       SET XlnEntero = FLOOR(XlnEntero/10);
       SET XlnCentenas = MOD(XlnEntero,10); 
       SET XlnEntero = FLOOR(XlnEntero/10); 
              SET XlcCadena = 
       CASE             WHEN XlnUnidades = 1 AND XlnTerna = 1 THEN CONCAT('UNO ', XlcCadena) 
            WHEN XlnUnidades = 1 AND XlnTerna <> 1 THEN CONCAT('UN ', XlcCadena) 
            WHEN XlnUnidades = 2 THEN CONCAT('DOS ', XlcCadena) 
            WHEN XlnUnidades = 3 THEN CONCAT('TRES ', XlcCadena) 
            WHEN XlnUnidades = 4 THEN CONCAT('CUATRO ', XlcCadena) 
            WHEN XlnUnidades = 5 THEN CONCAT('CINCO ', XlcCadena) 
            WHEN XlnUnidades = 6 THEN CONCAT('SEIS ', XlcCadena) 
            WHEN XlnUnidades = 7 THEN CONCAT('SIETE ', XlcCadena) 
            WHEN XlnUnidades = 8 THEN CONCAT('OCHO ', XlcCadena) 
            WHEN XlnUnidades = 9 THEN CONCAT('NUEVE ', XlcCadena) 
            ELSE XlcCadena 
       END;               SET XlcCadena = 
       CASE             WHEN XlnDecenas = 1 THEN 
            CASE XlnUnidades 
                 WHEN 0 THEN 'DIEZ ' 
                 WHEN 1 THEN 'ONCE ' 
                 WHEN 2 THEN 'DOCE ' 
                 WHEN 3 THEN 'TRECE ' 
                 WHEN 4 THEN 'CATORCE ' 
                 WHEN 5 THEN 'QUINCE' 
                 ELSE CONCAT('DIECI', XlcCadena) 
            END 
            WHEN XlnDecenas = 2 AND XlnUnidades = 0 THEN CONCAT('VEINTE ', XlcCadena) 
            WHEN XlnDecenas = 2 AND XlnUnidades <> 0 THEN CONCAT('VEINTI', XlcCadena) 
            WHEN XlnDecenas = 3 AND XlnUnidades = 0 THEN CONCAT('TREINTA ', XlcCadena) 
            WHEN XlnDecenas = 3 AND XlnUnidades <> 0 THEN CONCAT('TREINTA Y ', XlcCadena) 
            WHEN XlnDecenas = 4 AND XlnUnidades = 0 THEN CONCAT('CUARENTA ', XlcCadena) 
            WHEN XlnDecenas = 4 AND XlnUnidades <> 0 THEN CONCAT('CUARENTA Y ', XlcCadena) 
            WHEN XlnDecenas = 5 AND XlnUnidades = 0 THEN CONCAT('CINCUENTA ', XlcCadena) 
            WHEN XlnDecenas = 5 AND XlnUnidades <> 0 THEN CONCAT('CINCUENTA Y ', XlcCadena) 
            WHEN XlnDecenas = 6 AND XlnUnidades = 0 THEN CONCAT('SESENTA ', XlcCadena) 
            WHEN XlnDecenas = 6 AND XlnUnidades <> 0 THEN CONCAT('SESENTA Y ', XlcCadena) 
            WHEN XlnDecenas = 7 AND XlnUnidades = 0 THEN CONCAT('SETENTA ', XlcCadena) 
            WHEN XlnDecenas = 7 AND XlnUnidades <> 0 THEN CONCAT('SETENTA Y ', XlcCadena) 
            WHEN XlnDecenas = 8 AND XlnUnidades = 0 THEN CONCAT('OCHENTA ', XlcCadena) 
            WHEN XlnDecenas = 8 AND XlnUnidades <> 0 THEN CONCAT('OCHENTA Y ', XlcCadena) 
            WHEN XlnDecenas = 9 AND XlnUnidades = 0 THEN CONCAT('NOVENTA ', XlcCadena) 
            WHEN XlnDecenas = 9 AND XlnUnidades <> 0 THEN CONCAT('NOVENTA Y ', XlcCadena) 
            ELSE XlcCadena 
       END;               SET XlcCadena = 
           CASE                 WHEN XlnCentenas = 1 AND XlnUnidades = 0 AND XlnDecenas = 0 THEN CONCAT('CIEN ', XlcCadena) 
                WHEN XlnCentenas = 1 AND NOT(XlnUnidades = 0 AND XlnDecenas = 0) THEN CONCAT('CIENTO ', XlcCadena) 
                WHEN XlnCentenas = 2 THEN CONCAT('DOSCIENTOS ', XlcCadena) 
                WHEN XlnCentenas = 3 THEN CONCAT('TRESCIENTOS ', XlcCadena) 
                WHEN XlnCentenas = 4 THEN CONCAT('CUATROCIENTOS ', XlcCadena) 
                WHEN XlnCentenas = 5 THEN CONCAT('QUINIENTOS ', XlcCadena) 
                WHEN XlnCentenas = 6 THEN CONCAT('SEISCIENTOS ', XlcCadena) 
                WHEN XlnCentenas = 7 THEN CONCAT('SETECIENTOS ', XlcCadena) 
                WHEN XlnCentenas = 8 THEN CONCAT('OCHOCIENTOS ', XlcCadena) 
                WHEN XlnCentenas = 9 THEN CONCAT('NOVECIENTOS ', XlcCadena) 
                ELSE XlcCadena 
           END;               SET XlcCadena = 
           CASE                WHEN XlnTerna = 1 THEN XlcCadena 
               WHEN XlnTerna = 2 AND (XlnUnidades + XlnDecenas + XlnCentenas <> 0) THEN CONCAT(XlcCadena,  'MIL ') 
               WHEN XlnTerna = 3 AND (XlnUnidades + XlnDecenas + XlnCentenas <> 0) AND XlnUnidades = 1 AND XlnDecenas = 0 AND XlnCentenas = 0 THEN CONCAT(XlcCadena, 'MILLON ') 
               WHEN XlnTerna = 3 AND (XlnUnidades + XlnDecenas + XlnCentenas <> 0) AND NOT (XlnUnidades = 1 AND XlnDecenas = 0 AND XlnCentenas = 0) THEN CONCAT(XlcCadena, 'MILLONES ') 
               WHEN XlnTerna = 4 AND (XlnUnidades + XlnDecenas + XlnCentenas <> 0) THEN CONCAT(XlcCadena, 'MIL MILLONES ') 
               ELSE '' 
           END;               SET XlcRetorno = CONCAT(XlcCadena, XlcRetorno); 
       SET XlnTerna = XlnTerna + 1; 
END WHILE; 
IF XlnTerna = 1 THEN SET XlcRetorno = 'CERO'; END IF;
SET Xresultado = CONCAT(upper(XMoneda),' ',RTRIM(XlcRetorno));  
if XlnFraccion > 0 
then 
     
     SET Xresultado = CONCAT(Xresultado,' CON ', LTRIM(XlnFraccion), '/100');
end if;
RETURN trim(Xresultado); 

END$$