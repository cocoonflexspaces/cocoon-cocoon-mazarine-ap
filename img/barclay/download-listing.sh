#!/bin/bash
# Download Tribeca Duplex Penthouse listing photos from StreetEasy/Zillow CDN
# Run this from your Mac Terminal: bash img/barclay/download-listing.sh
# (Run from the cocoon-mazarine-ap/ folder)

set -e
cd "$(dirname "$0")"
echo "Downloading 20 listing photos to img/barclay/ ..."

URLS=(
  "https://photos.zillowstatic.com/fp/1f2ed22eb93e9100b02011d8a585419f-se_extra_large_1500_800.webp"
  "https://photos.zillowstatic.com/fp/7e8ed185c8fe7f538ab36cb241c8d674-se_extra_large_1500_800.webp"
  "https://photos.zillowstatic.com/fp/e15e9692a0ffe690b8a127ac5c642c3c-se_extra_large_1500_800.webp"
  "https://photos.zillowstatic.com/fp/0f3f8a8cfbf742156345b8365b5bbd4e-se_extra_large_1500_800.webp"
  "https://photos.zillowstatic.com/fp/a66096caefd2f8a539b45d433f8d91ad-se_extra_large_1500_800.webp"
  "https://photos.zillowstatic.com/fp/b837b5aec03da08372c4ba85dd8c0573-se_extra_large_1500_800.webp"
  "https://photos.zillowstatic.com/fp/b3417b44b7ae29115e486933e4cb7dfb-se_extra_large_1500_800.webp"
  "https://photos.zillowstatic.com/fp/e2d72150924a35caa8e8e22d93fddf1f-se_extra_large_1500_800.webp"
  "https://photos.zillowstatic.com/fp/2d769a34f53e2e5c5d56c476c92df082-se_extra_large_1500_800.webp"
  "https://photos.zillowstatic.com/fp/f5bf1a11b98b7184b4c30ed65dda54b8-se_extra_large_1500_800.webp"
  "https://photos.zillowstatic.com/fp/f50ac887883550d7bf47310d381333be-se_extra_large_1500_800.webp"
  "https://photos.zillowstatic.com/fp/677d9c45483ba2e898cdbc5707bbc726-se_extra_large_1500_800.webp"
  "https://photos.zillowstatic.com/fp/55e6f7e1ec23014e43aeb5781f7476ab-se_extra_large_1500_800.webp"
  "https://photos.zillowstatic.com/fp/fea81ef24956003ab06846cf39770110-se_extra_large_1500_800.webp"
  "https://photos.zillowstatic.com/fp/1a20721d3774d4fed077a10cde6cedc3-se_extra_large_1500_800.webp"
  "https://photos.zillowstatic.com/fp/aaa81d935aae5c46b582b69c2b3b7d68-se_extra_large_1500_800.webp"
  "https://photos.zillowstatic.com/fp/3cd1fa938a42bbee4da6c92a244ed610-se_extra_large_1500_800.webp"
  "https://photos.zillowstatic.com/fp/e5b43b0730013716292a4a1a2f967149-se_extra_large_1500_800.webp"
  "https://photos.zillowstatic.com/fp/605976aafda2138353f8496648aa1142-se_extra_large_1500_800.webp"
  "https://photos.zillowstatic.com/fp/bca81b3d19d75fe54544ae06e6f330ad-se_extra_large_1500_800.webp"
)

for i in "${!URLS[@]}"; do
  NUM=$(printf "%02d" $((i+1)))
  OUT="listing-${NUM}.webp"
  echo "  [$((i+1))/20] $OUT"
  curl -s -L \
    -H 'Referer: https://streeteasy.com/' \
    -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0 Safari/537.36' \
    "${URLS[$i]}" -o "$OUT"
done

echo ""
echo "Done! Files written to img/barclay/listing-01.webp … listing-20.webp"
echo "Reload index.html in your browser to see the photos."
