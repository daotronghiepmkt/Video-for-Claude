import React from "react";
import { AbsoluteFill, interpolate, spring, useCurrentFrame, useVideoConfig } from "remotion";

export const Demo: React.FC = () => {
  const frame = useCurrentFrame();
  const { fps, durationInFrames, width } = useVideoConfig();
  const scale = spring({ frame, fps, config: { damping: 12 } });
  const opacity = interpolate(frame, [0, 20], [0, 1], { extrapolateRight: "clamp" });
  const bar = interpolate(frame, [0, durationInFrames], [0, width]);
  return (
    <AbsoluteFill style={{ backgroundColor: "#0b2d5b", justifyContent: "center", alignItems: "center" }}>
      <h1 style={{ color: "white", fontSize: 96, fontFamily: "sans-serif", opacity, transform: `scale(${scale})` }}>
        Remotion OK
      </h1>
      <div style={{ position: "absolute", left: 0, bottom: 0, height: 16, width: bar, background: "#f26f21" }} />
    </AbsoluteFill>
  );
};
