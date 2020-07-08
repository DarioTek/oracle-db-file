/*
CREATE USER c##smith IDENTIFIED BY password;

drop user c##smith
*/

SELECT username, account_status FROM dba_users WHERE username = 'SMITH';

/*
drop user fred
*/

alter session set "_ORACLE_SCRIPT"=true;

create user fred identified by flintstone;
--grant dba to fred;
GRANT create session TO fred;
GRANT connect to fred
connect fred/flintstone

alter user fred identified by flintstone account unlock;

GRANT create table TO smithj;
GRANT create view TO smithj;
GRANT create any trigger TO smithj;
GRANT create any procedure TO smithj;
GRANT create sequence TO smithj;
GRANT create synonym TO smithj;

ALTER SYSTEM SET SEC_CASE_SENSITIVE_LOGON = FALSE;