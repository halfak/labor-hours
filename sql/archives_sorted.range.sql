SELECT
  DATABASE() AS wiki,
  ar_rev_id AS id,
  ar_page_id AS page_id,
  ar_user AS user_id,
  ar_user_text AS user_text,
  ar_timestamp AS timestamp,
  ar_sha1 AS sha1,
  ar_len AS len,
  True AS archived
FROM archive
WHERE
  ar_timestamp BETWEEN @start_date AND @end_date AND
  ar_deleted = 0 /* No deleted revisions */
ORDER BY ar_timestamp ASC, ar_rev_id ASC
