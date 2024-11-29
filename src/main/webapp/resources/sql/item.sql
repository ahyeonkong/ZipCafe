USE homecafe;

CREATE TABLE item (
    itemId VARCHAR(20) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    unitPrice INT NOT NULL,
    description TEXT NOT NULL,
    category VARCHAR(30) NOT NULL,
    unitsInStock INT NOT NULL,
    filename VARCHAR(255)
)default CHARSET=utf8;

desc item;