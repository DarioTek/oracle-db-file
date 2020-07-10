/*
 * Which stock has the most earning potential for the year?
 */ 
SELECT *
FROM nls_session_parameters
WHERE parameter = 'NLS_DATE_FORMAT';

ALTER SESSION SET nls_date_format = 'DD/MON/YYYY hh24:mi:ss';

SELECT * FROM trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY

SELECT * FROM trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY where SYMBOL = 'GS'
/*
 * Which stock has the most dividend yield
 */ 
