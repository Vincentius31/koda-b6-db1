CREATE TABLE "KATEGORI" (
    "id_kategori" SERIAL PRIMARY KEY,
    "nama_kategori" VARCHAR(50) NOT NULL
);

CREATE TABLE "RAK_BUKU" (
    "id_rak" SERIAL PRIMARY KEY,
    "nama_rak" VARCHAR(50) NOT NULL,
    "lokasi" VARCHAR(100) NOT NULL
);

CREATE TABLE "PETUGAS" (
    "id_petugas" SERIAL PRIMARY KEY,
    "nama_petugas" VARCHAR(100) NOT NULL,
    "username" VARCHAR(50) UNIQUE NOT NULL,
    "password" VARCHAR(255) NOT NULL
);

CREATE TABLE "PEMINJAM" (
    "id_peminjam" SERIAL PRIMARY KEY,
    "nama_peminjam" VARCHAR(100) NOT NULL,
    "alamat" TEXT,
    "no_telp" VARCHAR(15)
);

CREATE TABLE "BUKU" (
    "id_buku" SERIAL PRIMARY KEY,
    "isbn" CHAR(13),
    "judul" VARCHAR(255) NOT NULL,
    "penulis" VARCHAR(100),
    "penerbit" VARCHAR(100),
    "tahun_terbit" INT,
    "tgl_pinjam" DATE,
    "tgl_kembali" DATE,
    "id_kategori" INT REFERENCES "KATEGORI"("id_kategori") ON DELETE SET NULL,
    "id_rak" INT REFERENCES "RAK_BUKU"("id_rak") ON DELETE SET NULL,
    "id_peminjam" INT REFERENCES "PEMINJAM"("id_peminjam") ON DELETE SET NULL,
    "id_petugas" INT REFERENCES "PETUGAS"("id_petugas") ON DELETE SET NULL
);

INSERT INTO "KATEGORI" ("nama_kategori") VALUES 
('Sains'), ('Teknologi'), ('Sastra'), ('Sejarah'), ('Fiksi'), 
('Biografi'), ('Agama'), ('Seni'), ('Kesehatan'), ('Ekonomi');

INSERT INTO "RAK_BUKU" ("nama_rak", "lokasi") VALUES 
('A1', 'Lantai 1 Sayap Kiri'), ('A2', 'Lantai 1 Sayap Kiri'),
('B1', 'Lantai 1 Sayap Kanan'), ('B2', 'Lantai 1 Sayap Kanan'),
('C1', 'Lantai 2'), ('C2', 'Lantai 2'),
('D1', 'Lantai 3'), ('D2', 'Lantai 3'),
('E1', 'Area Referensi'), ('Z1', 'Gudang Koleksi');

INSERT INTO "PETUGAS" ("nama_petugas", "username", "password") VALUES 
('Budi Santoso', 'budi_admin', 'pass123'), ('Siti Aminah', 'siti_a', 'pass123'),
('Andi Wijaya', 'andi_w', 'pass123'), ('Dewi Lestari', 'dewi_l', 'pass123'),
('Eko Prasetyo', 'eko_p', 'pass123'), ('Fani Rahma', 'fani_r', 'pass123'),
('Gita Gutawa', 'gita_g', 'pass123'), ('Hadi Mulyo', 'hadi_m', 'pass123'),
('Indah Sari', 'indah_s', 'pass123'), ('Joko Susilo', 'joko_s', 'pass123');

INSERT INTO "PEMINJAM" ("nama_peminjam", "alamat", "no_telp") VALUES 
('Rizky', 'Jakarta', '08123456789'), ('Ahmad', 'Bandung', '08123456780'),
('Siska', 'Surabaya', '08123456781'), ('Bambang', 'Medan', '08123456782'),
('Citra', 'Semarang', '08123456783'), ('Deni', 'Makassar', '08123456784'),
('Echa', 'Palembang', '08123456785'), ('Fajar', 'Yogyakarta', '08123456786'),
('Gani', 'Denpasar', '08123456787'), ('Hani', 'Malang', '08123456788');

INSERT INTO "BUKU" ("isbn", "judul", "penulis", "penerbit", "tahun_terbit", "tgl_pinjam", "tgl_kembali", "id_kategori", "id_rak", "id_peminjam", "id_petugas") VALUES 
('9786020332512', 'Laskar Pelangi', 'Andrea Hirata', 'Bentang', 2005, '2024-02-01', '2024-02-15', 3, 1, 1, 1),
('9786020523316', 'Atomic Habits', 'James Clear', 'Gramedia', 2018, '2024-02-05', '2024-02-19', 2, 2, 2, 2),
('9789791227000', 'Bumi Manusia', 'Pramoedya A.T.', 'Lentera Dipantara', 1980, NULL, NULL, 3, 1, NULL, 1),
('9786024410292', 'Filosofi Teras', 'Henry Manampiring', 'Kompas', 2018, '2024-02-10', '2024-02-24', 7, 5, 3, 3),
('9786020633176', 'Sapiens', 'Yuval Noah Harari', 'KPG', 2011, NULL, NULL, 4, 7, NULL, 1),
('9786020300001', 'Dunia Sophie', 'Jostein Gaarder', 'Mizan', 1991, '2024-02-12', '2024-02-26', 7, 6, 4, 4),
('9786020300002', 'Cantik Itu Luka', 'Eka Kurniawan', 'Gramedia', 2002, NULL, NULL, 3, 3, NULL, 2),
('9786020300003', 'Negara Kelima', 'ES Ito', 'Pustaka Alvabet', 2005, '2024-02-14', '2024-02-28', 5, 4, 5, 5),
('9786020300004', 'Supernova', 'Dee Lestari', 'Bentang', 2001, NULL, NULL, 5, 1, NULL, 1),
('9786020300005', 'Pulang', 'Leila S. Chudori', 'KPG', 2012, '2024-02-15', '2024-03-01', 3, 2, 6, 2);










