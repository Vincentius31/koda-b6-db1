CREATE TABLE kategori (
    "id_kategori" SERIAL PRIMARY KEY,
    "nama_kategori" VARCHAR(100) NOT NULL
);

CREATE TABLE rak_buku (
    "id_rak" SERIAL PRIMARY KEY,
    "nama_rak" VARCHAR(100) NOT NULL,
    "lokasi" VARCHAR(150)
);

CREATE TABLE penerbit (
    "id_penerbit" SERIAL PRIMARY KEY,
    "nama_penerbit" VARCHAR(150) NOT NULL,
    "alamat_penerbit" TEXT,
    "no_telp_penerbit" VARCHAR(20)
);

CREATE TABLE penulis (
    "id_penulis" SERIAL PRIMARY KEY,
    "nama_penulis" VARCHAR(150) NOT NULL
);

CREATE TABLE petugas (
    "id_petugas" SERIAL PRIMARY KEY,
    "nama_petugas" VARCHAR(150) NOT NULL,
    "username" VARCHAR(50) UNIQUE NOT NULL,
    "password" VARCHAR(255) NOT NULL
);

CREATE TABLE peminjam (
    "id_peminjam" SERIAL PRIMARY KEY,
    "nama_peminjam" VARCHAR(150) NOT NULL,
    "alamat" TEXT,
    "no_telp" VARCHAR(20)
);

CREATE TABLE buku (
    "id_buku" SERIAL PRIMARY KEY,
    "isbn" VARCHAR(20) UNIQUE NOT NULL,
    "judul" VARCHAR(255) NOT NULL,
    "tahun_terbit" INT,

    "kategori_id" INT NOT NULL,
    "rak_id" INT NOT NULL,
    "penerbit_id" INT NOT NULL,

    CONSTRAINT "fk_buku_kategori"
        FOREIGN KEY ("kategori_id") REFERENCES "kategori"("id_kategori")
        ON UPDATE CASCADE ON DELETE RESTRICT,

    CONSTRAINT "fk_buku_rak"
        FOREIGN KEY ("rak_id") REFERENCES "rak_buku"("id_rak")
        ON UPDATE CASCADE ON DELETE RESTRICT,

    CONSTRAINT "fk_buku_penerbit"
        FOREIGN KEY ("penerbit_id") REFERENCES "penerbit"("id_penerbit")
        ON UPDATE CASCADE ON DELETE RESTRICT
);


CREATE TABLE buku_penulis (
    "buku_id" INT NOT NULL,
    "penulis_id" INT NOT NULL,

    PRIMARY KEY ("buku_id", "penulis_id"),

    CONSTRAINT "fk_bp_buku"
        FOREIGN KEY ("buku_id") REFERENCES "buku"("id_buku")
        ON DELETE CASCADE,

    CONSTRAINT "fk_bp_penulis"
        FOREIGN KEY ("penulis_id") REFERENCES "penulis"("id_penulis")
        ON DELETE CASCADE
);

CREATE TABLE peminjaman (
    "id_peminjaman" SERIAL PRIMARY KEY,
    "buku_id" INT NOT NULL,
    "peminjam_id" INT NOT NULL,
    "petugas_id" INT NOT NULL,
    "status" VARCHAR(20),
    "tgl_pinjam" DATE NOT NULL,
    "tgl_kembali" DATE,

    CONSTRAINT "fk_peminjaman_buku"
        FOREIGN KEY ("buku_id") REFERENCES "buku"("id_buku")
        ON UPDATE CASCADE ON DELETE RESTRICT,

    CONSTRAINT "fk_peminjaman_peminjam"
        FOREIGN KEY ("peminjam_id") REFERENCES "peminjam"("id_peminjam")
        ON UPDATE CASCADE ON DELETE RESTRICT,

    CONSTRAINT "fk_peminjaman_petugas"
        FOREIGN KEY ("petugas_id") REFERENCES "petugas"("id_petugas")
        ON UPDATE CASCADE ON DELETE RESTRICT
);

INSERT INTO "kategori" ("nama_kategori") VALUES
('Teknologi'),
('Pemrograman'),
('Database'),
('Jaringan'),
('Sistem Operasi'),
('Bisnis'),
('Manajemen'),
('Novel'),
('Sejarah'),
('Pendidikan');

INSERT INTO "rak_buku" ("nama_rak", "lokasi") VALUES
('Rak A1', 'Lantai 1'),
('Rak A2', 'Lantai 1'),
('Rak B1', 'Lantai 2'),
('Rak B2', 'Lantai 2'),
('Rak C1', 'Lantai 3'),
('Rak C2', 'Lantai 3'),
('Rak D1', 'Lantai 1'),
('Rak D2', 'Lantai 2'),
('Rak E1', 'Lantai 3'),
('Rak E2', 'Lantai 1');

INSERT INTO "penerbit" ("nama_penerbit", "alamat_penerbit", "no_telp_penerbit") VALUES
('Informatika', 'Bandung', '0811111111'),
('Erlangga', 'Jakarta', '0812222222'),
('Andi Offset', 'Yogyakarta', '0813333333'),
('Gramedia', 'Jakarta', '0814444444'),
('Deepublish', 'Yogyakarta', '0815555555'),
('Salemba', 'Jakarta', '0816666666'),
('Prenada Media', 'Jakarta', '0817777777'),
('Bumi Aksara', 'Jakarta', '0818888888'),
('Rajawali Press', 'Jakarta', '0819999999'),
('Kencana', 'Jakarta', '0810000000');

INSERT INTO "penulis" ("nama_penulis") VALUES
('Budi Raharjo'),
('Eko Kurniawan'),
('Andi Setiawan'),
('Dian Pratiwi'),
('Rudi Hartono'),
('Agus Saputra'),
('Siti Nurhaliza'),
('Joko Santoso'),
('Hendra Wijaya'),
('Tono Susilo');

INSERT INTO "petugas" ("nama_petugas", "username", "password") VALUES
('Admin Perpus', 'admin', 'admin123'),
('Rina', 'rina', 'pass123'),
('Dodi', 'dodi', 'pass123'),
('Sari', 'sari', 'pass123'),
('Bambang', 'bambang', 'pass123'),
('Wati', 'wati', 'pass123'),
('Fajar', 'fajar', 'pass123'),
('Lina', 'lina', 'pass123'),
('Heri', 'heri', 'pass123'),
('Nina', 'nina', 'pass123');

INSERT INTO "peminjam" ("nama_peminjam", "alamat", "no_telp") VALUES
('Ahmad', 'Bandung', '0811110001'),
('Rudi', 'Jakarta', '0811110002'),
('Sinta', 'Bogor', '0811110003'),
('Joko', 'Depok', '0811110004'),
('Budi', 'Bekasi', '0811110005'),
('Wulan', 'Tangerang', '0811110006'),
('Agus', 'Bandung', '0811110007'),
('Nina', 'Cimahi', '0811110008'),
('Dewi', 'Garut', '0811110009'),
('Hadi', 'Tasik', '0811110010');

INSERT INTO "buku" ("isbn", "judul", "tahun_terbit", "kategori_id", "rak_id", "penerbit_id") VALUES
('978001', 'Belajar HTML', 2020, 2, 1, 1),
('978002', 'Belajar CSS', 2021, 2, 2, 2),
('978003', 'JavaScript Dasar', 2022, 2, 3, 3),
('978004', 'Database MySQL', 2019, 3, 4, 4),
('978005', 'Jaringan Komputer', 2018, 4, 5, 5),
('978006', 'Linux Server', 2021, 5, 6, 6),
('978007', 'Manajemen Bisnis', 2020, 7, 7, 7),
('978008', 'Sejarah Dunia', 2017, 9, 8, 8),
('978009', 'Pendidikan Karakter', 2023, 10, 9, 9),
('978010', 'Novel Nusantara', 2016, 8, 10, 10);

INSERT INTO "buku_penulis" ("buku_id", "penulis_id") VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10);

INSERT INTO "peminjaman" ("buku_id", "peminjam_id", "petugas_id", "status", "tgl_pinjam", "tgl_kembali") VALUES
(1,1,1,'dipinjam','2025-01-01',NULL),
(2,2,2,'kembali','2025-01-02','2025-01-10'),
(3,3,3,'dipinjam','2025-01-03',NULL),
(4,4,4,'kembali','2025-01-04','2025-01-12'),
(5,5,5,'dipinjam','2025-01-05',NULL),
(6,6,6,'kembali','2025-01-06','2025-01-14'),
(7,7,7,'dipinjam','2025-01-07',NULL),
(8,8,8,'kembali','2025-01-08','2025-01-16'),
(9,9,9,'dipinjam','2025-01-09',NULL),
(10,10,10,'kembali','2025-01-10','2025-01-18');