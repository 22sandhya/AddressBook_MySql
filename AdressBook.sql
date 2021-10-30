
-- AddressBook Service
===========================================================
-- UC1 Creating database as AddessBookService
===========================================================

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

===========================================================
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

===========================================================
-- UC5 -deleting the contact by their lastname
===========================================================

in set (0.0009 sec)
 MySQL  localhost:3306 ssl  addressbookservice  SQL > delete from addressBook where lastname='Yadav';
Query OK, 2 rows affected (0.0324 sec)
 MySQL  localhost:3306 ssl  addressbookservice  SQL > select * from AddressBook;
+-----------+----------+-----------+---------+-----------+--------+-------------+-------------------------+
| firstName | lastName | address   | city    | state     | zip    | phoneNumber | email                   |
+-----------+----------+-----------+---------+-----------+--------+-------------+-------------------------+
| Sandhya   | Bagale   | Vijayapur | Bijapur | Karnataka | 767015 |  7339731548 | sandhyabagale@gmail.com |
+-----------+----------+-----------+---------+-----------+--------+-------------+-------------------------+
1 row in set (0.0015 sec)

===========================================================
--> UC6 retrieving the contact by city or state
===========================================================
localhost:3306 ssl  addressbookservice  SQL > select * from AddressBook;
+-----------+----------+-----------+---------+---------------+--------+-------------+-------------------------+
| firstName | lastName | address   | city    | state         | zip    | phoneNumber | email                   |
+-----------+----------+-----------+---------+---------------+--------+-------------+-------------------------+
| Sandhya   | Bagale   | Vijayapur | Bijapur | Karnataka     | 767015 |  7339731548 | sandhyabagale@gmail.com |
| Deepak    | Yadav    | Alambagh  | Lucknow | Uttar Pradesh | 520102 |   888888888 | deepak@gmail.com        |
+-----------+----------+-----------+---------+---------------+--------+-------------+-------------------------+
2 rows in set (0.0024 sec)
 MySQL  localhost:3306 ssl  addressbookservice  SQL >  select * from AddressBook where city = 'Lucknow' or State='Uttar Pradesh';
+-----------+----------+----------+---------+---------------+--------+-------------+------------------+
| firstName | lastName | address  | city    | state         | zip    | phoneNumber | email            |
+-----------+----------+----------+---------+---------------+--------+-------------+------------------+
| Deepak    | Yadav    | Alambagh | Lucknow | Uttar Pradesh | 520102 |   888888888 | deepak@gmail.com |
+-----------+----------+----------+---------+---------------+--------+-------------+------------------+
1 row in set (0.0011 sec)

===========================================================
-- UC7
===========================================================

 MySQL  localhost:3306 ssl  addressbookservice  SQL > select * from addressbook;
+-------------+----------+-----------+------------+-----------+--------+-------------+-------------------------+
| firstName   | lastName | address   | city       | state     | zip    | phoneNumber | email                   |
+-------------+----------+-----------+------------+-----------+--------+-------------+-------------------------+
| Sandhya     | Bagale   | Vijayapur | Bijapur    | Karnataka | 767015 |  7339731548 | sandhyabagale@gmail.com |
| Rahul       | Yadav    | Ramapura  | Hubbli     | Bihar     | 561210 |   999999999 | Rahul@gmail.com         |
| Raghavendra | Yadav    | Bidar     | Shivamugga | Karnataka | 520102 |   888888888 | raghabendra@gmail.com   |
+-------------+----------+-----------+------------+-----------+--------+-------------+-------------------------+
3 rows in set (0.0006 sec)
 MySQL  localhost:3306 ssl  addressbookservice  SQL >   ^C
 MySQL  localhost:3306 ssl  addressbookservice  SQL > select * from AddressBook where city = 'Bijapur' or State='Karnataka';
+-------------+----------+-----------+------------+-----------+--------+-------------+-------------------------+
| firstName   | lastName | address   | city       | state     | zip    | phoneNumber | email                   |
+-------------+----------+-----------+------------+-----------+--------+-------------+-------------------------+
| Sandhya     | Bagale   | Vijayapur | Bijapur    | Karnataka | 767015 |  7339731548 | sandhyabagale@gmail.com |
| Raghavendra | Yadav    | Bidar     | Shivamugga | Karnataka | 520102 |   888888888 | raghabendra@gmail.com   |
+-------------+----------+-----------+------------+-----------+--------+-------------+-------------------------+
2 rows in set (0.0009 sec)

=====================================================
-- UC8 soriting the name alphbetically for given city
=====================================================

 localhost:3306 ssl  addressbookservice  SQL > insert into AddressBook(firstname,lastname,address,city,state,zip,phoneNumber,email)
                                                   -> values ('Abhi','V','coorg','Chikkamagalur','Karnatak',50102,9874561023,'abhi@gmail.com');
Query OK, 1 row affected (0.0038 sec)
 MySQL  localhost:3306 ssl  addressbookservice  SQL > insert into AddressBook(firstname,lastname,address,city,state,zip,phoneNumber,email)
                                                   -> values('Vijay','Mishra','VaidyaPatti','Pratpgarh','Uttar Pradesh',851026,9874563201,'Vijay@gmail.com');
Query OK, 1 row affected (0.0044 sec)
 MySQL  localhost:3306 ssl  addressbookservice  SQL > insert into AddressBook(firstname,lastname,address,city,state,zip,phoneNumber,email)values
                                                   -> ('uday','reddy','gauribidanur','benagaluru','karnataka',652142,8520147963,'Uday@gmail.com');
Query OK, 1 row affected (0.0030 sec)

 localhost:3306 ssl  addressbookservice  SQL > select * from AddressBook;
+-----------+----------+--------------+---------------+---------------+--------+-------------+-------------------------+
| firstName | lastName | address      | city          | state         | zip    | phoneNumber | email                   |
+-----------+----------+--------------+---------------+---------------+--------+-------------+-------------------------+
| Sandhya   | Bagale   | Vijayapur    | Bijapur       | Karnataka     | 767015 |  7339731548 | sandhyabagale@gmail.com |
| Deepak    | Yadav    | Alambagh     | Lucknow       | Uttar Pradesh | 520102 |   888888888 | deepak@gmail.com        |
| Abhi      | V        | coorg        | Chikkamagalur | Karnatak      |  50102 |  9874561023 | abhi@gmail.com          |
| Vijay     | Mishra   | VaidyaPatti  | Pratpgarh     | Uttar Pradesh | 851026 |  9874563201 | Vijay@gmail.com         |
| uday      | reddy    | gauribidanur | benagaluru    | karnataka     | 652142 |  8520147963 | Uday@gmail.com          |
+-----------+----------+--------------+---------------+---------------+--------+-------------+-------------------------+
5 rows in set (0.0015 sec)
localhost:3306 ssl  addressbookservice  SQL > select firstname,city from AddressBook order by city;
+-----------+---------------+
| firstname | city          |
+-----------+---------------+
| uday      | benagaluru    |
| Sandhya   | Bijapur       |
| Abhi      | Chikkamagalur |
| Deepak    | Lucknow       |
| Vijay     | Pratpgarh     |
+-----------+---------------+
5 rows in set (0.0020 sec)
 ==================================================================
-- UC9- altering the table with addressbook name and contact type
==================================================================
 alter table addressbook add bookName varchar(25) not null, add contactType varchar(25)  not null;
Query OK, 0 rows affected (0.0902 sec)

Records: 0  Duplicates: 0  Warnings: 0
desc addressBook;
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
| bookName    | varchar(25)  | NO   |     | NULL    |       |
| contactType | varchar(25)  | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
10 rows in set (0.0496 sec)
 MySQL  localhost:3306 ssl  addressbookservice  SQL > update AddressBook set bookname='one', contactType='Family' where lastname='Bagale' ;
Query OK, 1 row affected (0.0064 sec)

Rows matched: 1  Changed: 1  Warnings: 0 localhost:3306 ssl  addressbookservice  SQL > update addressBook set bookname='two' ,contactType='Friends' where firstname='Deepak';
Query OK, 1 row affected (0.0034 sec)

Rows matched: 1  Changed: 1  Warnings: 0

 update addressbook set bookname='two',contactType='Profession' where  lastname='Yadav';
Query OK, 1 row affected (0.0090 sec)

Rows matched: 1  Changed: 1  Warnings: 0
tched: 1  Changed: 1  Warnings: 0
 MySQL  localhost:3306 ssl  addressbookservice  SQL >  select * from AddressBook;
+-----------+----------+--------------+---------------+---------------+--------+-------------+-------------------------+----------+-------------+
| firstName | lastName | address      | city          | state         | zip    | phoneNumber | email                   | bookName | contactType |
+-----------+----------+--------------+---------------+---------------+--------+-------------+-------------------------+----------+-------------+
| Sandhya   | Bagale   | Vijayapur    | Bijapur       | Karnataka     | 767015 |  7339731548 | sandhyabagale@gmail.com | one      | Family      |
| Deepak    | Yadav    | Alambagh     | Lucknow       | Uttar Pradesh | 520102 |   888888888 | deepak@gmail.com        | two      | Profession  |
| Abhi      | V        | coorg        | Chikkamagalur | Karnatak      |  50102 |  9874561023 | abhi@gmail.com          |          |             |
| Vijay     | Mishra   | VaidyaPatti  | Pratpgarh     | Uttar Pradesh | 851026 |  9874563201 | Vijay@gmail.com         |          |             |
| uday      | reddy    | gauribidanur | benagaluru    | karnataka     | 652142 |  8520147963 | Uday@gmail.com          |          |             |
+-----------+----------+--------------+---------------+---------------+--------+-------------+-------------------------+----------+-------------+
5 rows in set (0.0008 sec)
select * from addressbook where contactType='Family';
+-----------+----------+-----------+---------+-----------+--------+-------------+-------------------------+----------+-------------+
| firstName | lastName | address   | city    | state     | zip    | phoneNumber | email                   | bookName | contactType |
+-----------+----------+-----------+---------+-----------+--------+-------------+-------------------------+----------+-------------+
| Sandhya   | Bagale   | Vijayapur | Bijapur | Karnataka | 767015 |  7339731548 | sandhyabagale@gmail.com | one      | Family      |
+-----------+----------+-----------+---------+-----------+--------+-------------+-------------------------+----------+-------------+
1 row in set (0.0019 sec)
 select * from AddressBook where contacttype='Friends';
Empty set (0.0014 sec)

========================================================
-- UC10 ability to get count of contacts by contacttype
========================================================
                                            -> ^C
 MySQL  localhost:3306 ssl  addressbookservice  SQL > select count(firstname) from AddressBook where contactType='family';
+------------------+
| count(firstname) |
+------------------+
|                1 |
+------------------+
1 row in set (0.0024 sec)




