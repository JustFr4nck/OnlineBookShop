drop schema if exists bookShop;
create schema bookShop;
use bookShop;
-- create db
CREATE TABLE utente (
    id_utente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cognome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    data_registrazione TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE libro (
    id_libro INT PRIMARY KEY AUTO_INCREMENT,
    titolo VARCHAR(200) NOT NULL,
    autore VARCHAR(150) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    prezzo DECIMAL(8,2) NOT NULL,
    stock INT NOT NULL
);

CREATE TABLE ordine (
    id_ordine INT PRIMARY KEY AUTO_INCREMENT,
    id_utente INT NOT NULL,
    data_ordine TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    stato VARCHAR(50) NOT NULL,
    totale DECIMAL(10,2),

    FOREIGN KEY (id_utente) REFERENCES utente(id_utente)
);

CREATE TABLE dettaglio_ordine (
    id_dettaglio INT PRIMARY KEY AUTO_INCREMENT,
    id_ordine INT NOT NULL,
    id_libro INT NOT NULL,
    quantita INT NOT NULL,
    prezzo_unitario DECIMAL(8,2) NOT NULL,

    FOREIGN KEY (id_ordine) REFERENCES ordine(id_ordine),
    FOREIGN KEY (id_libro) REFERENCES libro(id_libro)
);

-- Insert

INSERT INTO utente (nome, cognome, email, password) VALUES
('Mario', 'Rossi', 'mario.rossi@email.it', 'pwd1'),
('Luigi', 'Bianchi', 'luigi.bianchi@email.it', 'pwd2'),
('Anna', 'Verdi', 'anna.verdi@email.it', 'pwd3'),
('Giulia', 'Neri', 'giulia.neri@email.it', 'pwd4'),
('Paolo', 'Ferrari', 'paolo.ferrari@email.it', 'pwd5'),
('Sara', 'Romano', 'sara.romano@email.it', 'pwd6'),
('Marco', 'Gallo', 'marco.gallo@email.it', 'pwd7'),
('Elena', 'Costa', 'elena.costa@email.it', 'pwd8');

INSERT INTO libro (titolo, autore, isbn, prezzo, stock) VALUES
('Il nome della rosa', 'Umberto Eco', '9780156001311', 14.90, 20),
('1984', 'George Orwell', '9780451524935', 12.50, 30),
('Il signore degli anelli', 'J.R.R. Tolkien', '9780618640157', 29.90, 15),
('Harry Potter e la pietra filosofale', 'J.K. Rowling', '9780747532699', 10.90, 50),
('Il codice Da Vinci', 'Dan Brown', '9780307474278', 11.90, 25),
('La divina commedia', 'Dante Alighieri', '9788807900331', 18.00, 10),
('Orgoglio e pregiudizio', 'Jane Austen', '9780141439518', 9.90, 40),
('Il piccolo principe', 'Antoine de Saint-Exupéry', '9780156012195', 8.50, 60),
('Cronache di Narnia', 'C.S. Lewis', '9780066238500', 24.00, 12),
('Fahrenheit 451', 'Ray Bradbury', '9781451673319', 11.00, 35);

INSERT INTO ordine (id_utente, stato, totale) VALUES
(1, 'SPEDITO', 27.40),
(2, 'CONSEGNATO', 29.90),
(3, 'IN_LAVORAZIONE', 22.80),
(1, 'CONSEGNATO', 18.00),
(4, 'SPEDITO', 21.40),
(5, 'ANNULLATO', 0.00),
(6, 'CONSEGNATO', 34.80),
(7, 'IN_LAVORAZIONE', 19.80),
(8, 'SPEDITO', 14.90),
(2, 'CONSEGNATO', 23.50);

INSERT INTO dettaglio_ordine (id_ordine, id_libro, quantita, prezzo_unitario) VALUES
-- Ordine 1
(1, 1, 1, 14.90),
(1, 8, 1, 12.50),

-- Ordine 2
(2, 3, 1, 29.90),

-- Ordine 3
(3, 4, 2, 10.90),

-- Ordine 4
(4, 6, 1, 18.00),

-- Ordine 5
(5, 7, 1, 9.90),
(5, 10, 1, 11.50),

-- Ordine 6 (annullato, nessun dettaglio)

-- Ordine 7
(7, 2, 2, 12.50),
(7, 8, 1, 8.50),

-- Ordine 8
(8, 7, 2, 9.90),

-- Ordine 9
(9, 1, 1, 14.90),

-- Ordine 10
(10, 8, 1, 8.50),
(10, 10, 1, 15.00);