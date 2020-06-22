delete FROM trading_investing.stock_quote_summary;
commit;

/*
 * Which stock has the most earning potential for the year?
 */ 
SELECT * FROM trading_investing.stock_quote_summary 
where scrape_date = (select max(scrape_date) from trading_investing.stock_quote_summary)
order by potential_earning_percent desc;

/*
 * Which stock has the most dividend yield
 */ 
SELECT * FROM trading_investing.stock_quote_summary 
where scrape_date = (select max(scrape_date) from trading_investing.stock_quote_summary)
order by yield desc;
