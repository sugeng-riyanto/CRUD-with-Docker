# 🏫 Sistem Inventaris Sekolah (Flask + Docker)

[![Python](https://img.shields.io/badge/Python-3.9-blue.svg)](https://www.python.org/)
[![Flask](https://img.shields.io/badge/Flask-2.3-green.svg)](https://flask.palletsprojects.com/)
[![Docker](https://img.shields.io/badge/Docker-Compose-blue.svg)](https://www.docker.com/)
[![PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-blue.svg)](https://www.postgresql.org/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)


Selamat datang di repositori **Sistem Inventaris**. Proyek ini adalah aplikasi web sederhana untuk mengelola data barang inventaris sekolah (CRUD) yang dibangun menggunakan **Flask**, **PostgreSQL**, dan **Docker**.


Proyek ini dibuat sebagai materi workshop **"Modern Web App untuk Guru"** untuk demonstrating bagaimana membuat aplikasi yang siap deploy, scalable, dan mudah dikelola.



## 📋 Daftar Isi


- [Fitur Utama](#-fitur-utama)

- [Teknologi yang Digunakan](#-teknologi-yang-digunakan)

- [Struktur Folder](#-struktur-folder)

- [Prasyarat](#-prasyarat)

- [Instalasi & Menjalankan](#-instalasi--menjalankan)

- [Konfigurasi](#-konfigurasi)

- [Cara Menggunakan](#-cara-menggunakan)

- [Troubleshooting](#-troubleshooting)

- [Implementasi di Sekolah](#-implementasi-di-sekolah)

- [Lisensi](#-lisensi)




## ✨ Fitur Utama



1.  **CRUD Lengkap**: Tambah, Lihat, Edit, dan Hapus data inventaris.

2.  **Upload Gambar**: Mendukung upload foto barang inventaris.

3.  **Database Persisten**: Menggunakan PostgreSQL dengan Docker Volume (data tidak hilang saat container restart).

4.  **Responsive UI**: Tampilan rapi menggunakan Bootstrap 5 (bisa dibuka di HP/Tablet).

5.  **Dockerized**: Lingkungan pengembangan yang konsisten, mudah dipindahkan ke server sekolah.

6.  **Flash Messages**: Notifikasi sukses/gagal saat operasi database.




## 🛠 Teknologi yang Digunakan


| Komponen | Teknologi | Versi |
| :--- | :--- | :--- |
| **Backend** | Python Flask | 2.3.2 |
| **Database** | PostgreSQL | 15 |
| **Frontend** | HTML5, Bootstrap 5 | 5.3 |
| **Container** | Docker & Docker Compose | Latest |
| **ORM** | Flask-SQLAlchemy | 3.0.5 |




## 📂 Struktur Folder


```text
workshop-flask-guru/
├── app.py                 # Logika utama aplikasi (Backend)
├── Dockerfile             # Instruksi build image Flask
├── docker-compose.yml     # Orkestrasi container (Web + DB)
├── requirements.txt       # Dependensi Python
├── templates/             # File HTML (Jinja2)
│   ├── base.html         # Template induk
│   ├── index.html        # Halaman daftar barang
│   ├── tambah.html       # Form tambah barang
│   └── edit.html         # Form edit barang
└── static/
    └── uploads/          # Tempat menyimpan gambar upload
```




## ✅ Prasyarat


Sebelum memulai, pastikan komputer Anda telah menginstall:


1.  **Docker Desktop** (Wajib) - [Download disini](https://www.docker.com/products/docker-desktop/)

2.  **Git** (Opsional, untuk clone repo) - [Download disini](https://git-scm.com/)

3.  **Text Editor** (VS Code direkomendasikan)


> **Catatan:** Anda **tidak perlu** menginstall Python atau PostgreSQL secara manual di laptop karena semuanya akan berjalan di dalam Docker.



## 🚀 Instalasi & Menjalankan


### Opsi 1: Menggunakan Docker (Direkomendasikan)


Ini adalah cara paling mudah dan konsisten.


1.  **Clone atau Download Repository ini**

    ```bash
    git clone https://github.com/username-anda/sistem-inventaris-sekolah.git
    cd sistem-inventaris-sekolah
    ```


2.  **Pastikan Docker Desktop Berjalan**

    Buka aplikasi Docker Desktop dan pastikan statusnya **Running** (ikon hijau).


3.  **Jalankan Aplikasi**

    Buka terminal/Git Bash di folder proyek, lalu ketik:

    ```bash
    docker-compose up --build
    ```


4.  **Akses Aplikasi**

    Buka browser dan kunjungi:
    > **http://localhost:5000**


5.  **Menghentikan Aplikasi**

    Tekan `Ctrl + C` di terminal, lalu jalankan:
    ```bash
    docker-compose down
    ```
    > ⚠️ **Peringatan:** Gunakan `docker-compose down -v` hanya jika Anda ingin **menghapus semua data database**.


### Opsi 2: Menjalankan Lokal (Tanpa Docker)


*Hanya untuk pengembangan lanjutan. Requires Python & Postgres installed locally.*


1.  Buat virtual environment:

    ```bash
    python -m venv venv
    source venv/bin/activate  # Windows: venv\Scripts\activate
    ```

2.  Install dependencies:

    ```bash
    pip install -r requirements.txt
    ```

3.  Setup database PostgreSQL lokal dan ubah `DATABASE_URL` di `app.py`.

4.  Jalankan:
    ```bash
    python app.py
    ```




## ⚙️ Konfigurasi


Aplikasi ini menggunakan environment variables yang diatur di `docker-compose.yml`. Anda dapat mengubah konfigurasi berikut jika diperlukan:


| Variable | Default Value | Keterangan |
| :--- | :--- | :--- |
| `POSTGRES_USER` | `guru` | Username database |
| `POSTGRES_PASSWORD` | `rahasia123` | Password database |
| `POSTGRES_DB` | `db_sekolah` | Nama database |
| `FLASK_PORT` | `5000` | Port akses aplikasi web |
| `DB_PORT` | `5432` | Port akses database |




## 📖 Cara Menggunakan



1.  **Halaman Utama:** Menampilkan daftar semua barang inventaris.

2.  **Tambah Barang:** Klik tombol **"+ Tambah Produk"**, isi form (Nama, Deskripsi, Harga, Upload Foto), lalu klik **Simpan**.

3.  **Edit Barang:** Klik tombol **"Edit"** pada barang yang ingin diubah. Anda bisa mengganti foto atau mengosongkannya.

4.  **Hapus Barang:** Klik tombol **"Hapus"**. Konfirmasi peringatan sebelum data dihapus permanen.




## 🆘 Troubleshooting


| Masalah | Solusi |
| :--- | :--- |
| **Error: Port 5000 already in use** | Ubah port di `docker-compose.yml` bagian `ports` menjadi `"5001:5000"`. |
| **Error: Connection refused** | Pastikan container `db` sudah sehat (healthy). Tunggu 30 detik setelah start. |
| **Gambar tidak muncul (404)** | Cek apakah folder `static/uploads` ter-mount dengan benar di `docker-compose.yml`. |
| **Docker tidak berjalan** | Pastikan Docker Desktop sudah dibuka dan tidak dalam mode pause. |
| **Permission Denied (Upload)** | Pastikan user di dalam container memiliki akses write ke folder uploads. |


Untuk melihat log error secara real-time:

```bash
docker-compose logs -f web
```




## 🏫 Implementasi di Sekolah


Proyek ini dirancang agar mudah dikembangkan untuk kebutuhan sekolah nyata. Berikut ide implementasinya:


1.  **Lab Komputer:** Melacak kondisi PC dan spesifikasi hardware.

2.  **Perpustakaan:** Manajemen buku dan peminjaman (perlu tambahan tabel anggota).

3.  **Gudang Sarpras:** Mencatat kondisi meja, kursi, dan alat kebersihan.

4.  **Galeri Kegiatan:** Mengupload foto kegiatan sekolah dengan keterangan.


**Tips Pengembangan:**

- Tambahkan fitur **Login/User Auth** agar hanya staf tertentu yang bisa edit.

- Tambahkan fitur **Export Excel/CSV** untuk laporan inventaris.

- Host aplikasi ini di server sekolah menggunakan **Nginx** sebagai reverse proxy.




## 🤝 Kontribusi


Proyek ini dibuat untuk tujuan edukasi. Guru dan siswa dipersilakan untuk:

1.  **Fork** repository ini.

2.  **Modify** sesuai kebutuhan sekolah.

3.  **Share** kembali jika menemukan fitur menarik.



## 📄 Lisensi


Proyek ini terbuka untuk keperluan edukasi dan non-komersial.

Dibuat dengan ❤️ untuk Komunitas Guru Coding Indonesia.









> *"Teknologi terbaik adalah teknologi yang memudahkan pekerjaan manusia, bukan mempersulit."*
# CRUD-with-Docker
