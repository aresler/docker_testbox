CREATE TABLE company(
    id serial PRIMARY KEY,
    name VARCHAR (255) NOT NULL
);

CREATE TABLE employees(
    id serial PRIMARY KEY,
    name VARCHAR (255) NOT NULL,
    position VARCHAR (255) NOT NULL,
	company_id int NOT NULL,
	FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE
);

INSERT INTO company (name) VALUES ('Microsoft');
INSERT INTO company (name) VALUES ('Oracle');
INSERT INTO company (name) VALUES ('IBM');

INSERT INTO employees (name, position, company_id) VALUES ('bob', 'programmer', 1);
INSERT INTO employees (name, position, company_id) VALUES ('alice', 'manager', 2);
INSERT INTO employees (name, position, company_id) VALUES ('john', 'janitor', 3);
