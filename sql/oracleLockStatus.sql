SELECT
  l.SID,
  user,
  s.OSUSER,
  (s.TYPE) USERTYPE,
  s.MACHINE,
  s.PROGRAM,
  (l.type) LOCKTYPE,
  ID1,
  ID2,
  LMODE,
  REQUEST,
  (CTIME) Seconds,
  "BLOCK"
FROM V$LOCK l, v$SESSION s
WHERE
l.sid = s.SID AND s.TYPE = 'USER'