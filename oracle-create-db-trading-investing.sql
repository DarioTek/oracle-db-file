/*************************/
/* CREATE NEW POWER USER */
/*************************/
alter session set "_ORACLE_SCRIPT"=true;

GRANT CONNECT, RESOURCE, DBA TO trading_investing;

GRANT create session TO trading_investing;
GRANT create table TO trading_investing;
GRANT create view TO trading_investing;
GRANT create any trigger TO trading_investing;
GRANT create any procedure TO trading_investing;
GRANT create sequence TO trading_investing;
GRANT create synonym TO trading_investing;

/* 
DROP USER trading_investing
*/


/************************************************************/
DROP SCHEMA IF EXISTS trading_investing;

CREATE SCHEMA trading_investing;

use trading_investing
/************************************************************/

DROP TABLE IF EXISTS `watch_list`;

CREATE TABLE `watch_list` (
  `watch_list_name` varchar(50) NOT NULL,
  `symbol` varchar(30) NOT NULL,
  `sector` varchar(30),
  PRIMARY KEY (`watch_list_name`,`symbol`)
);



/************************************************************/

DROP TABLE IF EXISTS `ameritrade_transactions`;

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
DROP TABLE IF EXISTS `historical_stock_prices`;

CREATE TABLE `historical_stock_prices` (
  `symbol` varchar(30) NOT NULL,
  `txn_date` date not null,
  `open` decimal(16, 6) NOT NULL,
  `close` decimal(16, 6) NOT NULL,
  `high` decimal(16, 6) NOT NULL,
  `low` decimal(16, 6) NOT NULL,
  `adj_close` decimal(16, 6) NOT NULL,
  `volume` numeric NOT NULL,
  `day_of_week` int,
  `day_of_month` int,
  `month` int,
  `year` int,
  `up_down` decimal(16, 6),
  `up_down_direction` int,
  PRIMARY KEY (`symbol`, `txn_date`)
); 

/************************************************************/
DROP TABLE IF EXISTS `stock_quote_summary`;

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