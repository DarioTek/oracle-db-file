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
    volume                 NUMBER
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
    volume                 NUMBER
);


ALTER TABLE trading_investing.HISTORICAL_PRICES ADD CONSTRAINT HISTORICAL_PRICES_PK PRIMARY KEY ( symbol,
                                                                                                                        record_date
                                                                                                                        );                

/************************************************************/


CREATE TABLE `ameritrade_transactions` (
  `date` date not null,
  `transaction_id` varchar(15) NOT NULL,
  `description` varchar(150) NOT NULL,
  `quantity` numeric NOT NULL,
  `symbol` varchar(30) NOT NULL,
  `price` decimal(16, 6) NOT NULL,
  `commission` decimal(16, 6) NOT NULL,
  `amount` decimal(16, 6) NOT NULL,
  `net_cash_balance` decimal(16, 6) NOT NULL,
  `reg_fee` decimal(16, 6),
  `short_term_rdm_fee` decimal(16, 6),
  `fund_redemption_fee` decimal(16, 6),
  `deferred_sales_charge` decimal(16, 6),
  PRIMARY KEY (`transaction_id`)
);

/************************************************************/

CREATE TABLE `stock_quote_summary` (
  `symbol` varchar(30) NOT NULL,
  `scrape_date` date not null,
  `live_price` decimal(26, 6),
  `live_price_change` decimal(26, 6),
  `live_price_change_percentage` decimal(26, 6),
  `previous_closing_price` decimal(26, 6) NOT NULL,
  `opening_price` decimal(26, 6) NOT NULL,
  `bid_offer` decimal(26, 6) NOT NULL,
  `bid_quantity` int,
  `asking_price` decimal(26, 6) NOT NULL,
  `asking_quantity` int,
  `days_range_start` decimal(26, 6) NOT NULL,
  `days_range_end` decimal(26, 6) NOT NULL,
  `fiftytwo_range_start` decimal(26, 6) NOT NULL,
  `fiftytwo_range_end` decimal(26, 6) NOT NULL,
  `volume` int,
  `average_volume` int,
  `market_cap` decimal(26, 6),
  `beta` decimal(26, 6),
  `pe_ratio_ttm` decimal(26, 6),
  `eps_ttm` decimal(26, 6),  
  `earnings_date_start` date,
  `earnings_date_end` date,
  `dividend` decimal(26, 6),
  `yield` decimal(26, 6),
  `ex_dividend_date` date,
  `one_year_targe_estimate` decimal(26, 6), 
  `potential_earning` decimal(26, 6), 
  `potential_earning_percent` decimal(26, 6), 
  PRIMARY KEY (`symbol`, `scrape_date`)
); 