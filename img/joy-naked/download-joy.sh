#!/bin/bash
# Download Casa Joy "no art" photos from Google Drive
# Run from your Mac Terminal (from the cocoon-mazarine-ap/ folder):
#   bash img/joy-naked/download-joy.sh
#
# Requires: pip install gdown  (one-time)

set -e
cd "$(dirname "$0")"

# Install gdown if not already present
if ! command -v gdown &>/dev/null; then
  echo "Installing gdown..."
  pip install gdown -q
fi

echo "Downloading Casa Joy naked photos..."

declare -A FILES=(
  ["01.jpg"]="1sHRy6-D1HtX3M_eRwyhYWBkkaNnB5tvR"
  ["02.jpg"]="1n-EIp93hUafUliBtWV1hKt4aZHermATx"
  ["03.jpg"]="1nyHMsXgsmjiNBpH-75B296AmF2n0KJ4A"
  ["04.jpg"]="1ID6ZWT0gndRF4B2UZKru67vWBIIjEnT9"
  ["05.jpg"]="1G5NdkRoDc-icvZ9YDx5wbouA3pee_i3G"
  ["06.jpg"]="15g_04Qc5u_3JiOSs0PIlHQgZdoG4sQQB"
  ["07.jpg"]="1rV9_mzjhTENQg9Sy1MccbXtvxKoOoYf3"
  ["08.jpg"]="1FvegqEcv414fKzVIxJW-OiTu9DXk1heR"
  ["09.jpg"]="1PTaFkiDYCR5Pzq4bUL-uQVcDrSUM1vOs"
  ["10.jpg"]="1FbezMzAN9VaEFVV6DDA8oImwdi9UYJUO"
  ["11.jpg"]="1q0Onyt1MUamHt1mpN7W6HYV8MVJi_W_e"
  ["12.jpg"]="1laR8BwR-Ywu_K0IvvFrsm_j5b9z_988p"
  ["13.jpg"]="1eZIhm-vLNfZYY_TNfZLVxc6rsGg8RLy4"
  ["14.jpg"]="1a9NnCXuVq-lLkt-nNY_WdZtqd2-xlfZ8"
  ["15.jpg"]="1Y049N8-Z8qmvMZEta41zB5eTX_U6Hmk-"
  ["16.jpg"]="1Gn8755BeE9FUb8ziDIr1ujH1Hwc-JLz-"
  ["17.jpg"]="1bA_vlfq738HjOvSmkZWDQSAxbdjTVPn5"
  ["18.jpg"]="1OXznh2Ub1upaMBKUTbYmLy8ml8XHwUKe"
  ["19.jpg"]="1AqoBIBGGmD0wvX3u34lMp5q1B-aYkbwb"
)

for fname in $(echo "${!FILES[@]}" | tr ' ' '\n' | sort); do
  id="${FILES[$fname]}"
  echo "  → $fname"
  gdown --id "$id" -O "$fname" -q
done

echo ""
echo "Done! 19 photos saved to img/joy-naked/"
echo "Reload index.html to see them."
