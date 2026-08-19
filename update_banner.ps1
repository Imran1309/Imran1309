$base64 = [convert]::ToBase64String([IO.File]::ReadAllBytes("assets/im.png"))

$svg = @"
<svg width="100%" height="250" viewBox="0 0 800 250" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="silver-wall" x1="0" y1="0" x2="1" y2="0">
      <stop offset="0%" stop-color="#eceff1"/>
      <stop offset="19%" stop-color="#cfd8dc"/>
      <stop offset="20%" stop-color="#90a4ae"/>
      <stop offset="21%" stop-color="#eceff1"/>
      <stop offset="39%" stop-color="#cfd8dc"/>
      <stop offset="40%" stop-color="#78909c"/>
      <stop offset="41%" stop-color="#eceff1"/>
      <stop offset="59%" stop-color="#cfd8dc"/>
      <stop offset="60%" stop-color="#90a4ae"/>
      <stop offset="61%" stop-color="#eceff1"/>
      <stop offset="79%" stop-color="#cfd8dc"/>
      <stop offset="80%" stop-color="#78909c"/>
      <stop offset="81%" stop-color="#eceff1"/>
      <stop offset="100%" stop-color="#cfd8dc"/>
    </linearGradient>

    <linearGradient id="gold-strip" x1="0" y1="0" x2="1" y2="0">
      <stop offset="0%" stop-color="#fff176"/>
      <stop offset="50%" stop-color="#ffb300"/>
      <stop offset="100%" stop-color="#fff176"/>
    </linearGradient>
    
    <clipPath id="circle-clip">
      <circle cx="150" cy="125" r="75" />
    </clipPath>
  </defs>

  <style>
    @keyframes goldGlow {
      0% { filter: drop-shadow(0px 0px 4px rgba(255, 215, 0, 0.4)) drop-shadow(0px 0px 8px rgba(255, 215, 0, 0.2)); }
      50% { filter: drop-shadow(0px 0px 12px rgba(255, 215, 0, 0.9)) drop-shadow(0px 0px 25px rgba(255, 215, 0, 0.7)) drop-shadow(0px 0px 40px rgba(255, 215, 0, 0.5)); }
      100% { filter: drop-shadow(0px 0px 4px rgba(255, 215, 0, 0.4)) drop-shadow(0px 0px 8px rgba(255, 215, 0, 0.2)); }
    }
    @keyframes stripPulse {
      0% { opacity: 0.7; filter: drop-shadow(0px 0px 10px #ffb300); }
      50% { opacity: 1; filter: drop-shadow(0px 0px 20px #ffca28) drop-shadow(0px 0px 40px #ffe57f); }
      100% { opacity: 0.7; filter: drop-shadow(0px 0px 10px #ffb300); }
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
    .strip { animation: stripPulse 2s infinite alternate; }
    .strip-light-base { fill: url(#gold-strip); }
  </style>

  <path d="M0 0 L800 0 L800 215 Q400 260 0 205 Z" fill="url(#silver-wall)" />
  <rect x="0" y="20" width="800" height="4" class="strip-light-base strip" />
  <path d="M0 195 Q400 245 800 190 L800 194 Q400 249 0 199 Z" class="strip-light-base strip" />
  
  <image href="data:image/png;base64,$base64" x="75" y="50" width="150" height="150" clip-path="url(#circle-clip)" />
  <text x="475" y="125" class="text">Hi myself imran</text>
</svg>
"@

Set-Content -Path "banner.svg" -Value $svg -Encoding UTF8
