SELECT * FROM trading_investing.historical_stock_prices;

SELECT symbol, count(symbol) FROM trading_investing.historical_stock_prices group by symbol;

/* sample query with date comparison - disregard error*/
SELECT * FROM trading_investing.historical_stock_prices where txn_date > date '2018-05-29';

/*
 * Trend per week
 */
SELECT symbol, day_of_week, avg(up_down) FROM trading_investing.historical_stock_prices 
where 
symbol in ('MSFT', 'V', 'C', 'JPM', 'VZ') and
date(txn_date) >= date '2017-10-01'
group by
symbol, day_of_week
order by symbol, day_of_week;

SELECT symbol, day_of_week, avg(up_down) FROM trading_investing.historical_stock_prices 
where 
symbol in ('MSFT', 'V', 'C', 'JPM', 'VZ') 
group by
symbol, day_of_week
order by symbol, day_of_week;

/*
 * 
 */
SELECT symbol, day_of_week, up_down_direction, count(up_down) FROM trading_investing.historical_stock_prices 
where 
symbol in ('MSFT', 'V', 'C', 'JPM') and
date(txn_date) >= date '2017-10-01'
group by
symbol, day_of_week, up_down_direction
order by symbol, day_of_week;

SELECT symbol, day_of_week, up_down_direction, count(up_down) FROM trading_investing.historical_stock_prices 
where 
symbol in ('MSFT', 'V', 'C', 'JPM')
group by
symbol, day_of_week, up_down_direction
order by symbol, day_of_week;

