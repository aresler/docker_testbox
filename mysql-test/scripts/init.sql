CREATE TABLE IF NOT EXISTS foo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    position VARCHAR(255) NOT NULL
)  ENGINE=INNODB;

INSERT INTO foo (name, position) VALUES ('bob', 'programmer');
INSERT INTO foo (name, position) VALUES ('alice', 'manager');
INSERT INTO foo (name, position) VALUES ('john', 'janitor');
