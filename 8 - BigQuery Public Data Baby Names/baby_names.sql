-- Q1
SELECT
  count(*) as record_count
FROM
  `bigquery-public-data.usa_names.usa_1910_current`;

-- Q2
SELECT
  gender,
  sum(number) as total_births
FROM
  `bigquery-public-data.usa_names.usa_1910_current`
GROUP BY
  gender
ORDER BY
  total_births desc;

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

-- Q4
SELECT
  name
FROM
  `bigquery-public-data.usa_names.usa_1910_current`
GROUP BY
  name, state
HAVING
  max(number) = 10021 and state = 'NY';

-- Q5
SELECT
  name,
  sum(number) as total
FROM
  `bigquery-public-data.usa_names.usa_1910_current`
WHERE
  name in (
    SELECT
      name
    FROM
      `bigquery-public-data.usa_names.usa_1910_current`
    WHERE
      state = 'FL'
    GROUP BY 
      name, state
    ORDER BY
      sum(number) desc
    LIMIT 1
  )
GROUP BY
  name
ORDER BY
  total desc
LIMIT 1;