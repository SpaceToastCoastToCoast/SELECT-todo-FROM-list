\c test;

DROP USER IF EXISTS michael;

CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

DROP DATABASE IF EXISTS todo_app;

CREATE DATABASE todo_app;

\c todo_app;

CREATE TABLE tasks (
  id serial NOT NULL PRIMARY KEY,
  title varchar(255) NOT NULL,
  description text,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp,
  completed boolean NOT NULL DEFAULT false
);

ALTER TABLE tasks DROP COLUMN completed;

ALTER TABLE tasks ADD COLUMN completed_at timestamp DEFAULT NULL;

ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;
ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT CURRENT_TIMESTAMP;

INSERT INTO tasks VALUES (
  DEFAULT,
  'Study SQL',
  'Complete this exercise',
  CURRENT_TIMESTAMP,
  CURRENT_TIMESTAMP,
  NULL
);

INSERT INTO tasks VALUES (
  DEFAULT,
  'Study PostgreSQL',
  'Read all the documentation',
  DEFAULT,
  DEFAULT,
  DEFAULT
);

SELECT title FROM tasks WHERE completed_at IS NULL;

UPDATE tasks SET completed_at = CURRENT_TIMESTAMP WHERE title = 'Study SQL';

SELECT title, description FROM tasks WHERE completed_at IS NULL;