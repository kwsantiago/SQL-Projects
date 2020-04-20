-- Q1
SELECT
  count(*) as record_count
FROM
  `bigquery-public-data.usa_names.usa_1910_current`

-- Q3
SELECT
  state,
  min(number) as fewest_num,
  round(avg(number)) as avg_num,
  max(number) as most_num
FROM
  `bigquery-public-data.usa_names.usa_1910_current`
GROUP BY
  state
ORDER BY
  most_num desc;