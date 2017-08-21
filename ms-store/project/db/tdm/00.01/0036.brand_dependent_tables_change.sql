-- TDM_LINKS
TRUNCATE TDM_LINKS;
ALTER TABLE TDM_LINKS DROP INDEX PKEY1;
ALTER TABLE TDM_LINKS DROP INDEX PKEY2;
ALTER TABLE TDM_LINKS DROP PRIMARY KEY;

ALTER TABLE TDM_LINKS DROP PKEY1, DROP PKEY2;

ALTER TABLE  TDM_LINKS CHANGE  BKEY1  BRAND_ID1 INT( 11 ) NOT NULL ;
ALTER TABLE  TDM_LINKS CHANGE  BKEY2  BRAND_ID2 INT( 11 ) NOT NULL ;

ALTER TABLE  TDM_LINKS ADD PRIMARY KEY ( BRAND_ID1 , AKEY1 , BRAND_ID2 , AKEY2 ) COMMENT  '';

-- TDM_LINKS_TMP
CREATE TABLE IF NOT EXISTS `TDM_LINKS_TMP` (
  `BRAND_ID1` int(11) NOT NULL,
  `AKEY1` varchar(32) NOT NULL,
  `BRAND_ID2` int(11) NOT NULL,
  `AKEY2` varchar(32) NOT NULL,
  `SIDE` int(1) NOT NULL,
  `CODE` varchar(32) NOT NULL,
  `STATUS` int(11) NOT NULL DEFAULT '0',
  `TIMER` int(11) DEFAULT NULL,
  PRIMARY KEY (`BRAND_ID1`,`AKEY1`,`BRAND_ID2`,`AKEY2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- TDM_PRICES
DROP TRIGGER IF EXISTS `InsertPrice`;
DROP TRIGGER IF EXISTS `UpdatePrice`;

ALTER TABLE  TDM_PRICES DROP  BKEY ;
ALTER TABLE  TDM_PRICES CHANGE  BRAND  BRAND_ID INT( 11 ) NOT NULL ;

DELIMITER $$
CREATE TRIGGER `InsertPrice` BEFORE INSERT ON TDM_PRICES
 FOR EACH ROW BEGIN 
SET NEW.PHID = MD5( CONCAT(NEW.AKEY, NEW.ARTICLE, NEW.ALT_NAME, NEW.BRAND_ID, NEW.PRICE, NEW.TYPE, NEW.CURRENCY, NEW.DAY, NEW.AVAILABLE, NEW.SUPPLIER, NEW.STOCK, NEW.OPTIONS, NEW.CODE, NEW.DATE ) ) ;

SET NEW.STATIC_MD5 = MD5( CONCAT(NEW.AKEY, NEW.ARTICLE, NEW.BRAND_ID, NEW.SUPPLIER, NEW.STOCK, NEW.CODE, NEW.SUPPLIER_OPTIONS ) ) ;

SET NEW.DYNAMIC_MD5 = MD5( CONCAT( NEW.DAY, NEW.PRICE, NEW.AVAILABLE, NEW.CURRENCY ) ) ;

END $$

CREATE TRIGGER `UpdatePrice` BEFORE UPDATE ON TDM_PRICES
 FOR EACH ROW BEGIN SET NEW.PHID = MD5( CONCAT( NEW.AKEY, NEW.ARTICLE, NEW.ALT_NAME, NEW.BRAND_ID, NEW.PRICE, NEW.TYPE, NEW.CURRENCY, NEW.DAY, NEW.AVAILABLE, NEW.SUPPLIER, NEW.STOCK, NEW.OPTIONS, NEW.CODE, NEW.DATE ) ) ;

SET NEW.DYNAMIC_MD5 = MD5( CONCAT( NEW.DAY, NEW.PRICE, NEW.AVAILABLE, NEW.CURRENCY ) ) ;

END $$
DELIMITER ;

-- TDM_WS_ANALOG_TIME2
TRUNCATE TDM_WS_ANALOG_TIME2;
ALTER TABLE TDM_WS_ANALOG_TIME2 DROP PRIMARY KEY;
ALTER TABLE TDM_WS_ANALOG_TIME2 CHANGE  BRAND  BRAND_ID INT( 11 ) NOT NULL ;
ALTER TABLE TDM_WS_ANALOG_TIME2 ADD PRIMARY KEY ( WSID , BRAND_ID , AKEY ) ;

-- TDM_WS_TIME2
TRUNCATE TDM_WS_TIME2;
ALTER TABLE TDM_WS_TIME2 DROP PRIMARY KEY;
ALTER TABLE TDM_WS_TIME2 CHANGE  BRAND  BRAND_ID INT( 11 ) NOT NULL ;
ALTER TABLE TDM_WS_TIME2 ADD PRIMARY KEY ( WSID , BRAND_ID , AKEY ) ;