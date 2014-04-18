 copy (
  select '* ' || suggestions
  from diary_survey
  group by suggestions
)
to '/Users/AlexanderSelzer1/git/survey-data/suggestions.md';
