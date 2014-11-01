
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_SQLDinamico`()
BEGIN
      SET @Query = 'select * from entidad';
    PREPARE smpt FROM @Query;
    EXECUTE smpt;
    DEALLOCATE PREPARE smpt;
END$$
