# Video for Claude

Bộ công cụ tạo, chỉnh sửa, làm hoạt ảnh và render video bằng code.

| Thành phần | Phiên bản | Vai trò |
|---|---|---|
| Node.js | 22.x | Runtime |
| FFmpeg / FFprobe | 6.1 (libx264, libx265, VP9, ProRes, AAC, Opus) | Cắt, ghép, encode, xử lý audio |
| HyperFrames | 0.9.16 | Video từ HTML + GSAP (`hyperframes-demo/`) |
| Remotion | 4.0.541 | Video từ React (`remotion-demo/`) |
| Chrome | for Testing 153 | Headless render |

## Cài đặt
```bash
npm install
npx hyperframes doctor   # kiểm tra môi trường
```

## Kiểm tra toàn bộ pipeline
```bash
npm run verify   # render 2 demo + FFmpeg ghép, kết quả trong out/
```

## Lệnh thường dùng
- `npm run hf:preview` / `npm run hf:render` — HyperFrames
- `npm run remotion:studio` / `npm run remotion:render` — Remotion
