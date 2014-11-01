CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkeartabla`(in basedatos varchar(20))
begin
	/*varible que identifica cada tabla*/
	declare tabla varchar(50);
    /*bandera que identifica si hay filas o no*/
    DECLARE bandera INT DEFAULT 0;
    /*cursor*/
    DECLARE cu_cursortablas CURSOR FOR select TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA=basedatos;
    /* Flag que permitirá saber si existen más registros por recorrer */
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET bandera=1;
    /*abrir cursor*/  
    open cu_cursortablas;
    /*nombre del loop*/
    nombre: LOOP 
    	/*cargar la variable*/
    	FETCH cu_cursortablas INTO tabla;
        /*verificar la bandera*/
        IF (bandera=1) THEN
        	/*si es verdadero sale del cursor*/           
            LEAVE nombre;        
        END IF;
        /*la logica del cursor*/
   		SET @Query = concat('CHECK TABLE ',tabla,' EXTENDED;');
    	PREPARE smpt FROM @Query;
    	EXECUTE smpt;
    	DEALLOCATE PREPARE smpt;
        /*fin de la logica*/
	/*termina el recorrido del loop*/
	END LOOP nombre;
    /*cierra el cursor*/
	CLOSE cu_cursortablas;
    
END$$