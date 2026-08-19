$base64 = [convert]::ToBase64String([IO.File]::ReadAllBytes("assets/im.png"))

$svg = @"
<svg width="100%" height="250" viewBox="0 0 800 250" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <!-- Background color based on the uploaded image -->
    <linearGradient id="bg" x1="0" y1="0" x2="1" y2="1">
      <stop offset="0%" stop-color="#9c6d89"/>
      <stop offset="100%" stop-color="#855b74"/>
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
    .text {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
      font-size: 55px;
      font-weight: 800;
      fill: #ffffff;
      text-anchor: middle;
      dominant-baseline: middle;
      animation: goldGlow 2.5s ease-in-out infinite;
    }
  </style>

  <!-- Waving Background Shape -->
  <path d="M0 0 L800 0 L800 215 Q400 260 0 205 Z" fill="url(#bg)" />
  
  <image href="data:image/png;base64,$base64" x="75" y="50" width="150" height="150" clip-path="url(#circle-clip)" />
  
  <!-- Glowing Text -->
  <text x="475" y="125" class="text">Hi myself imran</text>
</svg>
"@

Set-Content -Path "banner.svg" -Value $svg -Encoding UTF8
