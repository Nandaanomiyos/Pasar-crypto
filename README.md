# Pasar Crypto CLI

![Screenshot](https://i.postimg.cc/HWhg4mwg/Screenshot-20250419-173450.jpg)

## Deskripsi

Pasar Crypto CLI adalah aplikasi berbasis terminal yang memungkinkan kamu untuk memeriksa harga cryptocurrency secara real-time. Dengan aplikasi ini, kamu bisa mengecek harga terkini, perubahan harga 24 jam, dan melihat harga dalam mata uang IDR (Rupiah) untuk beberapa cryptocurrency populer.

## Fitur

- Cek harga Bitcoin, Ethereum, Dogecoin, Solana, dan banyak lagi.
- Menampilkan perubahan harga 24 jam untuk setiap cryptocurrency.
- Tampilan sederhana dan mudah digunakan di terminal.
- Mendapatkan harga secara real-time menggunakan API dari CoinGecko.
- Kompatibel dengan Termux di perangkat Android.

## Keuntungan

- Aplikasi ringan dan cepat, cocok digunakan pada perangkat dengan keterbatasan sumber daya.
- Tampilan yang sederhana dan tidak memerlukan antarmuka grafis.
- Mendukung beberapa pilihan cryptocurrency.
- Gratis dan open-source.

## Persyaratan

- **Termux** (untuk pengguna Android)
- **Git** dan **Curl** (untuk pengunduhan dan permintaan HTTP)
- Koneksi internet untuk mengakses data harga secara real-time.

## Cara Install

1. **Update dan upgrade Termux:**
```bash
   
   pkg update && pkg upgrade
pkg install git curl
git clone https://github.com/Nandaanomiyos/Pasar-crypto.git
cd Pasar-crypto
chmod +x Kripto.sh
./Kripto.sh
