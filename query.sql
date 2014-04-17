select grade, count, 100 * count / (sum(count) over ())::numeric as percentage from 
(
  select grade, count(1)
  from diary_survey
  group by grade
) t2
order by percentage desc;
