select SID,
  PROCESS,
  OSUSER,
  MACHINE,
  STATUS,
  SCHEMANAME,
  PROGRAM,
  TYPE,
  STATE
FROM v$session where TYPE = 'USER'