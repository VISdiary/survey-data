survey-data
===========

The results of the diary survey - conversion and analysis

The output of the Google survey will be pushed into a SQL database, from where it
can be queried more flexibly. We can then use R, etc. to visualize it...

run `psql -f init.sql -d diary` to import the data into the database `diary`.

## Example

See who used the most tables in total...

```sql
SELECT count(grade), grade FROM diary_survey WHERE 'Time table' = ANY (info) GROUP BY grade;

count  |  grade   
-------+----------
45     | Grade 10
55     | Grade 11
41     | Grade 7
31     | Grade 8
1      | Grade 12
26     | Grade 9
24     | Grade 6
(7 rows)
```

Percentage of total

```sql
SELECT grade, count, 100 * count / (SUM(count) OVER ())::numeric AS percentage
FROM (
  SELECT grade, count(1)
  FROM diary_survey
  GROUP BY grade
) t2
ORDER BY percentage DESC;


grade   | count |       percentage       
----------+-------+------------------------
Grade 11 |    61 |    24.7967479674796748
Grade 10 |    50 |    20.3252032520325203
Grade 7  |    42 |    17.0731707317073171
Grade 8  |    36 |    14.6341463414634146
Grade 9  |    31 |    12.6016260162601626
Grade 6  |    25 |    10.1626016260162602
Grade 12 |     1 | 0.40650406504065040650
(7 rows)
```
