DELIMITER //
CREATE PROCEDURE `singleBrandUpdate`(IN i INT)
BEGIN

  DECLARE oldBrandName VARCHAR(100);
  DECLARE oldBKEY VARCHAR(100);
  
  SELECT SortBrands.BKEY, SortBrands.BRAND INTO oldBrandName, oldBKEY FROM
    (SELECT BRAND, BKEY	FROM TDM_PRICES	GROUP BY BINARY BRAND) as SortBrands
  LIMIT i,1;
  IF aliasCheck(oldBrandName)
  THEN
	BEGIN
	DECLARE newBrandName VARCHAR(100);
	DECLARE newBKEY VARCHAR(100);
	SET newBrandName = getParentFunc(oldBrandName);
	SET newBKEY = clearBrandFunc(newBrandName);
	UPDATE TDM_PRICES
	SET BRAND=newBrandName, BKEY=newBKEY
	WHERE BRAND=oldBrandName;
	UPDATE TDM_LINKS
	SET BKEY1=newBKEY,PKEY1=CONCAT(newBKEY,AKEY1)
	WHERE BKEY1=oldBKEY;
	UPDATE TDM_LINKS
	SET BKEY2=newBKEY,PKEY2=CONCAT(newBKEY,AKEY2)
	WHERE BKEY2=oldBKEY;
	END;
  ELSE
	CALL insertBrand(oldBrandName);
  END IF;

END; //
DELIMITER ;