/*
 * Validation queries
 */
select RECORD_DATETIME, count(*) from trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY group by RECORD_DATETIME
-- Why are the scrapped records different every run? Put a retry logic? and track which ticker symbol error out?
 
-- Live price is null
select * from trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY_VIEW where live_price is null

-- ONE_YEAR_TARGET_PRICE is null
select * from trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY_VIEW where one_year_target_price is null
 
/*
 * Which stock has the most earning potential for the year?
 */ 
SELECT *
FROM nls_session_parameters
WHERE parameter = 'NLS_DATE_FORMAT';

ALTER SESSION SET nls_date_format = 'DD/MON/YYYY hh24:mi:ss';

ALTER SESSION SET nls_date_format = 'DD/MON/YYYY HH24:mi:ss';

SELECT * FROM trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY

SELECT * FROM trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY where SYMBOL = 'GS'


SELECT * FROM trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY where SYMBOL = 'SIVB'


/*
 * Which stock has the most dividend yield
 */ 
-- Which stock has the most dividend yield throughout all the records scrapped from Yahoo Finance
select * from trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY where DIVIDEND_YIELD in (select max(dividend_yield) from trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY)

-- Which stock has the most dividend yield (most current data)
select * from trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY_VIEW where DIVIDEND_YIELD in (select max(dividend_yield) from trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY_VIEW)

-- Which stock has the most dividend yield (most current data) top 10
select * from (select * from trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY_VIEW order by DIVIDEND_YIELD desc) where rownum <= 10


/*
 * Which stock has the most dividend Beta
 */ 
-- Which stock has the highest (most current data)
select * from trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY_VIEW where BETA in (select max(BETA) from trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY_VIEW)

-- Which stock has the highest (most current data) top 10
select * from (select * from trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY_VIEW order by BETA desc) where rownum <= 10

/*
 * Which stock has the highest one year potential gain
 */

-- Which stock has the highest one year potential gain
select * from  trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY_VIEW where ONE_YEAR_POTENTIAL_GAIN in (select max(ONE_YEAR_POTENTIAL_GAIN) from trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY_VIEW)
-- ANSWER: AZO (AutoZone) on 7/12/2020

-- Which stock has the highest one year potential gain (most current data) top 10
select * from (select * from trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY_VIEW order by ONE_YEAR_POTENTIAL_GAIN desc) where rownum <= 10 and ONE_YEAR_POTENTIAL_GAIN is not NULL

-- Which stock has the highest one year potential gain percentage(most current data) top 10
select * from (select * from trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY_VIEW order by ONE_YEAR_POTENTIAL_GAIN_PERCENTAGE desc) where rownum <= 10 and ONE_YEAR_POTENTIAL_GAIN_PERCENTAGE is not NULL

