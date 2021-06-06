CREATE TABLE customer(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR (100),
    address VARCHAR (200),
    attn VARCHAR(50),
    tel VARCHAR (20),
    fax VARCHAR (20)
);

CREATE TABLE invoice(
    invoice_no INT PRIMARY KEY AUTO_INCREMENT,
    invoice_date DATE,
    id INT,
    FOREIGN KEY (id) REFERENCES customer(customer_id) ON DELETE SET NULL
);

CREATE TABLE invoiceitem(
    line_no INT PRIMARY KEY AUTO_INCREMENT,
    invoice_no INT,
    item_no INT,
    quantity DECIMAL,
    FOREIGN KEY(invoice_no) REFERENCES invoice(invoice_no) ON DELETE CASCADE
);

CREATE TABLE item(
    item_no INT PRIMARY KEY AUTO_INCREMENT,
    item_desc VARCHAR (100),
    item_unit VARCHAR (10),
    item_price DECIMAL (13,2)
);

ALTER TABLE invoiceitem
ADD FOREIGN KEY(item_no)
REFERENCES item(item_no)
ON DELETE SET NULL;

CREATE TABLE receiver(
    receive_id INT PRIMARY KEY AUTO_INCREMENT,
    receive_name INT,
    receive_date DATE,
    receive_amount DECIMAL (13,2),
    FOREIGN KEY(receive_name) REFERENCES customer(customer_id) ON DELETE CASCADE
);
