#!/usr/bin/env bash
# Kiểm tra toàn bộ pipeline: công cụ -> render HyperFrames -> render Remotion -> FFmpeg ghép/chèn audio
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p out
echo "== Phiên bản =="; node -v; ffmpeg -version | head -1
npx hyperframes --version 2>/dev/null || true; npx remotion versions | tail -1
echo "== HyperFrames =="; (cd hyperframes-demo && npx hyperframes lint && npx hyperframes render -o ../out/hyperframes-test.mp4 >/dev/null)
echo "== Remotion ==";    npx remotion render Demo out/remotion-test.mp4 --log=error
echo "== FFmpeg ==";      ffmpeg -hide_banner -loglevel error -y -i out/hyperframes-test.mp4 -i out/remotion-test.mp4 \
  -f lavfi -t 10 -i "sine=frequency=440:sample_rate=48000" \
  -filter_complex "[0:v][1:v]concat=n=2:v=1:a=0,format=yuv420p,fade=t=in:d=0.5,fade=t=out:st=9.5:d=0.5[v];[2:a]volume=0.2,afade=t=out:st=9:d=1[a]" \
  -map "[v]" -map "[a]" -c:v libx264 -crf 20 -preset fast -c:a aac -movflags +faststart out/ffmpeg-combined.mp4
for f in out/*.mp4; do echo "$f -> $(ffprobe -v error -show_entries format=duration:stream=codec_name,width,height -of csv=p=0 "$f" | tr '\n' ' ')"; done
echo "TẤT CẢ OK"
