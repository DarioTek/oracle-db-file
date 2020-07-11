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

select RECORD_DATETIME, count(*) from trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY group by RECORD_DATETIME

/*
 * Which stock has the most dividend yield
 */ 
select * from trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY where DIVIDEND_YIELD in (select max(dividend_yield) from trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY)


select * from trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY_VIEW
