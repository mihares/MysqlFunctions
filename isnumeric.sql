
CREATE DEFINER=`root`@`localhost` FUNCTION `isnumeric`( `myVal` varchar(1024) ) RETURNS tinyint(1)
    DETERMINISTIC
begin  return myVal REGEXP '^(-|\\+)?([0-9]+\\.[0-9]*|[0-9]*\\.[0-9]+|[0-9]+)$'; end$$