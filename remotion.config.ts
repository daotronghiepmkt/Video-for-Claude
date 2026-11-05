import { Config } from "@remotion/cli/config";

Config.setEntryPoint("./remotion-demo/src/index.ts");
Config.setVideoImageFormat("jpeg");
Config.setOverwriteOutput(true);
// Dùng Chromium cài sẵn trong môi trường (tránh tải headless shell qua proxy)
if (process.env.REMOTION_BROWSER) Config.setBrowserExecutable(process.env.REMOTION_BROWSER);
