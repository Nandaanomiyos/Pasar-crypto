#!/bin/bash

# crypto.sh
# By nanXopilot

clear
while true; do
    echo -e "\e[1;36m=============================="
    echo -e "     nanXopilot Crypto CLI"
    echo -e "==============================\e[0m"
    echo "Pilih koin untuk cek harga:"
    echo "1. Bitcoin (BTC)"
    echo "2. Ethereum (ETH)"
    echo "3. Dogecoin (DOGE)"
    echo "4. Solana (SOL)"
    echo "5. Keluar"
    echo -n "Pilihan: "
    read pilihan

    case $pilihan in
        1) coin="bitcoin"; symbol="BTC" ;;
        2) coin="ethereum"; symbol="ETH" ;;
        3) coin="dogecoin"; symbol="DOGE" ;;
        4) coin="solana"; symbol="SOL" ;;
        5) echo "Keluar..."; exit ;;
        *) echo "Pilihan tidak valid!"; sleep 1; clear; continue ;;
    esac

    echo ""
    echo "Mengambil harga $symbol..."
    data=$(curl -s "https://api.coingecko.com/api/v3/simple/price?ids=$coin&vs_currencies=idr&include_24hr_change=true")
    harga=$(echo "$data" | grep -oP '"idr":\K[0-9.]+')
    perubahan=$(echo "$data" | grep -oP '"idr_24h_change":\K-?[0-9.]+')

    # Perbaikan format harga
    if [ "$harga" -ge 1000000000 ]; then
        harga_formatted=$(printf "%.1f miliar" $(echo "$harga / 1000000000" | bc -l))
    elif [ "$harga" -ge 1000000 ]; then
        harga_formatted=$(printf "%.1f juta" $(echo "$harga / 1000000" | bc -l))
    elif [ "$harga" -ge 1000 ]; then
        harga_formatted=$(printf "%.0f ribu" $(echo "$harga / 1000" | bc -l))
    else
        harga_formatted=$harga
    fi

    # Format perubahan 24 jam menjadi dua angka di belakang koma
    perubahan_formatted=$(printf "%.2f" $perubahan)

    # Warna perubahan
    if [[ "$perubahan" == -* ]]; then
        warna="\e[1;31m" # Merah
        tanda="▼"
    else
        warna="\e[1;32m" # Hijau
        tanda="▲"
    fi

    echo -e "\e[1;34m>> $symbol sekarang: \e[1;33mRp $harga_formatted"
    echo -e "$warna   $tanda Perubahan 24 jam: ${perubahan_formatted}%\e[0m"
    echo ""
    read -p "Tekan Enter untuk kembali ke menu..."
    clear
done
