Oracle Database Monitoring for 10g, 11g and 12c
-----------------------------------

**Introduction**
This solution is presented in 2 different ways.  The Include is the one stop shop that contains the type, sampler and SQL.  The SQL folder contains the raw sql files which can be copied and pasted into an existing deployment.  


**include XML**
The include XML contains a single type and sampler.   The sampler is an SQL-Toolkit with the 5 basic queries inline. Users will need to add their authentication information or define the named variables.   

	ORACLE_DB_NAME: Oracle Instance Name
	ORACLE_USER: Username with access to the required tables
	ORACLE_PASS: Your password for the named user
	ORACLE_TRACE_FILES_DIRECTORY: Variable for the Directory Path of the Oracle Trace files to be added to an FKM view


**raw sql**
The sql directory contains 5 sql statements that can be copied and pasted into an existing SQL-Toolkit plugin.  
