-- AddressBook Service
=============================================
-- UC1 Creating database as AddessBookService
=============================================

 MySQL  localhost:3306 ssl  addressbookservice  SQL > show databases;
+--------------------+
| Database           |
+--------------------+
| addressbookservice |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| user               |
| world              |
+--------------------+
8 rows in set (0.0016 sec)
mysql> use AddressBookService;
Database changed
===========================================================
-- UC2  creating table as AddressBook with attributes
===========================================================

localhost:3306 ssl  addressbookservice  SQL > create table AddressBook (
                                                   -> firstName varchar(50) not null,
                                                   -> lastName varchar(50) not null,
                                                   -> address varchar(100) not null,
                                                   -> city varchar(50) not null,
                                                   -> state varchar(50) not null,
                                                   -> zip int not null,
                                                   -> phoneNumber double not null,
                                                   -> email varchar(100) not null );
Query OK, 0 rows affected (0.0826 sec)
 MySQL  localhost:3306 ssl  addressbookservice  SQL > desc AddressBook;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| firstName   | varchar(50)  | NO   |     | NULL    |       |
| lastName    | varchar(50)  | NO   |     | NULL    |       |
| address     | varchar(100) | NO   |     | NULL    |       |
| city        | varchar(50)  | NO   |     | NULL    |       |
| state       | varchar(50)  | NO   |     | NULL    |       |
| zip         | int          | NO   |     | NULL    |       |
| phoneNumber | double       | NO   |     | NULL    |       |
| email       | varchar(100) | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
8 rows in set (0.0554 sec)
==========================================================
-- UC3 inserting new Contacts to AddressBook table
===========================================================
 MySQL  localhost:3306 ssl  addressbookservice  SQL > insert into AddressBook (firstname, lastname, address,city, state, zip,phoneNumber,email) values
                                                   -> ('Sandhya','Bagale','Vijayapur','Bijapur','Karnataka', 767015, 7339731548,'sandhyabagale@gmail.com');
Query OK, 1 row affected (0.0445 sec)
insert into AddressBook (firstname, lastname, address,city, state, zip,phoneNumber,email) values
                                                   -> ('Rahul ','Soukya','Ramapura','Hubbli','Bihar', 561210, 999999999,'shivam@gmail.com');
Query OK, 1 row affected (0.0057 sec)

/**
*Insertinng multiple values at once
*
*/

MySQL  localhost:3306 ssl  addressbookservice  SQL >  insert into AddressBook (firstname, lastname, address,city, state, zip,phoneNumber,email) values
                                                   ->  ('Raghavendra','Yadav','Bidar','Shivamugga','Karnataka', 520102, 888888888,'raghabendra@gmail.com'),
                                                   -> ('Rupesh','V','sirinagara','chennai','Tamilnadu', 3021402, 777777777,'rupesh@gmail.com');
Query OK, 2 rows affected (0.0069 sec)

Records: 2  Duplicates: 0  Warnings: 0

MySQL  localhost:3306 ssl  addressbookservice  SQL >  desc AddressBook;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| firstName   | varchar(50)  | NO   |     | NULL    |       |
| lastName    | varchar(50)  | NO   |     | NULL    |       |
| address     | varchar(100) | NO   |     | NULL    |       |
| city        | varchar(50)  | NO   |     | NULL    |       |
| state       | varchar(50)  | NO   |     | NULL    |       |
| zip         | int          | NO   |     | NULL    |       |
| phoneNumber | double       | NO   |     | NULL    |       |
| email       | varchar(100) | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
8 rows in set (0.0034 sec)
 MySQL  localhost:3306 ssl  addressbookservice  SQL > select * from AddressBook;
+-------------+----------+------------+------------+-----------+---------+-------------+-------------------------+
| firstName   | lastName | address    | city       | state     | zip     | phoneNumber | email                   |
+-------------+----------+------------+------------+-----------+---------+-------------+-------------------------+
| Sandhya     | Bagale   | Vijayapur  | Bijapur    | Karnataka |  767015 |  7339731548 | sandhyabagale@gmail.com |
| Rahul       | Soukya   | Ramapura   | Hubbli     | Bihar     |  561210 |   999999999 | Rahul@gmail.com         |
| Raghavendra | Yadav    | Bidar      | Shivamugga | Karnataka |  520102 |   888888888 | raghabendra@gmail.com   |
| Rupesh      | V        | sirinagara | chennai    | Tamilnadu | 3021402 |   777777777 | rupesh@gmail.com        |
+-------------+----------+------------+------------+-----------+---------+-------------+-------------------------+
4 rows in set (0.0013 sec)
===========================================================
--> UC4 editing the existing contact by their firstname
===========================================================
//by using zip column changing the last Name
MySQL  localhost:3306 ssl  addressbookservice  SQL > update AddressBook set  lastName='Yadav' where zip='561210';
Query OK, 1 row affected (0.0038 sec)
Rows matched: 1  Changed: 1  Warnings: 0

//Using firstName changing the phone number of that person
 MySQL  localhost:3306 ssl  addressbookservice  SQL > update addressbook set phoneNumber=9873154789 where firstname='Rupesh';
Query OK, 1 row affected (0.0042 sec)

Rows matched: 1  Changed: 1  Warnings: 0
 MySQL  localhost:3306 ssl  addressbookservice  SQL > select * from AddressBook;
+-------------+----------+------------+------------+-----------+---------+-------------+-------------------------+
| firstName   | lastName | address    | city       | state     | zip     | phoneNumber | email                   |
+-------------+----------+------------+------------+-----------+---------+-------------+-------------------------+
| Sandhya     | Bagale   | Vijayapur  | Bijapur    | Karnataka |  767015 |  7339731548 | sandhyabagale@gmail.com |
| Rahul       | Yadav    | Ramapura   | Hubbli     | Bihar     |  561210 |   999999999 | Rahul@gmail.com         |
| Raghavendra | Yadav    | Bidar      | Shivamugga | Karnataka |  520102 |   888888888 | raghabendra@gmail.com   |
| Rupesh      | V        | sirinagara | chennai    | Tamilnadu | 3021402 |  9873154789 | rupesh@gmail.com        |
+-------------+----------+------------+------------+-----------+---------+-------------+-------------------------+
4 rows in set (0.0006 sec)