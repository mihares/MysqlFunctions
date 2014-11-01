
CREATE DEFINER=`root`@`localhost` FUNCTION `Fn_HTML_UnEncode`(x VARCHAR(255)) RETURNS varchar(255) CHARSET latin1
    DETERMINISTIC
BEGIN 

DECLARE TextString VARCHAR(255) ; 
SET TextString = x ; 

IF INSTR( x , '&quot;' ) 
THEN SET TextString = REPLACE(TextString, '&quot;','"') ; 
END IF ; 

IF INSTR( x , '&apos;' ) 
THEN SET TextString = REPLACE(TextString, '&apos;','"') ; 
END IF ; 

IF INSTR( x , '&amp;' ) 
THEN SET TextString = REPLACE(TextString, '&amp;','&') ; 
END IF ; 

IF INSTR( x , '&lt;' ) 
THEN SET TextString = REPLACE(TextString, '&lt;','<') ; 
END IF ; 

IF INSTR( x , '&gt;' ) 
THEN SET TextString = REPLACE(TextString, '&gt;','>') ; 
END IF ; 

IF INSTR( x , '&nbsp;' ) 
THEN SET TextString = REPLACE(TextString, '&nbsp;',' ') ; 
END IF ; 

IF INSTR( x , '&iexcl;' ) 
THEN SET TextString = REPLACE(TextString, '&iexcl;','¡') ; 
END IF ; 

IF INSTR( x , '&cent;' ) 
THEN SET TextString = REPLACE(TextString, '&cent;','¢') ; 
END IF ; 

IF INSTR( x , '&pound;' ) 
THEN SET TextString = REPLACE(TextString, '&pound;','£') ; 
END IF ; 

IF INSTR( x , '&curren;' ) 
THEN SET TextString = REPLACE(TextString, '&curren;','¤') ; 
END IF ; 

IF INSTR( x , '&yen;' ) 
THEN SET TextString = REPLACE(TextString, '&yen;','¥') ; 
END IF ; 

IF INSTR( x , '&brvbar;' ) 
THEN SET TextString = REPLACE(TextString, '&brvbar;','¦') ; 
END IF ; 

IF INSTR( x , '&sect;' ) 
THEN SET TextString = REPLACE(TextString, '&sect;','§') ; 
END IF ; 

IF INSTR( x , '&uml;' ) 
THEN SET TextString = REPLACE(TextString, '&uml;','¨') ; 
END IF ; 

IF INSTR( x , '&copy;' ) 
THEN SET TextString = REPLACE(TextString, '&copy;','©') ; 
END IF ; 

IF INSTR( x , '&ordf;' ) 
THEN SET TextString = REPLACE(TextString, '&ordf;','ª') ; 
END IF ; 

IF INSTR( x , '&laquo;' ) 
THEN SET TextString = REPLACE(TextString, '&laquo;','«') ; 
END IF ; 

IF INSTR( x , '&not;' ) 
THEN SET TextString = REPLACE(TextString, '&not;','¬') ; 
END IF ; 

IF INSTR( x , '&shy;' ) 
THEN SET TextString = REPLACE(TextString, '&shy;','­') ; 
END IF ; 

IF INSTR( x , '&reg;' ) 
THEN SET TextString = REPLACE(TextString, '&reg;','®') ; 
END IF ; 

IF INSTR( x , '&macr;' ) 
THEN SET TextString = REPLACE(TextString, '&macr;','¯') ; 
END IF ; 

IF INSTR( x , '&deg;' ) 
THEN SET TextString = REPLACE(TextString, '&deg;','°') ; 
END IF ; 

IF INSTR( x , '&plusmn;' ) 
THEN SET TextString = REPLACE(TextString, '&plusmn;','±') ; 
END IF ; 

IF INSTR( x , '&sup2;' ) 
THEN SET TextString = REPLACE(TextString, '&sup2;','²') ; 
END IF ; 

IF INSTR( x , '&sup3;' ) 
THEN SET TextString = REPLACE(TextString, '&sup3;','³') ; 
END IF ; 

IF INSTR( x , '&acute;' ) 
THEN SET TextString = REPLACE(TextString, '&acute;','´') ; 
END IF ; 

IF INSTR( x , '&micro;' ) 
THEN SET TextString = REPLACE(TextString, '&micro;','µ') ; 
END IF ; 

IF INSTR( x , '&para;' ) 
THEN SET TextString = REPLACE(TextString, '&para;','¶') ; 
END IF ; 

IF INSTR( x , '&middot;' ) 
THEN SET TextString = REPLACE(TextString, '&middot;','·') ; 
END IF ; 

IF INSTR( x , '&cedil;' ) 
THEN SET TextString = REPLACE(TextString, '&cedil;','¸') ; 
END IF ; 

IF INSTR( x , '&sup1;' ) 
THEN SET TextString = REPLACE(TextString, '&sup1;','¹') ; 
END IF ; 

IF INSTR( x , '&ordm;' ) 
THEN SET TextString = REPLACE(TextString, '&ordm;','º') ; 
END IF ; 

IF INSTR( x , '&raquo;' ) 
THEN SET TextString = REPLACE(TextString, '&raquo;','»') ; 
END IF ; 

IF INSTR( x , '&frac14;' ) 
THEN SET TextString = REPLACE(TextString, '&frac14;','¼') ; 
END IF ; 

IF INSTR( x , '&frac12;' ) 
THEN SET TextString = REPLACE(TextString, '&frac12;','½') ; 
END IF ; 

IF INSTR( x , '&frac34;' ) 
THEN SET TextString = REPLACE(TextString, '&frac34;','¾') ; 
END IF ; 

IF INSTR( x , '&iquest;' ) 
THEN SET TextString = REPLACE(TextString, '&iquest;','¿') ; 
END IF ; 

IF INSTR( x , '&times;' ) 
THEN SET TextString = REPLACE(TextString, '&times;','×') ; 
END IF ; 

IF INSTR( x , '&divide;' ) 
THEN SET TextString = REPLACE(TextString, '&divide;','÷') ; 
END IF ; 

IF INSTR( x , '&Agrave;' ) 
THEN SET TextString = REPLACE(TextString, '&Agrave;','À') ; 
END IF ; 

IF INSTR( x , '&Aacute;' ) 
THEN SET TextString = REPLACE(TextString, '&Aacute;','Á') ; 
END IF ; 

IF INSTR( x , '&Acirc;' ) 
THEN SET TextString = REPLACE(TextString, '&Acirc;','Â') ; 
END IF ; 

IF INSTR( x , '&Atilde;' ) 
THEN SET TextString = REPLACE(TextString, '&Atilde;','Ã') ; 
END IF ; 

IF INSTR( x , '&Auml;' ) 
THEN SET TextString = REPLACE(TextString, '&Auml;','Ä') ; 
END IF ; 

IF INSTR( x , '&Aring;' ) 
THEN SET TextString = REPLACE(TextString, '&Aring;','Å') ; 
END IF ; 

IF INSTR( x , '&AElig;' ) 
THEN SET TextString = REPLACE(TextString, '&AElig;','Æ') ; 
END IF ; 

IF INSTR( x , '&Ccedil;' ) 
THEN SET TextString = REPLACE(TextString, '&Ccedil;','Ç') ; 
END IF ; 

IF INSTR( x , '&Egrave;' ) 
THEN SET TextString = REPLACE(TextString, '&Egrave;','È') ; 
END IF ; 

IF INSTR( x , '&Eacute;' ) 
THEN SET TextString = REPLACE(TextString, '&Eacute;','É') ; 
END IF ; 

IF INSTR( x , '&Ecirc;' ) 
THEN SET TextString = REPLACE(TextString, '&Ecirc;','Ê') ; 
END IF ; 

IF INSTR( x , '&Euml;' ) 
THEN SET TextString = REPLACE(TextString, '&Euml;','Ë') ; 
END IF ; 

IF INSTR( x , '&Igrave;' ) 
THEN SET TextString = REPLACE(TextString, '&Igrave;','Ì') ; 
END IF ; 

IF INSTR( x , '&Iacute;' ) 
THEN SET TextString = REPLACE(TextString, '&Iacute;','Í') ; 
END IF ; 

IF INSTR( x , '&Icirc;' ) 
THEN SET TextString = REPLACE(TextString, '&Icirc;','Î') ; 
END IF ; 

IF INSTR( x , '&Iuml;' ) 
THEN SET TextString = REPLACE(TextString, '&Iuml;','Ï') ; 
END IF ; 

IF INSTR( x , '&ETH;' ) 
THEN SET TextString = REPLACE(TextString, '&ETH;','Ð') ; 
END IF ; 

IF INSTR( x , '&Ntilde;' ) 
THEN SET TextString = REPLACE(TextString, '&Ntilde;','Ñ') ; 
END IF ; 

IF INSTR( x , '&Ograve;' ) 
THEN SET TextString = REPLACE(TextString, '&Ograve;','Ò') ; 
END IF ; 

IF INSTR( x , '&Oacute;' ) 
THEN SET TextString = REPLACE(TextString, '&Oacute;','Ó') ; 
END IF ; 

IF INSTR( x , '&Ocirc;' ) 
THEN SET TextString = REPLACE(TextString, '&Ocirc;','Ô') ; 
END IF ; 

IF INSTR( x , '&Otilde;' ) 
THEN SET TextString = REPLACE(TextString, '&Otilde;','Õ') ; 
END IF ; 

IF INSTR( x , '&Ouml;' ) 
THEN SET TextString = REPLACE(TextString, '&Ouml;','Ö') ; 
END IF ; 

IF INSTR( x , '&Oslash;' ) 
THEN SET TextString = REPLACE(TextString, '&Oslash;','Ø') ; 
END IF ; 

IF INSTR( x , '&Ugrave;' ) 
THEN SET TextString = REPLACE(TextString, '&Ugrave;','Ù') ; 
END IF ; 

IF INSTR( x , '&Uacute;' ) 
THEN SET TextString = REPLACE(TextString, '&Uacute;','Ú') ; 
END IF ; 

IF INSTR( x , '&Ucirc;' ) 
THEN SET TextString = REPLACE(TextString, '&Ucirc;','Û') ; 
END IF ; 

IF INSTR( x , '&Uuml;' ) 
THEN SET TextString = REPLACE(TextString, '&Uuml;','Ü') ; 
END IF ; 

IF INSTR( x , '&Yacute;' ) 
THEN SET TextString = REPLACE(TextString, '&Yacute;','Ý') ; 
END IF ; 

IF INSTR( x , '&THORN;' ) 
THEN SET TextString = REPLACE(TextString, '&THORN;','Þ') ; 
END IF ; 

IF INSTR( x , '&szlig;' ) 
THEN SET TextString = REPLACE(TextString, '&szlig;','ß') ; 
END IF ; 

IF INSTR( x , '&agrave;' ) 
THEN SET TextString = REPLACE(TextString, '&agrave;','à') ; 
END IF ; 

IF INSTR( x , '&aacute;' ) 
THEN SET TextString = REPLACE(TextString, '&aacute;','á') ; 
END IF ; 

IF INSTR( x , '&acirc;' ) 
THEN SET TextString = REPLACE(TextString, '&acirc;','â') ; 
END IF ; 

IF INSTR( x , '&atilde;' ) 
THEN SET TextString = REPLACE(TextString, '&atilde;','ã') ; 
END IF ; 

IF INSTR( x , '&auml;' ) 
THEN SET TextString = REPLACE(TextString, '&auml;','ä') ; 
END IF ; 

IF INSTR( x , '&aring;' ) 
THEN SET TextString = REPLACE(TextString, '&aring;','å') ; 
END IF ; 

IF INSTR( x , '&aelig;' ) 
THEN SET TextString = REPLACE(TextString, '&aelig;','æ') ; 
END IF ; 

IF INSTR( x , '&ccedil;' ) 
THEN SET TextString = REPLACE(TextString, '&ccedil;','ç') ; 
END IF ; 

IF INSTR( x , '&egrave;' ) 
THEN SET TextString = REPLACE(TextString, '&egrave;','è') ; 
END IF ; 

IF INSTR( x , '&eacute;' ) 
THEN SET TextString = REPLACE(TextString, '&eacute;','é') ; 
END IF ; 

IF INSTR( x , '&ecirc;' ) 
THEN SET TextString = REPLACE(TextString, '&ecirc;','ê') ; 
END IF ; 

IF INSTR( x , '&euml;' ) 
THEN SET TextString = REPLACE(TextString, '&euml;','ë') ; 
END IF ; 

IF INSTR( x , '&igrave;' ) 
THEN SET TextString = REPLACE(TextString, '&igrave;','ì') ; 
END IF ; 

IF INSTR( x , '&iacute;' ) 
THEN SET TextString = REPLACE(TextString, '&iacute;','í') ; 
END IF ; 

IF INSTR( x , '&icirc;' ) 
THEN SET TextString = REPLACE(TextString, '&icirc;','î') ; 
END IF ; 

IF INSTR( x , '&iuml;' ) 
THEN SET TextString = REPLACE(TextString, '&iuml;','ï') ; 
END IF ; 

IF INSTR( x , '&eth;' ) 
THEN SET TextString = REPLACE(TextString, '&eth;','ð') ; 
END IF ; 

IF INSTR( x , '&ntilde;' ) 
THEN SET TextString = REPLACE(TextString, '&ntilde;','ñ') ; 
END IF ; 

IF INSTR( x , '&ograve;' ) 
THEN SET TextString = REPLACE(TextString, '&ograve;','ò') ; 
END IF ; 

IF INSTR( x , '&oacute;' ) 
THEN SET TextString = REPLACE(TextString, '&oacute;','ó') ; 
END IF ; 

IF INSTR( x , '&ocirc;' ) 
THEN SET TextString = REPLACE(TextString, '&ocirc;','ô') ; 
END IF ; 

IF INSTR( x , '&otilde;' ) 
THEN SET TextString = REPLACE(TextString, '&otilde;','õ') ; 
END IF ; 

IF INSTR( x , '&ouml;' ) 
THEN SET TextString = REPLACE(TextString, '&ouml;','ö') ; 
END IF ; 

IF INSTR( x , '&oslash;' ) 
THEN SET TextString = REPLACE(TextString, '&oslash;','ø') ; 
END IF ; 

IF INSTR( x , '&ugrave;' ) 
THEN SET TextString = REPLACE(TextString, '&ugrave;','ù') ; 
END IF ; 

IF INSTR( x , '&uacute;' ) 
THEN SET TextString = REPLACE(TextString, '&uacute;','ú') ; 
END IF ; 

IF INSTR( x , '&ucirc;' ) 
THEN SET TextString = REPLACE(TextString, '&ucirc;','û') ; 
END IF ; 

IF INSTR( x , '&uuml;' ) 
THEN SET TextString = REPLACE(TextString, '&uuml;','ü') ; 
END IF ; 

IF INSTR( x , '&yacute;' ) 
THEN SET TextString = REPLACE(TextString, '&yacute;','ý') ; 
END IF ; 

IF INSTR( x , '&thorn;' ) 
THEN SET TextString = REPLACE(TextString, '&thorn;','þ') ; 
END IF ; 

IF INSTR( x , '&yuml;' ) 
THEN SET TextString = REPLACE(TextString, '&yuml;','ÿ') ; 
END IF ; 

RETURN TextString ; 

END$$