/*
 * trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY_VIEW
 */
 CREATE OR REPLACE VIEW trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY_VIEW AS
    SELECT
        trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.record_datetime,
        trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.symbol,
        trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.live_price,
        trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.previous_closing_price,
        trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.opening_price,
        trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.bid_offer_price,
        trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.bid_offer_quantity,
        trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.asking_price,
        trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.asking_quantity,
        trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.days_range_low_price,
        trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.days_range_high_price,
        trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.fifty_two_week_range_low_price,
        trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.fifty_two_week_range_high_price,
        trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.volume,
        trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.average_volume,
        trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.market_capitalization,
        trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.beta,
        trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.pe_ratio_ttm,
        trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.eps_ttm,
        trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.earnings_date,
        trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.earnings_date_end,
        trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.dividend,
        trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.dividend_yield,
        trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.ex_dividend_date,
        trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.one_year_target_price,
        (trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.one_year_target_price - trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.live_price)as one_year_potential_gain,
        ((trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.one_year_target_price - trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.live_price)/trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.live_price)*100 as one_year_potential_gain_percentage
    FROM
        trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY 
    WHERE
        trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY.record_datetime in (SELECT max(record_datetime) FROM trading_investing.YAHOO_FINANCE_QUOTE_SUMMARY);