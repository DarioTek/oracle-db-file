DROP USER 'hbstudent'@'localhost';
CREATE USER 'hbstudent'@'localhost' IDENTIFIED BY 'hbstudent';
GRANT ALL PRIVILEGES ON * . * TO 'hbstudent'@'localhost';


/*****************************************************************/
CREATE USER 'dariotek'@'localhost'
IDENTIFIED WITH caching_sha2_password BY 'password';

GRANT ALL PRIVILEGES ON * . * TO 'dariotek'@'localhost';

/* use this account for it to work with RMySQL */
ALTER USER 'dariotek'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';


/*****************************************************************/

SELECT * FROM trading_investing.ameritrade_transactions;

truncate table trading_investing.ameritrade_transactions