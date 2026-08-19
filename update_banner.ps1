$bgBase64 = [convert]::ToBase64String([IO.File]::ReadAllBytes("assets/banner.png"))
$profileBase64 = [convert]::ToBase64String([IO.File]::ReadAllBytes("assets/im.png"))

$svg = @"
<svg width="100%" height="250" viewBox="0 0 800 250" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <clipPath id="image-clip">
      <rect x="40" y="15" width="160" height="220" rx="15" />
    </clipPath>
    <!-- We clip the banner to have a nice wavy bottom like before -->
    <clipPath id="banner-clip">
      <path d="M0 0 L800 0 L800 215 Q400 260 0 205 Z" />
    </clipPath>
  </defs>

  <!-- Banner Background -->
  <image href="data:image/png;base64,$bgBase64" x="0" y="0" width="800" height="250" preserveAspectRatio="xMidYMid slice" clip-path="url(#banner-clip)" />
  
  <!-- Profile Picture -->
  <image href="data:image/png;base64,$profileBase64" x="40" y="15" width="160" height="220" clip-path="url(#image-clip)" preserveAspectRatio="xMidYMid slice" />
  
</svg>
"@

Set-Content -Path "banner.svg" -Value $svg -Encoding UTF8
