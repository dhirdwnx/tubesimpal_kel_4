CREATE DATABASE IF NOT EXISTS tryout_db;
USE tryout_db;

SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE IF NOT EXISTS ADMIN (
    id_admin VARCHAR(50) PRIMARY KEY,
    nama_admin VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS USER (
    id_user VARCHAR(50) PRIMARY KEY,
    nama VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(255),
    alamat TEXT,
    nomor_telepon VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS TRYOUT (
    id_tryout VARCHAR(50) PRIMARY KEY,
    nama_tryout VARCHAR(100),
    tanggal_pelaksanaan DATE,
    biaya INT,
    id_admin VARCHAR(50),
    FOREIGN KEY (id_admin) REFERENCES ADMIN(id_admin)
);

CREATE TABLE IF NOT EXISTS PEMBAYARAN (
    id_pembayaran VARCHAR(50) PRIMARY KEY,
    id_user VARCHAR(50),
    id_tryout VARCHAR(50),
    bukti_pembayaran VARCHAR(255),
    status_verifikasi VARCHAR(50),
    tanggal_bayar DATE,
    id_admin VARCHAR(50),
    FOREIGN KEY (id_user) REFERENCES USER(id_user),
    FOREIGN KEY (id_tryout) REFERENCES TRYOUT(id_tryout),
    FOREIGN KEY (id_admin) REFERENCES ADMIN(id_admin)
);

CREATE TABLE IF NOT EXISTS SOAL (
    id_soal VARCHAR(50) PRIMARY KEY,
    id_tryout VARCHAR(50),
    pertanyaan TEXT,
    pilihan_a TEXT,
    pilihan_b TEXT,
    pilihan_c TEXT,
    pilihan_d TEXT,
    jawaban_benar VARCHAR(5),
    FOREIGN KEY (id_tryout) REFERENCES TRYOUT(id_tryout)
);

CREATE TABLE IF NOT EXISTS HASIL (
    id_hasil VARCHAR(50) PRIMARY KEY,
    id_user VARCHAR(50),
    id_tryout VARCHAR(50),
    skor INT,
    ranking INT,
    tanggal_selesai DATE,
    FOREIGN KEY (id_user) REFERENCES USER(id_user),
    FOREIGN KEY (id_tryout) REFERENCES TRYOUT(id_tryout)
);

REPLACE INTO ADMIN VALUES  
('ADM01', 'Budi Santoso', 'budi@admin.com', 'admin123'),
('ADM02', 'Siti Aminah', 'siti@admin.com', 'admin123'),
('ADM03', 'Andi Wijaya', 'andi@admin.com', 'admin123'),
('ADM04', 'Dewi Lestari', 'dewi@admin.com', 'admin123'),
('ADM05', 'Fajar Pratama', 'fajar@admin.com', 'admin123'),
('ADM06', 'Gita Permata', 'gita@admin.com', 'admin123'),
('ADM07', 'Hendra Kusuma', 'hendra@admin.com', 'admin123'),
('ADM08', 'Indah Sari', 'indah@admin.com', 'admin123'),
('ADM09', 'Joko Susilo', 'joko@admin.com', 'admin123'),
('ADM10', 'Kartika Putri', 'kartika@admin.com', 'admin123');

REPLACE INTO USER VALUES  
('USR01', 'Rizky', 'rizky@email.com', 'user123', 'Jakarta', '0812345'),
('USR02', 'Laila', 'laila@email.com', 'user123', 'Bandung', '0812346'),
('USR03', 'Bambang', 'bambang@email.com', 'user123', 'Surabaya', '0812347'),
('USR04', 'Siska', 'siska@email.com', 'user123', 'Yogyakarta', '0812348'),
('USR05', 'Dedi', 'dedi@email.com', 'user123', 'Semarang', '0812349'),
('USR06', 'Nina', 'nina@email.com', 'user123', 'Malang', '0812350'),
('USR07', 'Eko', 'eko@email.com', 'user123', 'Medan', '0812351'),
('USR08', 'Maya', 'maya@email.com', 'user123', 'Makassar', '0812352'),
('USR09', 'Taufik', 'taufik@email.com', 'user123', 'Palembang', '0812353'),
('USR10', 'Putri', 'putri@email.com', 'user123', 'Denpasar', '0812354');

REPLACE INTO TRYOUT VALUES  
('TO01', 'UTBK Nasional', '2026-05-20', 50000, 'ADM01'),
('TO02', 'CPNS 2026', '2026-06-15', 75000, 'ADM01'),
('TO03', 'Mandiri PTN', '2026-07-10', 60000, 'ADM02'),
('TO04', 'Kedinasan STIS', '2026-08-05', 100000, 'ADM02'),
('TO05', 'TOEFL Prep', '2026-09-12', 150000, 'ADM03'),
('TO06', 'PPPK Guru', '2026-10-20', 80000, 'ADM03'),
('TO07', 'Sertifikasi IT', '2026-11-15', 200000, 'ADM04'),
('TO08', 'Saintek Pro', '2026-12-05', 45000, 'ADM04'),
('TO09', 'Soshum Pro', '2026-12-06', 45000, 'ADM05'),
('TO10', 'Final Tryout', '2026-12-25', 30000, 'ADM05');

REPLACE INTO PEMBAYARAN VALUES  
('PAY01', 'USR01', 'TO01', 'bukti1.jpg', 'Verified', '2026-04-01', 'ADM01'),
('PAY02', 'USR02', 'TO01', 'bukti2.jpg', 'Verified', '2026-04-01', 'ADM01'),
('PAY03', 'USR03', 'TO02', 'bukti3.jpg', 'Pending', '2026-04-02', 'ADM01'),
('PAY04', 'USR04', 'TO03', 'bukti4.jpg', 'Verified', '2026-04-02', 'ADM02'),
('PAY05', 'USR05', 'TO04', 'bukti5.jpg', 'Verified', '2026-04-03', 'ADM02'),
('PAY06', 'USR06', 'TO05', 'bukti6.jpg', 'Pending', '2026-04-03', 'ADM03'),
('PAY07', 'USR07', 'TO06', 'bukti7.jpg', 'Verified', '2026-04-04', 'ADM03'),
('PAY08', 'USR08', 'TO07', 'bukti8.jpg', 'Verified', '2026-04-04', 'ADM04'),
('PAY09', 'USR09', 'TO08', 'bukti9.jpg', 'Pending', '2026-04-05', 'ADM04'),
('PAY10', 'USR10', 'TO09', 'bukti10.jpg', 'Verified', '2026-04-05', 'ADM05');

REPLACE INTO SOAL VALUES  
('S01', 'TO01', 'Ibukota Jabar?', 'Jakarta', 'Bandung', 'Solo', 'Medan', 'B'),
('S02', 'TO01', '5x5?', '20', '30', '25', '15', 'C'),
('S03', 'TO01', 'Presiden 1?', 'Soeharto', 'Habibie', 'Jokowi', 'Soekarno', 'D'),
('S04', 'TO02', 'NKRI?', 'A', 'B', 'C', 'D', 'B'),
('S05', 'TO02', 'Sila 3?', 'Bintang', 'Rantai', 'Beringin', 'Padi', 'C'),
('S06', 'TO03', 'Luas Segitiga?', '1/2at', 'pl', 'ss', 'prr', 'A'),
('S07', 'TO04', 'Uang Jepang?', 'Dollar', 'Yen', 'Euro', 'Won', 'B'),
('S08', 'TO05', 'English?', 'Go', 'Going', 'Gone', 'Went', 'B'),
('S09', 'TO06', 'Bahasa?', 'Apotik', 'Apotek', 'Apotieq', 'Aphotek', 'B'),
('S10', 'TO07', 'HTTP?', 'A', 'B', 'C', 'D', 'D');

REPLACE INTO HASIL VALUES  
('H01', 'USR01', 'TO01', 850, 1, '2026-05-20'),
('H02', 'USR02', 'TO01', 700, 2, '2026-05-20'),
('H03', 'USR03', 'TO02', 650, 5, '2026-06-15'),
('H04', 'USR04', 'TO03', 900, 1, '2026-07-10'),
('H05', 'USR05', 'TO04', 780, 3, '2026-08-05'),
('H06', 'USR06', 'TO05', 400, 10, '2026-09-12'),
('H07', 'USR07', 'TO06', 920, 1, '2026-10-20'),
('H08', 'USR08', 'TO07', 880, 2, '2026-11-15'),
('H09', 'USR09', 'TO08', 500, 8, '2026-12-05'),
('H10', 'USR10', 'TO09', 760, 4, '2026-12-06');

SET FOREIGN_KEY_CHECKS = 1;