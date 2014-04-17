survey-data
===========

The results of the diary survey - conversion and analysis

The output of the Google survey will be pushed into a SQL database, from where it
can be queried more flexibly. We can then use R, etc. to visualize it...

run `psql -f init.sql -d diary` to import the data into the database `diary`.

## Example

See who likes time tables most...

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
