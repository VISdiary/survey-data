DROP TABLE diary_survey;

CREATE TABLE diary_survey (
  gender VARCHAR,
  grade VARCHAR,
  usage_freq VARCHAR,
  more_homework_space VARCHAR,
  cover VARCHAR,
  size VARCHAR,
  layout VARCHAR[],
  plastic_holder VARCHAR,
  info VARCHAR[],
  suggestions VARCHAR(2048),
  timestamp VARCHAR,
  sketching VARCHAR,
  online_service VARCHAR,
  usage VARCHAR[],
  looks VARCHAR,
  quotes VARCHAR,
  map VARCHAR
);

COPY diary_survey FROM '/Users/AlexanderSelzer1/git/survey-data/data.tsv';
