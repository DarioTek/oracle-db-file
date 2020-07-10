/*************************/
/* CREATE NEW POWER USER */
/*************************/
alter session set "_ORACLE_SCRIPT"=true;
create user TRADING_INVESTING identified by oracle;
--GRANT CONNECT, RESOURCE, DBA TO trading_investing;
GRANT CONNECT, RESOURCE TO trading_investing;
GRANT create session TO trading_investing;
GRANT create table TO trading_investing;
GRANT create view TO trading_investing;
GRANT create any trigger TO trading_investing;
GRANT create any procedure TO trading_investing;
GRANT create sequence TO trading_investing;
GRANT create synonym TO trading_investing;

-- To prevent ORA-01950: no privileges on tablespace error
GRANT UNLIMITED TABLESPACE TO trading_investing

-- Dropping User with admin privilege
alter session set "_ORACLE_SCRIPT"=true;
DROP USER trading_investing cascade;

-- Test connecting with the user credentials
connect trading_investing/oracle

-- Alter and unlock account
alter user fred identified by flintstone account unlock;

/*********************************************/
/* Create trading_investing.watch_list table */
/*********************************************/
--drop table trading_investing.watch_list

CREATE TABLE trading_investing.watch_list (
    watch_list_name   VARCHAR2(50 CHAR) NOT NULL,
    ticker_symbol     VARCHAR2(30 CHAR) NOT NULL
);

ALTER TABLE trading_investing.watch_list ADD CONSTRAINT watch_list_pk PRIMARY KEY ( watch_list_name,
                                                                                    ticker_symbol );

/*********************************************************/
/* Create trading_investing.load_historical_prices table */
/*********************************************************/

--drop table "TRADING_INVESTING.LOAD_HISTORICAL_PRICES"
--drop table "trading_investing.LOAD_HISTORICAL_PRICES"
/*
 * Not the drop statements above have quotes and is totally different without quotes.
 */ 

drop table trading_investing.LOAD_HISTORICAL_PRICES

CREATE TABLE trading_investing.LOAD_HISTORICAL_PRICES (
    record_date            DATE NOT NULL,
    open_price             NUMBER(21, 6),
    close_price            NUMBER(21, 6),
    high_price             NUMBER(21, 6),
    low_price              NUMBER(21, 6),
    adjusted_close_price   NUMBER(21, 6),
    volume                 NUMBER(21)
);

/****************************************************/
/* Create TRADING_INVESTING.HISTORICAL_PRICES table */
/****************************************************/
--drop table "TRADING_INVESTING.HISTORICAL_PRICES"
--drop table TRADING_INVESTING.HISTORICAL_PRICES
drop table trading_investing.HISTORICAL_PRICES

CREATE TABLE trading_investing.HISTORICAL_PRICES (
    symbol                 VARCHAR2(30 CHAR) NOT NULL,
    record_date            DATE NOT NULL,
    open_price             NUMBER(21, 6),
    close_price            NUMBER(21, 6),
    high_price             NUMBER(21, 6),
    low_price              NUMBER(21, 6),
    adjusted_close_price   NUMBER(21, 6),
    volume                 NUMBER(21)
);


ALTER TABLE trading_investing.HISTORICAL_PRICES ADD CONSTRAINT HISTORICAL_PRICES_PK PRIMARY KEY (symbol, record_date);                

/***********************************************************************/
/* Insert data from LOAD_HISTORICAL_PRICESS to HISTORICAL_PRICES table */
/***********************************************************************/
truncate table trading_investing.LOAD_HISTORICAL_PRICES;
commit;

INSERT INTO trading_investing.HISTORICAL_PRICES (SYMBOL, RECORD_DATE, OPEN_PRICE, CLOSE_PRICE, HIGH_PRICE, LOW_PRICE, ADJUSTED_CLOSE_PRICE, VOLUME)
SELECT 'JPM',
       RECORD_DATE, OPEN_PRICE, CLOSE_PRICE, HIGH_PRICE, LOW_PRICE, ADJUSTED_CLOSE_PRICE, VOLUME       
FROM trading_investing.LOAD_HISTORICAL_PRICES
--WHERE condition;

commit;

select * from trading_investing.LOAD_HISTORICAL_PRICES order by record_date asc


/****************************************************/
/* Create TRADING_INVESTING.HISTORICAL_PRICES table */
/****************************************************/
CREATE TABLE trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY (
    record_datetime                   DATE NOT NULL,
    symbol                            VARCHAR2(30 CHAR) NOT NULL,
    live_price                        NUMBER(21, 6),
    previous_closing_price            NUMBER(21, 6),
    opening_price                     NUMBER(21, 6),
    bid_offer_price                   NUMBER(21, 6),
    bid_offer_quantity                NUMBER(21),
    asking_price                      NUMBER(21, 6),
    asking_quantity                   NUMBER(21),
    days_range_low_price              NUMBER(21, 6),
    days_range_high_price             NUMBER(21, 6),
    fifty_two_week_range_low_price    NUMBER(21, 6),
    fifty_two_week_range_high_price   NUMBER(21, 6),
    volume                            NUMBER(21),
    average_volume                    NUMBER(21),
    market_capitalization             NUMBER(31, 6),
    beta                              NUMBER(21, 6),
    pe_ratio_ttm                      NUMBER(21, 6),
    eps_ttm                           NUMBER(21, 6),
    earnings_date                     DATE,
    earnings_date_end                 DATE,
    dividend                          NUMBER(21, 6),
    dividend_yield                    NUMBER(21, 6),
    ex_dividend_date                  DATE,
    one_year_target_price             NUMBER(21, 6)
);

ALTER TABLE trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY ADD CONSTRAINT YAHOO_FINANCE_QUOTE_SUMMARY_PK PRIMARY KEY (record_datetime, symbol);


CREATE TABLE trading_investing.STOCK_MASTER_LIST (
    symbol          VARCHAR2(30 CHAR) NOT NULL,
    security_name   VARCHAR2(100 CHAR),
    sector          VARCHAR2(100 CHAR),
    industry        VARCHAR2(100 CHAR)
)
LOGGING;

ALTER TABLE trading_investing.STOCK_MASTER_LIST ADD CONSTRAINT STOCK_MASTER_LIST_PK PRIMARY KEY ( symbol );