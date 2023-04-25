CREATE TABLE foo(
    id serial PRIMARY KEY,
    name VARCHAR (255) NOT NULL,
    position VARCHAR (255) NOT NULL
);

INSERT INTO foo (name, position) VALUES ('bob', 'programmer');
INSERT INTO foo (name, position) VALUES ('alice', 'manager');
INSERT INTO foo (name, position) VALUES ('john', 'janitor');
