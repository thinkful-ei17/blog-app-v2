DROP TABLE IF EXISTS stories;
DROP TABLE IF EXISTS authors;

CREATE TABLE authors (
    id serial PRIMARY KEY,
    username text NOT NULL,
    email text NOT NULL
);

CREATE TABLE stories (
    id serial PRIMARY KEY,
    title text NOT NULL,
    content text,
    author_id int REFERENCES authors ON DELETE RESTRICT,
    created timestamp DEFAULT now()
);

ALTER SEQUENCE stories_id_seq RESTART WITH 1000;

INSERT INTO authors (username, email) VALUES
('David', 'david@people.com'),
('Candace', 'candace@people.com'),
('MrHello', 'hello@hello.com');

INSERT INTO stories (title, content, author_id) VALUES 
('What the government doesn''t want you to know about cats', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.', 1),
('The most boring article about cats you''ll ever read', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.', 2),
('7 things lady gaga has in common with cats', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.', 3),
('The most incredible article about cats you''ll ever read', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.', 1),
('10 ways cats can help you live to 100', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.', 3),
('9 reasons you can blame the recession on cats', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.', 2),
('10 ways marketers are making you addicted to cats', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.', 3),
('11 ways investing in cats can make you a millionaire', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.', 2),
('Why you should forget everything you learned about cats', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.', 1);

-- SELECT authors.username as user, stories.title 
--     FROM stories
--     INNER JOIN authors
--     ON authors.id = stories.author_id;
    