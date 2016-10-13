\c test;

DROP USER IF EXISTS michael;

CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

DROP DATABASE IF EXISTS todo_app;

CREATE DATABASE todo_app;

\c todo_app;

CREATE TABLE tasks (
  id serial,
  title varchar(255),
  description text,
  created_at timestamp,
  updated_at timestamp,
  completed boolean
);