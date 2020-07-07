/*
CREATE USER c##smith IDENTIFIED BY password;

drop user c##smith
*/

SELECT username, account_status FROM dba_users WHERE username = 'SMITH';




alter session set "_ORACLE_SCRIPT"=true;

create user fred identified by flintstone;

grant dba to pubs;

connect fred/flintstone