# =============================================================
# Aurora Digital Foundry — Ecopetrol Aurora Deploy Script
# Run from: C:\Users\ADMIN\aurora-digital-foundry
# Usage: Right-click > Run with PowerShell
#        OR in terminal: .\deploy-ecopetrol.ps1
# =============================================================

$ErrorActionPreference = "Stop"
$repo = "C:\Users\ADMIN\aurora-digital-foundry"

Write-Host ""
Write-Host "========================================" -ForegroundColor Yellow
Write-Host "  AURORA DIGITAL FOUNDRY" -ForegroundColor Yellow
Write-Host "  Ecopetrol Aurora — Deploy Script" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Yellow
Write-Host ""

Set-Location $repo
Write-Host "[1/4] Creating directories..." -ForegroundColor Cyan
New-Item -ItemType Directory -Force -Path "src\pages\clients\ecopetrol-aurora" | Out-Null
Write-Host "      OK" -ForegroundColor Green

# =============================================================
# FILE 1: ShellLayout.astro
# =============================================================
Write-Host "[2/4] Writing files..." -ForegroundColor Cyan
Write-Host "      ShellLayout.astro" -ForegroundColor Gray

$f = @'
---
import '../styles/global.css';

interface Props {
  title?: string;
  description?: string;
}

const { title = 'Aurora Digital Foundry', description = '' } = Astro.props;
const base = import.meta.env.BASE_URL.replace(/\/$/, '') + '/';
---
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content={description} />
  <title>{title}</title>
  <link rel="icon" type="image/svg+xml" href={base + "favicon.svg"} />
</head>
<body>
  <slot />
</body>
</html>
'@
Set-Content -Path "src\layouts\ShellLayout.astro" -Value $f -Encoding UTF8

# =============================================================
# FILE 2: ecopetrol-aurora/index.astro
# =============================================================
Write-Host "      ecopetrol-aurora/index.astro" -ForegroundColor Gray

$f = @'
---
import ShellLayout from '../../../layouts/ShellLayout.astro';
const title = "Ecopetrol Aurora — Fuel & LPG Across Aurora Province";
const description = "Ecopetrol Gasoline Station — 8 branches across Aurora Province. Fuel, LPG, and fleet accounts for retail and institutional customers.";
const base = "/aurora-digital-foundry/clients/ecopetrol-aurora";
---
<ShellLayout title={title} description={description}>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@400;600;700;800;900&family=Barlow:wght@400;500;600&display=swap');
  :root {
    --red:#C41E2A; --red-dark:#9B1520; --red-light:#E8293A;
    --green:#1A5C2A; --white:#FFFFFF; --off-white:#F7F7F5;
    --charcoal:#111111; --gray:#444444; --border:#E0E0E0;
    --fd:'Barlow Condensed',sans-serif; --fb:'Barlow',sans-serif;
  }
  * { box-sizing:border-box; margin:0; padding:0; }
  body { font-family:var(--fb); color:var(--charcoal); }
  nav { background:var(--charcoal); display:flex; align-items:center; justify-content:space-between; padding:0 2rem; height:64px; position:sticky; top:0; z-index:100; border-bottom:3px solid var(--red); }
  .logo { font-family:var(--fd); font-size:1.4rem; font-weight:900; color:var(--white); text-decoration:none; display:flex; align-items:center; gap:0.4rem; }
  .logo .dot { color:var(--red); font-size:2rem; line-height:0; }
  .nav-links { display:flex; gap:1.5rem; list-style:none; align-items:center; }
  .nav-links a { color:#CCC; text-decoration:none; font-family:var(--fd); font-size:0.9rem; font-weight:600; letter-spacing:0.06em; text-transform:uppercase; transition:color 0.2s; }
  .nav-links a:hover { color:var(--white); }
  .nav-links .cta { background:var(--red); color:var(--white)!important; padding:0.4rem 1rem; }
  .emergency-top { background:var(--red-dark); color:var(--white); font-family:var(--fd); font-size:0.8rem; font-weight:600; letter-spacing:0.08em; text-align:center; padding:0.5rem 1rem; }
  .emergency-top a { color:var(--white); font-weight:700; }
  .hero { background:var(--charcoal); color:var(--white); min-height:520px; display:grid; grid-template-columns:1fr 1fr; position:relative; overflow:hidden; }
  .hero::before { content:''; position:absolute; inset:0; background:url('https://images.unsplash.com/photo-1545235617-9465d2a55698?auto=format&fit=crop&w=1600&q=60') center/cover no-repeat; opacity:0.15; }
  .hero-content { position:relative; z-index:2; padding:5rem 3rem 4rem; display:flex; flex-direction:column; justify-content:center; }
  .eyebrow { font-family:var(--fd); font-size:0.8rem; font-weight:700; letter-spacing:0.2em; text-transform:uppercase; color:var(--red); margin-bottom:1rem; display:flex; align-items:center; gap:0.5rem; }
  .eyebrow::before { content:''; display:block; width:2rem; height:2px; background:var(--red); }
  .hero-title { font-family:var(--fd); font-size:clamp(3rem,6vw,5rem); font-weight:900; line-height:0.95; text-transform:uppercase; margin-bottom:1.5rem; }
  .hero-title em { color:var(--red); font-style:normal; }
  .hero-sub { font-size:1.1rem; color:#CCC; line-height:1.6; max-width:420px; margin-bottom:2.5rem; }
  .hero-ctas { display:flex; gap:1rem; flex-wrap:wrap; }
  .btn-red { background:var(--red); color:var(--white); font-family:var(--fd); font-size:0.95rem; font-weight:700; letter-spacing:0.08em; text-transform:uppercase; padding:0.85rem 2rem; text-decoration:none; display:inline-block; transition:background 0.2s; }
  .btn-red:hover { background:var(--red-light); }
  .btn-outline { background:transparent; color:var(--white); font-family:var(--fd); font-size:0.95rem; font-weight:700; letter-spacing:0.08em; text-transform:uppercase; padding:0.85rem 2rem; border:2px solid rgba(255,255,255,0.4); text-decoration:none; display:inline-block; transition:border-color 0.2s; }
  .btn-outline:hover { border-color:var(--white); }
  .btn-green { background:var(--white); color:var(--green); font-family:var(--fd); font-size:0.9rem; font-weight:700; letter-spacing:0.08em; text-transform:uppercase; padding:0.8rem 1.75rem; text-decoration:none; display:inline-block; }
  .price-ticker { background:var(--red); color:var(--white); padding:1.25rem 2rem; display:flex; align-items:center; gap:2rem; flex-wrap:wrap; justify-content:center; }
  .ticker-label { font-family:var(--fd); font-size:0.75rem; font-weight:700; letter-spacing:0.15em; text-transform:uppercase; opacity:0.8; white-space:nowrap; }
  .ticker-items { display:flex; gap:2rem; flex-wrap:wrap; justify-content:center; }
  .ticker-item { display:flex; flex-direction:column; align-items:center; min-width:80px; }
  .ticker-product { font-family:var(--fd); font-size:0.7rem; font-weight:700; letter-spacing:0.12em; text-transform:uppercase; opacity:0.8; }
  .ticker-price { font-family:var(--fd); font-size:1.6rem; font-weight:900; line-height:1; }
  .divider { width:1px; height:40px; background:rgba(255,255,255,0.3); }
  .ticker-update { font-family:var(--fd); font-size:0.7rem; opacity:0.7; white-space:nowrap; }
  .ticker-link { font-family:var(--fd); font-size:0.8rem; font-weight:700; color:var(--white); text-decoration:none; border:1px solid rgba(255,255,255,0.5); padding:0.35rem 0.8rem; letter-spacing:0.08em; text-transform:uppercase; white-space:nowrap; }
  .audience-split { display:grid; grid-template-columns:1fr 1fr; }
  .audience-card { padding:4rem 3rem; display:flex; flex-direction:column; gap:1.25rem; }
  .audience-card.b2c { background:var(--off-white); }
  .audience-card.b2b { background:var(--green); color:var(--white); }
  .audience-tag { font-family:var(--fd); font-size:0.7rem; font-weight:700; letter-spacing:0.2em; text-transform:uppercase; }
  .b2c .audience-tag { color:var(--red); }
  .b2b .audience-tag { color:rgba(255,255,255,0.7); }
  .audience-title { font-family:var(--fd); font-size:clamp(1.8rem,3vw,2.5rem); font-weight:800; text-transform:uppercase; line-height:1; }
  .audience-body { font-size:1rem; line-height:1.6; max-width:380px; }
  .b2c .audience-body { color:var(--gray); }
  .b2b .audience-body { color:rgba(255,255,255,0.85); }
  .audience-features { list-style:none; display:flex; flex-direction:column; gap:0.5rem; }
  .audience-features li { font-family:var(--fd); font-size:0.9rem; font-weight:600; display:flex; align-items:center; gap:0.5rem; }
  .audience-features li::before { content:'→'; font-weight:700; }
  .b2c .audience-features li::before { color:var(--red); }
  .b2b .audience-features li { color:rgba(255,255,255,0.9); }
  .b2b .audience-features li::before { color:rgba(255,255,255,0.6); }
  .stats-strip { background:var(--charcoal); display:flex; justify-content:center; flex-wrap:wrap; }
  .stat-item { padding:2.5rem 3rem; text-align:center; border-right:1px solid rgba(255,255,255,0.08); flex:1; min-width:150px; }
  .stat-item:last-child { border-right:none; }
  .stat-number { font-family:var(--fd); font-size:3rem; font-weight:900; color:var(--red); line-height:1; }
  .stat-label { font-family:var(--fd); font-size:0.75rem; font-weight:600; letter-spacing:0.15em; text-transform:uppercase; color:#888; margin-top:0.35rem; }
  .section { padding:5rem 2rem; }
  .section-inner { max-width:1200px; margin:0 auto; }
  .section-eyebrow { font-family:var(--fd); font-size:0.75rem; font-weight:700; letter-spacing:0.2em; text-transform:uppercase; color:var(--red); margin-bottom:0.75rem; display:flex; align-items:center; gap:0.5rem; }
  .section-eyebrow::before { content:''; display:block; width:1.5rem; height:2px; background:var(--red); }
  .section-title { font-family:var(--fd); font-size:clamp(2rem,4vw,3rem); font-weight:800; text-transform:uppercase; line-height:1; margin-bottom:1rem; }
  .section-sub { font-size:1rem; color:var(--gray); max-width:560px; margin-bottom:3rem; line-height:1.6; }
  .branches-grid { display:grid; grid-template-columns:repeat(auto-fill,minmax(260px,1fr)); gap:1px; background:var(--border); border:1px solid var(--border); }
  .branch-card { background:var(--white); padding:1.75rem; display:flex; flex-direction:column; gap:0.75rem; transition:background 0.2s; }
  .branch-card:hover { background:var(--off-white); }
  .branch-name { font-family:var(--fd); font-size:1.1rem; font-weight:800; text-transform:uppercase; }
  .branch-address { font-size:0.85rem; color:var(--gray); line-height:1.5; }
  .product-tags { display:flex; gap:0.4rem; flex-wrap:wrap; }
  .tag { font-family:var(--fd); font-size:0.7rem; font-weight:700; letter-spacing:0.08em; text-transform:uppercase; padding:0.2rem 0.5rem; background:var(--off-white); color:var(--charcoal); border:1px solid var(--border); }
  .tag.lpg { background:#E8F5EC; color:var(--green); border-color:#B8DFC2; }
  .branch-link { font-family:var(--fd); font-size:0.8rem; font-weight:700; letter-spacing:0.06em; text-transform:uppercase; color:var(--red); text-decoration:none; border-bottom:1px solid var(--red); padding-bottom:1px; }
  .lpg-callout { background:var(--green); color:var(--white); padding:5rem 2rem; }
  .lpg-inner { max-width:1200px; margin:0 auto; display:grid; grid-template-columns:1fr 1fr; gap:4rem; align-items:center; }
  .lpg-inner .section-eyebrow { color:rgba(255,255,255,0.6); }
  .lpg-inner .section-eyebrow::before { background:rgba(255,255,255,0.6); }
  .lpg-inner .section-title { color:var(--white); }
  .lpg-inner .section-sub { color:rgba(255,255,255,0.8); }
  .solane-badge { display:inline-flex; align-items:center; gap:0.75rem; background:rgba(255,255,255,0.1); border:1px solid rgba(255,255,255,0.2); padding:0.75rem 1.25rem; margin-bottom:2rem; }
  .solane-badge span { font-family:var(--fd); font-size:0.8rem; font-weight:700; letter-spacing:0.1em; text-transform:uppercase; color:rgba(255,255,255,0.8); }
  .solane-badge strong { font-family:var(--fd); font-size:1rem; font-weight:900; color:var(--white); }
  .lpg-features { list-style:none; display:flex; flex-direction:column; gap:1rem; margin-bottom:2.5rem; }
  .lpg-features li { display:flex; align-items:flex-start; gap:0.75rem; font-size:0.95rem; color:rgba(255,255,255,0.9); line-height:1.5; }
  .img-placeholder { background:rgba(255,255,255,0.08); border:1px solid rgba(255,255,255,0.15); height:320px; display:flex; align-items:center; justify-content:center; flex-direction:column; gap:0.75rem; color:rgba(255,255,255,0.4); font-family:var(--fd); font-size:0.8rem; font-weight:600; letter-spacing:0.1em; text-transform:uppercase; text-align:center; }
  .eco-footer { background:#0A0A0A; color:var(--white); padding:3rem 2rem; }
  .footer-inner { max-width:1200px; margin:0 auto; display:grid; grid-template-columns:2fr 1fr 1fr 1fr; gap:3rem; }
  .footer-brand-name { font-family:var(--fd); font-size:1.3rem; font-weight:900; color:var(--white); letter-spacing:0.04em; margin-bottom:0.75rem; display:block; text-decoration:none; }
  .footer-brand p { font-size:0.85rem; color:#777; line-height:1.6; max-width:260px; }
  .footer-col h4 { font-family:var(--fd); font-size:0.7rem; font-weight:700; letter-spacing:0.2em; text-transform:uppercase; color:#555; margin-bottom:1rem; }
  .footer-col ul { list-style:none; display:flex; flex-direction:column; gap:0.5rem; }
  .footer-col ul a { color:#999; text-decoration:none; font-size:0.9rem; font-family:var(--fd); font-weight:500; transition:color 0.2s; }
  .footer-col ul a:hover { color:var(--white); }
  .footer-bottom { max-width:1200px; margin:2rem auto 0; padding-top:1.5rem; border-top:1px solid #1E1E1E; display:flex; justify-content:space-between; align-items:center; flex-wrap:wrap; gap:0.5rem; }
  .footer-bottom p { font-size:0.8rem; color:#555; }
  .footer-bottom a { color:#555; text-decoration:none; }
  .sticky-emergency { position:fixed; bottom:0; left:0; right:0; background:var(--red-dark); color:var(--white); display:flex; align-items:center; justify-content:center; gap:1.5rem; padding:0.6rem 1.5rem; font-family:var(--fd); font-size:0.8rem; font-weight:600; letter-spacing:0.06em; z-index:200; flex-wrap:wrap; }
  .sticky-emergency .label { text-transform:uppercase; opacity:0.7; font-size:0.7rem; letter-spacing:0.15em; }
  .sticky-emergency a { color:var(--white); text-decoration:none; font-weight:800; font-size:0.95rem; }
  .dismiss { position:absolute; right:1rem; background:none; border:none; color:rgba(255,255,255,0.5); cursor:pointer; font-size:1rem; }
  @media (max-width:768px) {
    .hero { grid-template-columns:1fr; }
    .hero-content { padding:3.5rem 1.5rem; }
    .audience-split { grid-template-columns:1fr; }
    .audience-card { padding:3rem 1.5rem; }
    .lpg-inner { grid-template-columns:1fr; gap:2rem; }
    .footer-inner { grid-template-columns:1fr 1fr; gap:2rem; }
    .nav-links { display:none; }
    .section { padding:3.5rem 1.5rem; }
  }
</style>
<div>
  <div class="emergency-top">
    LPG Emergency / Safety Concern? Call your nearest branch immediately.
    &nbsp;·&nbsp; <a href={`${base}/contact`}>Branch Hotlines</a>
  </div>
  <nav>
    <a href={base} class="logo"><span class="dot">·</span> ECOPETROL</a>
    <ul class="nav-links">
      <li><a href={`${base}/branches`}>Branches</a></li>
      <li><a href={`${base}/prices`}>Fuel Prices</a></li>
      <li><a href={`${base}/lpg`}>LPG / Solane</a></li>
      <li><a href={`${base}/fleet`}>Fleet Accounts</a></li>
      <li><a href={`${base}/about`}>About</a></li>
      <li><a href={`${base}/contact`} class="cta">Contact Us</a></li>
    </ul>
  </nav>
  <section class="hero">
    <div class="hero-content">
      <div class="eyebrow">Aurora Province's Fuel Network</div>
      <h1 class="hero-title">Fuel That <em>Keeps</em><br>Aurora Moving.</h1>
      <p class="hero-sub">8 branches across Aurora Province. Gasoline, diesel, and Solane LPG for retail customers, fleets, and institutional buyers.</p>
      <div class="hero-ctas">
        <a href={`${base}/branches`} class="btn-red">Find a Branch</a>
        <a href={`${base}/fleet`} class="btn-outline">Fleet Accounts &rarr;</a>
      </div>
    </div>
  </section>
  <div class="price-ticker">
    <span class="ticker-label">Today's Pump Prices</span>
    <div class="divider"></div>
    <div class="ticker-items">
      <div class="ticker-item"><span class="ticker-product">Unleaded RON 91</span><span class="ticker-price">TODO</span></div>
      <div class="ticker-item"><span class="ticker-product">Premium RON 95</span><span class="ticker-price">TODO</span></div>
      <div class="ticker-item"><span class="ticker-product">Diesel Euro 4</span><span class="ticker-price">TODO</span></div>
      <div class="ticker-item"><span class="ticker-product">Kerosene</span><span class="ticker-price">TODO</span></div>
    </div>
    <div class="divider"></div>
    <span class="ticker-update">Last updated: TODO</span>
    <a href={`${base}/prices`} class="ticker-link">Full Price Board &rarr;</a>
  </div>
  <div class="audience-split">
    <div class="audience-card b2c">
      <div class="audience-tag">For Motorists &amp; Households</div>
      <h2 class="audience-title">Fill Up, Gas Up,<br>Drive On.</h2>
      <p class="audience-body">Find your nearest Ecopetrol station, check today's prices, and inquire about Solane LPG delivery for your home.</p>
      <ul class="audience-features">
        <li>8 branch locations across Aurora</li>
        <li>Gasoline, diesel &amp; kerosene</li>
        <li>Solane LPG cylinders &amp; refills</li>
        <li>Residential LPG delivery inquiry</li>
      </ul>
      <a href={`${base}/branches`} class="btn-red" style="align-self:flex-start;">Find Your Branch</a>
    </div>
    <div class="audience-card b2b">
      <div class="audience-tag">For Fleets &amp; Institutions</div>
      <h2 class="audience-title">Fuel Your<br>Operations.</h2>
      <p class="audience-body">Open a fleet account for volume pricing, credit terms, and dedicated service across our Aurora network.</p>
      <ul class="audience-features">
        <li>Volume pricing for fleet operators</li>
        <li>Government &amp; institutional supply</li>
        <li>Commercial LPG delivery</li>
        <li>Multi-branch account coverage</li>
      </ul>
      <a href={`${base}/fleet`} class="btn-green">Open Fleet Account</a>
    </div>
  </div>
  <div class="stats-strip">
    <div class="stat-item"><div class="stat-number">8+</div><div class="stat-label">Branch Locations</div></div>
    <div class="stat-item"><div class="stat-number">TODO</div><div class="stat-label">Years in Aurora</div></div>
    <div class="stat-item"><div class="stat-number">4</div><div class="stat-label">Fuel Products</div></div>
    <div class="stat-item"><div class="stat-number">TODO</div><div class="stat-label">Municipalities Covered</div></div>
    <div class="stat-item"><div class="stat-number">Solane</div><div class="stat-label">LPG Partner</div></div>
  </div>
  <section class="section" style="background:var(--off-white);">
    <div class="section-inner">
      <div class="section-eyebrow">Branch Network</div>
      <h2 class="section-title">Across Aurora Province</h2>
      <p class="section-sub">From Maria Aurora to Baler, Dipaculao to San Luis — we're where Aurora moves.</p>
      <div class="branches-grid">
        {[
          { name:'Maria Aurora — Flagship', town:'Maria Aurora', lpg:true },
          { name:'Baler NE', town:'Baler', lpg:true },
          { name:'Baler Pingit', town:'Baler', lpg:false },
          { name:'Dipaculao South', town:'Dipaculao', lpg:true },
          { name:'San Luis', town:'San Luis', lpg:true },
          { name:'Dinadiawan', town:'Dinadiawan', lpg:false },
          { name:'Detailen — Maria Aurora', town:'Maria Aurora', lpg:false },
          { name:'Uno — Maria Aurora', town:'Maria Aurora', lpg:true },
        ].map(b => (
          <div class="branch-card">
            <div class="branch-name">{b.name}</div>
            <div class="branch-address">TODO: Address, {b.town}, Aurora</div>
            <div class="product-tags">
              <span class="tag">Unleaded</span>
              <span class="tag">Diesel</span>
              {b.lpg && <span class="tag lpg">Solane LPG</span>}
            </div>
            <a href={`${base}/branches`} class="branch-link">Directions</a>
          </div>
        ))}
      </div>
      <div style="margin-top:2rem;">
        <a href={`${base}/branches`} class="btn-red">View All Branches with Maps &rarr;</a>
      </div>
    </div>
  </section>
  <section class="lpg-callout">
    <div class="lpg-inner">
      <div>
        <div class="solane-badge"><span>Authorized Showroom</span><strong>SOLANE LPG</strong></div>
        <div class="section-eyebrow">LPG Delivery &amp; Refills</div>
        <h2 class="section-title">Solane LPG for Home<br>&amp; Business.</h2>
        <p class="section-sub">Residential cylinder refills and commercial bulk LPG delivery across our Aurora coverage area.</p>
        <ul class="lpg-features">
          <li>🏠 Residential cylinder refills — 11kg, 22kg sizes</li>
          <li>🏭 Commercial &amp; bulk delivery for restaurants, resorts, institutions</li>
          <li>📍 Multiple showroom branches across the province</li>
          <li>📞 Call your nearest branch to schedule delivery</li>
        </ul>
        <a href={`${base}/lpg`} class="btn-green">LPG Inquiry &amp; Delivery</a>
      </div>
      <div class="img-placeholder">🔥<br>TODO: Photo of LPG cylinders / Solane product display</div>
    </div>
  </section>
  <footer class="eco-footer">
    <div class="footer-inner">
      <div class="footer-brand">
        <a href={base} class="footer-brand-name">· ECOPETROL AURORA</a>
        <p>Fuel and LPG across Aurora Province. Serving retail, fleet, and institutional customers since TODO: year.</p>
      </div>
      <div class="footer-col">
        <h4>For Motorists</h4>
        <ul>
          <li><a href={`${base}/branches`}>Find a Branch</a></li>
          <li><a href={`${base}/prices`}>Fuel Prices</a></li>
          <li><a href={`${base}/lpg`}>LPG / Solane</a></li>
        </ul>
      </div>
      <div class="footer-col">
        <h4>For Business</h4>
        <ul>
          <li><a href={`${base}/fleet`}>Fleet Accounts</a></li>
          <li><a href={`${base}/lpg`}>Commercial LPG</a></li>
          <li><a href={`${base}/contact`}>Contact Us</a></li>
        </ul>
      </div>
      <div class="footer-col">
        <h4>Company</h4>
        <ul>
          <li><a href={`${base}/about`}>About Ecopetrol</a></li>
          <li><a href={`${base}/about`}>Compliance</a></li>
          <li><a href={`${base}/contact`}>Careers</a></li>
        </ul>
      </div>
    </div>
    <div class="footer-bottom">
      <p>© 2026 Ecopetrol Gasoline Station · Maria Aurora, Aurora · TODO: Phone</p>
      <p>Site by <a href="https://github.com/hirrok">Aurora Digital Foundry</a></p>
    </div>
  </footer>
  <div class="sticky-emergency" id="es">
    <span class="label">⚠️ Emergency</span>
    <span>LPG leak or fuel hazard? Call your nearest branch immediately.</span>
    <a href={`${base}/contact`}>Branch Hotlines</a>
    <button class="dismiss" onclick="document.getElementById('es').style.display='none'" aria-label="Dismiss">✕</button>
  </div>
</div>
</ShellLayout>
'@
Set-Content -Path "src\pages\clients\ecopetrol-aurora\index.astro" -Value $f -Encoding UTF8

# =============================================================
# FILE 3: branches.astro
# =============================================================
Write-Host "      ecopetrol-aurora/branches.astro" -ForegroundColor Gray

$f = @'
---
import ShellLayout from '../../../layouts/ShellLayout.astro';
const base = "/aurora-digital-foundry/clients/ecopetrol-aurora";
---
<ShellLayout title="Branches — Ecopetrol Aurora" description="Find your nearest Ecopetrol branch across Aurora Province.">
<style>
  @import url('https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@700;800;900&family=Barlow:wght@400;500;600&display=swap');
  :root { --red:#C41E2A; --green:#1A5C2A; --charcoal:#111; --off-white:#F7F7F5; --gray:#444; --border:#E0E0E0; --white:#fff; --fd:'Barlow Condensed',sans-serif; --fb:'Barlow',sans-serif; }
  * { box-sizing:border-box; margin:0; padding:0; }
  body { font-family:var(--fb); color:var(--charcoal); }
  nav { background:var(--charcoal); display:flex; align-items:center; justify-content:space-between; padding:0 2rem; height:64px; border-bottom:3px solid var(--red); }
  .logo { font-family:var(--fd); font-size:1.4rem; font-weight:900; color:var(--white); text-decoration:none; display:flex; align-items:center; gap:0.4rem; }
  .logo .dot { color:var(--red); font-size:2rem; line-height:0; }
  .nav-links { display:flex; gap:1.5rem; list-style:none; }
  .nav-links a { color:#CCC; text-decoration:none; font-family:var(--fd); font-size:0.9rem; font-weight:600; letter-spacing:0.06em; text-transform:uppercase; }
  .nav-links .cta { background:var(--red); color:var(--white)!important; padding:0.4rem 1rem; }
  .page-hero { background:var(--charcoal); color:var(--white); padding:4rem 2rem; }
  .page-hero-inner { max-width:1200px; margin:0 auto; }
  .eyebrow { font-family:var(--fd); font-size:0.75rem; font-weight:700; letter-spacing:0.2em; text-transform:uppercase; color:var(--red); margin-bottom:0.75rem; display:flex; align-items:center; gap:0.5rem; }
  .eyebrow::before { content:''; display:block; width:1.5rem; height:2px; background:var(--red); }
  h1 { font-family:var(--fd); font-size:clamp(2.5rem,5vw,4rem); font-weight:900; text-transform:uppercase; line-height:0.95; }
  .page-sub { font-size:1rem; color:#CCC; margin-top:1rem; max-width:560px; line-height:1.6; }
  .section { padding:4rem 2rem; }
  .section-inner { max-width:1200px; margin:0 auto; }
  .branches-grid { display:grid; grid-template-columns:repeat(auto-fill,minmax(300px,1fr)); gap:1.5rem; }
  .branch-card { background:var(--white); border:1px solid var(--border); padding:2rem; display:flex; flex-direction:column; gap:1rem; }
  .branch-number { font-family:var(--fd); font-size:0.7rem; font-weight:700; letter-spacing:0.15em; text-transform:uppercase; color:var(--red); }
  .branch-name { font-family:var(--fd); font-size:1.3rem; font-weight:800; text-transform:uppercase; }
  .branch-meta { font-size:0.85rem; color:var(--gray); line-height:1.8; }
  .tags { display:flex; gap:0.4rem; flex-wrap:wrap; }
  .tag { font-family:var(--fd); font-size:0.7rem; font-weight:700; letter-spacing:0.08em; text-transform:uppercase; padding:0.2rem 0.5rem; background:var(--off-white); border:1px solid var(--border); }
  .tag.lpg { background:#E8F5EC; color:var(--green); border-color:#B8DFC2; }
  .map-placeholder { background:var(--off-white); border:1px solid var(--border); height:180px; display:flex; align-items:center; justify-content:center; font-family:var(--fd); font-size:0.8rem; font-weight:600; letter-spacing:0.1em; text-transform:uppercase; color:#999; }
  .branch-ctas { display:flex; gap:0.75rem; }
  .btn-sm { font-family:var(--fd); font-size:0.8rem; font-weight:700; letter-spacing:0.06em; text-transform:uppercase; padding:0.5rem 1rem; text-decoration:none; display:inline-block; }
  .btn-red { background:var(--red); color:var(--white); }
  .btn-border { background:transparent; border:1px solid var(--border); color:var(--charcoal); }
  footer { background:#0A0A0A; color:var(--white); padding:2rem; text-align:center; }
  footer p { font-size:0.8rem; color:#555; }
  footer a { color:#555; text-decoration:none; }
  @media (max-width:768px) { .nav-links { display:none; } }
</style>
<nav>
  <a href={base} class="logo"><span class="dot">·</span> ECOPETROL</a>
  <ul class="nav-links">
    <li><a href={`${base}/branches`}>Branches</a></li>
    <li><a href={`${base}/prices`}>Fuel Prices</a></li>
    <li><a href={`${base}/lpg`}>LPG / Solane</a></li>
    <li><a href={`${base}/fleet`}>Fleet Accounts</a></li>
    <li><a href={`${base}/about`}>About</a></li>
    <li><a href={`${base}/contact`} class="cta">Contact Us</a></li>
  </ul>
</nav>
<div class="page-hero">
  <div class="page-hero-inner">
    <div class="eyebrow">Branch Network</div>
    <h1>Our Locations<br>Across Aurora.</h1>
    <p class="page-sub">8 branches from Maria Aurora to Baler, Dipaculao, San Luis, and beyond.</p>
  </div>
</div>
<section class="section">
  <div class="section-inner">
    <div class="branches-grid">
      {[
        { n:1, name:'Maria Aurora — Flagship', town:'Maria Aurora', lpg:true },
        { n:2, name:'Baler NE', town:'Baler', lpg:true },
        { n:3, name:'Baler Pingit', town:'Baler', lpg:false },
        { n:4, name:'Dipaculao South', town:'Dipaculao', lpg:true },
        { n:5, name:'San Luis', town:'San Luis', lpg:true },
        { n:6, name:'Dinadiawan', town:'Dinadiawan', lpg:false },
        { n:7, name:'Detailen — Maria Aurora', town:'Maria Aurora', lpg:false },
        { n:8, name:'Uno — Maria Aurora', town:'Maria Aurora', lpg:true },
      ].map(b => (
        <div class="branch-card">
          <div class="branch-number">Branch {String(b.n).padStart(2,'0')}</div>
          <div class="branch-name">{b.name}</div>
          <div class="branch-meta">
            📍 TODO: Full address, {b.town}, Aurora<br/>
            🕐 Hours: TODO<br/>
            📞 TODO: Branch phone
          </div>
          <div class="tags">
            <span class="tag">Unleaded RON 91</span>
            <span class="tag">Diesel Euro 4</span>
            {b.lpg && <span class="tag lpg">Solane LPG</span>}
          </div>
          <div class="map-placeholder">TODO: Google Maps Embed</div>
          <div class="branch-ctas">
            <a href={`${base}/contact`} class="btn-sm btn-red">Get Directions</a>
            <a href={`${base}/contact`} class="btn-sm btn-border">Call Branch</a>
          </div>
        </div>
      ))}
    </div>
  </div>
</section>
<footer><p>© 2026 Ecopetrol Gasoline Station · Maria Aurora, Aurora · Site by <a href="https://github.com/hirrok">Aurora Digital Foundry</a></p></footer>
</ShellLayout>
'@
Set-Content -Path "src\pages\clients\ecopetrol-aurora\branches.astro" -Value $f -Encoding UTF8

# =============================================================
# FILE 4: prices.astro
# =============================================================
Write-Host "      ecopetrol-aurora/prices.astro" -ForegroundColor Gray

$f = @'
---
import ShellLayout from '../../../layouts/ShellLayout.astro';
const base = "/aurora-digital-foundry/clients/ecopetrol-aurora";
---
<ShellLayout title="Fuel Prices — Ecopetrol Aurora" description="Today's pump prices at Ecopetrol branches across Aurora Province.">
<style>
  @import url('https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@700;800;900&family=Barlow:wght@400;500;600&display=swap');
  :root { --red:#C41E2A; --charcoal:#111; --off-white:#F7F7F5; --gray:#444; --border:#E0E0E0; --white:#fff; --fd:'Barlow Condensed',sans-serif; --fb:'Barlow',sans-serif; }
  * { box-sizing:border-box; margin:0; padding:0; }
  body { font-family:var(--fb); color:var(--charcoal); }
  nav { background:var(--charcoal); display:flex; align-items:center; justify-content:space-between; padding:0 2rem; height:64px; border-bottom:3px solid var(--red); }
  .logo { font-family:var(--fd); font-size:1.4rem; font-weight:900; color:var(--white); text-decoration:none; display:flex; align-items:center; gap:0.4rem; }
  .logo .dot { color:var(--red); font-size:2rem; line-height:0; }
  .nav-links { display:flex; gap:1.5rem; list-style:none; }
  .nav-links a { color:#CCC; text-decoration:none; font-family:var(--fd); font-size:0.9rem; font-weight:600; letter-spacing:0.06em; text-transform:uppercase; }
  .nav-links .cta { background:var(--red); color:var(--white)!important; padding:0.4rem 1rem; }
  .page-hero { background:var(--charcoal); color:var(--white); padding:4rem 2rem; }
  .page-hero-inner { max-width:900px; margin:0 auto; }
  .eyebrow { font-family:var(--fd); font-size:0.75rem; font-weight:700; letter-spacing:0.2em; text-transform:uppercase; color:var(--red); margin-bottom:0.75rem; display:flex; align-items:center; gap:0.5rem; }
  .eyebrow::before { content:''; display:block; width:1.5rem; height:2px; background:var(--red); }
  h1 { font-family:var(--fd); font-size:clamp(2.5rem,5vw,4rem); font-weight:900; text-transform:uppercase; line-height:0.95; }
  .last-updated { font-size:0.85rem; color:#888; margin-top:0.75rem; }
  .section { padding:4rem 2rem; }
  .section-inner { max-width:900px; margin:0 auto; }
  .doe-notice { background:#FFF8E1; border:1px solid #F5C518; padding:1rem 1.25rem; font-size:0.9rem; color:#6D4C00; margin-bottom:2.5rem; line-height:1.6; }
  .price-table { width:100%; border-collapse:collapse; }
  .price-table thead tr { background:var(--charcoal); color:var(--white); }
  .price-table th { font-family:var(--fd); font-size:0.8rem; font-weight:700; letter-spacing:0.12em; text-transform:uppercase; padding:1rem 1.25rem; text-align:left; }
  .price-table tbody tr { border-bottom:1px solid var(--border); }
  .price-table tbody tr:nth-child(even) { background:var(--off-white); }
  .price-table td { padding:1rem 1.25rem; font-size:1rem; }
  .price-value { font-family:var(--fd); font-size:1.5rem; font-weight:900; color:var(--red); }
  footer { background:#0A0A0A; color:var(--white); padding:2rem; text-align:center; }
  footer p { font-size:0.8rem; color:#555; }
  footer a { color:#555; text-decoration:none; }
  @media (max-width:768px) { .nav-links { display:none; } }
</style>
<nav>
  <a href={base} class="logo"><span class="dot">·</span> ECOPETROL</a>
  <ul class="nav-links">
    <li><a href={`${base}/branches`}>Branches</a></li>
    <li><a href={`${base}/prices`}>Fuel Prices</a></li>
    <li><a href={`${base}/lpg`}>LPG / Solane</a></li>
    <li><a href={`${base}/fleet`}>Fleet Accounts</a></li>
    <li><a href={`${base}/about`}>About</a></li>
    <li><a href={`${base}/contact`} class="cta">Contact Us</a></li>
  </ul>
</nav>
<div class="page-hero">
  <div class="page-hero-inner">
    <div class="eyebrow">Price Board</div>
    <h1>Today's Pump<br>Prices.</h1>
    <p class="last-updated">Last updated: <strong>TODO — insert date of last DOE adjustment</strong></p>
  </div>
</div>
<section class="section">
  <div class="section-inner">
    <div class="doe-notice">
      ⚠️ <strong>DOE Compliance Notice:</strong> Fuel prices are updated per DOE weekly price adjustment schedules. Prices shown are per liter and apply to all Ecopetrol branches unless otherwise noted.
    </div>
    <table class="price-table">
      <thead><tr><th>Product</th><th>Price per Liter</th><th>Previous Price</th><th>Change</th></tr></thead>
      <tbody>
        {[
          { product:'Unleaded Gasoline RON 91', desc:'Standard unleaded' },
          { product:'Premium Gasoline RON 95', desc:'High-octane unleaded' },
          { product:'Diesel Euro 4', desc:'Clean diesel' },
          { product:'Kerosene', desc:'Household / commercial' },
        ].map(p => (
          <tr>
            <td><strong>{p.product}</strong><br/><span style="font-size:0.8rem;color:#888;">{p.desc}</span></td>
            <td><span class="price-value">TODO</span></td>
            <td><span style="color:#888;">TODO</span></td>
            <td><span style="color:#888;">TODO</span></td>
          </tr>
        ))}
      </tbody>
    </table>
    <p style="margin-top:1.5rem;font-size:0.85rem;color:#888;line-height:1.6;">Prices subject to DOE weekly adjustments. Call your nearest branch for the most current figures.</p>
  </div>
</section>
<footer><p>© 2026 Ecopetrol Gasoline Station · Maria Aurora, Aurora · Site by <a href="https://github.com/hirrok">Aurora Digital Foundry</a></p></footer>
</ShellLayout>
'@
Set-Content -Path "src\pages\clients\ecopetrol-aurora\prices.astro" -Value $f -Encoding UTF8

# =============================================================
# FILE 5: lpg.astro
# =============================================================
Write-Host "      ecopetrol-aurora/lpg.astro" -ForegroundColor Gray

$f = @'
---
import ShellLayout from '../../../layouts/ShellLayout.astro';
const base = "/aurora-digital-foundry/clients/ecopetrol-aurora";
---
<ShellLayout title="LPG / Solane — Ecopetrol Aurora" description="Solane LPG cylinders, refills, and delivery across Aurora Province.">
<style>
  @import url('https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@700;800;900&family=Barlow:wght@400;500;600&display=swap');
  :root { --red:#C41E2A; --green:#1A5C2A; --charcoal:#111; --off-white:#F7F7F5; --gray:#444; --border:#E0E0E0; --white:#fff; --fd:'Barlow Condensed',sans-serif; --fb:'Barlow',sans-serif; }
  * { box-sizing:border-box; margin:0; padding:0; }
  body { font-family:var(--fb); color:var(--charcoal); }
  nav { background:var(--charcoal); display:flex; align-items:center; justify-content:space-between; padding:0 2rem; height:64px; border-bottom:3px solid var(--red); }
  .logo { font-family:var(--fd); font-size:1.4rem; font-weight:900; color:var(--white); text-decoration:none; display:flex; align-items:center; gap:0.4rem; }
  .logo .dot { color:var(--red); font-size:2rem; line-height:0; }
  .nav-links { display:flex; gap:1.5rem; list-style:none; }
  .nav-links a { color:#CCC; text-decoration:none; font-family:var(--fd); font-size:0.9rem; font-weight:600; letter-spacing:0.06em; text-transform:uppercase; }
  .nav-links .cta { background:var(--red); color:var(--white)!important; padding:0.4rem 1rem; }
  .page-hero { background:var(--green); color:var(--white); padding:4rem 2rem; }
  .page-hero-inner { max-width:1100px; margin:0 auto; }
  .eyebrow { font-family:var(--fd); font-size:0.75rem; font-weight:700; letter-spacing:0.2em; text-transform:uppercase; color:rgba(255,255,255,0.6); margin-bottom:0.75rem; display:flex; align-items:center; gap:0.5rem; }
  .eyebrow::before { content:''; display:block; width:1.5rem; height:2px; background:rgba(255,255,255,0.6); }
  h1 { font-family:var(--fd); font-size:clamp(2.5rem,5vw,4rem); font-weight:900; text-transform:uppercase; line-height:0.95; }
  .page-sub { font-size:1rem; color:rgba(255,255,255,0.8); margin-top:1rem; max-width:560px; line-height:1.6; }
  .solane-badge { display:inline-flex; align-items:center; gap:0.75rem; background:rgba(255,255,255,0.1); border:1px solid rgba(255,255,255,0.2); padding:0.6rem 1rem; margin-bottom:1.5rem; }
  .solane-badge span { font-family:var(--fd); font-size:0.75rem; font-weight:700; letter-spacing:0.1em; text-transform:uppercase; color:rgba(255,255,255,0.8); }
  .solane-badge strong { font-family:var(--fd); font-size:0.95rem; font-weight:900; color:var(--white); }
  .section { padding:4rem 2rem; }
  .section-inner { max-width:1100px; margin:0 auto; }
  .cards-grid { display:grid; grid-template-columns:repeat(auto-fill,minmax(260px,1fr)); gap:1.5rem; margin-bottom:3rem; }
  .card { background:var(--off-white); border:1px solid var(--border); padding:2rem; }
  .card-icon { font-size:2rem; margin-bottom:1rem; }
  .card-title { font-family:var(--fd); font-size:1.2rem; font-weight:800; text-transform:uppercase; margin-bottom:0.75rem; }
  .card-body { font-size:0.9rem; color:var(--gray); line-height:1.6; }
  .cta-block { background:var(--green); color:var(--white); padding:3rem 2rem; text-align:center; }
  .cta-block h2 { font-family:var(--fd); font-size:2rem; font-weight:800; text-transform:uppercase; margin-bottom:1rem; }
  .cta-block p { color:rgba(255,255,255,0.8); margin-bottom:2rem; line-height:1.6; }
  .btn-white { background:var(--white); color:var(--green); font-family:var(--fd); font-size:0.95rem; font-weight:700; letter-spacing:0.08em; text-transform:uppercase; padding:0.9rem 2rem; text-decoration:none; display:inline-block; }
  footer { background:#0A0A0A; color:var(--white); padding:2rem; text-align:center; }
  footer p { font-size:0.8rem; color:#555; }
  footer a { color:#555; text-decoration:none; }
  @media (max-width:768px) { .nav-links { display:none; } }
</style>
<nav>
  <a href={base} class="logo"><span class="dot">·</span> ECOPETROL</a>
  <ul class="nav-links">
    <li><a href={`${base}/branches`}>Branches</a></li>
    <li><a href={`${base}/prices`}>Fuel Prices</a></li>
    <li><a href={`${base}/lpg`}>LPG / Solane</a></li>
    <li><a href={`${base}/fleet`}>Fleet Accounts</a></li>
    <li><a href={`${base}/about`}>About</a></li>
    <li><a href={`${base}/contact`} class="cta">Contact Us</a></li>
  </ul>
</nav>
<div class="page-hero">
  <div class="page-hero-inner">
    <div class="solane-badge"><span>Authorized Showroom</span><strong>SOLANE LPG</strong></div>
    <div class="eyebrow">LPG Delivery &amp; Refills</div>
    <h1>Solane LPG for<br>Home &amp; Business.</h1>
    <p class="page-sub">Residential cylinder refills and commercial bulk LPG delivery across Aurora Province.</p>
  </div>
</div>
<section class="section">
  <div class="section-inner">
    <div class="cards-grid">
      <div class="card"><div class="card-icon">🏠</div><div class="card-title">Residential Refills</div><p class="card-body">11kg and 22kg cylinder refills for households. Walk-in or call for delivery. TODO: prices per cylinder size.</p></div>
      <div class="card"><div class="card-icon">🏭</div><div class="card-title">Commercial &amp; Bulk</div><p class="card-body">High-volume LPG supply for restaurants, resorts, bakeries, and institutions. Inquire for bulk pricing and delivery scheduling.</p></div>
      <div class="card"><div class="card-icon">📍</div><div class="card-title">Showroom Locations</div><p class="card-body">Solane showrooms at: TODO — confirm which branches operate as authorized Solane showrooms.</p></div>
      <div class="card"><div class="card-icon">🛡️</div><div class="card-title">Safety First</div><p class="card-body">All cylinders are Solane-certified. LPG emergency? Call your nearest branch immediately.</p></div>
    </div>
  </div>
</section>
<div class="cta-block">
  <h2>Order LPG or Inquire About Delivery</h2>
  <p>Call your nearest branch or send an inquiry and we'll connect you with the right location for your area.</p>
  <a href={`${base}/contact`} class="btn-white">Send Inquiry &rarr;</a>
</div>
<footer><p>© 2026 Ecopetrol Gasoline Station · Maria Aurora, Aurora · Site by <a href="https://github.com/hirrok">Aurora Digital Foundry</a></p></footer>
</ShellLayout>
'@
Set-Content -Path "src\pages\clients\ecopetrol-aurora\lpg.astro" -Value $f -Encoding UTF8

# =============================================================
# FILE 6: fleet.astro
# =============================================================
Write-Host "      ecopetrol-aurora/fleet.astro" -ForegroundColor Gray

$f = @'
---
import ShellLayout from '../../../layouts/ShellLayout.astro';
const base = "/aurora-digital-foundry/clients/ecopetrol-aurora";
---
<ShellLayout title="Fleet Accounts — Ecopetrol Aurora" description="Open a fleet account with Ecopetrol Aurora for volume pricing and institutional fuel supply.">
<style>
  @import url('https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@700;800;900&family=Barlow:wght@400;500;600&display=swap');
  :root { --red:#C41E2A; --green:#1A5C2A; --charcoal:#111; --off-white:#F7F7F5; --gray:#444; --border:#E0E0E0; --white:#fff; --fd:'Barlow Condensed',sans-serif; --fb:'Barlow',sans-serif; }
  * { box-sizing:border-box; margin:0; padding:0; }
  body { font-family:var(--fb); color:var(--charcoal); }
  nav { background:var(--charcoal); display:flex; align-items:center; justify-content:space-between; padding:0 2rem; height:64px; border-bottom:3px solid var(--red); }
  .logo { font-family:var(--fd); font-size:1.4rem; font-weight:900; color:var(--white); text-decoration:none; display:flex; align-items:center; gap:0.4rem; }
  .logo .dot { color:var(--red); font-size:2rem; line-height:0; }
  .nav-links { display:flex; gap:1.5rem; list-style:none; }
  .nav-links a { color:#CCC; text-decoration:none; font-family:var(--fd); font-size:0.9rem; font-weight:600; letter-spacing:0.06em; text-transform:uppercase; }
  .nav-links .cta { background:var(--red); color:var(--white)!important; padding:0.4rem 1rem; }
  .page-hero { background:var(--charcoal); color:var(--white); padding:4rem 2rem; }
  .page-hero-inner { max-width:1100px; margin:0 auto; }
  .eyebrow { font-family:var(--fd); font-size:0.75rem; font-weight:700; letter-spacing:0.2em; text-transform:uppercase; color:var(--red); margin-bottom:0.75rem; display:flex; align-items:center; gap:0.5rem; }
  .eyebrow::before { content:''; display:block; width:1.5rem; height:2px; background:var(--red); }
  h1 { font-family:var(--fd); font-size:clamp(2.5rem,5vw,4rem); font-weight:900; text-transform:uppercase; line-height:0.95; }
  .page-sub { font-size:1rem; color:#CCC; margin-top:1rem; max-width:560px; line-height:1.6; }
  .two-col { display:grid; grid-template-columns:1fr 1fr; gap:4rem; padding:4rem 2rem; max-width:1100px; margin:0 auto; }
  h2 { font-family:var(--fd); font-size:1.8rem; font-weight:800; text-transform:uppercase; margin-bottom:1.25rem; }
  .benefit-list { list-style:none; display:flex; flex-direction:column; gap:1rem; }
  .benefit-list li { display:flex; align-items:flex-start; gap:0.75rem; font-size:0.95rem; line-height:1.5; }
  .benefit-list li::before { content:'→'; color:var(--red); font-weight:700; flex-shrink:0; }
  .serve-block { background:var(--off-white); padding:1.5rem; margin-top:2rem; }
  .serve-block h3 { font-family:var(--fd); font-size:1rem; font-weight:700; text-transform:uppercase; letter-spacing:0.1em; margin-bottom:0.75rem; }
  .serve-tags { display:flex; gap:0.5rem; flex-wrap:wrap; }
  .serve-tag { font-family:var(--fd); font-size:0.75rem; font-weight:700; text-transform:uppercase; letter-spacing:0.06em; padding:0.3rem 0.7rem; background:var(--charcoal); color:var(--white); }
  .form-block { background:var(--off-white); border:1px solid var(--border); padding:2rem; }
  .form-block h2 { margin-bottom:1.5rem; }
  .form-group { margin-bottom:1.25rem; }
  label { display:block; font-family:var(--fd); font-size:0.75rem; font-weight:700; letter-spacing:0.1em; text-transform:uppercase; color:var(--gray); margin-bottom:0.4rem; }
  input, select, textarea { width:100%; padding:0.75rem; border:1px solid var(--border); font-family:var(--fb); font-size:0.95rem; background:var(--white); }
  input:focus, select:focus, textarea:focus { outline:2px solid var(--red); }
  textarea { resize:vertical; min-height:100px; }
  .form-note { font-size:0.8rem; color:var(--gray); margin-top:0.4rem; }
  .btn-submit { background:var(--red); color:var(--white); font-family:var(--fd); font-size:1rem; font-weight:700; letter-spacing:0.08em; text-transform:uppercase; padding:0.9rem 2rem; border:none; cursor:pointer; width:100%; }
  footer { background:#0A0A0A; color:var(--white); padding:2rem; text-align:center; }
  footer p { font-size:0.8rem; color:#555; }
  footer a { color:#555; text-decoration:none; }
  @media (max-width:768px) { .nav-links{display:none;} .two-col{grid-template-columns:1fr;gap:2rem;padding:2rem 1.5rem;} }
</style>
<nav>
  <a href={base} class="logo"><span class="dot">·</span> ECOPETROL</a>
  <ul class="nav-links">
    <li><a href={`${base}/branches`}>Branches</a></li>
    <li><a href={`${base}/prices`}>Fuel Prices</a></li>
    <li><a href={`${base}/lpg`}>LPG / Solane</a></li>
    <li><a href={`${base}/fleet`}>Fleet Accounts</a></li>
    <li><a href={`${base}/about`}>About</a></li>
    <li><a href={`${base}/contact`} class="cta">Contact Us</a></li>
  </ul>
</nav>
<div class="page-hero">
  <div class="page-hero-inner">
    <div class="eyebrow">For Fleets &amp; Institutions</div>
    <h1>Fuel Your<br>Operations.</h1>
    <p class="page-sub">Open a fleet account for volume pricing, credit terms, and dedicated service across all Ecopetrol branches in Aurora Province.</p>
  </div>
</div>
<div class="two-col">
  <div>
    <h2>Why Open a Fleet Account</h2>
    <ul class="benefit-list">
      <li>Volume pricing — lower per-liter rates for high-consumption fleets</li>
      <li>Multi-branch coverage — fuel up at any of our 8 Aurora locations</li>
      <li>Monthly billing options — reduce cash handling for operations</li>
      <li>Dedicated account contact — direct line to our operations team</li>
      <li>Commercial LPG supply — for kitchens, generators, and equipment</li>
      <li>Government procurement ready — supply history available on request</li>
    </ul>
    <div class="serve-block">
      <h3>We Supply</h3>
      <div class="serve-tags">
        <span class="serve-tag">Government Agencies</span>
        <span class="serve-tag">Construction</span>
        <span class="serve-tag">Logistics &amp; Trucking</span>
        <span class="serve-tag">Resorts &amp; Hotels</span>
        <span class="serve-tag">Agricultural</span>
        <span class="serve-tag">Schools &amp; Institutions</span>
      </div>
    </div>
  </div>
  <div class="form-block">
    <h2>Open a Fleet Account</h2>
    <form action="https://formspree.io/f/TODO_FLEET_FORM_ID" method="POST">
      <div class="form-group"><label>Company / Organization Name *</label><input type="text" name="company" required placeholder="e.g. Aurora Provincial Government" /></div>
      <div class="form-group"><label>Contact Person *</label><input type="text" name="contact" required placeholder="Full name" /></div>
      <div class="form-group"><label>Phone Number *</label><input type="tel" name="phone" required placeholder="+63" /></div>
      <div class="form-group"><label>Email Address</label><input type="email" name="email" placeholder="optional but recommended" /></div>
      <div class="form-group">
        <label>Fleet Size</label>
        <select name="fleet_size">
          <option value="">Select range</option>
          <option>1–5 vehicles</option>
          <option>6–15 vehicles</option>
          <option>16–30 vehicles</option>
          <option>30+ vehicles</option>
        </select>
      </div>
      <div class="form-group">
        <label>Primary Fuel Type</label>
        <select name="fuel_type">
          <option value="">Select</option>
          <option>Diesel only</option>
          <option>Unleaded only</option>
          <option>Mixed diesel &amp; unleaded</option>
          <option>LPG / Solane</option>
          <option>Multiple products</option>
        </select>
      </div>
      <div class="form-group"><label>Preferred Branch(es)</label><input type="text" name="preferred_branch" placeholder="e.g. Baler, Maria Aurora" /></div>
      <div class="form-group">
        <label>Additional Information</label>
        <textarea name="message" placeholder="Tell us about your fuel needs, volume estimates, or specific requirements."></textarea>
        <p class="form-note">TODO: Replace form action with real Formspree ID before launch.</p>
      </div>
      <button type="submit" class="btn-submit">Submit Fleet Account Request</button>
    </form>
  </div>
</div>
<footer><p>© 2026 Ecopetrol Gasoline Station · Maria Aurora, Aurora · Site by <a href="https://github.com/hirrok">Aurora Digital Foundry</a></p></footer>
</ShellLayout>
'@
Set-Content -Path "src\pages\clients\ecopetrol-aurora\fleet.astro" -Value $f -Encoding UTF8

# =============================================================
# FILE 7: about.astro
# =============================================================
Write-Host "      ecopetrol-aurora/about.astro" -ForegroundColor Gray

$f = @'
---
import ShellLayout from '../../../layouts/ShellLayout.astro';
const base = "/aurora-digital-foundry/clients/ecopetrol-aurora";
---
<ShellLayout title="About — Ecopetrol Aurora" description="About Ecopetrol Gasoline Station — Aurora Province's fuel network.">
<style>
  @import url('https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@700;800;900&family=Barlow:wght@400;500;600&display=swap');
  :root { --red:#C41E2A; --green:#1A5C2A; --charcoal:#111; --off-white:#F7F7F5; --gray:#444; --border:#E0E0E0; --white:#fff; --fd:'Barlow Condensed',sans-serif; --fb:'Barlow',sans-serif; }
  * { box-sizing:border-box; margin:0; padding:0; }
  body { font-family:var(--fb); color:var(--charcoal); }
  nav { background:var(--charcoal); display:flex; align-items:center; justify-content:space-between; padding:0 2rem; height:64px; border-bottom:3px solid var(--red); }
  .logo { font-family:var(--fd); font-size:1.4rem; font-weight:900; color:var(--white); text-decoration:none; display:flex; align-items:center; gap:0.4rem; }
  .logo .dot { color:var(--red); font-size:2rem; line-height:0; }
  .nav-links { display:flex; gap:1.5rem; list-style:none; }
  .nav-links a { color:#CCC; text-decoration:none; font-family:var(--fd); font-size:0.9rem; font-weight:600; letter-spacing:0.06em; text-transform:uppercase; }
  .nav-links .cta { background:var(--red); color:var(--white)!important; padding:0.4rem 1rem; }
  .page-hero { background:var(--charcoal); color:var(--white); padding:4rem 2rem; }
  .page-hero-inner { max-width:1100px; margin:0 auto; }
  .eyebrow { font-family:var(--fd); font-size:0.75rem; font-weight:700; letter-spacing:0.2em; text-transform:uppercase; color:var(--red); margin-bottom:0.75rem; display:flex; align-items:center; gap:0.5rem; }
  .eyebrow::before { content:''; display:block; width:1.5rem; height:2px; background:var(--red); }
  h1 { font-family:var(--fd); font-size:clamp(2.5rem,5vw,4rem); font-weight:900; text-transform:uppercase; line-height:0.95; }
  .section { padding:4rem 2rem; }
  .section-inner { max-width:1100px; margin:0 auto; }
  .two-col { display:grid; grid-template-columns:1fr 1fr; gap:4rem; }
  h2 { font-family:var(--fd); font-size:1.8rem; font-weight:800; text-transform:uppercase; margin-bottom:1.25rem; }
  p { font-size:0.95rem; color:var(--gray); line-height:1.7; margin-bottom:1rem; }
  .compliance-grid { display:grid; grid-template-columns:repeat(auto-fill,minmax(240px,1fr)); gap:1rem; margin-top:1.5rem; }
  .compliance-card { background:var(--off-white); border:1px solid var(--border); padding:1.5rem; }
  .compliance-card h3 { font-family:var(--fd); font-size:1rem; font-weight:800; text-transform:uppercase; margin-bottom:0.5rem; color:var(--charcoal); }
  .compliance-card p { font-size:0.85rem; margin-bottom:0; }
  .todo-tag { display:inline-block; font-family:var(--fd); font-size:0.65rem; font-weight:700; background:#FFE0E0; color:var(--red); padding:0.1rem 0.4rem; letter-spacing:0.06em; vertical-align:middle; margin-left:0.4rem; }
  footer { background:#0A0A0A; color:var(--white); padding:2rem; text-align:center; }
  footer p { font-size:0.8rem; color:#555; margin-bottom:0; }
  footer a { color:#555; text-decoration:none; }
  @media (max-width:768px) { .nav-links{display:none;} .two-col{grid-template-columns:1fr;gap:2rem;} }
</style>
<nav>
  <a href={base} class="logo"><span class="dot">·</span> ECOPETROL</a>
  <ul class="nav-links">
    <li><a href={`${base}/branches`}>Branches</a></li>
    <li><a href={`${base}/prices`}>Fuel Prices</a></li>
    <li><a href={`${base}/lpg`}>LPG / Solane</a></li>
    <li><a href={`${base}/fleet`}>Fleet Accounts</a></li>
    <li><a href={`${base}/about`}>About</a></li>
    <li><a href={`${base}/contact`} class="cta">Contact Us</a></li>
  </ul>
</nav>
<div class="page-hero">
  <div class="page-hero-inner">
    <div class="eyebrow">Our Story</div>
    <h1>Aurora's Fuel<br>Network.</h1>
  </div>
</div>
<section class="section">
  <div class="section-inner">
    <div class="two-col">
      <div>
        <h2>About Ecopetrol</h2>
        <p>Ecopetrol Gasoline Station has been serving Aurora Province's motorists, households, and businesses since TODO: year. From our flagship branch in Maria Aurora to locations across Baler, Dipaculao, San Luis, and beyond, we've built Aurora's most extensive independent fuel network.</p>
        <p>We operate 8+ branches offering gasoline, diesel, kerosene, and Solane LPG — serving retail customers, fleet operators, government agencies, and institutional buyers.</p>
        <p>TODO: Add founding story, owner background, or company history approved by client.</p>
      </div>
      <div>
        <h2>Compliance &amp; Licensing</h2>
        <div class="compliance-grid">
          <div class="compliance-card">
            <h3>DOE Certificate of Compliance <span class="todo-tag">PENDING</span></h3>
            <p>All branches operate under DOE Certificate of Compliance. TODO: Insert COC numbers per branch after client confirms.</p>
          </div>
          <div class="compliance-card">
            <h3>Solane Authorized Showroom <span class="todo-tag">PENDING</span></h3>
            <p>Authorized Solane LPG showroom operator. TODO: Confirm legal entity name and showroom branch count.</p>
          </div>
          <div class="compliance-card">
            <h3>Price Board Compliance</h3>
            <p>Fuel prices displayed per DOE weekly price adjustment requirements at all branch locations.</p>
          </div>
          <div class="compliance-card">
            <h3>Safety Standards <span class="todo-tag">PENDING</span></h3>
            <p>All branches maintain required safety signage, fire suppression, and responsible officer certification per DOE standards.</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<footer><p>© 2026 Ecopetrol Gasoline Station · Maria Aurora, Aurora · Site by <a href="https://github.com/hirrok">Aurora Digital Foundry</a></p></footer>
</ShellLayout>
'@
Set-Content -Path "src\pages\clients\ecopetrol-aurora\about.astro" -Value $f -Encoding UTF8

# =============================================================
# FILE 8: contact.astro
# =============================================================
Write-Host "      ecopetrol-aurora/contact.astro" -ForegroundColor Gray

$f = @'
---
import ShellLayout from '../../../layouts/ShellLayout.astro';
const base = "/aurora-digital-foundry/clients/ecopetrol-aurora";
---
<ShellLayout title="Contact — Ecopetrol Aurora" description="Contact Ecopetrol Aurora. Branch hotlines, fleet inquiries, and LPG delivery.">
<style>
  @import url('https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@700;800;900&family=Barlow:wght@400;500;600&display=swap');
  :root { --red:#C41E2A; --red-dark:#9B1520; --charcoal:#111; --off-white:#F7F7F5; --gray:#444; --border:#E0E0E0; --white:#fff; --fd:'Barlow Condensed',sans-serif; --fb:'Barlow',sans-serif; }
  * { box-sizing:border-box; margin:0; padding:0; }
  body { font-family:var(--fb); color:var(--charcoal); }
  nav { background:var(--charcoal); display:flex; align-items:center; justify-content:space-between; padding:0 2rem; height:64px; border-bottom:3px solid var(--red); }
  .logo { font-family:var(--fd); font-size:1.4rem; font-weight:900; color:var(--white); text-decoration:none; display:flex; align-items:center; gap:0.4rem; }
  .logo .dot { color:var(--red); font-size:2rem; line-height:0; }
  .nav-links { display:flex; gap:1.5rem; list-style:none; }
  .nav-links a { color:#CCC; text-decoration:none; font-family:var(--fd); font-size:0.9rem; font-weight:600; letter-spacing:0.06em; text-transform:uppercase; }
  .nav-links .cta { background:var(--red); color:var(--white)!important; padding:0.4rem 1rem; }
  .page-hero { background:var(--charcoal); color:var(--white); padding:4rem 2rem; }
  .page-hero-inner { max-width:1100px; margin:0 auto; }
  .eyebrow { font-family:var(--fd); font-size:0.75rem; font-weight:700; letter-spacing:0.2em; text-transform:uppercase; color:var(--red); margin-bottom:0.75rem; display:flex; align-items:center; gap:0.5rem; }
  .eyebrow::before { content:''; display:block; width:1.5rem; height:2px; background:var(--red); }
  h1 { font-family:var(--fd); font-size:clamp(2.5rem,5vw,4rem); font-weight:900; text-transform:uppercase; line-height:0.95; }
  .two-col { display:grid; grid-template-columns:1fr 1fr; gap:4rem; padding:4rem 2rem; max-width:1100px; margin:0 auto; }
  h2 { font-family:var(--fd); font-size:1.5rem; font-weight:800; text-transform:uppercase; margin-bottom:1.25rem; }
  .emergency-block { background:var(--red-dark); color:var(--white); padding:1.5rem; margin-bottom:2rem; }
  .emergency-block h3 { font-family:var(--fd); font-size:1.1rem; font-weight:800; text-transform:uppercase; margin-bottom:0.5rem; }
  .emergency-block p { font-size:0.9rem; color:rgba(255,255,255,0.85); line-height:1.6; }
  .hotline-card { background:var(--off-white); border:1px solid var(--border); padding:1.25rem; margin-bottom:0.75rem; display:flex; justify-content:space-between; align-items:center; }
  .hotline-name { font-family:var(--fd); font-size:1rem; font-weight:700; text-transform:uppercase; }
  .hotline-number { font-family:var(--fd); font-size:1.1rem; font-weight:800; color:var(--red); }
  .form-block h2 { margin-bottom:1.5rem; }
  .form-group { margin-bottom:1.25rem; }
  label { display:block; font-family:var(--fd); font-size:0.75rem; font-weight:700; letter-spacing:0.1em; text-transform:uppercase; color:var(--gray); margin-bottom:0.4rem; }
  input, select, textarea { width:100%; padding:0.75rem; border:1px solid var(--border); font-family:var(--fb); font-size:0.95rem; background:var(--white); }
  input:focus, select:focus, textarea:focus { outline:2px solid var(--red); }
  textarea { resize:vertical; min-height:120px; }
  .form-note { font-size:0.8rem; color:var(--gray); margin-top:0.4rem; }
  .btn-submit { background:var(--red); color:var(--white); font-family:var(--fd); font-size:1rem; font-weight:700; letter-spacing:0.08em; text-transform:uppercase; padding:0.9rem 2rem; border:none; cursor:pointer; width:100%; }
  footer { background:#0A0A0A; color:var(--white); padding:2rem; text-align:center; }
  footer p { font-size:0.8rem; color:#555; }
  footer a { color:#555; text-decoration:none; }
  @media (max-width:768px) { .nav-links{display:none;} .two-col{grid-template-columns:1fr;gap:2rem;padding:2rem 1.5rem;} }
</style>
<nav>
  <a href={base} class="logo"><span class="dot">·</span> ECOPETROL</a>
  <ul class="nav-links">
    <li><a href={`${base}/branches`}>Branches</a></li>
    <li><a href={`${base}/prices`}>Fuel Prices</a></li>
    <li><a href={`${base}/lpg`}>LPG / Solane</a></li>
    <li><a href={`${base}/fleet`}>Fleet Accounts</a></li>
    <li><a href={`${base}/about`}>About</a></li>
    <li><a href={`${base}/contact`} class="cta">Contact Us</a></li>
  </ul>
</nav>
<div class="page-hero">
  <div class="page-hero-inner">
    <div class="eyebrow">Get In Touch</div>
    <h1>Contact &amp;<br>Branch Hotlines.</h1>
  </div>
</div>
<div class="two-col">
  <div>
    <div class="emergency-block">
      <h3>⚠️ LPG Emergency Line</h3>
      <p>Smell gas? Suspected leak? Call your nearest branch immediately. Do not use electrical switches. Evacuate the area first.</p>
    </div>
    <h2>Branch Hotlines</h2>
    {[
      'Maria Aurora — Flagship',
      'Baler NE',
      'Baler Pingit',
      'Dipaculao South',
      'San Luis',
      'Dinadiawan',
      'Detailen — Maria Aurora',
      'Uno — Maria Aurora',
    ].map(name => (
      <div class="hotline-card">
        <span class="hotline-name">{name}</span>
        <span class="hotline-number">TODO</span>
      </div>
    ))}
  </div>
  <div class="form-block">
    <h2>Send an Inquiry</h2>
    <form action="https://formspree.io/f/TODO_CONTACT_FORM_ID" method="POST">
      <div class="form-group"><label>Name *</label><input type="text" name="name" required placeholder="Your full name" /></div>
      <div class="form-group"><label>Phone *</label><input type="tel" name="phone" required placeholder="+63" /></div>
      <div class="form-group"><label>Email</label><input type="email" name="email" placeholder="optional" /></div>
      <div class="form-group">
        <label>Inquiry Type</label>
        <select name="type">
          <option value="">Select</option>
          <option>Fleet Account</option>
          <option>LPG Delivery</option>
          <option>General Inquiry</option>
          <option>Bulk Fuel Supply</option>
          <option>Careers</option>
          <option>Other</option>
        </select>
      </div>
      <div class="form-group">
        <label>Message *</label>
        <textarea name="message" required placeholder="How can we help you?"></textarea>
        <p class="form-note">TODO: Replace form action with real Formspree ID before launch.</p>
      </div>
      <button type="submit" class="btn-submit">Send Inquiry</button>
    </form>
  </div>
</div>
<footer><p>© 2026 Ecopetrol Gasoline Station · Maria Aurora, Aurora · Site by <a href="https://github.com/hirrok">Aurora Digital Foundry</a></p></footer>
</ShellLayout>
'@
Set-Content -Path "src\pages\clients\ecopetrol-aurora\contact.astro" -Value $f -Encoding UTF8

# =============================================================
# GIT
# =============================================================
Write-Host ""
Write-Host "[3/4] Running git..." -ForegroundColor Cyan
git add -A
git commit -m "feat: Volt v2 — Ecopetrol Aurora full rebuild with ShellLayout (7 pages)"
git push

Write-Host ""
Write-Host "[4/4] Done." -ForegroundColor Green
Write-Host ""
Write-Host "========================================" -ForegroundColor Yellow
Write-Host "  Files written: 8 (ShellLayout + 7 pages)" -ForegroundColor Yellow
Write-Host "  Committed and pushed to main" -ForegroundColor Yellow
Write-Host "  GitHub Actions deploying now..." -ForegroundColor Yellow
Write-Host ""
Write-Host "  Live in ~2 min:" -ForegroundColor Yellow
Write-Host "  hirrok.github.io/aurora-digital-foundry/clients/ecopetrol-aurora/" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Yellow
Write-Host ""
