# UTS Pemrograman Mobile - Aplikasi Flutter

## Identitas Mahasiswa

- **Nama**: Riza Maulana Tamsirin
- **NIM**: 152023109
- **Kelas**: AA
- **Mata Kuliah**: Pemrograman Mobile
- **Dosen**: Galih Ashari R., S.Si., MT

## Link Repository GitHub

🔗 https://github.com/Notnoir/uts_mobile.git

## Deskripsi Aplikasi

Aplikasi mobile berbasis Flutter yang menampilkan 5 halaman utama dengan berbagai widget dan layout:

1. **Splash Screen** - Tampilan awal dengan profil dan informasi mahasiswa
2. **Biodata** - Form input data pribadi dengan berbagai widget input
3. **Daftar Kontak** - Menampilkan daftar kontak dengan fitur pencarian
4. **Kalkulator** - Kalkulator sederhana dengan operasi dasar
5. **Cuaca** - Informasi cuaca dengan berbagai detail (Air Quality, UV Index, Sunrise, Wind, Rainfall)
6. **Berita** - Daftar berita dengan kategori dan fitur filter

## Fitur Utama

### 1. Splash Screen

- Durasi 5 detik dengan animasi
- Menampilkan foto profil (riza.png)
- Judul "UTS PEMROGRAMAN MOBILE"
- Informasi NIM dan nama mahasiswa
- Floating icons animation

### 2. Halaman Biodata

- Form input lengkap:
  - Nama Lengkap (TextField)
  - NIM (TextField)
  - Jenis Kelamin (Radio Button)
  - Tanggal Lahir (Date Picker)
  - Program Studi (Dropdown)
  - Hobi/Deskripsi (TextArea)
- Foto profil dengan border dan shadow
- Design Neobrutalism dengan hard shadows

### 3. Daftar Kontak

- List 6 kontak dengan informasi lengkap
- Search bar untuk mencari kontak
- Circle avatar dengan foto
- Tombol call dan message
- Card design dengan warna berbeda (bergantian)

### 4. Kalkulator

- Operasi matematika: +, -, ×, ÷
- Display dengan background kuning
- Button dengan warna berbeda (pink untuk angka, biru untuk operator)
- Desain Neobrutalism

### 5. Cuaca

- Main weather display dengan PageView (4 kota: Montreal, Toronto, Tokyo, Jakarta)
- Page indicators di dalam weather card
- Hourly forecast
- Air Quality card
- UV Index card
- Sunrise/Sunset information dengan arc visualization
- Wind compass
- Rainfall information
- Semua menggunakan bahasa Inggris

### 6. Berita

- 5 item berita dengan kategori berbeda
- Filter kategori (Semua, Teknologi, Ekonomi, Iklim, Hiburan, Olahraga)
- Card design dengan gradient
- Badge kategori berwarna

## Screenshots

### Splash Screen

![Splash Screen](screenshots/splash_screen.png)

### Halaman Biodata

![Halaman Biodata](screenshots/biodata.png)

### Daftar Kontak

![Daftar Kontak](screenshots/daftar_kontak.png)

### Kalkulator

![Kalkulator](screenshots/kalkulator.png)

### Halaman Cuaca (1)

![Halaman Cuaca 1](screenshots/cuaca.png)

### Halaman Cuaca (2)

![Halaman Cuaca 2](screenshots/cuaca2.png)

### Halaman Berita (1)

![Halaman Berita 1](screenshots/berita.png)

### Halaman Berita (2)

![Halaman Berita 2](screenshots/berita2.png)

## Widget dan Layout yang Digunakan

### Widget Dasar

- `Scaffold`, `AppBar`, `BottomNavigationBar`
- `Container`, `Card`, `ListTile`
- `Row`, `Column`, `Stack`, `Positioned`
- `ListView`, `PageView`, `SingleChildScrollView`
- `Image.asset`, `CircleAvatar`, `Icon`

### Widget Input

- `TextField` (untuk input teks)
- `Radio` (untuk jenis kelamin)
- `DropdownButton` (untuk program studi)
- `DatePicker` (untuk tanggal lahir)

### Widget Custom

- `CustomPainter` (untuk Sunrise arc visualization)
- `Transform.rotate` (untuk decorative elements)
- `AnimatedBuilder` (untuk splash screen animations)

### Styling

- `BoxDecoration` dengan border, borderRadius, boxShadow
- `TextStyle` dengan berbagai font weight dan size
- `Gradient` untuk background
- Hard shadows (Neobrutalism style)
- Color palette: Purple (#5936B4), Mint (#A8E6CF), Yellow (#F9E2AF), dll.

## Cara Menjalankan Aplikasi

1. Clone repository:

```bash
git clone https://github.com/Notnoir/uts_mobile.git
cd uts_mobile
```

2. Install dependencies:

```bash
flutter pub get
```

3. Jalankan aplikasi:

```bash
flutter run
```

4. Build APK (opsional):

```bash
flutter build apk --release
```

## Struktur Project

```
lib/
├── main.dart                      # Entry point aplikasi
└── screens/
    ├── splash_screen.dart         # Splash screen dengan animasi
    ├── dashboard_screen.dart      # Bottom navigation
    ├── biodata_screen.dart        # Form biodata
    ├── kontak_screen.dart         # Daftar kontak
    ├── kalkulator_screen.dart     # Kalkulator
    ├── cuaca_screen.dart          # Informasi cuaca
    └── berita_screen.dart         # Daftar berita

public/
├── riza.png                       # Foto profil
├── cuaca-asset/                   # Icon cuaca
└── kontak/                        # Foto kontak

screenshots/                       # Screenshot aplikasi
```

## Teknologi yang Digunakan

- **Flutter SDK**: ^3.24.5
- **Dart**: ^3.5.4
- **Material Design 3**: Design system untuk UI/UX

## Catatan Pengembangan

- Aplikasi menggunakan design system **Neobrutalism** dengan karakteristik:
  - Hard shadows (offset 4x4 atau 6x6, blur 0)
  - Bold borders (2-4px, warna #222222)
  - Bright colors dengan kontras tinggi
  - No gradients pada shadows
- Semua teks di halaman cuaca menggunakan bahasa Inggris
- Teks di halaman lain menggunakan bahasa Indonesia
- Foto profil menggunakan asset lokal (riza.png)

---

**Dibuat dengan ❤️ menggunakan Flutter**
