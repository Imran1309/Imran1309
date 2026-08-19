$base64 = [convert]::ToBase64String([IO.File]::ReadAllBytes("assets/im.png"))

$svg = @"
<svg width="100%" height="250" viewBox="0 0 800 250" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <!-- Dark Grey Panel Background -->
    <linearGradient id="dark-wall" x1="0" y1="0" x2="0" y2="1">
      <stop offset="0%" stop-color="#2a2a2a"/>
      <stop offset="100%" stop-color="#1a1a1a"/>
    </linearGradient>

    <!-- Golden/Orange Strip Gradient -->
    <linearGradient id="neon-strip" x1="0" y1="0" x2="0" y2="1">
      <stop offset="0%" stop-color="#ffb74d"/>
      <stop offset="50%" stop-color="#ff9800"/>
      <stop offset="100%" stop-color="#ffb74d"/>
    </linearGradient>
    
    <clipPath id="image-clip">
      <rect x="40" y="15" width="160" height="220" rx="15" />
    </clipPath>
  </defs>

  <style>
    @keyframes goldGlow {
      0% { filter: drop-shadow(0px 0px 4px rgba(255, 183, 77, 0.4)) drop-shadow(0px 0px 8px rgba(255, 183, 77, 0.2)); }
      50% { filter: drop-shadow(0px 0px 12px rgba(255, 183, 77, 0.9)) drop-shadow(0px 0px 25px rgba(255, 152, 0, 0.7)) drop-shadow(0px 0px 40px rgba(255, 152, 0, 0.5)); }
      100% { filter: drop-shadow(0px 0px 4px rgba(255, 183, 77, 0.4)) drop-shadow(0px 0px 8px rgba(255, 183, 77, 0.2)); }
    }
    @keyframes verticalStripPulse {
      0% { filter: drop-shadow(0px 0px 10px #ff9800) drop-shadow(0px 0px 20px #ffb74d); opacity: 0.8; }
      50% { filter: drop-shadow(0px 0px 20px #ff9800) drop-shadow(0px 0px 40px #ffb74d); opacity: 1; }
      100% { filter: drop-shadow(0px 0px 10px #ff9800) drop-shadow(0px 0px 20px #ffb74d); opacity: 0.8; }
    }
    .text {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
      font-size: 55px;
      font-weight: 800;
      fill: #ffffff;
      text-anchor: middle;
      dominant-baseline: middle;
      animation: goldGlow 2.5s ease-in-out infinite;
    }
    .vertical-strip { animation: verticalStripPulse 2s infinite alternate; }
  </style>

  <!-- Waving Background Shape -->
  <path d="M0 0 L800 0 L800 215 Q400 260 0 205 Z" fill="url(#dark-wall)" />
  
  <!-- Horizontal Seams for Panels -->
  <line x1="0" y1="80" x2="800" y2="80" stroke="#111" stroke-width="2" />
  <line x1="0" y1="160" x2="800" y2="160" stroke="#111" stroke-width="2" />
  
  <image href="data:image/png;base64,$base64" x="40" y="15" width="160" height="220" clip-path="url(#image-clip)" preserveAspectRatio="xMidYMid slice" />
  
  <!-- Glowing Text -->
  <text x="465" y="125" class="text">Hi myself imran</text>
</svg>
"@

Set-Content -Path "banner.svg" -Value $svg -Encoding UTF8
