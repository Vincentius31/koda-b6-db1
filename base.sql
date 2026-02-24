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
