SELECT
  DATABASE() AS wiki,
  rev_id AS id,
  rev_page AS page_id,
  rev_user AS user_id,
  rev_user_text AS user_text,
  rev_timestamp AS timestamp,
  rev_sha1 AS sha1,
  rev_len AS len,
  False AS archived
FROM revision
WHERE
  rev_timestamp BETWEEN @start_date AND @end_date AND
  rev_deleted = 0 /* No deleted revisions */
ORDER BY rev_timestamp ASC, rev_id ASC;
