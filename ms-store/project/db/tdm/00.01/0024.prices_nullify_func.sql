DROP PROCEDURE IF EXISTS `pricesNullify` ;

DELIMITER $$
CREATE PROCEDURE  `pricesNullify` ( IN  `inBKEY` VARCHAR( 64 ) , IN  `inAKEY` VARCHAR( 64 ) , IN  `inCODE` VARCHAR( 32 ) , IN  `inTIME` VARCHAR( 10 ) ) NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER BEGIN UPDATE TDM_PRICES SET AVAILABLE =  '0',
DAY =  '0',
PRICE =  '0',
PRICE_ORIG =  '0',
PRICE_SUPP =  '0',
DATE = inTIME WHERE BKEY = inBKEY AND AKEY = inAKEY AND CODE = inCODE;

CALL pricesGroupNullify(
inBKEY, inAKEY, inCODE
);

END $$
DELIMITER ;