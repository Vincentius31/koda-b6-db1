# Library System Entity Relationship Diagram (ERD)
---

```mermaid
erDiagram
    KATEGORI ||--o{ BUKU : "memiliki"
    RAK_BUKU ||--o{ BUKU : "menyimpan"

    BUKU ||--o{ PEMINJAMAN : "dipinjam"
    PEMINJAM ||--o{ PEMINJAMAN : "mengelola"
    PETUGAS ||--o{ PEMINJAMAN : "melayani"

    PENERBIT ||--o{ BUKU : "menerbitkan"
    PENULIS ||--o{ BUKU_PENULIS: "menulis"
    BUKU ||--o{ BUKU_PENULIS : "memiliki"

    KATEGORI {
        int id_kategori PK
        string nama_kategori
    }

    RAK_BUKU {
        int id_rak PK
        string nama_rak
        string lokasi
    }

    PENERBIT{
        int id_penerbit PK
        string nama_penerbit
        string alamat_penerbit
        string no_telp_penerbit
    }

    PENULIS{
        int id_penulis PK
        string nama_penulis
    }

    BUKU {
        int id_buku PK
        string isbn
        string judul
        int tahun_terbit
        int id_kategori FK
        int id_rak FK
        int id_penerbit FK
    }

    BUKU_PENULIS{
        int id_buku FK
        int id_penulis FK
    }

    PEMINJAMAN{
        int id_peminjaman PK
        int id_buku FK
        int id_peminjam FK
        int id_petugas FK
        string status
        date tgl_pinjam
        date tgl_kembali
    }

    PETUGAS {
        int id_petugas PK
        string nama_petugas
        string username
        string password
    }

    PEMINJAM {
        int id_peminjam PK
        string nama_peminjam
        string alamat
        string no_telp
    }
```
