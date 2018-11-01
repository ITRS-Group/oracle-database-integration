****************************
Oracle Database Integration
****************************



Introduction
============

The Oracle Database Integration provides SQL and Geneos Include files that can get you easily started monitoring basic application dependent statistics of your Oracle Database Server.
The integration includes 5 SQL statements that can be copied and pasted into an Existing SQL-Toolkit plugin or the Geneos include file has everything already configured.  
In order for the integration to work the Netprobe running the SQL-Toolkit plug-in needs to have the proper environment variables set.  
The SQL included with this Integration currently supports Oracle 10g and 11g database instances.  

.. note:: To test out this SQL or any other SQL before implementing it Oracle provides a free program called **SqlDeveloper**




Prerequisites
=============

Netprobe Environment Variables
------------------------------
	ORACLE_HOME: Path to the Oracle Client Libraries installed on the physical server
		By Default the Netprobe running the SQL-Toolkit plugin will look in $ORACLE_HOME/network/admin for the tnsnames.ora file.  

	LD_LIBRARY_PATH: For Unix Systems only add in $ORACLE_HOME/lib32:$ORACLE_HOME/lib

Geneos Variables
----------------
	ORACLE_DB_NAME: Oracle Instance Name

	ORACLE_USER: Username with access to the required tables

	ORACLE_PASS: Your password for the named user

	ORACLE_TRACE_FILES_DIRECTORY: Variable for the Directory Path of the Oracle Trace files to be added to an FKM view

Database Permissions
--------------------
The ORACLE_USER must have access to read from the tables reference in the SQL. ex. v$instance, v$session, etc




View Descriptions
=================

**Server Status**: Selected values from the v$instance table.

**Session Status**: Session Status values filtered by ``TYPE=USER``.

**Table Space**: Table Space statistics in Mb and Percentages.

**Long Query**: A Union of long running queries against the user and process running them.

**Locks**: A Union of table locks with the user and process locking them, filtered by ``TYPE=USER``