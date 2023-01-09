CREATE DATABASE project;

USE project;

CREATE TABLE tavolina (
  ID INT NOT NULL,
  Statusi NVARCHAR(45) NOT NULL,
  NrIKarrigeve NVARCHAR(45) NOT NULL,
  PRIMARY KEY (ID));

CREATE TABLE stafi (
  ID INT NOT NULL,
  Emri NVARCHAR(45) NOT NULL,
  Mbiemri NVARCHAR(45) NOT NULL,
  Roli NVARCHAR(45) NOT NULL,
  Paga INT NOT NULL,
  Adresa NVARCHAR(45) NOT NULL,
  NumriITelefonit INT NOT NULL,
  Bonuset INT NOT NULL,
  PRIMARY KEY (ID));

CREATE TABLE konsumatori (
  ID INT NOT NULL,
  Emri NVARCHAR(45) NOT NULL,
  Mbiemri NVARCHAR(45) NOT NULL,
  Telefoni BIGINT(45) NOT NULL,
  Adresa NVARCHAR(45) NOT NULL,
  Nacionaliteti NVARCHAR(45) NOT NULL,
  Email NVARCHAR(45) NOT NULL,
  PRIMARY KEY (ID));

CREATE TABLE booking (
  ID INT NOT NULL,
  DataRezervimit DATE NOT NULL,
  Rezervimi DATE NOT NULL,
  Punetori INT NOT NULL,
  Klienti INT NOT NULL,
  Tavolina INT NOT NULL,
  Anuluar NVARCHAR(45) NOT NULL,
  NrIRezervimeve INT NOT NULL,
  PRIMARY KEY (Rezervimi),
  INDEX Punetori_idx (Punetori ASC) VISIBLE,
  INDEX Klienti_idx (Klienti ASC) VISIBLE,
  INDEX Tavolina_idx (Tavolina ASC) VISIBLE,
  CONSTRAINT Punetori
    FOREIGN KEY (Punetori)
    REFERENCES stafi (ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT Klienti
    FOREIGN KEY (Klienti)
    REFERENCES konsumatori (ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT Tavolina
    FOREIGN KEY (Tavolina)
    REFERENCES tavolina (ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE porosia (
  ID INT NOT NULL,
  Tavolina INT NOT NULL,
  Kamarieri INT NOT NULL,
  Artikujt INT NOT NULL,
  Data DATE NOT NULL,
  Sasia INT NOT NULL,
  Totali DOUBLE NOT NULL,
  Klienti INT NOT NULL,
  INDEX Tavolina_idx (Tavolina ASC) VISIBLE,
  INDEX Kamarieri_idx (Kamarieri ASC) VISIBLE,
  PRIMARY KEY (Data),
  CONSTRAINT Tavolina1
    FOREIGN KEY (Tavolina)
    REFERENCES tavolina (ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT Kamarieri
    FOREIGN KEY (Kamarieri)
    REFERENCES stafi (ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT Data1
    FOREIGN KEY (Data)
    REFERENCES booking (Rezervimi)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE menu (
  ID INT NOT NULL,
  Kategoria NVARCHAR(45) NOT NULL,
  Ushqimi NVARCHAR(45) NOT NULL,
  Pershkrimi NVARCHAR(45) NOT NULL,
  Cmimi DOUBLE NOT NULL,
  KohaESherbimit NVARCHAR(45) NOT NULL,
  PRIMARY KEY (ID));

CREATE TABLE muzika (
  Kengetari NVARCHAR(45) NOT NULL,
  Kenga NVARCHAR(45) NOT NULL,
  Koha NVARCHAR(45) NOT NULL,
  Pagesa INT NOT NULL,
  NrIPjesemarresve INT NOT NULL,
  Data DATE NOT NULL,
  PRIMARY KEY (Data),
  CONSTRAINT Data
    FOREIGN KEY (Data)
    REFERENCES booking (Rezervimi)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO tavolina (ID, Statusi, NrIKarrigeve) 
VALUES 
('100', 'E lire', '4');

INSERT INTO tavolina (ID, Statusi, NrIKarrigeve)
VALUES 
('101', 'E lire', '6');

INSERT INTO tavolina (ID, Statusi, NrIKarrigeve)
VALUES 
('102', 'E zene', '4');

INSERT INTO tavolina (ID, Statusi, NrIKarrigeve)
VALUES
('103', 'E zene', '6');

INSERT INTO tavolina (ID, Statusi, NrIKarrigeve)
VALUES
('104', 'E lire', '8');

INSERT INTO tavolina (ID, Statusi, NrIKarrigeve)
VALUES 
('105', 'E zene', '6');

INSERT INTO tavolina (ID, Statusi, NrIKarrigeve)
VALUES 
('106', 'E lire', '8');

INSERT INTO tavolina (ID, Statusi, NrIKarrigeve)
VALUES 
('107', 'E zene', '4');

INSERT INTO tavolina (ID, Statusi, NrIKarrigeve)
VALUES 
('108', 'E zene', '6');

INSERT INTO tavolina (ID, Statusi, NrIKarrigeve)
VALUES 
('109', 'E lire', '8');


INSERT INTO stafi (ID, Emri, Mbiemri, Roli, Paga, Adresa, NumriITelefonit, Bonuset) 
VALUES 
('210756', 'Kody', 'Jameson', 'Kamarier', '800', 'Birmingham', '+447253263342', '15');

INSERT INTO stafi (ID, Emri, Mbiemri, Roli, Paga, Adresa, NumriITelefonit, Bonuset) 
VALUES 
('210757', 'Raleigh', 'Triggs', 'Asistent Menaxher', '820', 'Cambridge', '+447253263356', '35');

INSERT INTO stafi (ID, Emri, Mbiemri, Roli, Paga, Adresa, NumriITelefonit, Bonuset) 
VALUES 
('210758', 'Justin', 'Savidge', 'Kuzhinier', '750', 'Edinburgh', '+447472044056', '35');

INSERT INTO stafi (ID, Emri, Mbiemri, Roli, Paga, Adresa, NumriITelefonit, Bonuset) 
VALUES 
('210759', 'Morris', 'Fields', 'Kamarier', '600', 'Leeds', '+447453375765', '24');

INSERT INTO stafi (ID, Emri, Mbiemri, Roli, Paga, Adresa, NumriITelefonit, Bonuset) 
VALUES 
('210760', 'Stuart', 'Simons', 'Kamarier', '650', 'Manchester', '+447438705883', '24');

INSERT INTO stafi (ID, Emri, Mbiemri, Roli, Paga, Adresa, NumriITelefonit, Bonuset) 
VALUES 
('210761', 'Harley', 'Keys', 'Shankist', '750', 'Norwich', '+447457243403', '24');

INSERT INTO stafi (ID, Emri, Mbiemri, Roli, Paga, Adresa, NumriITelefonit, Bonuset) 
VALUES 
('210762', 'Gael', 'Waller', 'Kuzhinier', '800', 'Nottingham', '+447911043627', '22');

INSERT INTO stafi (ID, Emri, Mbiemri, Roli, Paga, Adresa, NumriITelefonit, Bonuset) 
VALUES 
('210763', 'Trent', 'House', 'Kamarier', '600', 'Brighton', '+447457544164', '20');

INSERT INTO stafi (ID, Emri, Mbiemri, Roli, Paga, Adresa, NumriITelefonit, Bonuset) 
VALUES 
('210764', 'Abe', 'Jacobs', 'Shankist', '750', 'Sheffield', '+447247767005', '15');

INSERT INTO stafi (ID, Emri, Mbiemri, Roli, Paga, Adresa, NumriITelefonit, Bonuset)  
VALUES 
('210765', 'Ingram', 'Reynolds', 'Kamarier', '650', 'Sunderland', '+447160535422', '20');


INSERT INTO konsumatori (ID, Emri, Mbiemri, Telefoni, Adresa, Nacionaliteti, Email) 
VALUES 
('756100', 'Jeremy', 'Osborne', '+447459587811', 'Swansesa', 'Spanjoll', 'jeremyosborne@gmail.com');

INSERT INTO konsumatori (ID, Emri, Mbiemri, Telefoni, Adresa, Nacionaliteti, Email) 
VALUES 
('756101', 'Leighton', 'Endicott', '+447700061699', 'Wrexham', 'Gjerman', 'leightonendicott@gmail.com');

INSERT INTO konsumatori (ID, Emri, Mbiemri, Telefoni, Adresa, Nacionaliteti, Email) 
VALUES 
('756102', 'Wade', 'Waterman', '+447457526467', 'Wolverhampton', 'Portugez', 'wadewaterman@gmail.com');

INSERT INTO konsumatori (ID, Emri, Mbiemri, Telefoni, Adresa, Nacionaliteti, Email) 
VALUES 
('756103', 'Haven', 'Fry', '+447522645495', 'Liverpool', 'Anglez', 'havenfry@gmail.com');

INSERT INTO konsumatori (ID, Emri, Mbiemri, Telefoni, Adresa, Nacionaliteti, Email) 
VALUES 
('756104', 'Isa', 'Jernigan', '+447524753935', 'London', 'Francez', 'isajernigan@gmail.com');

INSERT INTO konsumatori (ID, Emri, Mbiemri, Telefoni, Adresa, Nacionaliteti, Email) 
VALUES 
('756105', 'Waverly', 'Pearson', '+447700039264', 'Southampton', 'Italian', 'waverlypearson@gmail.com');

INSERT INTO konsumatori (ID, Emri, Mbiemri, Telefoni, Adresa, Nacionaliteti, Email) 
VALUES 
('756106', 'Dutch', 'Winthrop', '+447457968380', 'Leicester', 'Ukrainas', 'dutchwinthrop@gmail.com');

INSERT INTO konsumatori (ID, Emri, Mbiemri, Telefoni, Adresa, Nacionaliteti, Email) 
VALUES 
('756107', 'Graeme', 'Coy', '+447830036270', 'Bristol', 'Gjerman', 'graemecoy@gmail.com');

INSERT INTO konsumatori (ID, Emri, Mbiemri, Telefoni, Adresa, Nacionaliteti, Email)  
VALUES 
('756108', 'Bertrand', 'Holt', '+447457165034', 'Bradford', 'Anglez', 'bertrandholt@gmail.com');

INSERT INTO konsumatori (ID, Emri, Mbiemri, Telefoni, Adresa, Nacionaliteti, Email) 
VALUES 
('756109', 'Page', 'Fitzroy', '+447457436057', 'Colchester', 'Kosovar', 'pagefitzroy@gmail.com');

INSERT INTO konsumatori (ID, Emri, Mbiemri, Telefoni, Adresa, Nacionaliteti, Email) 
VALUES 
('756110', 'James', 'Arnold', '+447457437162', 'Liverpool', 'Anglez', 'jamesarnold@gmail.com');

INSERT INTO konsumatori (ID, Emri, Mbiemri, Telefoni, Adresa, Nacionaliteti, Email) 
VALUES 
('756111', 'Reece', 'Henderson', '+447457156282', 'London', 'Gjerman', 'reecehenderson@gmail.com');



INSERT INTO booking (ID, DataRezervimit, Rezervimi, Punetori, Klienti, Tavolina, Anuluar, NrIRezervimeve) 
VALUES 
('121100', '2022-1-31', '2022-3-2', '210764', '756100', '101', 'Jo', '1');

INSERT INTO booking (ID, DataRezervimit, Rezervimi, Punetori, Klienti, Tavolina, Anuluar, NrIRezervimeve) 
VALUES 
('121101', '2022-3-31', '2022-4-10', '210761', '756101', '105', 'Jo', '2');

INSERT INTO booking (ID, DataRezervimit, Rezervimi, Punetori, Klienti, Tavolina, Anuluar, NrIRezervimeve) 
VALUES 
('121102', '2022-7-14', '2022-7-20', '210761', '756102', '109', 'Po', '2');

INSERT INTO booking (ID, DataRezervimit, Rezervimi, Punetori, Klienti, Tavolina, Anuluar, NrIRezervimeve) 
VALUES 
('121103', '2022-7-12', '2022-7-23', '210763', '756103', '108', 'Po', '3');

INSERT INTO booking (ID, DataRezervimit, Rezervimi, Punetori, Klienti, Tavolina, Anuluar, NrIRezervimeve) 
VALUES 
('121104', '2022-8-11', '2022-8-20', '210764', '756104', '102', 'Jo', '5');

INSERT INTO booking (ID, DataRezervimit, Rezervimi, Punetori, Klienti, Tavolina, Anuluar, NrIRezervimeve) 
VALUES 
('121105', '2022-19-9', '2022-9-21', '210759', '756105', '100', 'Jo', '1');

INSERT INTO booking (ID, DataRezervimit, Rezervimi, Punetori, Klienti, Tavolina, Anuluar, NrIRezervimeve) 
VALUES 
('121106', '2022-10-13', '2022-10-15', '210765', '756106', '103', 'Jo', '1');

INSERT INTO booking (ID, DataRezervimit, Rezervimi, Punetori, Klienti, Tavolina, Anuluar, NrIRezervimeve) 
VALUES 
('121107', '2022-12-13', '2022-12-15', '210761', '756107', '107', 'Jo', '2');

INSERT INTO booking (ID, DataRezervimit, Rezervimi, Punetori, Klienti, Tavolina, Anuluar, NrIRezervimeve) 
VALUES 
('121108', '2022-12-8', '2022-12-17', '210764', '756108', '104', 'Po', '4');

INSERT INTO booking (ID, DataRezervimit, Rezervimi, Punetori, Klienti, Tavolina, Anuluar, NrIRezervimeve) 
VALUES 
('121109', '2022-12-15', '2022-12-19', '210761', '756109', '106', 'Jo', '3');

INSERT INTO booking (ID, DataRezervimit, Rezervimi, Punetori, Klienti, Tavolina, Anuluar, NrIRezervimeve) 
VALUES 
('121110', '2022-12-10', '2022-12-20', '210759', '756110', '101', 'Jo', '4');

INSERT INTO booking (ID, DataRezervimit, Rezervimi, Punetori, Klienti, Tavolina, Anuluar, NrIRezervimeve) 
VALUES 
('121111', '2022-12-11', '2022-12-21', '210760', '756111', '108', 'Jo', '1');


INSERT INTO porosia (ID, Tavolina, Kamarieri, Artikujt, Data, Sasia, Totali, Klienti) 
VALUES 
('7110', '105', '210760', '509', '2022-7-20', '4', '26', '756102');

INSERT INTO porosia (ID, Tavolina, Kamarieri, Artikujt, Data, Sasia, Totali, Klienti)  
VALUES 
('7111', '102', '210763', '503', '2022-8-20', '3', '10.5', '756104');

INSERT INTO porosia (ID, Tavolina, Kamarieri, Artikujt, Data, Sasia, Totali, Klienti) 
VALUES 
('7112', '107', '210759', '507', '2022-12-15', '2', '5', '756107');

INSERT INTO porosia (ID, Tavolina, Kamarieri, Artikujt, Data, Sasia, Totali, Klienti) 
VALUES 
('7113', '100', '210760', '505', '2022-12-17', '4', '5.2', '756108');

INSERT INTO porosia (ID, Tavolina, Kamarieri, Artikujt, Data, Sasia, Totali, Klienti) 
VALUES 
('7114', '109', '210760', '510', '2022-9-21', '6', '39', '756105');

INSERT INTO porosia (ID, Tavolina, Kamarieri, Artikujt, Data, Sasia, Totali, Klienti) 
VALUES 
('7115', '101', '210756', '504', '2022-3-2', '6', '7.8', '756100');

INSERT INTO porosia (ID, Tavolina, Kamarieri, Artikujt, Data, Sasia, Totali, Klienti) 
VALUES 
('7116', '103', '210759', '508', '2022-10-15', '5', '15', '756106');

INSERT INTO porosia (ID, Tavolina, Kamarieri, Artikujt, Data, Sasia, Totali, Klienti) 
VALUES 
('7117', '106', '210763', '502', '2022-12-19', '6', '33', '756109');

INSERT INTO porosia (ID, Tavolina, Kamarieri, Artikujt, Data, Sasia, Totali, Klienti) 
VALUES 
('7117', '101', '210759', '502', '2022-12-20', '3', '16.5', '756110');

INSERT INTO porosia (ID, Tavolina, Kamarieri, Artikujt, Data, Sasia, Totali, Klienti) 
VALUES 
('7117', '108', '210760', '502', '2022-12-21', '2', '11', '756111');

INSERT INTO porosia (ID, Tavolina, Kamarieri, Artikujt, Data, Sasia, Totali, Klienti) 
VALUES 
('7118', '104', '210760', '501', '2022-7-23', '4', '24', '756103');

INSERT INTO porosia (ID, Tavolina, Kamarieri, Artikujt, Data, Sasia, Totali, Klienti) 
VALUES 
('7119', '108', '210759', '506', '2022-4-10', '6', '6', '756101');


INSERT INTO menu (ID, Kategoria, Ushqimi, Pershkrimi, Cmimi, KohaESherbimit) 
VALUES 
('501', 'Pizza', 'Mushroom Pizza', 'Pice e vogel', '6', 'Tere diten');

INSERT INTO menu (ID, Kategoria, Ushqimi, Pershkrimi, Cmimi, KohaESherbimit) 
VALUES 
('502', 'Pizza', 'Vegetarian Pizza', 'Pice mesatare', '5.5', 'Tere diten');

INSERT INTO menu (ID, Kategoria, Ushqimi, Pershkrimi, Cmimi, KohaESherbimit) 
VALUES 
('503', 'Burger', 'Bacon Cheeseburger', 'Djeges', '3.5', 'Mengjes');

INSERT INTO menu (ID, Kategoria, Ushqimi, Pershkrimi, Cmimi, KohaESherbimit) 
VALUES 
('504', 'Drinks', 'Cocacola', 'Me akull', '1.3', 'Tere diten');

INSERT INTO menu (ID, Kategoria, Ushqimi, Pershkrimi, Cmimi, KohaESherbimit) 
VALUES 
('505', 'Drinks', 'Fanta', 'Pa akull', '1.3', 'Tere diten');

INSERT INTO menu (ID, Kategoria, Ushqimi, Pershkrimi, Cmimi, KohaESherbimit) 
VALUES 
('506', 'Drinks', 'Coffee', 'Turke', '1', 'Tere diten');

INSERT INTO menu (ID, Kategoria, Ushqimi, Pershkrimi, Cmimi, KohaESherbimit) 
VALUES 
('507', 'Milkshake', 'Vanilla Milkshake', 'Nje porcion', '2.5', 'Mesdite');

INSERT INTO menu (ID, Kategoria, Ushqimi, Pershkrimi, Cmimi, KohaESherbimit) 
VALUES 
('508', 'Milkshake', 'Chocolate Milkshake', 'Nje porcion', '3', 'Mengjes');

INSERT INTO menu (ID, Kategoria, Ushqimi, Pershkrimi, Cmimi, KohaESherbimit) 
VALUES 
('509', 'Fries', 'Mozzarella Sticks', 'Djeges', '6.5', 'Pasdite');

INSERT INTO menu (ID, Kategoria, Ushqimi, Pershkrimi, Cmimi, KohaESherbimit) 
VALUES 
('510', 'Fries', 'French Fries', 'Dy porcione', '6.5', 'Tere diten');


INSERT INTO muzika (Kengetari, Kenga, Koha, Pagesa, NrIPjesemarresve, Data) 
VALUES 
('Sabri Fejzullahu', 'Fshatarja ime', '12:00 deri 16:00', '500', '310', '2022-3-2');

INSERT INTO muzika (Kengetari, Kenga, Koha, Pagesa, NrIPjesemarresve, Data) 
VALUES 
('Meda', 'Ai plumb', '16:00 deri 20:00', '800', '300', '2022-4-10');

INSERT INTO muzika (Kengetari, Kenga, Koha, Pagesa, NrIPjesemarresve, Data) 
VALUES 
('Mentor Kurtishi', 'Zemra te don', '20:00 deri 00:00', '750', '285', '2022-7-20');

INSERT INTO muzika (Kengetari, Kenga, Koha, Pagesa, NrIPjesemarresve, Data) 
VALUES 
('Shyhrete Behluli', 'Banja qefin vetes', '12:00 deri 16:00', '450', '170', '2022-7-23');

INSERT INTO muzika (Kengetari, Kenga, Koha, Pagesa, NrIPjesemarresve, Data) 
VALUES 
('Sinan Vllasaliu', 'Mos ia falni', '16:00 deri 20:00', '800', '210', '2022-8-20');

INSERT INTO muzika (Kengetari, Kenga, Koha, Pagesa, NrIPjesemarresve, Data) 
VALUES 
('Yllka Kuqi', 'Ani', '20:00 deri 00:00', '1000', '320', '2022-9-21');

INSERT INTO muzika (Kengetari, Kenga, Koha, Pagesa, NrIPjesemarresve, Data) 
VALUES 
('Yll Limani', 'Najher', '16:00 deri 20:00', '900', '400', '2022-10-15');

INSERT INTO muzika (Kengetari, Kenga, Koha, Pagesa, NrIPjesemarresve, Data)  
VALUES 
('Butrint Imeri', 'Lejla', '20:00 deri 00:00', '600', '380', '2022-12-15');

INSERT INTO muzika (Kengetari, Kenga, Koha, Pagesa, NrIPjesemarresve, Data) 
VALUES 
('Kida', 'Merri krejt', '16:00 deri 20:00', '850', '395', '2022-12-17');

INSERT INTO muzika (Kengetari, Kenga, Koha, Pagesa, NrIPjesemarresve, Data) 
VALUES 
('Mozzik', 'Bespreme', '20:00 deri 00:00', '1200', '399', '2022-12-19');


SELECT * FROM konsumatori WHERE Adresa='Liverpool';

SELECT Emri, Mbiemri FROM konsumatori
WHERE ID IN (SELECT Klienti FROM booking
WHERE year(Rezervimi) = 2022
GROUP BY ID
HAVING COUNT(*) >= 2);

SELECT * FROM konsumatori
WHERE ID IN (SELECT Klienti FROM booking
WHERE year(Rezervimi) IN (2021, 2022) AND Anuluar = "Po"
GROUP BY ID
HAVING COUNT(*) >= 1);

(SELECT Emri, Mbiemri FROM stafi WHERE Paga > 500)
UNION
(SELECT Emri, Mbiemri FROM konsumatori WHERE ID IN (SELECT Klienti FROM booking WHERE DataRezervimit = '2022-01-31'));

SELECT k.Emri, k.Mbiemri, p.Sasia, s.Emri, s.Mbiemri
FROM porosia p
JOIN konsumatori k ON p.Klienti = k.ID
JOIN stafi s ON p.Kamarieri = s.ID
WHERE p.Data >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
ORDER BY p.Sasia DESC
LIMIT 5;

SELECT YEAR(p.Data) AS Viti, MONTH(p.Data) AS Muaji, SUM(m.Cmimi * p.Sasia) AS Shuma
FROM porosia p
JOIN menu m ON p.Artikujt = m.ID
WHERE p.Data BETWEEN '2022-10-01' AND '2022-12-31'
GROUP BY YEAR(p.Data), MONTH(p.Data)
ORDER BY Muaji DESC;

SELECT DAYNAME(b.Rezervimi) AS Dita, AVG(b.NrIRezervimeve) AS Mesatarja
FROM booking b
WHERE MONTH(b.Rezervimi) IN (7, 8)
GROUP BY DAYNAME(b.Rezervimi)
ORDER BY DAYOFWEEK(b.Rezervimi);

SELECT m.Ushqimi AS TopProdukti, SUM(p.Sasia) AS Total
FROM porosia p
JOIN menu m ON p.Artikujt = m.ID
WHERE m.kategoria = ('Pizza' AND 'Fries' AND 'Burger') AND m.kategoria != ('Drinks') AND YEAR(p.Data) = YEAR(CURDATE())
GROUP BY m.Ushqimi
ORDER BY TopProdukti DESC
LIMIT 1;

SELECT (p.ID) as Porosia
FROM porosia p
JOIN menu m ON p.Artikujt = m.ID
WHERE m.Kategoria = 'Pizza'
GROUP BY p.Artikujt
HAVING COUNT(*) >= 3;

CREATE VIEW KonsumatoretAnglez AS
SELECT * FROM konsumatori WHERE Nacionaliteti = 'Anglez';

SELECT * FROM KonsumatoretAnglez;

CREATE VIEW KonsumatoretDimeror AS
SELECT k.* FROM konsumatori k
INNER JOIN booking b ON k.id = b.klienti
WHERE b.Anuluar = "Jo" AND MONTH(b.Rezervimi) IN (12, 1, 2)
GROUP BY k.id;

SELECT * FROM KonsumatoretDimeror;

DELIMITER $$
CREATE TRIGGER CheckDateOnInsertBooking BEFORE INSERT ON booking
FOR EACH ROW
BEGIN
  IF YEAR(NEW.Rezervimi) != 2022 THEN
    SET NEW.Rezervimi = NULL;
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Viti duhet te jete 2022';
  END IF;
END
$$ DELIMITER ;

SHOW TRIGGERS;

INSERT INTO booking (ID, DataRezervimit, Rezervimi, Punetori, Klienti, Tavolina, Anuluar, NrIRezervimeve)
VALUES
('121107', '2023-12-13', '2023-12-15', '210761', '756109', '101', 'Po', '2');

DELIMITER $$
CREATE TRIGGER CheckIDOnUpdatePorosia BEFORE UPDATE ON porosia
FOR EACH ROW
BEGIN
  IF NEW.Kamarieri NOT IN (210763, 210760, 210759, 210756) THEN
    SET NEW.Kamarieri = OLD.Kamarieri;
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Ky punetor nuk eshte kamarier';
  END IF;
END
$$ DELIMITER ;

SHOW TRIGGERS;

UPDATE porosia
SET Kamarieri = '210762'
WHERE Data = '2022-08-20';

DELIMITER $$
CREATE PROCEDURE ListAdresses()
BEGIN
    SELECT Emri, Mbiemri, Adresa FROM konsumatori
    ORDER BY Adresa ASC;
END
$$ DELIMITER ;

CALL ListAdresses();

DELIMITER $$
CREATE PROCEDURE EditTavolina(IDTavolines INT, Gjendja VARCHAR(45), NrIKarrigeve VARCHAR(45))
BEGIN
 UPDATE Tavolina
 SET Statusi = Gjendja,
 NrIKarrigeve = NrIKarrigeve
 WHERE ID = IDTavolines;
END 
$$ DELIMITER ;

CALL EditTavolina(105, 'E lire', 7);

DELIMITER $$
CREATE FUNCTION TotaliTabeles()
RETURNS DECIMAL DETERMINISTIC
BEGIN
  DECLARE TotaliNeFund DECIMAL;
  SELECT SUM(Totali) INTO TotaliNeFund FROM porosia;
  RETURN TotaliNeFund;
END
$$ DELIMITER ;

SELECT TotaliTabeles();

DELIMITER $$
CREATE FUNCTION NrRezervimeveNeDhjetor()
RETURNS DECIMAL DETERMINISTIC
BEGIN
  DECLARE RezervimetNeDhjetor DECIMAL;
  SELECT COUNT(*) INTO RezervimetNeDhjetor FROM booking WHERE MONTH(Rezervimi) = 12;
  RETURN RezervimetNeDhjetor;
END
$$ DELIMITER ;

SELECT NrRezervimeveNeDhjetor();