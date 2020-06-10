DROP DATABASE IF EXISTS baker;

CREATE DATABASE baker CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE baker;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;

#正規化
#總價=訂單明細資料表.購買數量 * 產品基本資料表.單價
#運費也可以使用計算公式得出出來
/*
CREATE TABLE orders(
  訂單編號 VARCHAR(4) NOT NULL UNIQUE,
  客戶編號 VARCHAR(4) NOT NULL,
  購買日期 DATE,
  運費     INTEGER,
  PRIMARY KEY (訂單編號)
);
*/

/*
CREATE TABLE orders_detail(
  訂單編號 VARCHAR(4) NOT NULL,
  產品編號 VARCHAR(4) NOT NULL,
  購買數量 INTEGER,
  PRIMARY KEY (訂單編號, 產品編號)
);
*/
CREATE TABLE customers(
  cid  tinyint(4) NOT NULL auto_increment, 
  cname VARCHAR(20) NOT NULL UNIQUE,
  ps varchar(10) ,
  cemail VARCHAR(100) NOT NULL,
   
  PRIMARY KEY (cid)
);


CREATE TABLE products(
  pid  tinyint(4) NOT NULL auto_increment,
  pname VARCHAR(20) NOT null unique,
  num VARCHAR(2),
  cash int,
  PRIMARY KEY (pid)
);

INSERT INTO products (pname,num,cash) VALUE('75% 摩卡生巧乳酪','個','400');
INSERT INTO products (pname,num,cash)  VALUE('丸久小山園抹茶生巧乳酪','個','350');
INSERT INTO products (pname,num,cash)  VALUE('日光。芋乳酪蛋糕','個','360');
INSERT INTO products (pname,num,cash)  VALUE('奇幻旅程','個','500');
INSERT INTO products (pname,num,cash)  VALUE('品好經典原味乳酪','個','750');
INSERT INTO products (pname,num,cash)  VALUE('仲夏莓果','個','600');
INSERT INTO products (pname,num,cash)  VALUE('巧克力手工餅乾','個','760');
INSERT INTO products (pname,num,cash)  VALUE('玉米片手工餅乾','個','780');
INSERT INTO products (pname,num,cash)  VALUE('帕瑪森迷迭香起司餅乾','個','900');
INSERT INTO products (pname,num,cash)  VALUE('黑芝麻手工餅乾','個','100');
INSERT INTO products (pname,num,cash)  VALUE('橘子手工餅乾','個','130');
INSERT INTO products (pname,num,cash)  VALUE('覆盆莓餅乾','個','130');




/*
CREATE TABLE members(
	會員編號 VARCHAR(5) NOT NULL UNIQUE,
	會員名稱 VARCHAR(15),
    會員帳號 VARCHAR(20),
    會員密碼 VARCHAR(20),
    會員Email VARCHAR(20),
    會員地址 VARCHAR(30),
     PRIMARY KEY (會員編號)
);
*/



