PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

DROP TABLE if exists questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT,
  user_id INTEGER NOT NULL,
  
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  parent INTEGER,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO 
  users (fname, lname)
VALUES
  ('Ronil', 'Bhatia'), 
  ('Alex', 'Kao');

INSERT INTO 
  questions (title, body, user_id)
VALUES
  ('What is life?', 'Tell me the meaning of life', 1), 
  ('Why?', 'why', 2);

INSERT INTO 
  question_follows (user_id, question_id)
VALUES
  (1, 2), 
  (2, 1);
  
INSERT INTO 
  replies (body, parent, question_id, user_id)
VALUES
  ('42', NULL, 1, 2), 
  ('Because', NULL, 2, 1),
  ('I said so', 2, 2, 2);

INSERT INTO 
  question_likes (user_id, question_id)
VALUES
  (1, 2);

