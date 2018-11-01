SELECT
l.sid,
user,
process,
machine,
time_remaining,
message
FROM
v$session_longops l, v$session s
WHERE
l.sid = s.sid AND time_remaining > 60