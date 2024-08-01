CREATE DATABASE mcdonalds;

SHOW DATABASES;

USE mcdonalds;

CREATE TABLE product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name TINYTEXT,
    price FLOAT
);

CREATE TABLE panier (
    id INT PRIMARY KEY AUTO_INCREMENT,
);

CREATE TABLE product_panier(
    product_id INT,
    panier_id INT,
    PRIMARY KEY(product_id,panier_id),
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (panier_id) REFERENCES panier(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    quantity INT
);

CREATE TABLE client_panier(
    client_id INT,
    panier_id INT,
    PRIMARY KEY(client_id,panier_id),
    FOREIGN KEY (client_id) REFERENCES client(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (panier_id) REFERENCES panier(id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE client (
     id INT PRIMARY KEY AUTO_INCREMENT,
     name TINYTEXT
);

CREATE TABLE employe(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name TINYTEXT
);

CREATE TABLE commande (
    panier_id INT,
    employe_id INT,
    FOREIGN KEY (panier_id) REFERENCES panier(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (employe_id) REFERENCES employe(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY (panier_id,employe_id),
    isvalide BOOLEAN
);

ALTER TABLE commande ADD isvalide BOOLEAN;

INSERT INTO product (name,price) VALUES 
("x2 Pancake", 2.30),
("Bacon et Egg", 2.50),
("Mc Griddles", 2.00),
("Bacon et Beef", 2.50),
("Egg & Cheese", 2.50),
("Berlingo Fruits", 1.60),
("Bio a boire", 1.50),
("Ananas a croquer",  1.60),
("Fruits croquer",  1.60);

SELECT * FROM product;

INSERT INTO client (name) VALUES 
("Cyril"),
("massi"),
("Alicia"),
("Jeremie");

SELECT * FROM client;

INSERT INTO panier (id) VALUES (0);

INSERT INTO product_panier(product_id,panier_id,quantity) VALUES
(1,1,23),
(3,1,5);

INSERT INTO client_panier(client_id,panier_id) VALUES
(2,1);

INSERT INTO employe(name) VALUES ("Miguel");

INSERT INTO commande (panier_id,employe_id) VALUES (1,1);