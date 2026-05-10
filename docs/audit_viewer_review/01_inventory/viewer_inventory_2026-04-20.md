# viewer inventory audit

generated: 2026-04-20 12:10:05

## ./viewer/bloodline.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>血統アーカイブ | MERITOCRACIA</title>
<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600&family=Noto+Serif+JP:wght@400;500&display=swap" rel="stylesheet">
<style>
:root{
  --bg:#060810;
  --bg2:#0f1320;
  --bg3:#141928;
  --text:#c4cdd8;
  --muted:#8894a3;
  --silver:#a8b8cc;
  --blue:#3a6898;
  --border:rgba(168,184,204,0.12);
}
*{box-sizing:border-box;margin:0;padding:0}
body{
  background:var(--bg);
  color:var(--text);
  font-family:'Noto Serif JP',serif;
  line-height:1.9;
}
.container{
  max-width:1100px;
  margin:0 auto;
  padding:48px 24px 80px;
}
.hero{
  margin-bottom:40px;
  padding-bottom:24px;
  border-bottom:1px solid var(--border);
}
.hero .label{
  font-family:'Cinzel',serif;
  font-size:11px;
  letter-spacing:4px;
  color:var(--silver);
```

## ./viewer/character/<!DOCTYPE html>.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Iris Earlgray | Nightfall Mode</title>
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;1,300&family=Noto+Serif+JP:wght@300;500&family=IM+Fell+English:ital@0;1&display=swap" rel="stylesheet">
<style>
/* ============================================================
   VARIABLE SETTINGS
   ============================================================ */
:root {
  /* Day Mode: Tea & Amber */
  --bg-main:      #2a1a0e;
  --label-bg:     linear-gradient(180deg, rgba(139,69,19,0.3) 0%, rgba(42,26,14,0.5) 100%);
  --accent-color: #C5A35A; /* Gold */
  --text-main:    #FFF8E7;
  --steam-color:  rgba(255,248,231,0.5);
  --border-line:  rgba(197,163,90,0.4);
}

body.night-mode {
  /* Night Mode: Moon & Abyss */
  --bg-main:      #0B1020;
  --label-bg:     linear-gradient(180deg, rgba(40,20,80,0.5) 0%, rgba(11,16,32,0.7) 100%);
  --accent-color: #C0C0C0; /* Silver / Nightfall */
  --text-main:    #d8e0f0;
  --steam-color:  rgba(140,95,191,0.4); /* Purple Particles */
  --border-line:  rgba(140,95,191,0.5);
}

/* ============================================================
   BASE STYLES
   ============================================================ */
body {
  background: var(--bg-main);
  color: var(--text-main);
  font-family: 'Noto Serif JP', serif;
  transition: background 0.8s ease, color 0.5s ease;
  min-height: 100vh;
```

## ./viewer/character/daisia/daisia.css

```
/* ============================================================
   DAISIA NOCTURNE — CHARACTER CSS
   Template: night-blood (reusable for vampire lineage chars)
   Default mode: night  |  Toggle: dawn
   ============================================================ */

/* ── NIGHT BASE（デフォルト CSS変数） ── */
:root {
  --n-bg:          #0a0608;
  --n-bg2:         #120a0d;
  --n-crimson:     #8b1a2a;
  --n-crimson2:    #a82035;
  --n-crimson-dim: #5a1020;
  --n-gold:        #c9a040;
  --n-gold2:       #e8c060;
  --n-bone:        #e8ddd0;
  --n-bone2:       #d0c4b4;
  --n-smoke:       #9a8878;
  --n-ash:         #5a4840;

  --border-cr:     rgba(139,26,42,0.5);
  --border-cr2:    rgba(139,26,42,0.9);
  --border-gold:   rgba(201,160,64,0.4);

  --text-warm:     #e8ddd0;
  --text-muted:    #c09080;
  --text-dim:      #6a4840;

  --particle-col:  rgba(139,26,42,0.7);
}

/* ── DAWN MODE 変数上書き ── */
body.dawn-mode {
  --n-bg:          #1a1008;
  --n-bg2:         #281808;
  --n-crimson:     #8b6020;
  --n-crimson2:    #c89040;
  --n-crimson-dim: #6a4810;
  --n-gold:        #e8b840;
  --n-gold2:       #f8d870;
```

## ./viewer/character/daisia/daisia.js

```
'use strict';

/* ============================================================
   DAISIA NOCTURNE — CHARACTER JS
   JSON fetch → DOM render → Night/Dawn toggle
   将来的に character.js として共通化可能な構造
   ============================================================ */

/* ── util ── */
const el = (tag, cls) => {
  const e = document.createElement(tag);
  if (cls) e.className = cls;
  return e;
};

/* ============================================================
   RENDER: HEADER
   ============================================================ */
function renderHeader(data) {
  const h = data.header;
  const f = data.flavor;

  /* ブランドロゴ */
  document.getElementById('char-brand-logo').textContent = h.brand_logo;

  /* キャラ名 */
  document.getElementById('char-name-en').textContent = h.char_name_en;
  document.getElementById('char-name-ja').textContent = h.char_name_ja;

  /* 区切り線 symbol */
  document.querySelectorAll('.char-divider span')
    .forEach(s => s.textContent = h.divider_symbol);

  /* 四隅 symbol */
  document.querySelectorAll('.char-corner-tl, .char-corner-br')
    .forEach(s => s.textContent = h.corner_symbol);

  /* blood-label-header の ::before / ::after 用 */
  const headerEl = document.querySelector('.blood-label-header');
  headerEl.setAttribute('data-corner', h.corner_symbol);
```

## ./viewer/character/daisia/daisia.json

```
{
  "meta": {
    "id": "daisia",
    "theme": "night-blood",
    "default_mode": "night",
    "template_version": "1.0"
  },

  "header": {
    "brand_logo": "Meritocracia — Sang Royal Réserve Nuit No.13",
    "char_name_en": "Daisia Nocturne",
    "char_name_ja": "デイジア＝ノクターン",
    "divider_symbol": "✦",
    "corner_symbol": "❋",
    "particle_count": 7,
    "dawn_ray_count": 4
  },

  "flavor": {
    "night": {
      "text": "血でしか繋がれないと信じていた夜が、<br>　　　　　朝と出会う前の最後の一杯",
      "sub": "— Bottled in Darkness, Aged by Memory —"
    },
    "dawn": {
      "text": "夜を越えた少女は、朝日を杯に注いで<br>　　　　　初めて乾杯の意味を知る",
      "sub": "— Distilled by Dawn, Released from Night —"
    }
  },

  "color_strip": {
    "night": ["#0a0608", "#8b1a2a", "#c9a040", "#1a0f12", "#5a1020", "#e8ddd0"],
    "dawn":  ["#1a1008", "#e8b840", "#f8d870", "#281808", "#c89040", "#fff8e8"]
  },

  "profile": {
    "card_title": "Blood Profile",
    "fields": [
      { "label": "Name",           "value": "デイジア＝ノクターン" },
      { "label": "Race",           "value": "吸血エルフ（古代エルフ血統分岐）" },
      { "label": "Age",            "value": "14歳" },
```

## ./viewer/character/daisia/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Daisia Nocturne | MERITOCRACIA</title>
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,300;1,400&family=Noto+Serif+JP:wght@300;400;500&family=IM+Fell+English:ital@0;1&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./daisia.css">
</head>
<body>

<div class="char-page">

  <div id="char-error-msg"
       style="display:none; color:#e05050; font-size:12px; padding:12px;
              border:1px solid rgba(139,26,26,0.3); margin-bottom:16px;"></div>

  <div class="mode-toggle-wrap">
    <button id="char-toggle-btn" class="mode-toggle-btn">
      <span>🌙 Night / ☀ Dawn</span>
    </button>
  </div>

  <a class="char-back-link" href="../index.html">← CHARACTER LIST</a>

  <header class="blood-label-header char-fade-in" data-corner="❋">
    <span class="char-corner-tl"></span>
    <span class="char-corner-br"></span>
    <div id="char-brand-logo" class="char-brand-logo"></div>
    <div class="char-divider"><span></span></div>
    <h1 id="char-name-en" class="char-name-en"></h1>
    <p  id="char-name-ja" class="char-name-ja"></p>
    <div class="char-divider"><span></span></div>
    <div id="char-particle-wrap" class="char-particle-wrap" aria-hidden="true"></div>
    <p id="char-flavor-text" class="char-flavor-text"></p>
  </header>

  <div id="char-strip-night" class="char-color-strip char-strip-night" aria-hidden="true"></div>
  <div id="char-strip-dawn"  class="char-color-strip char-strip-dawn"  aria-hidden="true"></div>

```

## ./viewer/character/fine.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CHARACTER PROFILE | FINE</title>

<!-- フォント統一 -->
<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@400;600&display=swap" rel="stylesheet">

<style>
:root {
    --primary-color: #2d5a27;
    --accent-color: #c0392b;
    --sub-color: #2980b9;
    --bg-dark: #0f1410;
    --text-gray: #a0a8a0;
    --border-color: #2c3e2d;
}

body {
    background-color: var(--bg-dark);
    color: #e8eee8;
    font-family: 'Noto Serif JP', serif;
    margin: 0;
    padding: 40px 20px;
}

.container {
    max-width: 900px;
    margin: 0 auto;
    border: 1px solid var(--border-color);
    padding: 40px;
    background: linear-gradient(145deg, #162017, #0f1410);
}

/* 見出し */
h1, h2 {
    font-family: 'Cinzel', serif;
}
```

## ./viewer/character/fran.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CHARACTER PROFILE | FRAN</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600&family=Noto+Serif+JP:wght@400;500;600&display=swap" rel="stylesheet">

<style>
:root {
    --bg-base: #f4c6d0;
    --bg-shell: rgba(255, 255, 255, 0.18);
    --section-bg: rgba(255, 255, 255, 0.46);
    --border-primary: rgba(255, 255, 255, 0.58);
    --border-soft: rgba(255, 255, 255, 0.32);
    --border-accent: #ffffff;

    --text-main: #3a2e2e;
    --text-sub: #6b4b4b;
    --text-dim: rgba(58, 46, 46, 0.62);

    --header-bg: #8e8e8e;
    --header-text: #ffffff;
    --header-sub: rgba(255,255,255,0.78);

    --shadow: rgba(0, 0, 0, 0.08);
    --accent-line: rgba(255,255,255,0.72);
}

* { box-sizing: border-box; }

body {
    margin: 0;
    padding: 0;
    background:
        radial-gradient(circle at top center, rgba(255,255,255,0.24) 0%, transparent 38%),
        linear-gradient(180deg, #f6ccd5 0%, #efc0cb 100%);
```

## ./viewer/character/garnet./garnet.css

```
/* ============================================================
   DAISIA NOCTURNE — CHARACTER CSS
   Template: night-blood (reusable for vampire lineage chars)
   Default mode: night  |  Toggle: dawn
   ============================================================ */

/* ── NIGHT BASE（デフォルト CSS変数） ── */
:root {
  --n-bg:          #0a0608;
  --n-bg2:         #120a0d;
  --n-crimson:     #8b1a2a;
  --n-crimson2:    #a82035;
  --n-crimson-dim: #5a1020;
  --n-gold:        #c9a040;
  --n-gold2:       #e8c060;
  --n-bone:        #e8ddd0;
  --n-bone2:       #d0c4b4;
  --n-smoke:       #9a8878;
  --n-ash:         #5a4840;

  --border-cr:     rgba(139,26,42,0.5);
  --border-cr2:    rgba(139,26,42,0.9);
  --border-gold:   rgba(201,160,64,0.4);

  --text-warm:     #e8ddd0;
  --text-muted:    #c09080;
  --text-dim:      #6a4840;

  --particle-col:  rgba(139,26,42,0.7);
}

/* ── DAWN MODE 変数上書き ── */
body.dawn-mode {
  --n-bg:          #1a1008;
  --n-bg2:         #281808;
  --n-crimson:     #8b6020;
  --n-crimson2:    #c89040;
  --n-crimson-dim: #6a4810;
  --n-gold:        #e8b840;
  --n-gold2:       #f8d870;
```

## ./viewer/character/garnet./garnet.js

```
'use strict';

/* ============================================================
   DAISIA NOCTURNE — CHARACTER JS
   JSON fetch → DOM render → Night/Dawn toggle
   将来的に character.js として共通化可能な構造
   ============================================================ */

/* ── util ── */
const el = (tag, cls) => {
  const e = document.createElement(tag);
  if (cls) e.className = cls;
  return e;
};

/* ============================================================
   RENDER: HEADER
   ============================================================ */
function renderHeader(data) {
  const h = data.header;
  const f = data.flavor;

  /* ブランドロゴ */
  document.getElementById('char-brand-logo').textContent = h.brand_logo;

  /* キャラ名 */
  document.getElementById('char-name-en').textContent = h.char_name_en;
  document.getElementById('char-name-ja').textContent = h.char_name_ja;

  /* 区切り線 symbol */
  document.querySelectorAll('.char-divider span')
    .forEach(s => s.textContent = h.divider_symbol);

  /* 四隅 symbol */
  document.querySelectorAll('.char-corner-tl, .char-corner-br')
    .forEach(s => s.textContent = h.corner_symbol);

  /* blood-label-header の ::before / ::after 用 */
  const headerEl = document.querySelector('.blood-label-header');
  headerEl.setAttribute('data-corner', h.corner_symbol);
```

## ./viewer/character/garnet./garnet.json

```
{
  "meta": {
    "id": "garnet",
    "theme": "ember-knight",
    "default_mode": "night",
    "template_version": "1.0"
  },

  "header": {
    "brand_logo": "Meritocracia — Frontorden Ember Archive No.01",
    "char_name_en": "Garnet Valgray",
    "char_name_ja": "ガーネット・ヴァルグレイ",
    "divider_symbol": "✦",
    "corner_symbol": "✦",
    "particle_count": 7,
    "dawn_ray_count": 4
  },

  "flavor": {
    "night": {
      "text": "炎上する都市の中でも、<br>　　　　　最後まで剣を下ろさなかった男",
      "sub": "— The Sword That Entered the Fire After the Sirens —"
    },
    "dawn": {
      "text": "守れなかった命を背負いながらも、<br>　　　　　それでも次の市民を守るため前へ出る",
      "sub": "— Not Salvation, But Duty Carried Into Morning —"
    }
  },

  "color_strip": {
    "night": ["#0a0608", "#7f0f19", "#b51f2e", "#d4a64a", "#4a0d12", "#f2e3c6"],
    "dawn":  ["#1a1008", "#a24d1c", "#d97a2b", "#f0c86a", "#5b2e14", "#fff2d9"]
  },

  "profile": {
    "card_title": "Front Profile",
    "fields": [
      { "label": "Name", "value": "ガーネット・ヴァルグレイ" },
      { "label": "Affiliation", "value": "Frontorden（前線騎士団）" },
      { "label": "Age", "value": "35歳" },
```

## ./viewer/character/garnet./index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Garnet Valgray | MERITOCRACIA</title>
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,300;1,400&family=Noto+Serif+JP:wght@300;400;500&family=IM+Fell+English:ital@0;1&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./garnet.css">
</head>
<body>

<div class="char-page">

  <div id="char-error-msg"
       style="display:none; color:#e05050; font-size:12px; padding:12px;
              border:1px solid rgba(139,26,26,0.3); margin-bottom:16px;"></div>

  <div class="mode-toggle-wrap">
    <button id="char-toggle-btn" class="mode-toggle-btn">
      <span>🔥 Ember / ✨ Dawn</span>
    </button>
  </div>

  <a class="char-back-link" href="../index.html">← CHARACTER LIST</a>

  <header class="blood-label-header char-fade-in" data-corner="✦">
    <span class="char-corner-tl"></span>
    <span class="char-corner-br"></span>
    <div id="char-brand-logo" class="char-brand-logo"></div>
    <div class="char-divider"><span></span></div>
    <h1 id="char-name-en" class="char-name-en"></h1>
    <p id="char-name-ja" class="char-name-ja"></p>
    <div class="char-divider"><span></span></div>
    <div id="char-particle-wrap" class="char-particle-wrap" aria-hidden="true"></div>
    <p id="char-flavor-text" class="char-flavor-text"></p>
  </header>

  <div id="char-strip-night" class="char-color-strip char-strip-night" aria-hidden="true"></div>
  <div id="char-strip-dawn" class="char-color-strip char-strip-dawn" aria-hidden="true"></div>

```

## ./viewer/character/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>キャラクター｜メリトクラシア</title>

<style>
body {
  background:#0d0d0d;
  color:#fff;
  font-family: 'Noto Serif JP', serif;
  margin:0;
}

/* タイトル */
h1 {
  margin-top:40px;
  text-align:center;
}

/* 🔥 グリッド化 */
.card-grid {
  display:grid;
  grid-template-columns:repeat(auto-fit, minmax(250px,1fr));
  gap:20px;
  max-width:900px;
  margin:40px auto;
  padding:0 20px;
}

/* カード */
.card {
  position: relative;
  background:#1a1a1a;
  padding:30px 20px;
  border-radius:12px;
  transition:0.25s;
  text-align:center;
  border:1px solid #222;
```

## ./viewer/character/iris.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Iris Earlgray | MERITOCRACIA</title>
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,300;1,400&family=Noto+Serif+JP:wght@300;400;500&family=IM+Fell+English:ital@0;1&display=swap" rel="stylesheet">
<style>
/* ============================================================
   IRIS EARLGRAY — CHARACTER PAGE
   コンセプト: 高級紅茶ブランドのラベル × メイド服の黒白緑金
   カラー方針: 琥珀背景にPDF公式カラーを乗せる折衷設計
   ============================================================ */

:root {
  /* 背景・紅茶系 */
  --tea-bg:       #2a1a0e;
  --tea-bg2:      #3d2410;
  --tea-amber:    #8B4513;
  --tea-amber2:   #a0521a;
  --tea-light:    #c4803a;
  --parchment:    #FFF8E7;
  --parchment2:   #f5e8c8;

  /* アイリス公式カラー（PDF準拠） */
  --iris-black:   #1C1B1B;
  --iris-white:   #F2EDE6;
  --iris-green:   #2E6135;
  --iris-gold:    #C5A35A;
  --iris-skin:    #6A4E3D;
  --iris-hair:    #E8E8E8;
  --iris-eye:     #8C5FBF;

  /* テキスト */
  --text-warm:    #FFF8E7;
  --text-muted:   #c8a87a;
  --text-dim:     #7a5a3a;

  /* ボーダー */
  --border-gold:  rgba(197,163,90,0.4);
```

## ./viewer/character/jade.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>主人公設計 & 作品理念 | MERITOCRACIA</title>
<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700&family=Noto+Serif+JP:wght@300;400;500;700&display=swap" rel="stylesheet">
<style>
:root {
  --bg:      #06090f;
  --bg2:     #0b1018;
  --bg3:     #10161f;
  --bg4:     #151c28;
  --gold:    #c8a45a;
  --gold2:   #e8c97e;
  --gold3:   #f5dfa0;
  --red:     #8b2020;
  --text:    #d4cab8;
  --text2:   #8a7e6e;
  --text3:   #5a5040;
  --border:  rgba(200,164,90,0.12);
  --border2: rgba(200,164,90,0.25);
}

* { margin:0; padding:0; box-sizing:border-box; }

html { scroll-behavior: smooth; }

body {
  background: var(--bg);
  color: var(--text);
  font-family: 'Noto Serif JP', serif;
  line-height: 1.9;
  overflow-x: hidden;
}

/* 背景 */
body::before {
  content: '';
  position: fixed;
```

## ./viewer/character/kernel/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>カーネル・レオンハルト | MERITOCRACIA INTERNAL VIEW</title>
  <link rel="stylesheet" href="./kernel.css" />
</head>
<body>
  <div class="char-page">

    <a class="char-back-link" href="../index.html">← CHARACTER LIST</a>

    <header class="angel-label-header">
      <p class="char-brand-logo">MERITOCRACIA — INTERNAL CHARACTER DOSSIER</p>
      <div class="char-divider"><span>✦</span></div>
      <h1 class="char-name-ja">カーネル・レオンハルト</h1>
      <p class="char-name-en">KERNEL LEONHART</p>
      <div class="char-divider"><span>✦</span></div>
      <p class="char-flavor-text">
        ジェイド・レオンハルトの姉。<br>
        ZERO編における「家族の日常」「庶民生活」「守られたかった平穏」の象徴であり、<br>
        同時に「魂回収」「神性適合」「聖骸騎士化」に接続する中核人物。
      </p>
    </header>

    <div class="char-color-strip" aria-hidden="true">
      <span class="c1"></span>
      <span class="c2"></span>
      <span class="c3"></span>
      <span class="c4"></span>
      <span class="c5"></span>
      <span class="c6"></span>
    </div>

    <main>
      <div class="char-hero-grid">
        <div class="char-visual-card">
          <div class="char-visual-wrap">
            <img src="../../assets/characters/kernel/kernel_main.png" alt="カーネル・レオンハルト 正式ビジュアル">
```

## ./viewer/character/kernel/kernel.css

```
:root {
  --bg: #140f18;
  --bg2: #1d1522;
  --panel: rgba(28, 20, 34, 0.82);
  --panel-strong: rgba(38, 27, 46, 0.92);

  --pink: #d88aa8;
  --pink-2: #f2a9c3;
  --pink-dim: #9a5f77;

  --gold: #e7c768;
  --gold-2: #fff0a8;

  --ivory: #fff7f3;
  --ivory-2: #f6e7df;
  --muted: #ccb7bb;
  --ash: #8c7477;

  --line: rgba(242, 169, 195, 0.22);
  --line-strong: rgba(242, 169, 195, 0.38);
  --shadow: 0 18px 48px rgba(0, 0, 0, 0.34);
  --radius: 22px;
}

*,
*::before,
*::after {
  box-sizing: border-box;
}

html {
  scroll-behavior: smooth;
}

body {
  margin: 0;
  color: var(--ivory);
  font-family: "Noto Serif JP", serif;
  background:
    radial-gradient(circle at top, rgba(231, 199, 104, 0.18), transparent 28%),
```

## ./viewer/character/kernel/kernel.json

```
{
  "meta": {
    "id": "カーネル-レオンハルト-view化前提資料内部設定版-ネタバレあり",
    "slug": "カーネル-レオンハルト-view化前提資料内部設定版-ネタバレあり",
    "source_format": "markdown",
    "source_path": "/home/lancer/DOCS/meritocracia-team-share/docs/settings/Meritocracia_Data_Hub/01_世界観・設定_Wiki/キャラクター/主人公一家/カーネル　レオンハルト/view化前.md",
    "access_level": "internal",
    "theme": "afterglow-memory"
  },
  "header": {
    "title": "📘 カーネル・レオンハルト view化前提資料（内部設定版 / ネタバレあり）",
    "summary": "カーネル・レオンハルトは、ジェイド・レオンハルトの姉であり、 ZERO編における「家族の日常」「庶民生活」「守られたかった平穏」の象徴である。 しかし内部設定上の本質はそれだけではない。 彼女は同時に、 - 日常の象徴 - 神性適合個体 - 魂回収対象 - ジェイドの倫理観の原点"
  },
  "keywords": [
    "元下級天使",
    "神性適合率",
    "神性残滓",
    "高価値魂",
    "選別殺害",
    "炎槍選別",
    "魂回収",
    "サンギナリア黒幕",
    "聖骸騎士",
    "守護向きの魂",
    "対英雄兵器への反転",
    "ジェイドの良心の原型",
    "深層残響",
    "再会する喪失"
  ],
  "sections": [
    {
      "id": "1-キャラクター定義",
      "title": "1. キャラクター定義",
      "type": "text",
      "content": "カーネル・レオンハルトは、ジェイド・レオンハルトの姉であり、\nZERO編における「家族の日常」「庶民生活」「守られたかった平穏」の象徴である。\n\nしかし内部設定上の本質はそれだけではない。\n\n彼女は同時に、\n\n- 日常の象徴\n- 神性適合個体\n- 魂回収対象\n- ジェイドの倫理観の原点\n- 喪失そのもの\n- 後に再会する悲劇装置\n\nを一身に担う、多層的な中核キャラクターである。"
    },
    {
      "id": "2-基本情報",
      "title": "2. 基本情報",
      "type": "list",
```

## ./viewer/character/kernel/軽量版/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>カーネル・レオンハルト | MERITOCRACIA</title>
  <link rel="stylesheet" href="./kernel.css" />
</head>
<body>
  <div class="char-page">

    <a class="char-back-link" href="../index.html">← CHARACTER LIST</a>

    <header class="angel-label-header">
      <p class="char-brand-logo">MERITOCRACIA — ZERO / FAMILY ARCHIVE</p>
      <div class="char-divider"><span>✦</span></div>
      <h1 class="char-name-ja">カーネル・レオンハルト</h1>
      <p class="char-name-en">KERNEL LEONHART</p>
      <div class="char-divider"><span>✦</span></div>
      <p class="char-flavor-text">
        明るさと行動力を併せ持つ、ZERO編の「日常」と「ぬくもり」を象徴する存在。<br>
        ジェイドの過去に確かにあった、守りたかった日々の残光。
      </p>
    </header>

    <div class="char-color-strip" aria-hidden="true">
      <span class="c1"></span>
      <span class="c2"></span>
      <span class="c3"></span>
      <span class="c4"></span>
      <span class="c5"></span>
      <span class="c6"></span>
    </div>

    <main>
      <div class="char-hero-grid">
        <div class="char-visual-card">
          <div class="char-visual-wrap">
            <img src="../../assets/characters/kernel/kernel_main.png" alt="カーネル・レオンハルト 正式ビジュアル">
          </div>
```

## ./viewer/character/kiel.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>CHARACTER PROFILE | KIEL</title>

  <!-- World Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
    href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;500;600;700&family=Noto+Serif+JP:wght@400;500;600;700&display=swap"
    rel="stylesheet"
  />

  <style>
    :root {
      --bg-main: #0f0f10;
      --bg-panel: #171718;
      --bg-panel-2: #1d1d1f;
      --bg-nav: rgba(12, 12, 13, 0.92);
      --text-main: #e8e3da;
      --text-sub: #b8b0a4;
      --text-dim: #7f786e;
      --line: #2e2a27;
      --line-strong: #4e433d;

      --primary-color: #4a4a4a;   /* 鈍い鉄色 */
      --accent-color: #8b0000;    /* 抑えた血の赤 */
      --accent-soft: rgba(139, 0, 0, 0.18);
      --shadow: 0 12px 36px rgba(0, 0, 0, 0.35);

      --nav-width: 240px;
      --content-max: 1100px;
      --radius: 14px;

      --hero-letter-spacing: 0.18em;
      --section-gap: 28px;
      --transition: 180ms ease;
    }
```

## ./viewer/character/others.css

```
    :root {
      --bg: #060b14;
      --bg2: #0b1320;
      --line: rgba(212, 175, 55, 0.18);
      --line-strong: rgba(212, 175, 55, 0.38);
      --text: #e8dcc0;
      --muted: #8f8368;
      --accent: #d4af37;
      --card: rgba(12, 18, 30, 0.86);
      --hover: rgba(212, 175, 55, 0.08);
    }

    * { box-sizing: border-box; }
    body {
      margin: 0;
      background:
        radial-gradient(circle at top, rgba(212,175,55,0.06), transparent 30%),
        linear-gradient(180deg, var(--bg), #050910 70%);
      color: var(--text);
      font-family: "Noto Serif JP", serif;
    }

    .wrap {
      max-width: 1080px;
      margin: 0 auto;
      padding: 40px 20px 80px;
    }

    .back-link {
      display: inline-block;
      margin-bottom: 24px;
      color: var(--muted);
      text-decoration: none;
      border-bottom: 1px solid transparent;
    }

    .back-link:hover {
      color: var(--accent);
      border-bottom-color: var(--accent);
    }
```

## ./viewer/character/others.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>その他キャラ一覧 | MERITOCRACIA</title>
  <link rel="stylesheet" href="./others.css">
</head>
<body>
  <div class="wrap">
    <a class="back-link" href="./index.html">← CHARACTER TOP</a>

    <section class="hero">
      <div class="eyebrow">CHARACTER ARCHIVE / SUB LAYER HUB</div>
      <h1>その他キャラ一覧</h1>
      <p class="lead">
        トップHUBに置かない準主要・周辺人物をまとめる中間層ページ。<br>
        個別viewの入口として運用し、今後の追加キャラもここへ順次接続していく。
      </p>
    </section>

    <h2 class="section-title">ZERO編・事件関係者</h2>
    <div class="grid">
      <a class="card" href="./garnet./">
        <div class="tag">FO / ZERO / DONE</div>
        <h2>ガーネット</h2>
        <p class="role">Frontorden リーダー / 中央市場炎槍事件の現場指揮官</p>
        <p class="desc">歴戦騎士。現実主義だが、市民防衛を優先する前線指揮官。</p>
      </a>

      <a class="card coming" href="#">
        <div class="tag">CHURCH / ZERO / WIP</div>
        <h2>ルカ</h2>
        <p class="role">星導教会の手伝い少年</p>
        <p class="desc">宗教の温かさと歪みの両方に触れてしまった被害者側の重要人物。</p>
      </a>

      <a class="card coming" href="#">
        <div class="tag">CHURCH / ZERO / WIP</div>
        <h2>神父エリオス</h2>
```

## ./viewer/character/reinhardt.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ライナルト＝グロース | MERITOCRACIA</title>
<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700&family=Noto+Serif+JP:wght@300;400;500;700&display=swap" rel="stylesheet">
<style>
:root {
  --bg:      #060810;
  --bg2:     #0a0d18;
  --bg3:     #0f1320;
  --bg4:     #141928;
  --silver:  #a8b8cc;
  --silver2: #c8d8e8;
  --silver3: #e0eaf4;
  --blue:    #1e3a5a;
  --blue2:   #2a5080;
  --blue3:   #3a6898;
  --text:    #c4cdd8;
  --text2:   #6a7888;
  --text3:   #3a4858;
  --border:  rgba(168,184,204,0.1);
  --border2: rgba(168,184,204,0.22);
}

* { margin:0; padding:0; box-sizing:border-box; }
html { scroll-behavior: smooth; }

body {
  background: var(--bg);
  color: var(--text);
  font-family: 'Noto Serif JP', serif;
  line-height: 1.9;
  overflow-x: hidden;
}

body::before {
  content: '';
  position: fixed;
```

## ./viewer/character/viola.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ヴィオラ＝スティルネン | MERITOCRACIA</title>

<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700&family=Noto+Serif+JP:wght@300;400;500;700&display=swap" rel="stylesheet">

<style>
body {
  background: #060810;
  color: #c4cdd8;
  font-family: 'Noto Serif JP', serif;
  margin: 0;
  line-height: 1.9;
}

.container {
  max-width: 800px;
  margin: auto;
  padding: 40px 24px;
}

h1 {
  font-family: 'Cinzel', serif;
  letter-spacing: 4px;
  font-weight: 400;
  margin-bottom: 20px;
}

.section {
  margin-bottom: 40px;
}

.title {
  font-size: 14px;
  letter-spacing: 3px;
  color: #a8b8cc;
  margin-bottom: 10px;
```

## ./viewer/character/yumina.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ユミナ | MERITOCRACIA</title>

<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600&family=Noto+Serif+JP:wght@400;500&display=swap" rel="stylesheet">

<style>
body {
  background: #060810;
  color: #c4cdd8;
  font-family: 'Noto Serif JP', serif;
  margin: 0;
  line-height: 1.9;
}

.container {
  max-width: 800px;
  margin: auto;
  padding: 40px 24px;
}

h1 {
  font-family: 'Cinzel', serif;
  letter-spacing: 4px;
  font-weight: 400;
  margin-bottom: 20px;
}

.section {
  margin-bottom: 40px;
}

.title {
  font-size: 14px;
  letter-spacing: 3px;
  color: #a8b8cc;
  margin-bottom: 10px;
```

## ./viewer/daily.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>日報Viewer</title>
<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
<style>
body {
  display: flex;
  margin: 0;
  font-family: sans-serif;
  background: #111;
  color: #eee;
}
#sidebar {
  width: 250px;
  background: #1a1a1a;
  padding: 10px;
  overflow-y: auto;
}
#main {
  flex: 1;
  padding: 20px;
}
.date {
  cursor: pointer;
  padding: 5px;
}
.date:hover {
  background: #333;
}
.file {
  margin-left: 10px;
  cursor: pointer;
  color: #aaa;
  padding: 4px 0;
}
.file:hover {
  color: #fff;
}
```

## ./viewer/data/data.json

```
{
  "week": "2026-W13",
  "tasks": [
    {
      "name": "ヴィオラ設計資料確定",
      "status": "done",
      "priority": "A",
      "category": "キャラ設計",
      "day": 1
    },
    {
      "name": "キール・フィーネ・フラン一文定義",
      "status": "done",
      "priority": "A",
      "category": "キャラ設計",
      "day": 2
    },
    {
      "name": "心音システム演出設計",
      "status": "doing",
      "priority": "S",
      "category": "システム設計",
      "day": 3
    },
    {
      "name": "国家機関一覧作成",
      "status": "done",
      "priority": "A",
      "category": "世界観",
      "day": 4
    },
    {
      "name": "テロ拠点構造設計",
      "status": "todo",
      "priority": "A",
      "category": "敵組織",
      "day": 5
    },
    {
      "name": "国際情勢整理",
```

## ./viewer/data/日報_20260324_02.md

```
# 📝 日報

## 📅 日付
2026-03-24

## 🧩 セッション
02

# 📝 作業日報

## 📅 日付

2026-03-24

---

## 🎯 本日の目的

・タスク管理UIの導入
・Viewerとの統合確認
・運用可能状態の構築

---

## 🧩 実施内容

### ① タスク管理UIの導入（Claude製）

・track.htmlベースのUIを採用
・data.jsonによるデータ駆動構造を確認
・ステータス / 優先度 / カテゴリ表示の動作確認

---

### ② data.json連携修正

・fetchパス修正（./track/data.json）
・相対パス問題を解消
・JSON構造をUI仕様に合わせて調整

```

## ./viewer/db/academy/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>士官学校制度 | Meritocracia DB</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <main class="container">
    <p class="sub">ACADEMY PORTAL</p>
    <h1>🎓 士官学校制度</h1>
    <p class="lead">
      士官学校関連制度の概要ハブ。
      詳細Wikiと、士官学校に併設される使用人養成学校への導線をまとめる。
    </p>

    <section class="grid">
      <a class="card" href="./overview.html">
        <span class="badge">OVERVIEW</span>
        <h2>🎓 士官学校概要</h2>
        <p>理念、学年、入学条件、パンフレット的な学校案内ページ。</p>
      </a>

      <a class="card" href="../../story/academy/">
        <span class="badge">WIKI</span>
        <h2>📘 士官学校詳細Wiki</h2>
        <p>学年構造、教官、制度、事件導線などの詳細設定資料。</p>
      </a>

      <a class="card" href="./servant-academy.html">
        <span class="badge">SUB SCHOOL</span>
        <h2>🫖 使用人養成学校</h2>
        <p>Diskens〜Primas の使用人階級と育成制度を扱うページ。</p>
      </a>
    </section>
  </main>
</body>```

## ./viewer/db/academy/overview.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Magic Dashboard | Meritocracia</title>
  <style>
    :root {
      --bg: #0b1020;
      --panel: #121a30;
      --line: #263252;
      --text: #e8eefc;
      --muted: #9db0d8;
      --accent: #7aa2ff;
    }
    * { box-sizing: border-box; }
    body {
      margin: 0;
      font-family: "Noto Sans JP", system-ui, sans-serif;
      background: linear-gradient(180deg, #0b1020, #111831);
      color: var(--text);
    }
    .wrap {
      max-width: 1200px;
      margin: 0 auto;
      padding: 32px;
    }
    .hero {
      padding: 24px;
      border: 1px solid var(--line);
      border-radius: 20px;
      background: rgba(18, 26, 48, 0.9);
      margin-bottom: 24px;
    }
    .hero h1 {
      margin: 0 0 8px;
      font-size: 2rem;
    }
    .hero p {
      margin: 0;
```

## ./viewer/db/academy/servant-academy.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>使用人養成学校 | Meritocracia DB</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <main class="container">
    <h1>🫖 使用人養成学校</h1>
    <p>Diskens から Primas までを育成する家門直属教育機関。</p>
    <p>士官学校に併設され、秘書・礼法・家門運営・護衛補佐を学ぶ。</p>
  </main>
</body>
</html>
```

## ./viewer/db/academy/servant-academy/servant-rank.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>統合議事録｜使用人階級制度（ドイツ語正式運用版）</title>
    <style>
        body { font-family: 'Helvetica Neue', Arial, sans-serif; line-height: 1.6; color: #333; max-width: 800px; margin: 20px auto; padding: 20px; border: 1px solid #ddd; background-color: #f9f9f9; }
        h1 { color: #2c3e50; border-bottom: 2px solid #2c3e50; padding-bottom: 10px; }
        h2 { color: #e67e22; border-left: 5px solid #e67e22; padding-left: 10px; margin-top: 30px; }
        h3 { color: #2980b9; margin-top: 20px; }
        table { width: 100%; border-collapse: collapse; margin: 20px 0; background-color: #fff; }
        th, td { border: 1px solid #ccc; padding: 12px; text-align: left; }
        th { background-color: #ecf0f1; }
        .conclusion { background-color: #fff3e0; border: 1px solid #ffe0b2; padding: 15px; border-radius: 5px; }
        .benefits { background-color: #e8f8f5; border-left: 5px solid #1abc9c; padding: 10px 20px; }
        .footer { margin-top: 40px; font-size: 0.9em; color: #7f8c8d; text-align: right; }
    </style>
</head>
<body>

    <h1>統合議事録｜使用人階級制度（ドイツ語正式運用版）</h1>
    <p><strong>作成日：</strong>2026-04-10<br>
    <strong>決定権者：</strong>Lancer</p>

    <section class="conclusion">
        <h2>本日の結論（正式ロック）</h2>
        <p>『メリトクラシア -Reboot-』における使用人養成学校および家門直属使用人制度の正式階級名称を、以下のドイツ語ベース5段階で固定する。</p>
        <ul>
            <li>アイリスの成長階段</li>
            <li>使用人学校カリキュラム</li>
            <li>家門運営能力</li>
            <li>主人評価連動</li>
            <li>士官学校編の制度美</li>
        </ul>
    </section>

    <h2>使用人階級一覧（正式版）</h2>
    <table>
        <thead>
            <tr>
```

## ./viewer/db/academy/style.css

```
body {
  margin: 0;
  min-height: 100vh;
  color: #e8e8e8;
  font-family: sans-serif;
  line-height: 1.8;
  background:
    radial-gradient(circle at top right, rgba(25, 60, 120, 0.25), transparent 40%),
    radial-gradient(circle at bottom left, rgba(10, 40, 90, 0.35), transparent 45%),
    linear-gradient(135deg, #07111f 0%, #09182a 40%, #0b1f36 100%);
}

.container {
  max-width: 960px;
  margin: 56px auto;
  padding: 40px 24px;
}

.sub {
  font-size: 12px;
  letter-spacing: 0.2em;
  color: #8fa6c2;
  margin-bottom: 8px;
}

h1 {
  color: #d6b36a;
  margin: 0 0 16px;
}

.lead {
  color: #d7dbe4;
  max-width: 760px;
  margin-bottom: 32px;
}

.grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 20px;
```

## ./viewer/db/city/_local_staging_backup/academy_interactive_v1/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>士官学校詳細図 | Meritocracia Academy Detail</title>
  <style>
    body {
      margin: 0;
      background: #08101c;
      color: #e6d2a2;
      font-family: "Noto Sans JP", sans-serif;
    }
    .topbar {
      padding: 14px 20px;
      border-bottom: 1px solid rgba(230,210,162,0.25);
      letter-spacing: 0.08em;
    }
    .wrap {
      position: relative;
      max-width: 1400px;
      margin: 0 auto;
    }
    .map {
      width: 100%;
      display: block;
    }
    .poi {
      position: absolute;
      width: 18px;
      height: 18px;
      border-radius: 50%;
      background: #d7b56d;
      border: 2px solid #08101c;
      cursor: pointer;
      box-shadow: 0 0 0 2px rgba(215,181,109,0.25);
      transform: translate(-50%, -50%);
    }
    .panel {
      position: fixed;
```

## ./viewer/db/city/_local_staging_backup/grand-central_interactive_v1/city-map.js

```
'use strict';

/* ============================================================
   CITY MAP — Grand Central Interactive Navigator
   Vanilla JS, no dependencies.
   ============================================================ */

/* ----------------------------------------------------------
   STATE
   ---------------------------------------------------------- */
const state = {
  data:         null,
  activeFilter: null,   // null = all
  activePoi:    null,   // poi id
  zoom:         1,
  panX:         0,
  panY:         0,
  dragging:     false,
  dragStartX:   0,
  dragStartY:   0,
  dragStartPanX:0,
  dragStartPanY:0,
  imgNaturalW:  0,
  imgNaturalH:  0,
};

const ZOOM_MIN  = 0.4;
const ZOOM_MAX  = 4.0;
const ZOOM_STEP = 0.18;

/* ----------------------------------------------------------
   DOM REFS
   ---------------------------------------------------------- */
const $ = id => document.getElementById(id);

let DOM = {};

/* ----------------------------------------------------------
   BOOT
   ---------------------------------------------------------- */
```

## ./viewer/db/city/_local_staging_backup/grand-central_interactive_v1/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
  <title>グランセントラル インタラクティブ地図 | GRAND CENTRAL NAVIGATOR</title>
  <meta name="description" content="ZERO編〜本編 グランセントラル都市区画インタラクティブナビゲータ。POIクリック・ズーム・パン・フィルター対応。">
  <link rel="stylesheet" href="./interactive.css">
</head>
<body>

<div class="map-app">

  <!-- ============================================================
       TOP BAR
       ============================================================ -->
  <header class="topbar">
    <!-- モバイルサイドバートグル -->
    <button class="sidebar-toggle-btn" id="sidebar-toggle" aria-label="サイドバーを開く">☰</button>

    <a class="topbar-back" href="../index.html">← STATIC VIEW</a>

    <div class="topbar-title">
      グランセントラル
      <span>INTERACTIVE NAVIGATOR</span>
    </div>

    <div class="topbar-spacer"></div>

    <!-- フィルターバー -->
    <div class="filter-bar" id="filter-bar">
      <span class="filter-label">FILTER</span>
      <!-- JS が buildFilters() でボタンを生成 -->
    </div>
  </header>

  <!-- ============================================================
       SIDEBAR
       ============================================================ -->
  <aside class="sidebar" id="sidebar">
```

## ./viewer/db/city/_local_staging_backup/grand-central_interactive_v1/interactive.css

```
@import url('https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,400&family=Noto+Serif+JP:wght@300;400;500&display=swap');

/* ============================================================
   CSS VARIABLES  （city.css / terror.css 継承）
   ============================================================ */
:root {
  --bg:           #060a11;
  --bg2:          #0a1020;
  --bg3:          #0e1628;
  --panel:        #0d1525;
  --panel2:       #111d35;
  --panel-glass:  rgba(13,21,37,0.92);

  --gold:         #c9a961;
  --gold2:        #e8c97a;
  --gold-dim:     #7a6035;
  --gold-glow:    rgba(201,169,97,0.15);
  --gold-glow2:   rgba(201,169,97,0.08);

  --text:         #d8ccb4;
  --text2:        #7a6e58;
  --text3:        #4a4030;

  --border:       rgba(201,169,97,0.14);
  --border2:      rgba(201,169,97,0.30);
  --border3:      rgba(201,169,97,0.50);

  --c-dead:       #8b1a1a;
  --c-dead-text:  #e05050;
  --c-fo:         #4a7fc1;
  --c-escape:     #b080f0;

  --sidebar-w:    320px;
  --topbar-h:     52px;
  --footer-h:     44px;
}

/* ============================================================
   RESET & BASE
   ============================================================ */
```

## ./viewer/db/city/_local_staging_backup/grand-central_interactive_v1/map-data.json

```
{
  "meta": {
    "map_id": "grand_central_interactive_v1",
    "title": "グランセントラル都市区画図",
    "title_en": "Grand Central City District Map",
    "image": "../grand-central-map.png",
    "version": "1.0"
  },
  "filters": [
    { "id": "zero",    "label": "ZERO編",    "label_ja": "ZERO編" },
    { "id": "main",    "label": "本編",      "label_ja": "本編" },
    { "id": "officer", "label": "士官学校",  "label_ja": "士官学校" },
    { "id": "church",  "label": "教会バイト","label_ja": "教会バイト" },
    { "id": "harbor",  "label": "港湾物流",  "label_ja": "港湾物流" }
  ],
  "pois": [
    {
      "id": "poi_central_market",
      "name": "中央市場",
      "name_en": "Central Market",
      "district": "中央市場区",
      "x_pct": 47.5,
      "y_pct": 24.0,
      "icon": "◈",
      "color": "#b8860b",
      "filters": ["zero", "main"],
      "description": "都市最大の商業・流通拠点。祝祭広場と隣接し、平時は市民の集う活気ある場所。ZERO編「中央市場炎槍事件」の主舞台となり、炎翼セルによる大規模テロ攻撃が発生した。",
      "lore_zero": "炎翼セル配置→初爆発→召喚獣出現→炎槍発射→カーネル死亡という一連のテロ事件が展開。ジェイドにとって「国家の嘘」と「心音覚醒」の起点となる転換点。",
      "lore_main": "本編ではテロ後の復興が進み、警備体制が強化された状態で登場。事件の痕跡が一部残る。",
      "lore_officer": "士官学校の演習ルート上に位置。市場警備との連携訓練が行われる。",
      "lore_church": null,
      "lore_harbor": null
    },
    {
      "id": "poi_festival_square",
      "name": "祝祭広場",
      "name_en": "Festival Square",
      "district": "中央市場区",
      "x_pct": 47.5,
      "y_pct": 34.5,
```

## ./viewer/db/city/_local_staging_backup/grand-central_v3_restore/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
  <title>グランセントラル 連続地図 v3 | GRAND CENTRAL SEAMLESS MAP</title>
  <meta name="description" content="グランセントラル都市全体図＋士官学校詳細の連続インタラクティブマップ v3。">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@400;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="./v3.css">
</head>
<body>

<!-- ══════════════════════════════════════════════════════════
     TOP BAR
     ══════════════════════════════════════════════════════════ -->
<header class="topbar">
  <a class="topbar-back" href="../index.html">← VIEWER HUB</a>
  <div class="topbar-sep"></div>

  <div class="topbar-title">
    グランセントラル
    <span>SEAMLESS NAVIGATOR v3</span>
  </div>

  <div class="topbar-spacer"></div>

  <!-- フィルターバー -->
  <div class="filter-bar" id="filter-bar">
    <span class="filter-label">FILTER</span>
    <!-- JS buildFilters() -->
  </div>

  <div class="topbar-sep"></div>

  <!-- Map mode tabs -->
  <div class="mode-tabs">
    <button class="mode-tab active" data-mode="combined">連続</button>
    <button class="mode-tab" data-mode="gc">都市</button>
```

## ./viewer/db/city/_local_staging_backup/grand-central_v3_restore/v3.css

```
/* ============================================================
   GRAND CENTRAL NAVIGATOR v3 — Seamless Dual-Map Viewer
   Aesthetic: Dark Cartographic / Fantasy Atlas
   ============================================================ */

:root {
  --bg:          #0b0e16;
  --chrome:      #12161f;
  --border:      #2a3040;
  --gold:        #c9a961;
  --gold-dim:    #8a7040;
  --gold-bright: #f0d080;
  --text:        #d4c9a8;
  --text-dim:    #7a7060;
  --red:         #9a3a3a;
  --blue:        #2a5a9a;
  --green:       #3a7a5a;
  --panel-bg:    rgba(11,14,22,0.92);
  --seam-w:      60px;   /* blending seam width */
  --topbar-h:    48px;
  --footer-h:    36px;
}

*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

html, body {
  width: 100%; height: 100%; overflow: hidden;
  background: var(--bg);
  color: var(--text);
  font-family: 'Noto Serif JP', 'Georgia', serif;
  -webkit-font-smoothing: antialiased;
}

/* ── TOPBAR ─────────────────────────────────────────────── */
.topbar {
  position: fixed; top: 0; left: 0; right: 0;
  height: var(--topbar-h);
  background: var(--chrome);
  border-bottom: 1px solid var(--border);
  display: flex; align-items: center; gap: 12px;
```

## ./viewer/db/city/_local_staging_backup/grand-central_v3_restore/v3.js

```
/**
 * GRAND CENTRAL NAVIGATOR v3
 * Seamless dual-map viewer
 * grand-central-map.png (1408×768) + academy-map.png (1380×752)
 */

'use strict';

// ─── CONFIG ────────────────────────────────────────────────────────────────

const CFG = {
  gc: { src: '../grand-central-map.png', w: 1408, h: 768 },
  ac: { src: '../academy-map.png',        w: 1380, h: 752 },

  // Where academy left-edge anchors on the combined world X axis
  // We overlap slightly so the seam at the 士官予備区 feels continuous.
  // Visually the 士官予備区 is roughly x=40–55% on GC map.
  // We want academy to "grow out" of that zone toward the right.
  // Overlap amount: 120px (the two images share ~120px of visual territory)
  overlap: 130,

  // Vertical offset: academy map is slightly taller/shorter than GC.
  // Center academy vertically relative to GC height.
  get acOffsetY() {
    return Math.round((CFG.gc.h - CFG.ac.h) / 2);
  },

  // World dimensions
  get worldW() { return CFG.gc.w + CFG.ac.w - CFG.overlap; },
  get worldH() { return Math.max(CFG.gc.h, CFG.ac.h); },

  // Seam X position (right edge of GC / left edge of AC in world coords)
  get seamX()   { return CFG.gc.w - CFG.overlap; },

  // Zoom
  minZoom: 0.35,
  maxZoom: 2.5,
  zoomStep: 0.18,
  initialZoom: null, // computed on init
};
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/academy/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1.0">
  <title>Grand Central Map v2</title>
  <link rel="stylesheet" href="./v2.css">
</head>
<body>
  <header class="header">
    <h1>グランセントラル都市マップ v2</h1>
    <p>ドラッグで都市全体 → 士官学校詳細へ移動</p>
  </header>

  <main class="map-scroll">
    <section class="map-panel">
      <h2>都市全体</h2>
      <img src="../grand-central-map.png" alt="都市全体図">
    </section>

    <section class="map-panel">
      <h2>士官学校詳細</h2>
      <img src="../academy/academy-map.png" alt="士官学校詳細">
    </section>
  </main>
</body>
</html>```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/archive/map_v2_pre_zero_overlay_2026-04-16/city.css

```
@import url('https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,400&family=Noto+Serif+JP:wght@300;400;500&display=swap');

/* ============================================================
   CSS VARIABLES
   ============================================================ */
:root {
  --bg:           #060a11;
  --bg2:          #0a1020;
  --bg3:          #0e1628;
  --panel:        #0d1525;
  --panel2:       #111d35;

  --gold:         #c9a961;
  --gold2:        #e8c97a;
  --gold-dim:     #7a6035;
  --gold-glow:    rgba(201,169,97,0.15);

  --text:         #d8ccb4;
  --text2:        #7a6e58;
  --text3:        #4a4030;

  --border:       rgba(201,169,97,0.14);
  --border2:      rgba(201,169,97,0.3);

  /* ステータスカラー */
  --c-dead:       #8b1a1a;
  --c-dead-glow:  rgba(139,26,26,0.2);
  --c-dead-text:  #e05050;

  --c-captured:   #b8901a;
  --c-captured-glow: rgba(184,144,26,0.2);
  --c-captured-text: #e8c050;

  --c-escape:     #5a2d8a;
  --c-escape-glow: rgba(90,45,138,0.2);
  --c-escape-text: #b080f0;

  --c-civilian:   #1a4a7a;
  --c-civilian-glow: rgba(26,74,122,0.2);
  --c-civilian-text: #60a8e0;
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/archive/map_v2_pre_zero_overlay_2026-04-16/city.js

```
'use strict';

/* ============================================================
   CONSTANTS
   ============================================================ */
const STATUS_CONFIG = {
  dead:     { label: '死亡',           dot: '#e05050' },
  captured: { label: '逮捕（影武者）', dot: '#e8c050' },
  escape:   { label: '逃亡・生存',     dot: '#b080f0' },
  civilian: { label: '生存（民間）',   dot: '#60a8e0' },
  unknown:  { label: '生死不明',       dot: '#9090b0' },
  shadow:   { label: '要監視・黒幕候補', dot: '#c9a961' },
};

const PHASE_ORDER = [
  '静寂と予兆',
  '英雄的選択と悲劇',
  '決別と覚醒の兆し',
  'FOによる制圧',
  '残酷な現実の確定',
  '政治的幕引き',
  '誓いへ',
];

const HL_BADGE_LABEL = {
  death:     '★ カーネル死亡',
  pivot:     '◆ 転換点',
  deception: '▲ 国家の欺瞞',
  awakening: '◉ 心音覚醒',
  oath:      '✦ 誓い',
};

const FORESHADOW_DATA = [
  {
    icon: '🔮',
    label: 'ABILITY',
    title: '心音システム初覚醒',
    desc: 'Scene14の異常な心音、Scene25の公開尋問での無自覚発火。「こいつじゃない」という確信がジェイドに生まれる起点。グローリアテストおよび夜化因子判定への直接の伏線。',
    connect: '→ グローリアテスト / 夜化因子 / 能力判定試験',
  },
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/archive/map_v2_pre_zero_overlay_2026-04-16/city_map.json

```
{
  "map_id": "grand_central_city_v1",

  "districts": [
    {
      "district_id": "market_core",
      "name": "中央市場区",
      "x": 520,
      "y": 220
    },
    {
      "district_id": "admin_core",
      "name": "行政中枢区",
      "x": 250,
      "y": 300
    },
    {
      "district_id": "east_residential",
      "name": "東住宅区",
      "x": 820,
      "y": 300
    },
    {
      "district_id": "port_logistics",
      "name": "港湾物流区",
      "x": 130,
      "y": 540
    },
    {
      "district_id": "church_oldtown",
      "name": "教会旧市街",
      "x": 760,
      "y": 650
    },
    {
      "district_id": "academy_outer",
      "name": "士官予備区",
      "x": 520,
      "y": 560
    }
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/archive/map_v2_pre_zero_overlay_2026-04-16/city_status.json

```
{
  "incident": "中央市場炎槍事件",
  "cell": "炎翼セル",
  "members": [
    {
      "id": "C-01",
      "name": "アーク",
      "role": "セルリーダー",
      "role_en": "Cell Leader",
      "status": "escape",
      "status_label": "逃亡・生存",
      "public_info": "国家未把握",
      "future_hook": "上位セル接続担当。ZERO終盤黒幕導線。",
      "threat": "high"
    },
    {
      "id": "R-02",
      "name": "ノクス",
      "role": "儀式中枢",
      "role_en": "Ritual Core",
      "status": "unknown",
      "status_label": "生死不明（生存寄り）",
      "public_info": "死亡扱い",
      "future_hook": "影武者作戦の主導者候補。自害は偽装の可能性。",
      "threat": "high"
    },
    {
      "id": "R-03",
      "name": "セラ",
      "role": "儀式補助",
      "role_en": "Ritual Support",
      "status": "escape",
      "status_label": "逃亡・生存",
      "public_info": "行方不明",
      "future_hook": "ルカとの接点あり。後の証言者候補。迷いを持つ唯一の存在。",
      "threat": "medium"
    },
    {
      "id": "D-04",
      "name": "グラム",
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/archive/map_v2_pre_zero_overlay_2026-04-16/city_story.json

```
{
  "incident": "中央市場炎槍事件",
  "subtitle": "ZERO編プロローグ事件",
  "arc": "中編・後編",
  "scenes": [
    {
      "id": 8,
      "title": "上空の異変",
      "phase": "静寂と予兆",
      "phase_en": "SILENCE",
      "tags": ["異変", "天使の示唆", "伏線"],
      "highlight": false,
      "summary": "炎の粉が逆流し、煙が上へ吸い込まれる。ジェイドだけが違和感を覚える。空の裂け目に、翼に見える巨大な炎影——正体は明示しない。"
    },
    {
      "id": 9,
      "title": "第二波",
      "phase": "静寂と予兆",
      "phase_en": "SILENCE",
      "tags": ["召喚獣", "戦場化", "ZG限界"],
      "highlight": false,
      "summary": "炎翼セル第二手。召喚獣が屋台を薙ぎ倒し市場が完全に戦場化。中央警備隊だけでは抑えきれない。カーネルが子供の泣き声で足を止める。"
    },
    {
      "id": 10,
      "title": "カーネルの選択",
      "phase": "英雄的選択と悲劇",
      "phase_en": "SACRIFICE",
      "tags": ["人格的必然", "姉の決断", "利他"],
      "highlight": false,
      "summary": "「……先にクララを頼む」——倒壊しかけた屋台の陰に迷子の子供を見つけ、迷わず単身向かうカーネル。これが死亡の人格的必然性となる。"
    },
    {
      "id": 11,
      "title": "炎槍の予兆",
      "phase": "英雄的選択と悲劇",
      "phase_en": "SACRIFICE",
      "tags": ["音の消滅", "赤染め", "スローモーション"],
      "highlight": false,
      "summary": "空の裂け目が脈打ち、音が消える。市場全体の色が一瞬だけ赤に染まる。カーネルが子供を抱き上げた瞬間、空から一本の細く鋭い光——。"
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/archive/map_v2_pre_zero_overlay_2026-04-16/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>中央市場炎槍事件 | Meritocracia Terror DB</title>
<link rel="stylesheet" href="./city.css">
</head>
<body>

<div class="terror-shell">

  <!-- ナビ -->
  <a class="back-link" href="../../index.html">← NATION ARCHIVE</a>
  <a class="back-link" href="./map.html" style="margin-left:24px; color:var(--gold-dim);">🗺 TACTICAL MAP →</a>

  <!-- ======================================================
       ① INCIDENT HEADER
       ====================================================== -->
  <section class="incident-header">
    <div class="incident-tag">ZERO編 ／ MERITOCRACIA INCIDENT RECORD</div>
    <h1 class="incident-title" id="incident-title">読み込み中...</h1>
    <p class="incident-sub" id="incident-sub"></p>

    <div class="incident-stats">
      <div class="stat-chip red">
        <span class="stat-label">死者</span>
        <span class="stat-val" id="stat-dead">—</span>
      </div>
      <div class="stat-chip purple">
        <span class="stat-label">逃亡・行方不明</span>
        <span class="stat-val" id="stat-escape">—</span>
      </div>
      <div class="stat-chip amber">
        <span class="stat-label">公式犯人（影武者）</span>
        <span class="stat-val" id="stat-captured">—</span>
      </div>
      <div class="stat-chip">
        <span class="stat-label">Scene</span>
        <span class="stat-val">08 – 30</span>
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/archive/map_v2_pre_zero_overlay_2026-04-16/map.css

```
@import url('https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,400&family=Noto+Serif+JP:wght@300;400;500&family=JetBrains+Mono:wght@300;400&display=swap');

/* ============================================================
   CSS VARIABLES — dark fantasy + London tube aesthetic
   ============================================================ */
:root {
  --bg:           #060a11;
  --bg2:          #0a1020;
  --bg3:          #0e1628;
  --panel:        #0d1525;
  --panel2:       #111d35;
  --panel-glass:  rgba(13,21,37,0.92);

  --gold:         #c9a961;
  --gold2:        #e8c97a;
  --gold-dim:     #7a6035;
  --gold-glow:    rgba(201,169,97,0.15);

  --text:         #d8ccb4;
  --text2:        #7a6e58;
  --text3:        #4a4030;

  --border:       rgba(201,169,97,0.14);
  --border2:      rgba(201,169,97,0.3);

  /* District palette — muted London-map tones */
  --dist-church:     rgba(120,80,160,0.18);
  --dist-church-s:   rgba(120,80,160,0.35);
  --dist-market:     rgba(200,120,60,0.18);
  --dist-market-s:   rgba(200,120,60,0.35);
  --dist-south:      rgba(80,140,100,0.15);
  --dist-south-s:    rgba(80,140,100,0.30);
  --dist-alley:      rgba(100,100,140,0.16);
  --dist-alley-s:    rgba(100,100,140,0.32);
  --dist-fo:         rgba(60,120,200,0.16);
  --dist-fo-s:       rgba(60,120,200,0.32);
  --dist-civic:      rgba(180,140,80,0.14);
  --dist-civic-s:    rgba(180,140,80,0.30);

  /* Route colors — Tube-line inspired */
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/archive/map_v2_pre_zero_overlay_2026-04-16/map.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>中央市場テロ事件 地図 | Meritocracia Terror Map</title>
<meta name="description" content="ZERO編 中央市場炎槍事件の地図ビューア。ロンドン地下鉄路線図の読みやすさ + Googleマップの事件ピンUI + ダークファンタジー世界観を融合。">
<link rel="stylesheet" href="./map.css">
</head>
<body>

<!-- Mobile sidebar toggle -->
<button class="sidebar-toggle" id="sidebar-toggle" aria-label="メニュー">☰</button>

<!-- Mobile backdrop -->
<div class="sidebar-backdrop" id="sidebar-backdrop"></div>

<div class="map-app">

  <!-- ============================================================
       SIDEBAR (LEFT PANE)
       ============================================================ -->
  <aside class="sidebar" id="sidebar">

    <div class="sidebar-header">
      <a class="sidebar-back" href="./index.html">← INCIDENT RECORD</a>
      <div class="sidebar-tag">ZERO編 ／ TACTICAL MAP</div>
      <h1 class="sidebar-title">中央市場炎槍事件</h1>
      <div class="sidebar-subtitle">CENTRAL MARKET INCIDENT MAP</div>
    </div>

    <!-- Route toggles -->
    <div class="sidebar-section">
      <div class="sidebar-section-label">ROUTE LAYERS</div>
      <div id="route-toggles">
        <!-- JS generates -->
      </div>
    </div>

    <!-- Detail panel -->
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/archive/map_v2_pre_zero_overlay_2026-04-16/map.js

```
'use strict';

/* ============================================================
   CONSTANTS & CONFIG
   ============================================================ */

/** District visual config — shape polygons & colors */
const DISTRICT_CONFIG = {
  church_quarter: {
    color: 'rgba(120,80,160,0.18)',
    stroke: 'rgba(120,80,160,0.35)',
    poly: [
      [100, 100], [320, 100], [330, 140], [320, 300],
      [280, 310], [100, 290], [90, 200]
    ],
    labelOffset: { dx: 0, dy: -15 }
  },
  market_core: {
    color: 'rgba(200,120,60,0.18)',
    stroke: 'rgba(200,120,60,0.35)',
    poly: [
      [370, 380], [620, 370], [640, 420], [630, 580],
      [580, 600], [370, 590], [350, 520]
    ],
    labelOffset: { dx: 0, dy: -15 }
  },
  south_market_edge: {
    color: 'rgba(80,140,100,0.15)',
    stroke: 'rgba(80,140,100,0.30)',
    poly: [
      [370, 620], [620, 620], [640, 670], [630, 830],
      [560, 850], [370, 840], [350, 750]
    ],
    labelOffset: { dx: 0, dy: -10 }
  },
  alley_belt: {
    color: 'rgba(100,100,140,0.16)',
    stroke: 'rgba(100,100,140,0.32)',
    poly: [
      [660, 380], [870, 400], [880, 450], [870, 600],
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/city.css

```
@import url('https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,400&family=Noto+Serif+JP:wght@300;400;500&display=swap');

/* ============================================================
   CSS VARIABLES  （terror.css から継承）
   ============================================================ */
:root {
  --bg:           #060a11;
  --bg2:          #0a1020;
  --bg3:          #0e1628;
  --panel:        #0d1525;
  --panel2:       #111d35;

  --gold:         #c9a961;
  --gold2:        #e8c97a;
  --gold-dim:     #7a6035;
  --gold-glow:    rgba(201,169,97,0.15);

  --text:         #d8ccb4;
  --text2:        #7a6e58;
  --text3:        #4a4030;

  --border:       rgba(201,169,97,0.14);
  --border2:      rgba(201,169,97,0.30);
  --border3:      rgba(201,169,97,0.50);

  /* 区画カラー */
  --d-market:     #b8860b;   /* 中央市場区   */
  --d-east:       #3a6e5a;   /* 東住宅区     */
  --d-admin:      #2a4a7a;   /* 行政中枢区   */
  --d-port:       #4a4a6a;   /* 港湾物流区   */
  --d-church:     #7a3a6a;   /* 教会旧市街   */
  --d-officer:    #7a2a2a;   /* 士官予備区   */
}

/* ============================================================
   RESET & BASE
   ============================================================ */
*, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }

html { scroll-behavior: smooth; }
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/events/zero-market/event-data.json

```
{
  "event_id": "zero_market_terror_v1",
  "timeline": [
    {
      "time_order": -30,
      "type": "normal",
      "district_ref": "central_market",
      "route_ref": "south_main_road",
      "pin_ref": "market_open"
    },
    {
      "time_order": 0,
      "type": "explosion",
      "district_ref": "central_market",
      "route_ref": "south_main_road",
      "pin_ref": "blast_origin"
    },
    {
      "time_order": 12,
      "type": "fo_entry",
      "district_ref": "central_market",
      "route_ref": "south_main_road",
      "pin_ref": "fo_entry_gate"
    }
  ]
}```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/events/zero-market/replay.js

```
"events": [
  {
    "event_id": "zero_market_terror_v1",
    "label": "ZERO 中央市場炎槍事件",
    "link": "../events/zero-market/event-data.json",
    "district_ref": "central_market"
  }
]```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>グランセントラル都市区画図 | GRAND CENTRAL CITY DISTRICT MAP</title>
  <meta name="description" content="ZERO編〜本編の都市生活圏ベースマップ。中央市場テロ事件・ジェイド生活圏・士官学校導線に対応。">
  <link rel="stylesheet" href="./city.css">
</head>
<body>

<div class="city-shell">

  <!-- ============================================================
       BACK LINK
       ============================================================ -->
  <section id="sec-nav">
    <a class="back-link" href="../index.html">← INCIDENT RECORD</a>
  </section>

  <!-- ============================================================
       ① HEADER
       ============================================================ -->
  <section id="sec-header">
    <header class="city-header">
      <div class="city-archive-tag">City District Archive</div>
      <h1 class="city-title-ja">グランセントラル都市区画図</h1>
      <div class="city-title-en">Grand Central City District Map</div>
      <div class="city-meta-row">
        <span class="city-meta-chip">ZERO編 → 本編</span>
        <span class="city-meta-chip">World: Meritocracia</span>
        <span class="city-meta-chip">Base Map v1.0</span>
      </div>
    </header>
  </section>

  <!-- ============================================================
       ② MAP VIEWER
       ============================================================ -->
  <section id="sec-map" class="section-block">
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/interactive/city-map.js

```
'use strict';

/* ============================================================
   CITY MAP — Grand Central Interactive Navigator
   Vanilla JS, no dependencies.
   ============================================================ */

/* ----------------------------------------------------------
   STATE
   ---------------------------------------------------------- */
const state = {
  data:         null,
  activeFilter: null,   // null = all
  activePoi:    null,   // poi id
  zoom:         1,
  panX:         0,
  panY:         0,
  dragging:     false,
  dragStartX:   0,
  dragStartY:   0,
  dragStartPanX:0,
  dragStartPanY:0,
  imgNaturalW:  0,
  imgNaturalH:  0,
};

const ZOOM_MIN  = 0.4;
const ZOOM_MAX  = 4.0;
const ZOOM_STEP = 0.18;

/* ----------------------------------------------------------
   DOM REFS
   ---------------------------------------------------------- */
const $ = id => document.getElementById(id);

let DOM = {};

/* ----------------------------------------------------------
   BOOT
   ---------------------------------------------------------- */
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/interactive/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
  <title>グランセントラル インタラクティブ地図 | GRAND CENTRAL NAVIGATOR</title>
  <meta name="description" content="ZERO編〜本編 グランセントラル都市区画インタラクティブナビゲータ。POIクリック・ズーム・パン・フィルター対応。">
  <link rel="stylesheet" href="./interactive.css">
</head>
<body>

<div class="map-app">

  <!-- ============================================================
       TOP BAR
       ============================================================ -->
  <header class="topbar">
    <!-- モバイルサイドバートグル -->
    <button class="sidebar-toggle-btn" id="sidebar-toggle" aria-label="サイドバーを開く">☰</button>

    <a class="topbar-back" href="../index.html">← STATIC VIEW</a>

    <div class="topbar-title">
      グランセントラル
      <span>INTERACTIVE NAVIGATOR</span>
    </div>

    <div class="topbar-spacer"></div>

    <!-- フィルターバー -->
    <div class="filter-bar" id="filter-bar">
      <span class="filter-label">FILTER</span>
      <!-- JS が buildFilters() でボタンを生成 -->
    </div>
  </header>

  <!-- ============================================================
       SIDEBAR
       ============================================================ -->
  <aside class="sidebar" id="sidebar">
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/interactive/interactive.css

```
@import url('https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,400&family=Noto+Serif+JP:wght@300;400;500&display=swap');

/* ============================================================
   CSS VARIABLES  （city.css / terror.css 継承）
   ============================================================ */
:root {
  --bg:           #060a11;
  --bg2:          #0a1020;
  --bg3:          #0e1628;
  --panel:        #0d1525;
  --panel2:       #111d35;
  --panel-glass:  rgba(13,21,37,0.92);

  --gold:         #c9a961;
  --gold2:        #e8c97a;
  --gold-dim:     #7a6035;
  --gold-glow:    rgba(201,169,97,0.15);
  --gold-glow2:   rgba(201,169,97,0.08);

  --text:         #d8ccb4;
  --text2:        #7a6e58;
  --text3:        #4a4030;

  --border:       rgba(201,169,97,0.14);
  --border2:      rgba(201,169,97,0.30);
  --border3:      rgba(201,169,97,0.50);

  --c-dead:       #8b1a1a;
  --c-dead-text:  #e05050;
  --c-fo:         #4a7fc1;
  --c-escape:     #b080f0;

  --sidebar-w:    320px;
  --topbar-h:     52px;
  --footer-h:     44px;
}

/* ============================================================
   RESET & BASE
   ============================================================ */
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/interactive/map-data.json

```
{
  "meta": {
    "map_id": "grand_central_interactive_v1",
    "title": "グランセントラル都市区画図",
    "title_en": "Grand Central City District Map",
    "image": "../grand-central-map.png",
    "version": "1.0"
  },
  "filters": [
    { "id": "zero",    "label": "ZERO編",    "label_ja": "ZERO編" },
    { "id": "main",    "label": "本編",      "label_ja": "本編" },
    { "id": "officer", "label": "士官学校",  "label_ja": "士官学校" },
    { "id": "church",  "label": "教会バイト","label_ja": "教会バイト" },
    { "id": "harbor",  "label": "港湾物流",  "label_ja": "港湾物流" }
  ],
  "pois": [
    {
      "id": "poi_central_market",
      "name": "中央市場",
      "name_en": "Central Market",
      "district": "中央市場区",
      "x_pct": 47.5,
      "y_pct": 24.0,
      "icon": "◈",
      "color": "#b8860b",
      "filters": ["zero", "main"],
      "description": "都市最大の商業・流通拠点。祝祭広場と隣接し、平時は市民の集う活気ある場所。ZERO編「中央市場炎槍事件」の主舞台となり、炎翼セルによる大規模テロ攻撃が発生した。",
      "lore_zero": "炎翼セル配置→初爆発→召喚獣出現→炎槍発射→カーネル死亡という一連のテロ事件が展開。ジェイドにとって「国家の嘘」と「心音覚醒」の起点となる転換点。",
      "lore_main": "本編ではテロ後の復興が進み、警備体制が強化された状態で登場。事件の痕跡が一部残る。",
      "lore_officer": "士官学校の演習ルート上に位置。市場警備との連携訓練が行われる。",
      "lore_church": null,
      "lore_harbor": null
    },
    {
      "id": "poi_festival_square",
      "name": "祝祭広場",
      "name_en": "Festival Square",
      "district": "中央市場区",
      "x_pct": 47.5,
      "y_pct": 34.5,
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/map/city.css

```
@import url('https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,400&family=Noto+Serif+JP:wght@300;400;500&display=swap');

/* ============================================================
   CSS VARIABLES
   ============================================================ */
:root {
  --bg:           #060a11;
  --bg2:          #0a1020;
  --bg3:          #0e1628;
  --panel:        #0d1525;
  --panel2:       #111d35;

  --gold:         #c9a961;
  --gold2:        #e8c97a;
  --gold-dim:     #7a6035;
  --gold-glow:    rgba(201,169,97,0.15);

  --text:         #d8ccb4;
  --text2:        #7a6e58;
  --text3:        #4a4030;

  --border:       rgba(201,169,97,0.14);
  --border2:      rgba(201,169,97,0.3);

  /* ステータスカラー */
  --c-dead:       #8b1a1a;
  --c-dead-glow:  rgba(139,26,26,0.2);
  --c-dead-text:  #e05050;

  --c-captured:   #b8901a;
  --c-captured-glow: rgba(184,144,26,0.2);
  --c-captured-text: #e8c050;

  --c-escape:     #5a2d8a;
  --c-escape-glow: rgba(90,45,138,0.2);
  --c-escape-text: #b080f0;

  --c-civilian:   #1a4a7a;
  --c-civilian-glow: rgba(26,74,122,0.2);
  --c-civilian-text: #60a8e0;
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/map/city.js

```
'use strict';

/* ============================================================
   CONSTANTS
   ============================================================ */
const STATUS_CONFIG = {
  dead:     { label: '死亡',           dot: '#e05050' },
  captured: { label: '逮捕（影武者）', dot: '#e8c050' },
  escape:   { label: '逃亡・生存',     dot: '#b080f0' },
  civilian: { label: '生存（民間）',   dot: '#60a8e0' },
  unknown:  { label: '生死不明',       dot: '#9090b0' },
  shadow:   { label: '要監視・黒幕候補', dot: '#c9a961' },
};

const PHASE_ORDER = [
  '静寂と予兆',
  '英雄的選択と悲劇',
  '決別と覚醒の兆し',
  'FOによる制圧',
  '残酷な現実の確定',
  '政治的幕引き',
  '誓いへ',
];

const HL_BADGE_LABEL = {
  death:     '★ カーネル死亡',
  pivot:     '◆ 転換点',
  deception: '▲ 国家の欺瞞',
  awakening: '◉ 心音覚醒',
  oath:      '✦ 誓い',
};

const FORESHADOW_DATA = [
  {
    icon: '🔮',
    label: 'ABILITY',
    title: '心音システム初覚醒',
    desc: 'Scene14の異常な心音、Scene25の公開尋問での無自覚発火。「こいつじゃない」という確信がジェイドに生まれる起点。グローリアテストおよび夜化因子判定への直接の伏線。',
    connect: '→ グローリアテスト / 夜化因子 / 能力判定試験',
  },
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/map/city_map.json

```
{
  "map_id": "grand_central_city_v2_final",

  "districts": [
    {
      "district_id": "market_core",
      "name": "中央市場区",
      "x": 520,
      "y": 220
    },
    {
      "district_id": "admin_core",
      "name": "行政中枢区",
      "x": 250,
      "y": 300
    },
    {
      "district_id": "east_residential",
      "name": "東住宅区",
      "x": 820,
      "y": 300
    },
    {
      "district_id": "port_logistics",
      "name": "港湾物流区",
      "x": 130,
      "y": 540
    },
    {
      "district_id": "church_oldtown",
      "name": "教会旧市街",
      "x": 760,
      "y": 650
    },
    {
      "district_id": "academy_outer",
      "name": "士官予備区",
      "x": 520,
      "y": 560
    }
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/map/city_status.json

```
{
  "incident": "中央市場炎槍事件",
  "cell": "炎翼セル",
  "members": [
    {
      "id": "C-01",
      "name": "アーク",
      "role": "セルリーダー",
      "role_en": "Cell Leader",
      "status": "escape",
      "status_label": "逃亡・生存",
      "public_info": "国家未把握",
      "future_hook": "上位セル接続担当。ZERO終盤黒幕導線。",
      "threat": "high"
    },
    {
      "id": "R-02",
      "name": "ノクス",
      "role": "儀式中枢",
      "role_en": "Ritual Core",
      "status": "unknown",
      "status_label": "生死不明（生存寄り）",
      "public_info": "死亡扱い",
      "future_hook": "影武者作戦の主導者候補。自害は偽装の可能性。",
      "threat": "high"
    },
    {
      "id": "R-03",
      "name": "セラ",
      "role": "儀式補助",
      "role_en": "Ritual Support",
      "status": "escape",
      "status_label": "逃亡・生存",
      "public_info": "行方不明",
      "future_hook": "ルカとの接点あり。後の証言者候補。迷いを持つ唯一の存在。",
      "threat": "medium"
    },
    {
      "id": "D-04",
      "name": "グラム",
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/map/city_story.json

```
{
  "incident": "中央市場炎槍事件",
  "subtitle": "ZERO編プロローグ事件",
  "arc": "中編・後編",
  "scenes": [
    {
      "id": 8,
      "title": "上空の異変",
      "phase": "静寂と予兆",
      "phase_en": "SILENCE",
      "tags": ["異変", "天使の示唆", "伏線"],
      "highlight": false,
      "summary": "炎の粉が逆流し、煙が上へ吸い込まれる。ジェイドだけが違和感を覚える。空の裂け目に、翼に見える巨大な炎影——正体は明示しない。"
    },
    {
      "id": 9,
      "title": "第二波",
      "phase": "静寂と予兆",
      "phase_en": "SILENCE",
      "tags": ["召喚獣", "戦場化", "ZG限界"],
      "highlight": false,
      "summary": "炎翼セル第二手。召喚獣が屋台を薙ぎ倒し市場が完全に戦場化。中央警備隊だけでは抑えきれない。カーネルが子供の泣き声で足を止める。"
    },
    {
      "id": 10,
      "title": "カーネルの選択",
      "phase": "英雄的選択と悲劇",
      "phase_en": "SACRIFICE",
      "tags": ["人格的必然", "姉の決断", "利他"],
      "highlight": false,
      "summary": "「……先にクララを頼む」——倒壊しかけた屋台の陰に迷子の子供を見つけ、迷わず単身向かうカーネル。これが死亡の人格的必然性となる。"
    },
    {
      "id": 11,
      "title": "炎槍の予兆",
      "phase": "英雄的選択と悲劇",
      "phase_en": "SACRIFICE",
      "tags": ["音の消滅", "赤染め", "スローモーション"],
      "highlight": false,
      "summary": "空の裂け目が脈打ち、音が消える。市場全体の色が一瞬だけ赤に染まる。カーネルが子供を抱き上げた瞬間、空から一本の細く鋭い光——。"
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/map/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>中央市場炎槍事件 | Meritocracia Terror DB</title>
<link rel="stylesheet" href="./city.css">
</head>
<body>

<div class="terror-shell">

  <!-- ナビ -->
  <a class="back-link" href="../../index.html">← NATION ARCHIVE</a>
  <a class="back-link" href="./map.html" style="margin-left:24px; color:var(--gold-dim);">🗺 TACTICAL MAP →</a>

  <!-- ======================================================
       ① INCIDENT HEADER
       ====================================================== -->
  <section class="incident-header">
    <div class="incident-tag">ZERO編 ／ MERITOCRACIA INCIDENT RECORD</div>
    <h1 class="incident-title" id="incident-title">読み込み中...</h1>
    <p class="incident-sub" id="incident-sub"></p>

    <div class="incident-stats">
      <div class="stat-chip red">
        <span class="stat-label">死者</span>
        <span class="stat-val" id="stat-dead">—</span>
      </div>
      <div class="stat-chip purple">
        <span class="stat-label">逃亡・行方不明</span>
        <span class="stat-val" id="stat-escape">—</span>
      </div>
      <div class="stat-chip amber">
        <span class="stat-label">公式犯人（影武者）</span>
        <span class="stat-val" id="stat-captured">—</span>
      </div>
      <div class="stat-chip">
        <span class="stat-label">Scene</span>
        <span class="stat-val">08 – 30</span>
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/map/map.css

```
@import url('https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,400&family=Noto+Serif+JP:wght@300;400;500&family=JetBrains+Mono:wght@300;400&display=swap');

/* ============================================================
   CSS VARIABLES — dark fantasy + London tube aesthetic
   ============================================================ */
:root {
  --bg:           #060a11;
  --bg2:          #0a1020;
  --bg3:          #0e1628;
  --panel:        #0d1525;
  --panel2:       #111d35;
  --panel-glass:  rgba(13,21,37,0.92);

  --gold:         #c9a961;
  --gold2:        #e8c97a;
  --gold-dim:     #7a6035;
  --gold-glow:    rgba(201,169,97,0.15);

  --text:         #d8ccb4;
  --text2:        #7a6e58;
  --text3:        #4a4030;

  --border:       rgba(201,169,97,0.14);
  --border2:      rgba(201,169,97,0.3);

  /* District palette — muted London-map tones */
  --dist-church:     rgba(120,80,160,0.18);
  --dist-church-s:   rgba(120,80,160,0.35);
  --dist-market:     rgba(200,120,60,0.18);
  --dist-market-s:   rgba(200,120,60,0.35);
  --dist-south:      rgba(80,140,100,0.15);
  --dist-south-s:    rgba(80,140,100,0.30);
  --dist-alley:      rgba(100,100,140,0.16);
  --dist-alley-s:    rgba(100,100,140,0.32);
  --dist-fo:         rgba(60,120,200,0.16);
  --dist-fo-s:       rgba(60,120,200,0.32);
  --dist-civic:      rgba(180,140,80,0.14);
  --dist-civic-s:    rgba(180,140,80,0.30);

  /* Route colors — Tube-line inspired */
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/map/map.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>中央市場テロ事件 地図 | Meritocracia Terror Map</title>
<meta name="description" content="ZERO編 中央市場炎槍事件の地図ビューア。ロンドン地下鉄路線図の読みやすさ + Googleマップの事件ピンUI + ダークファンタジー世界観を融合。">
<link rel="stylesheet" href="./map.css">
</head>
<body>

<!-- Mobile sidebar toggle -->
<button class="sidebar-toggle" id="sidebar-toggle" aria-label="メニュー">☰</button>

<!-- Mobile backdrop -->
<div class="sidebar-backdrop" id="sidebar-backdrop"></div>

<div class="map-app">

  <!-- ============================================================
       SIDEBAR (LEFT PANE)
       ============================================================ -->
  <aside class="sidebar" id="sidebar">

    <div class="sidebar-header">
      <a class="sidebar-back" href="./index.html">← INCIDENT RECORD</a>
      <div class="sidebar-tag">ZERO編 ／ TACTICAL MAP</div>
      <h1 class="sidebar-title">中央市場炎槍事件</h1>
      <div class="sidebar-subtitle">CENTRAL MARKET INCIDENT MAP</div>
    </div>

    <!-- Route toggles -->
    <div class="sidebar-section">
      <div class="sidebar-section-label">ROUTE LAYERS</div>
      <div id="route-toggles">
        <!-- JS generates -->
      </div>
    </div>

    <!-- Detail panel -->
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/map/map.js

```
'use strict';

/* ============================================================
   CONSTANTS & CONFIG
   ============================================================ */

/** District visual config — shape polygons & colors */
const DISTRICT_CONFIG = {
  church_quarter: {
    color: 'rgba(120,80,160,0.18)',
    stroke: 'rgba(120,80,160,0.35)',
    poly: [
      [100, 100], [320, 100], [330, 140], [320, 300],
      [280, 310], [100, 290], [90, 200]
    ],
    labelOffset: { dx: 0, dy: -15 }
  },
  market_core: {
    color: 'rgba(200,120,60,0.18)',
    stroke: 'rgba(200,120,60,0.35)',
    poly: [
      [370, 380], [620, 370], [640, 420], [630, 580],
      [580, 600], [370, 590], [350, 520]
    ],
    labelOffset: { dx: 0, dy: -15 }
  },
  south_market_edge: {
    color: 'rgba(80,140,100,0.15)',
    stroke: 'rgba(80,140,100,0.30)',
    poly: [
      [370, 620], [620, 620], [640, 670], [630, 830],
      [560, 850], [370, 840], [350, 750]
    ],
    labelOffset: { dx: 0, dy: -10 }
  },
  alley_belt: {
    color: 'rgba(100,100,140,0.16)',
    stroke: 'rgba(100,100,140,0.32)',
    poly: [
      [660, 380], [870, 400], [880, 450], [870, 600],
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/map_v1_archive_2026-04-16/city.css

```
@import url('https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,400&family=Noto+Serif+JP:wght@300;400;500&display=swap');

/* ============================================================
   CSS VARIABLES
   ============================================================ */
:root {
  --bg:           #060a11;
  --bg2:          #0a1020;
  --bg3:          #0e1628;
  --panel:        #0d1525;
  --panel2:       #111d35;

  --gold:         #c9a961;
  --gold2:        #e8c97a;
  --gold-dim:     #7a6035;
  --gold-glow:    rgba(201,169,97,0.15);

  --text:         #d8ccb4;
  --text2:        #7a6e58;
  --text3:        #4a4030;

  --border:       rgba(201,169,97,0.14);
  --border2:      rgba(201,169,97,0.3);

  /* ステータスカラー */
  --c-dead:       #8b1a1a;
  --c-dead-glow:  rgba(139,26,26,0.2);
  --c-dead-text:  #e05050;

  --c-captured:   #b8901a;
  --c-captured-glow: rgba(184,144,26,0.2);
  --c-captured-text: #e8c050;

  --c-escape:     #5a2d8a;
  --c-escape-glow: rgba(90,45,138,0.2);
  --c-escape-text: #b080f0;

  --c-civilian:   #1a4a7a;
  --c-civilian-glow: rgba(26,74,122,0.2);
  --c-civilian-text: #60a8e0;
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/map_v1_archive_2026-04-16/city.js

```
'use strict';

/* ============================================================
   CONSTANTS
   ============================================================ */
const STATUS_CONFIG = {
  dead:     { label: '死亡',           dot: '#e05050' },
  captured: { label: '逮捕（影武者）', dot: '#e8c050' },
  escape:   { label: '逃亡・生存',     dot: '#b080f0' },
  civilian: { label: '生存（民間）',   dot: '#60a8e0' },
  unknown:  { label: '生死不明',       dot: '#9090b0' },
  shadow:   { label: '要監視・黒幕候補', dot: '#c9a961' },
};

const PHASE_ORDER = [
  '静寂と予兆',
  '英雄的選択と悲劇',
  '決別と覚醒の兆し',
  'FOによる制圧',
  '残酷な現実の確定',
  '政治的幕引き',
  '誓いへ',
];

const HL_BADGE_LABEL = {
  death:     '★ カーネル死亡',
  pivot:     '◆ 転換点',
  deception: '▲ 国家の欺瞞',
  awakening: '◉ 心音覚醒',
  oath:      '✦ 誓い',
};

const FORESHADOW_DATA = [
  {
    icon: '🔮',
    label: 'ABILITY',
    title: '心音システム初覚醒',
    desc: 'Scene14の異常な心音、Scene25の公開尋問での無自覚発火。「こいつじゃない」という確信がジェイドに生まれる起点。グローリアテストおよび夜化因子判定への直接の伏線。',
    connect: '→ グローリアテスト / 夜化因子 / 能力判定試験',
  },
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/map_v1_archive_2026-04-16/city_map.json

```
{
  "map_id": "grand_central_city_v1",

  "districts": [
    {
      "district_id": "market_core",
      "name": "中央市場区",
      "x": 520,
      "y": 220
    },
    {
      "district_id": "admin_core",
      "name": "行政中枢区",
      "x": 250,
      "y": 300
    },
    {
      "district_id": "east_residential",
      "name": "東住宅区",
      "x": 820,
      "y": 300
    },
    {
      "district_id": "port_logistics",
      "name": "港湾物流区",
      "x": 130,
      "y": 540
    },
    {
      "district_id": "church_oldtown",
      "name": "教会旧市街",
      "x": 760,
      "y": 650
    },
    {
      "district_id": "academy_outer",
      "name": "士官予備区",
      "x": 520,
      "y": 560
    }
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/map_v1_archive_2026-04-16/city_status.json

```
{
  "incident": "中央市場炎槍事件",
  "cell": "炎翼セル",
  "members": [
    {
      "id": "C-01",
      "name": "アーク",
      "role": "セルリーダー",
      "role_en": "Cell Leader",
      "status": "escape",
      "status_label": "逃亡・生存",
      "public_info": "国家未把握",
      "future_hook": "上位セル接続担当。ZERO終盤黒幕導線。",
      "threat": "high"
    },
    {
      "id": "R-02",
      "name": "ノクス",
      "role": "儀式中枢",
      "role_en": "Ritual Core",
      "status": "unknown",
      "status_label": "生死不明（生存寄り）",
      "public_info": "死亡扱い",
      "future_hook": "影武者作戦の主導者候補。自害は偽装の可能性。",
      "threat": "high"
    },
    {
      "id": "R-03",
      "name": "セラ",
      "role": "儀式補助",
      "role_en": "Ritual Support",
      "status": "escape",
      "status_label": "逃亡・生存",
      "public_info": "行方不明",
      "future_hook": "ルカとの接点あり。後の証言者候補。迷いを持つ唯一の存在。",
      "threat": "medium"
    },
    {
      "id": "D-04",
      "name": "グラム",
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/map_v1_archive_2026-04-16/city_story.json

```
{
  "incident": "中央市場炎槍事件",
  "subtitle": "ZERO編プロローグ事件",
  "arc": "中編・後編",
  "scenes": [
    {
      "id": 8,
      "title": "上空の異変",
      "phase": "静寂と予兆",
      "phase_en": "SILENCE",
      "tags": ["異変", "天使の示唆", "伏線"],
      "highlight": false,
      "summary": "炎の粉が逆流し、煙が上へ吸い込まれる。ジェイドだけが違和感を覚える。空の裂け目に、翼に見える巨大な炎影——正体は明示しない。"
    },
    {
      "id": 9,
      "title": "第二波",
      "phase": "静寂と予兆",
      "phase_en": "SILENCE",
      "tags": ["召喚獣", "戦場化", "ZG限界"],
      "highlight": false,
      "summary": "炎翼セル第二手。召喚獣が屋台を薙ぎ倒し市場が完全に戦場化。中央警備隊だけでは抑えきれない。カーネルが子供の泣き声で足を止める。"
    },
    {
      "id": 10,
      "title": "カーネルの選択",
      "phase": "英雄的選択と悲劇",
      "phase_en": "SACRIFICE",
      "tags": ["人格的必然", "姉の決断", "利他"],
      "highlight": false,
      "summary": "「……先にクララを頼む」——倒壊しかけた屋台の陰に迷子の子供を見つけ、迷わず単身向かうカーネル。これが死亡の人格的必然性となる。"
    },
    {
      "id": 11,
      "title": "炎槍の予兆",
      "phase": "英雄的選択と悲劇",
      "phase_en": "SACRIFICE",
      "tags": ["音の消滅", "赤染め", "スローモーション"],
      "highlight": false,
      "summary": "空の裂け目が脈打ち、音が消える。市場全体の色が一瞬だけ赤に染まる。カーネルが子供を抱き上げた瞬間、空から一本の細く鋭い光——。"
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/map_v1_archive_2026-04-16/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>中央市場炎槍事件 | Meritocracia Terror DB</title>
<link rel="stylesheet" href="./city.css">
</head>
<body>

<div class="terror-shell">

  <!-- ナビ -->
  <a class="back-link" href="../../index.html">← NATION ARCHIVE</a>
  <a class="back-link" href="./map.html" style="margin-left:24px; color:var(--gold-dim);">🗺 TACTICAL MAP →</a>

  <!-- ======================================================
       ① INCIDENT HEADER
       ====================================================== -->
  <section class="incident-header">
    <div class="incident-tag">ZERO編 ／ MERITOCRACIA INCIDENT RECORD</div>
    <h1 class="incident-title" id="incident-title">読み込み中...</h1>
    <p class="incident-sub" id="incident-sub"></p>

    <div class="incident-stats">
      <div class="stat-chip red">
        <span class="stat-label">死者</span>
        <span class="stat-val" id="stat-dead">—</span>
      </div>
      <div class="stat-chip purple">
        <span class="stat-label">逃亡・行方不明</span>
        <span class="stat-val" id="stat-escape">—</span>
      </div>
      <div class="stat-chip amber">
        <span class="stat-label">公式犯人（影武者）</span>
        <span class="stat-val" id="stat-captured">—</span>
      </div>
      <div class="stat-chip">
        <span class="stat-label">Scene</span>
        <span class="stat-val">08 – 30</span>
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/map_v1_archive_2026-04-16/map.css

```
@import url('https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,400&family=Noto+Serif+JP:wght@300;400;500&family=JetBrains+Mono:wght@300;400&display=swap');

/* ============================================================
   CSS VARIABLES — dark fantasy + London tube aesthetic
   ============================================================ */
:root {
  --bg:           #060a11;
  --bg2:          #0a1020;
  --bg3:          #0e1628;
  --panel:        #0d1525;
  --panel2:       #111d35;
  --panel-glass:  rgba(13,21,37,0.92);

  --gold:         #c9a961;
  --gold2:        #e8c97a;
  --gold-dim:     #7a6035;
  --gold-glow:    rgba(201,169,97,0.15);

  --text:         #d8ccb4;
  --text2:        #7a6e58;
  --text3:        #4a4030;

  --border:       rgba(201,169,97,0.14);
  --border2:      rgba(201,169,97,0.3);

  /* District palette — muted London-map tones */
  --dist-church:     rgba(120,80,160,0.18);
  --dist-church-s:   rgba(120,80,160,0.35);
  --dist-market:     rgba(200,120,60,0.18);
  --dist-market-s:   rgba(200,120,60,0.35);
  --dist-south:      rgba(80,140,100,0.15);
  --dist-south-s:    rgba(80,140,100,0.30);
  --dist-alley:      rgba(100,100,140,0.16);
  --dist-alley-s:    rgba(100,100,140,0.32);
  --dist-fo:         rgba(60,120,200,0.16);
  --dist-fo-s:       rgba(60,120,200,0.32);
  --dist-civic:      rgba(180,140,80,0.14);
  --dist-civic-s:    rgba(180,140,80,0.30);

  /* Route colors — Tube-line inspired */
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/map_v1_archive_2026-04-16/map.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>中央市場テロ事件 地図 | Meritocracia Terror Map</title>
<meta name="description" content="ZERO編 中央市場炎槍事件の地図ビューア。ロンドン地下鉄路線図の読みやすさ + Googleマップの事件ピンUI + ダークファンタジー世界観を融合。">
<link rel="stylesheet" href="./map.css">
</head>
<body>

<!-- Mobile sidebar toggle -->
<button class="sidebar-toggle" id="sidebar-toggle" aria-label="メニュー">☰</button>

<!-- Mobile backdrop -->
<div class="sidebar-backdrop" id="sidebar-backdrop"></div>

<div class="map-app">

  <!-- ============================================================
       SIDEBAR (LEFT PANE)
       ============================================================ -->
  <aside class="sidebar" id="sidebar">

    <div class="sidebar-header">
      <a class="sidebar-back" href="./index.html">← INCIDENT RECORD</a>
      <div class="sidebar-tag">ZERO編 ／ TACTICAL MAP</div>
      <h1 class="sidebar-title">中央市場炎槍事件</h1>
      <div class="sidebar-subtitle">CENTRAL MARKET INCIDENT MAP</div>
    </div>

    <!-- Route toggles -->
    <div class="sidebar-section">
      <div class="sidebar-section-label">ROUTE LAYERS</div>
      <div id="route-toggles">
        <!-- JS generates -->
      </div>
    </div>

    <!-- Detail panel -->
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/map_v1_archive_2026-04-16/map.js

```
'use strict';

/* ============================================================
   CONSTANTS & CONFIG
   ============================================================ */

/** District visual config — shape polygons & colors */
const DISTRICT_CONFIG = {
  church_quarter: {
    color: 'rgba(120,80,160,0.18)',
    stroke: 'rgba(120,80,160,0.35)',
    poly: [
      [100, 100], [320, 100], [330, 140], [320, 300],
      [280, 310], [100, 290], [90, 200]
    ],
    labelOffset: { dx: 0, dy: -15 }
  },
  market_core: {
    color: 'rgba(200,120,60,0.18)',
    stroke: 'rgba(200,120,60,0.35)',
    poly: [
      [370, 380], [620, 370], [640, 420], [630, 580],
      [580, 600], [370, 590], [350, 520]
    ],
    labelOffset: { dx: 0, dy: -15 }
  },
  south_market_edge: {
    color: 'rgba(80,140,100,0.15)',
    stroke: 'rgba(80,140,100,0.30)',
    poly: [
      [370, 620], [620, 620], [640, 670], [630, 830],
      [560, 850], [370, 840], [350, 750]
    ],
    labelOffset: { dx: 0, dy: -10 }
  },
  alley_belt: {
    color: 'rgba(100,100,140,0.16)',
    stroke: 'rgba(100,100,140,0.32)',
    poly: [
      [660, 380], [870, 400], [880, 450], [870, 600],
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/v2/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1.0">
  <title>Grand Central Map v2</title>
  <link rel="stylesheet" href="./v2.css">
</head>
<body>
  <header class="header">
    <h1>グランセントラル都市マップ v2</h1>
    <p>ドラッグで都市全体 → 士官学校詳細へ移動</p>
  </header>

  <main class="map-scroll">
    <section class="map-panel">
      <h2>都市全体</h2>
      <img src="../grand-central-map.png" alt="都市全体図">
    </section>

    <section class="map-panel">
      <h2>士官学校詳細</h2>
      <img src="../academy/academy-map.png" alt="士官学校詳細">
    </section>
  </main>
</body>
</html>```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/v2/v2.css

```
body {
  margin: 0;
  background: #07101c;
  color: #fff;
  font-family: sans-serif;
}

.header {
  padding: 20px;
  border-bottom: 1px solid #333;
  background: #0b1420;
}

.header h1 {
  margin: 0;
  color: #d4af37;
}

.map-scroll {
  display: flex;
  overflow-x: auto;
  gap: 40px;
  padding: 30px;
  scroll-snap-type: x mandatory;
}

.map-panel {
  min-width: 90vw;
  flex-shrink: 0;
  scroll-snap-align: start;
}

.map-panel h2 {
  margin-bottom: 16px;
  color: #d4af37;
}

.map-panel img {
  width: 100%;
  border-radius: 12px;
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/v3/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
  <title>グランセントラル 連続地図 v3 | GRAND CENTRAL SEAMLESS MAP</title>
  <meta name="description" content="グランセントラル都市全体図＋士官学校詳細の連続インタラクティブマップ v3。">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@400;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="./v3.css">
</head>
<body>

<!-- ══════════════════════════════════════════════════════════
     TOP BAR
     ══════════════════════════════════════════════════════════ -->
<header class="topbar">
  <a class="topbar-back" href="../index.html">← VIEWER HUB</a>
  <div class="topbar-sep"></div>

  <div class="topbar-title">
    グランセントラル
    <span>SEAMLESS NAVIGATOR v3</span>
  </div>

  <div class="topbar-spacer"></div>

  <!-- フィルターバー -->
  <div class="filter-bar" id="filter-bar">
    <span class="filter-label">FILTER</span>
    <!-- JS buildFilters() -->
  </div>

  <div class="topbar-sep"></div>

  <!-- Map mode tabs -->
  <div class="mode-tabs">
    <button class="mode-tab active" data-mode="combined">連続</button>
    <button class="mode-tab" data-mode="gc">都市</button>
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/v3/v3.css

```
/* ============================================================
   GRAND CENTRAL NAVIGATOR v3 — Seamless Dual-Map Viewer
   Aesthetic: Dark Cartographic / Fantasy Atlas
   ============================================================ */

:root {
  --bg:          #0b0e16;
  --chrome:      #12161f;
  --border:      #2a3040;
  --gold:        #c9a961;
  --gold-dim:    #8a7040;
  --gold-bright: #f0d080;
  --text:        #d4c9a8;
  --text-dim:    #7a7060;
  --red:         #9a3a3a;
  --blue:        #2a5a9a;
  --green:       #3a7a5a;
  --panel-bg:    rgba(11,14,22,0.92);
  --seam-w:      60px;   /* blending seam width */
  --topbar-h:    48px;
  --footer-h:    36px;
}

*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

html, body {
  width: 100%; height: 100%; overflow: hidden;
  background: var(--bg);
  color: var(--text);
  font-family: 'Noto Serif JP', 'Georgia', serif;
  -webkit-font-smoothing: antialiased;
}

/* ── TOPBAR ─────────────────────────────────────────────── */
.topbar {
  position: fixed; top: 0; left: 0; right: 0;
  height: var(--topbar-h);
  background: var(--chrome);
  border-bottom: 1px solid var(--border);
  display: flex; align-items: center; gap: 12px;
```

## ./viewer/db/city/_local_staging_backup/grand-central_wip_2026-04-16_1811/v3/v3.js

```
/**
 * GRAND CENTRAL NAVIGATOR v3
 * Seamless dual-map viewer
 * grand-central-map.png (1408×768) + academy-map.png (1380×752)
 */

'use strict';

// ─── CONFIG ────────────────────────────────────────────────────────────────

const CFG = {
  gc: { src: '../grand-central-map.png', w: 1408, h: 768 },
  ac: { src: '../academy-map.png',        w: 1380, h: 752 },

  // Where academy left-edge anchors on the combined world X axis
  // We overlap slightly so the seam at the 士官予備区 feels continuous.
  // Visually the 士官予備区 is roughly x=40–55% on GC map.
  // We want academy to "grow out" of that zone toward the right.
  // Overlap amount: 120px (the two images share ~120px of visual territory)
  overlap: 130,

  // Vertical offset: academy map is slightly taller/shorter than GC.
  // Center academy vertically relative to GC height.
  get acOffsetY() {
    return Math.round((CFG.gc.h - CFG.ac.h) / 2);
  },

  // World dimensions
  get worldW() { return CFG.gc.w + CFG.ac.w - CFG.overlap; },
  get worldH() { return Math.max(CFG.gc.h, CFG.ac.h); },

  // Seam X position (right edge of GC / left edge of AC in world coords)
  get seamX()   { return CFG.gc.w - CFG.overlap; },

  // Zoom
  minZoom: 0.35,
  maxZoom: 2.5,
  zoomStep: 0.18,
  initialZoom: null, // computed on init
};
```

## ./viewer/db/city/grand-central/city.css

```
@import url('https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,400&family=Noto+Serif+JP:wght@300;400;500&display=swap');

/* ============================================================
   CSS VARIABLES  （terror.css から継承）
   ============================================================ */
:root {
  --bg:           #060a11;
  --bg2:          #0a1020;
  --bg3:          #0e1628;
  --panel:        #0d1525;
  --panel2:       #111d35;

  --gold:         #c9a961;
  --gold2:        #e8c97a;
  --gold-dim:     #7a6035;
  --gold-glow:    rgba(201,169,97,0.15);

  --text:         #d8ccb4;
  --text2:        #7a6e58;
  --text3:        #4a4030;

  --border:       rgba(201,169,97,0.14);
  --border2:      rgba(201,169,97,0.30);
  --border3:      rgba(201,169,97,0.50);

  /* 区画カラー */
  --d-market:     #b8860b;   /* 中央市場区   */
  --d-east:       #3a6e5a;   /* 東住宅区     */
  --d-admin:      #2a4a7a;   /* 行政中枢区   */
  --d-port:       #4a4a6a;   /* 港湾物流区   */
  --d-church:     #7a3a6a;   /* 教会旧市街   */
  --d-officer:    #7a2a2a;   /* 士官予備区   */
}

/* ============================================================
   RESET & BASE
   ============================================================ */
*, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }

html { scroll-behavior: smooth; }
```

## ./viewer/db/city/grand-central/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>グランセントラル都市区画図 | GRAND CENTRAL CITY DISTRICT MAP</title>
  <meta name="description" content="ZERO編〜本編の都市生活圏ベースマップ。中央市場テロ事件・ジェイド生活圏・士官学校導線に対応。">
  <link rel="stylesheet" href="./city.css">
</head>
<body>

<div class="city-shell">

  <!-- ============================================================
       BACK LINK
       ============================================================ -->
  <section id="sec-nav">
    <a class="back-link" href="../index.html">← INCIDENT RECORD</a>
  </section>

  <!-- ============================================================
       ① HEADER
       ============================================================ -->
  <section id="sec-header">
    <header class="city-header">
      <div class="city-archive-tag">City District Archive</div>
      <h1 class="city-title-ja">グランセントラル都市区画図</h1>
      <div class="city-title-en">Grand Central City District Map</div>
      <div class="city-meta-row">
        <span class="city-meta-chip">ZERO編 → 本編</span>
        <span class="city-meta-chip">World: Meritocracia</span>
        <span class="city-meta-chip">Base Map v1.0</span>
      </div>
    </header>
  </section>

  <!-- ============================================================
       ② MAP VIEWER
       ============================================================ -->
  <section id="sec-map" class="section-block">
```

## ./viewer/db/city/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>メリトクラシア国 地域一覧</title>
  <style>
    body {
      background: #0b1220;
      color: #e5d0a2;
      font-family: sans-serif;
      padding: 40px;
    }
    h1 {
      margin-bottom: 24px;
    }
    .card-grid {
      display: grid;
      gap: 16px;
      max-width: 700px;
    }
    .card {
      border: 1px solid #8a6a2f;
      padding: 20px;
      border-radius: 8px;
      background: #10192b;
      transition: 0.2s;
    }
    .card:hover {
      background: #162238;
    }
    a {
      text-decoration: none;
      color: inherit;
    }
    h2 {
      margin: 0 0 8px;
    }
    p {
      margin: 0;
```

## ./viewer/db/mythology/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>Mythology | Meritocracia</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #0f1115;
      color: #e5e7eb;
      margin: 0;
      padding: 40px;
      line-height: 1.6;
    }
    h1, h2, h3 {
      color: #60a5fa;
    }
    .section {
      margin-bottom: 40px;
      padding: 20px;
      border-left: 3px solid #60a5fa;
      background: #1a1d24;
    }
    .node {
      margin-left: 20px;
    }
    .arrow {
      color: #9ca3af;
      margin: 10px 0;
    }
  </style>
</head>

<body>

<h1>🌌 Mythology Tree</h1>
<p>メリトクラシア 神話構造（v1.0）</p>

<div class="section">
  <h2>■ 原初層</h2>
```

## ./viewer/db/nation/citizen-petition-system/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>貴族陳情制度 | Meritocracia DB</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <main class="container">
    <h1>🏛 貴族陳情制度</h1>
    <p class="lead">
      平民は国家へ直接不満や要望を届けず、担当貴族を通して中央へ上申する制度。
    </p>

    <section>
      <h2>制度概要</h2>
      <p>
        メリトクラシアにおける民意の流れを整理する正式制度。
        発言権には責任と資格が伴い、街区ごとの担当貴族が窓口となる。
      </p>
    </section>

    <section>
      <h2>士官学校編での活用</h2>
      <p>
        学費、商業規制、治安要請、抗議活動などを
        暴徒化ではなく制度的な政治行動として描写できる。
      </p>
    </section>

    <section>
      <h2>国家テーマ接続</h2>
      <p>
        「声を上げる資格は責任によって得る」──
        実力主義国家メリトクラシアを象徴する制度。
      </p>
    </section>
<a href="./citizen-petition-system/">
  <div class="card">
```

## ./viewer/db/nation/citizen-petition-system/index_backup_2026-04-15_1657.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>貴族陳情制度 | Meritocracia DB</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <main class="container">
    <h1>🏛 貴族陳情制度</h1>
    <p class="lead">
      平民は国家へ直接不満や要望を届けず、担当貴族を通して中央へ上申する制度。
    </p>

    <section>
      <h2>制度概要</h2>
      <p>
        メリトクラシアにおける民意の流れを整理する正式制度。
        発言権には責任と資格が伴い、街区ごとの担当貴族が窓口となる。
      </p>
    </section>

    <section>
      <h2>士官学校編での活用</h2>
      <p>
        学費、商業規制、治安要請、抗議活動などを
        暴徒化ではなく制度的な政治行動として描写できる。
      </p>
    </section>

    <section>
      <h2>国家テーマ接続</h2>
      <p>
        「声を上げる資格は責任によって得る」──
        実力主義国家メリトクラシアを象徴する制度。
      </p>
    </section>
  </main>
</body>
```

## ./viewer/db/nation/citizen-petition-system/style.css

```
body {
  margin: 0;
  min-height: 100vh;
  color: #e8e8e8;
  font-family: sans-serif;
  line-height: 1.8;
  background:
    radial-gradient(circle at top right, rgba(25, 60, 120, 0.25), transparent 40%),
    radial-gradient(circle at bottom left, rgba(10, 40, 90, 0.35), transparent 45%),
    linear-gradient(135deg, #07111f 0%, #09182a 40%, #0b1f36 100%);
}

.container {
  max-width: 900px;
  margin: 48px auto;
  padding: 40px 28px;
  background: rgba(8, 18, 36, 0.55);
  border: 1px solid rgba(212, 175, 55, 0.15);
  border-radius: 16px;
  backdrop-filter: blur(6px);
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
}

h1, h2 {
  color: #d6b36a;
  letter-spacing: 0.04em;
}

.lead {
  font-size: 1.1rem;
  color: #d7dbe4;
}

section {
  margin-top: 32px;
  padding-top: 12px;
  border-top: 1px solid rgba(214, 179, 106, 0.12);
}
```

## ./viewer/db/nation/government/central_government_phase2.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>中央政府組織図 Phase2 | Nation Archive</title>
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@400;600&family=Noto+Serif+JP:wght@300;400;500&display=swap" rel="stylesheet">
  <style>
    :root {
      --bg: #070d18;
      --panel: #0d1526;
      --panel2: #111e35;
      --border: rgba(201,169,97,0.2);
      --border-bright: rgba(201,169,97,0.5);
      --gold: #c9a961;
      --gold-dim: #8a7040;
      --text: #f4efe2;
      --muted: #a59a7a;
      --dim: #5a5040;
      --zg: #4a7fc1;
      --fo: #c14a4a;
      --va: #7a4ac1;
      --lotus: #c9a961;
    }
    * { margin:0; padding:0; box-sizing:border-box; }
    body { background:var(--bg); color:var(--text); font-family:'Noto Serif JP',serif; min-height:100vh; line-height:1.8; }
    body::before {
      content:''; position:fixed; inset:0;
      background:
        radial-gradient(ellipse 70% 50% at 50% 0%, rgba(13,30,60,0.8) 0%, transparent 60%),
        repeating-linear-gradient(45deg, transparent, transparent 80px, rgba(201,169,97,0.015) 80px, rgba(201,169,97,0.015) 81px);
      pointer-events:none; z-index:0;
    }
    .shell { position:relative; z-index:1; max-width:900px; margin:0 auto; padding:56px 24px 100px; }
    .back { display:inline-flex; align-items:center; gap:8px; font-family:'Cormorant Garamond',serif; font-size:11px; letter-spacing:3px; color:var(--muted); text-decoration:none; margin-bottom:40px; transition:color 0.2s; }
    .back:hover{color:var(--gold)}
    .doc-header { border-bottom:1px solid var(--border); padding-bottom:28px; margin-bottom:56px; }
    .doc-sub { font-family:'Cormorant Garamond',serif; font-size:11px; letter-spacing:5px; color:var(--gold); opacity:0.7; margin-bottom:12px; }
    .doc-title { font-family:'Cormorant Garamond',serif; font-size:clamp(2rem,6vw,3.2rem); font-weight:600; color:var(--gold); letter-spacing:0.06em; margin-bottom:10px; }
    .doc-meta { font-size:12px; color:var(--dim); letter-spacing:2px; }
```

## ./viewer/db/nation/government/military_system_design_20260401.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>三兵団制度設計 | Nation Archive</title>
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@400;600&family=Noto+Serif+JP:wght@300;400;500&display=swap" rel="stylesheet">
  <style>
    :root {
      --bg: #070d18;
      --panel: #0d1526;
      --panel2: #111e35;
      --border: rgba(201,169,97,0.2);
      --border-bright: rgba(201,169,97,0.5);
      --gold: #c9a961;
      --gold-dim: #8a7040;
      --text: #f4efe2;
      --muted: #a59a7a;
      --dim: #5a5040;
      --zg: #4a7fc1;
      --fo: #c14a4a;
      --va: #7a4ac1;
    }
    * { margin:0; padding:0; box-sizing:border-box; }
    body {
      background: var(--bg);
      color: var(--text);
      font-family: 'Noto Serif JP', serif;
      min-height: 100vh; line-height: 1.8;
    }
    body::before {
      content:''; position:fixed; inset:0;
      background:
        radial-gradient(ellipse 70% 50% at 50% 0%, rgba(13,30,60,0.8) 0%, transparent 60%),
        repeating-linear-gradient(45deg, transparent, transparent 80px, rgba(201,169,97,0.015) 80px, rgba(201,169,97,0.015) 81px);
      pointer-events:none; z-index:0;
    }
    .shell { position:relative; z-index:1; max-width:900px; margin:0 auto; padding:56px 24px 100px; }
    .back {
      display:inline-flex; align-items:center; gap:8px;
```

## ./viewer/db/nation/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Meritocracia Nation Archive</title>
  <link rel="stylesheet" href="nation.css">
</head>
<body>
  <main class="nation-shell">
    <header class="nation-header">
      <p class="sub">MERITOCRACIA CENTRAL ARCHIVE</p>
      <h1>国家制度アーカイブ</h1>
      <p class="lead">
        国家基礎・統治制度・軍事・階級制度を管理する正史閲覧ポータル
      </p>
    </header>

    <!-- 国家基礎 -->
    <section class="nation-category">
      <h2>🏛 国家基礎</h2>
      <div class="nation-grid">
        <a href="./overview/" class="nation-card">
          <span class="badge">OVERVIEW</span>
          <h2>国家概要</h2>
          <p>国名・人口・首都・政体・建国年の基本プロフィール</p>
        </a>
      </div>
    </section>

    <!-- 統治制度 -->
    <section class="nation-category">
      <h2>⚖ 統治制度</h2>
      <div class="nation-grid">
        <a href="./government/central_government_phase2.html" class="nation-card">
          <span class="badge">GOVERNMENT</span>
          <h2>中央政府組織図</h2>
          <p>中央政府 + 三兵団人物4層の統合運用DB</p>
        </a>

```

## ./viewer/db/nation/nation.css

```
:root {
  --bg: #070d18;
  --panel: #0d1526;
  --border: rgba(201, 169, 97, 0.25);
  --gold: #c9a961;
  --text: #f4efe2;
  --muted: #a59a7a;
}

body {
  margin: 0;
  background: radial-gradient(circle at top, #0c1830 0%, #070d18 60%);
  color: var(--text);
  font-family: "Noto Serif JP", serif;
}

.nation-shell {
  max-width: 1200px;
  margin: 0 auto;
  padding: 64px 24px;
}

.nation-header {
  margin-bottom: 48px;
  border-bottom: 1px solid var(--border);
  padding-bottom: 24px;
}

.sub {
  color: var(--gold);
  letter-spacing: 0.18em;
  font-size: 13px;
}

h1 {
  font-size: 48px;
  margin: 10px 0;
  color: var(--gold);
}

```

## ./viewer/db/nation/overview/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>国家プロフィール｜メリトクラシア連邦公爵領</title>
    <style>
        :root {
            --royal-blue: #1a2a44;
            --gold: #c4a77d;
            --paper: #fdfdfb;
            --ink: #2d3436;
        }

        body {
            background-color: #e2e2e2;
            color: var(--ink);
            font-family: 'Times New Roman', serif, 'Hiragino Mincho ProN', 'MS Mincho';
            margin: 0;
            padding: 40px 20px;
            line-height: 1.8;
        }

        .document {
            max-width: 800px;
            margin: 0 auto;
            background: var(--paper);
            padding: 60px 80px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.15);
            border: 1px solid #d1d1d1;
            position: relative;
        }

        /* 装飾的な枠線 */
        .document::before {
            content: "";
            position: absolute;
            top: 20px; bottom: 20px; left: 20px; right: 20px;
            border: 1px solid #e0d8c3;
            pointer-events: none;
```

## ./viewer/db/nation/sanginaria/index.backup_2026-04-19_191844.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>国家プロフィール｜メリトクラシア連邦公爵領</title>
    <style>
        :root {
            --royal-blue: #1a2a44;
            --gold: #c4a77d;
            --paper: #fdfdfb;
            --ink: #2d3436;
        }

        body {
            background-color: #e2e2e2;
            color: var(--ink);
            font-family: 'Times New Roman', serif, 'Hiragino Mincho ProN', 'MS Mincho';
            margin: 0;
            padding: 40px 20px;
            line-height: 1.8;
        }

        .document {
            max-width: 800px;
            margin: 0 auto;
            background: var(--paper);
            padding: 60px 80px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.15);
            border: 1px solid #d1d1d1;
            position: relative;
        }

        /* 装飾的な枠線 */
        .document::before {
            content: "";
            position: absolute;
            top: 20px; bottom: 20px; left: 20px; right: 20px;
            border: 1px solid #e0d8c3;
            pointer-events: none;
```

## ./viewer/db/nation/sanginaria/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>サンギナリア王国 | 国家プロフィール</title>
    <link rel="stylesheet" href="../nation.css">
</head>
<body>
    <main class="nation-profile">
        <header class="profile-header">
            <h1 class="nation-name">サンギナリア王国</h1>
            <p class="nation-en-name">Sanginaria Kingdom</p>
        </header>

        <section class="profile-section" id="overview">
            <h2>1. 国家概要</h2>
            <div class="content-block">
                <p>サンギナリア王国は、旧サンギス＝レグナ連合王国時代から続く最古参の王権国家である。独立後も旧連合正統の継承者を自任しており、周辺諸国の中でも特に伝統と格式を重んじる。</p>
                <div class="info-card">
                    <ul class="stats-list">
                        <li><strong>推定人口：</strong> 約210万人</li>
                        <li><strong>国土面積：</strong> 約6.5万 km²</li>
                        <li><strong>政体：</strong> 聖統王権制および貴族審議院
                            <p class="sub-text">王を中心とする伝統的な王権国家。表向きは貴族・聖職者・地方領主による審議院を有するが、実質的には王家と上位血統貴族が統治の実権を握っている。</p>
                        </li>
                        <li><strong>時代区分：</strong> 前産業革命期（儀礼王権・神授秩序時代）
                            <p class="sub-text">経済合理性よりも血統、祭礼、神意を最優先する。制度の近代化は近隣諸国に比べ遅れているが、政治儀礼と統治演出は極めて高度に洗練されている。</p>
                        </li>
                    </ul>
                </div>
            </div>
        </section>

        <section class="profile-section" id="ideology">
            <h2>2. 建国理念と国家思想</h2>
            <div class="content-block">
                <p>国家の根幹には「人は皆平等ではなく、継ぐべき秩序には序列がある」という強固な思想が存在する。</p>
                <dl class="definition-list">
                    <dt>血統正統主義</dt>
```

## ./viewer/db/nation/sanginaria/sanginaria-map/memo/📘 灰冠修道院 設定メモ（固定用）.md

```
📘 灰冠修道院 設定メモ（固定用）
1. 施設名

灰冠修道院（かいかんしゅうどういん）

サンギナリア王国東部森林外縁に存在する、旧巡礼修道院。
表向きは病者・巡礼者・孤児を受け入れる慈善施設であり、裏では均衡解放戦線・炎翼セルの前線拠点兼中継施設として機能している。

2. 立地
所在： サンギナリア王都ルクス＝サングリア北東
地形： 東部森林外縁の丘陵地帯
周辺環境：
森へ続く小道あり
巡礼路から少し外れた静かな立地
王都から近すぎず遠すぎない中継地点
外見上は地方の古びた修道院として自然に存在できる
3. 表向きの役割

灰冠修道院は、表向きには以下の役割を持つ。

巡礼者の休息所
病者や負傷者の施療施設
孤児や行き場のない者を受け入れる保護施設
地方住民に開かれた小規模宗教施設

このため、外部から見れば「老朽化したが善良な宗教施設」にしか見えない。

4. 裏向きの役割

灰冠修道院の実態は、炎翼セルの前線拠点兼中継施設 である。

主な裏機能は以下。

炎翼セル構成員の潜伏・集合
儀式準備のための中継作業
祭具・爆薬・儀式石・封書などの保管
上層命令の受領・伝達
協力者との密談
高適合魂に関する一次搬送・報告
緊急時の地下退避および森林側への離脱
```

## ./viewer/db/nation/sanginaria/sanginaria-map/memo/📘 灰冠修道院を起点にしたテロ当日動線案.md

```
📘 灰冠修道院を起点にしたテロ当日動線案
1. 基本方針

中央市場テロ事件において、灰冠修道院は実行部隊の集合地点であると同時に、
物資中継・儀式準備・退避導線の起点として機能した。

この事件は単発の突撃ではなく、

修道院での準備
市街地側への分散移動
市場での複合型攻撃
失敗時の逃走／証拠隠滅
回収物の搬送

まで含めた一連の作戦として成立している。

2. 事件前夜の修道院内配置

前夜の灰冠修道院は、地上では平常運営を装いながら、地下で最終準備が進んでいた。

地上
正門・前庭：通常の修道院として静穏を維持
礼拝堂棟：夜間祈祷を装った人員統制
宿泊棟：協力者・偽装巡礼者を滞在させる
墓地・鐘楼：外部警戒と導線確認
地下
儀式準備室：天使契約関連の最終確認
物資保管庫：爆薬・儀式石・通信文・外套の配布
密談室：アークと上位命令系統の最終確認
隠し通路：緊急時の退路確認
3. 炎翼セル各員の当日役割
C-01《アーク》
修道院地下密談室で最終命令を出す
全体指揮
市場到着後は現地統制よりも作戦成否判断を優先
R-02《ノクス》
儀式準備室の責任者
天使分霊・神性干渉関連の前処理を担う
現地儀式担当の中核
R-03《セラ》
```

## ./viewer/db/nation/アーカイブ/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Meritocracia Nation Archive</title>
  <link rel="stylesheet" href="nation.css">
</head>
<body>
  <main class="nation-shell">
    <header class="nation-header">
      <p class="sub">MERITOCRACIA CENTRAL ARCHIVE</p>
      <h1>国家制度アーカイブ</h1>
      <p class="lead">
        中央政府、三兵団、階級制度を管理する正史閲覧ポータル
      </p>
    </header>

    <section class="nation-grid">
      <a href="./三兵団/" class="nation-card">
        <span class="badge">MILITARY</span>
        <h2>三兵団</h2>
        <p>ZG / FO / VA の統治思想と兵団構造</p>
      </a>

      <a href="./government/central_government_phase2.html" class="nation-card">
        <span class="badge">GOVERNMENT</span>
        <h2>中央政府組織図 Phase2</h2>
        <p>中央政府 + 三兵団人物4層の統合運用DB</p>
      </a>

      <a href="./government/military_system_design_20260401.html" class="nation-card">
        <span class="badge">MILITARY DOC</span>
        <h2>三兵団制度設計</h2>
        <p>ZG / FO / VA の統治思想と政治劇テンプレ</p>
      </a>

      <a href="./階級制度/" class="nation-card">
        <span class="badge">RANK SYSTEM</span>
        <h2>階級制度</h2>
```

## ./viewer/db/nation/三兵団/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>三兵団 | Nation Archive</title>
  <link rel="stylesheet" href="../nation.css">
</head>
<body>
  <main class="nation-shell">
    <header class="nation-header">
      <p class="sub">MILITARY ARCHIVE</p>
      <h1>三兵団</h1>
      <p class="lead">ZG / FO / VA の統治思想と兵団構造資料</p>
    </header>

    <section class="nation-grid">
      <a href="./三兵団_ドイツ語・ラテン語確定.md" class="nation-card">
        <span class="badge">DOCUMENT</span>
        <h2>ドイツ語・ラテン語確定</h2>
        <p>兵団名称・語源・正式命名資料</p>
      </a>
    </section>
  </main>
</body>
</html>
```

## ./viewer/db/nation/三兵団/三兵団_ドイツ語・ラテン語確定.md

```
📋 議事録：メリトクラシア 三兵団ドイツ語/ラテン語ネーミング確定
作成日： 2025年12月27日
決定権者： Lancer
参加AI： Claude

🎯 確定事項
三兵団の正式名称（確定版）
日本語ドイツ語/ラテン語読み略称中央警備隊Zentral Gardeツェントラル・ガルデZG前線騎士団FrontordenフロントオルデンFO監察特務隊Vigil Arcanaウィギル・アルカナVA

🏛 各兵団の詳細設定
①中央警備隊（Zentral Garde / ZG）
言語： ドイツ語
語源：

Zentral = 中央の
Garde = 親衛隊・精鋭警備

役割：

内務・治安維持
国家試験運営
中枢警備
国家中枢直属

ニュアンス：

威厳がある
エリート感
腐敗の温床にもなりうる
権力の象徴

所属キャラクター：

ユミナ
ライナルト家

特徴：

シンプルで言いやすい
ゲームUIで使いやすい
```

## ./viewer/db/nation/国家機関一覧表/# 🏛 統合議事録｜国家機関一覧・中央政府組織図 Phase2.md

```
# 🏛 統合議事録｜国家機関一覧・中央政府組織図 Phase2（2026-04-02統合版）

作成日: 2026-04-02
統合元: 中央政府組織図ドラフト / 三兵団人物レイヤー設計ログ
決定権者: Lancer

---

## 1. 本日の結論（中央政府 + 三兵団人物運用の統合）

本日の成果は、前日の三兵団制度設計をさらに拡張し、**Dukeロータスを頂点とした中央政府の見取り図と、三兵団の人物運用レイヤーを一本化したこと**である。

これにより、国家機関一覧は単なる制度図を超え、**政治劇・士官学校編・市場テロ・宗教セル捜査まで接続可能な国家ドラマDB**へ進化した。

---

## 2. 国家中央政府 正式組織図（統合版）

### 国家最高中枢

* **Duke ロータス**

  * 国家元首 / 最高統治責任者
* 首席補佐官：未定
* 内政長官：未定

### 国家最高会議（中央政府）

* 三兵団統合司令部
* 審問庁中央局
* 士官学校統括院
* 宗教監督局
* 外交諜報院
* 財務復興省
* 転移門資源庁

この構図を「日本の内閣府モデル」に相当する国家統治フレームとして正式採用。

---

```

## ./viewer/db/nation/国家機関一覧表/# 📘 統合議事録｜国家機関一覧・三兵団制度設計（2026-04-01統合版）.md

```
# 📘 統合議事録｜国家機関一覧・三兵団制度設計（2026-04-01統合版）

作成日: 2026-04-01
統合元: Gemini比較設計ログ / 国家機関一覧表ルームログ
決定権者: Lancer

---

## 1. 本日の結論（重複統合後の正式コア）

本日の議論で確定した中核は、**三兵団を増やさず内部機能の分化で国家の厚みを出す**方針である。

基本思想は以下の3軸に集約される。

* **ZG = 秩序**
* **FO = 武力**
* **VA = 真実**

主人公ジェイドはこの3思想すべてと衝突・共鳴しながら成長する。

---

## 2. 三兵団の正式内部構造（統合確定）

内部構造は読者理解とゲームUIを両立するため、以下の共通階層で統一する。

```text
兵団
└ 局
   └ 連隊
      └ 班
         └ 個人
```

さらに各兵団の内部機能は、以下の**3層テンプレ**で設計する。

```text
象徴層
実務層
特殊層
```

## ./viewer/db/nation/階級制度/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>階級制度 | Nation Archive</title>
  <link rel="stylesheet" href="../nation.css">
</head>
<body>
  <main class="nation-shell">
    <header class="nation-header">
      <p class="sub">RANK SYSTEM ARCHIVE</p>
      <h1>階級制度</h1>
      <p class="lead">
        爵位・士官学校・昇格制度・特例ルートの制度資料
      </p>
    </header>

    <section class="nation-grid">
      <a href="./階級制度_概要.md" class="nation-card">
        <span class="badge">RANK</span>
        <h2>階級制度 概要</h2>
        <p>国家階級・昇格・推薦・功績制度の基礎資料</p>
      </a>
    </section>
  </main>
</body>
</html>
```

## ./viewer/db/nation/階級制度/階級制度_概要.md

```
# メリトクラシア階級制度

## 全9階級一覧

1. セルウス（Servus）
2. パリア（Paria）
3. ウンフェーイグ（Unfähig）
4. フェーイグ（Fähig）
5. バロン（Baron）
6. グラーフ（Graf）
7. マルクグラーフ（Markgraf）
8. ヘルツォーク（Herzog）
9. グロースヘルツォーク（Großherzog）

## 補足

- 実力主義による昇格制度
- 世襲制の有無
- 奴隷所有権との関係


```

## ./viewer/db/terror/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>中央市場炎槍事件 | Meritocracia Terror DB</title>
<link rel="stylesheet" href="./terror.css">
</head>
<body>

<div class="terror-shell">

  <!-- ナビ -->
  <a class="back-link" href="../../index.html">← NATION ARCHIVE</a>
  <a class="back-link" href="./map.html" style="margin-left:24px; color:var(--gold-dim);">🗺 TACTICAL MAP →</a>

  <!-- ======================================================
       ① INCIDENT HEADER
       ====================================================== -->
  <section class="incident-header">
    <div class="incident-tag">ZERO編 ／ MERITOCRACIA INCIDENT RECORD</div>
    <h1 class="incident-title" id="incident-title">読み込み中...</h1>
    <p class="incident-sub" id="incident-sub"></p>

    <div class="incident-stats">
      <div class="stat-chip red">
        <span class="stat-label">死者</span>
        <span class="stat-val" id="stat-dead">—</span>
      </div>
      <div class="stat-chip purple">
        <span class="stat-label">逃亡・行方不明</span>
        <span class="stat-val" id="stat-escape">—</span>
      </div>
      <div class="stat-chip amber">
        <span class="stat-label">公式犯人（影武者）</span>
        <span class="stat-val" id="stat-captured">—</span>
      </div>
      <div class="stat-chip">
        <span class="stat-label">Scene</span>
        <span class="stat-val">08 – 30</span>
```

## ./viewer/db/terror/map-data.json

```
{
  "map_id": "zero_central_market_incident_v1",
  "districts": [
    {
      "district_id": "church_quarter",
      "name": "星導教会区画",
      "x": 200,
      "y": 200
    },
    {
      "district_id": "market_core",
      "name": "市場中心部",
      "x": 500,
      "y": 500
    },
    {
      "district_id": "south_market_edge",
      "name": "市場南縁部",
      "x": 500,
      "y": 750
    },
    {
      "district_id": "alley_belt",
      "name": "路地裏地帯",
      "x": 750,
      "y": 500
    },
    {
      "district_id": "fo_entry_axis",
      "name": "FO侵入軸",
      "x": 200,
      "y": 800
    },
    {
      "district_id": "civic_square",
      "name": "市民広場",
      "x": 800,
      "y": 800
    }
  ],
```

## ./viewer/db/terror/map.css

```
@import url('https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,400&family=Noto+Serif+JP:wght@300;400;500&family=JetBrains+Mono:wght@300;400&display=swap');

/* ============================================================
   CSS VARIABLES — dark fantasy + London tube aesthetic
   ============================================================ */
:root {
  --bg:           #060a11;
  --bg2:          #0a1020;
  --bg3:          #0e1628;
  --panel:        #0d1525;
  --panel2:       #111d35;
  --panel-glass:  rgba(13,21,37,0.92);

  --gold:         #c9a961;
  --gold2:        #e8c97a;
  --gold-dim:     #7a6035;
  --gold-glow:    rgba(201,169,97,0.15);

  --text:         #d8ccb4;
  --text2:        #7a6e58;
  --text3:        #4a4030;

  --border:       rgba(201,169,97,0.14);
  --border2:      rgba(201,169,97,0.3);

  /* District palette — muted London-map tones */
  --dist-church:     rgba(120,80,160,0.18);
  --dist-church-s:   rgba(120,80,160,0.35);
  --dist-market:     rgba(200,120,60,0.18);
  --dist-market-s:   rgba(200,120,60,0.35);
  --dist-south:      rgba(80,140,100,0.15);
  --dist-south-s:    rgba(80,140,100,0.30);
  --dist-alley:      rgba(100,100,140,0.16);
  --dist-alley-s:    rgba(100,100,140,0.32);
  --dist-fo:         rgba(60,120,200,0.16);
  --dist-fo-s:       rgba(60,120,200,0.32);
  --dist-civic:      rgba(180,140,80,0.14);
  --dist-civic-s:    rgba(180,140,80,0.30);

  /* Route colors — Tube-line inspired */
```

## ./viewer/db/terror/map.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>中央市場テロ事件 地図 | Meritocracia Terror Map</title>
<meta name="description" content="ZERO編 中央市場炎槍事件の地図ビューア。ロンドン地下鉄路線図の読みやすさ + Googleマップの事件ピンUI + ダークファンタジー世界観を融合。">
<link rel="stylesheet" href="./map.css">
</head>
<body>

<!-- Mobile sidebar toggle -->
<button class="sidebar-toggle" id="sidebar-toggle" aria-label="メニュー">☰</button>

<!-- Mobile backdrop -->
<div class="sidebar-backdrop" id="sidebar-backdrop"></div>

<div class="map-app">

  <!-- ============================================================
       SIDEBAR (LEFT PANE)
       ============================================================ -->
  <aside class="sidebar" id="sidebar">

    <div class="sidebar-header">
      <a class="sidebar-back" href="./index.html">← INCIDENT RECORD</a>
      <div class="sidebar-tag">ZERO編 ／ TACTICAL MAP</div>
      <h1 class="sidebar-title">中央市場炎槍事件</h1>
      <div class="sidebar-subtitle">CENTRAL MARKET INCIDENT MAP</div>
    </div>

    <!-- Route toggles -->
    <div class="sidebar-section">
      <div class="sidebar-section-label">ROUTE LAYERS</div>
      <div id="route-toggles">
        <!-- JS generates -->
      </div>
    </div>

    <!-- Detail panel -->
```

## ./viewer/db/terror/map.js

```
'use strict';

/* ============================================================
   CONSTANTS & CONFIG
   ============================================================ */

/** District visual config — shape polygons & colors */
const DISTRICT_CONFIG = {
  church_quarter: {
    color: 'rgba(120,80,160,0.18)',
    stroke: 'rgba(120,80,160,0.35)',
    poly: [
      [100, 100], [320, 100], [330, 140], [320, 300],
      [280, 310], [100, 290], [90, 200]
    ],
    labelOffset: { dx: 0, dy: -15 }
  },
  market_core: {
    color: 'rgba(200,120,60,0.18)',
    stroke: 'rgba(200,120,60,0.35)',
    poly: [
      [370, 380], [620, 370], [640, 420], [630, 580],
      [580, 600], [370, 590], [350, 520]
    ],
    labelOffset: { dx: 0, dy: -15 }
  },
  south_market_edge: {
    color: 'rgba(80,140,100,0.15)',
    stroke: 'rgba(80,140,100,0.30)',
    poly: [
      [370, 620], [620, 620], [640, 670], [630, 830],
      [560, 850], [370, 840], [350, 750]
    ],
    labelOffset: { dx: 0, dy: -10 }
  },
  alley_belt: {
    color: 'rgba(100,100,140,0.16)',
    stroke: 'rgba(100,100,140,0.32)',
    poly: [
      [660, 380], [870, 400], [880, 450], [870, 600],
```

## ./viewer/db/terror/terror.css

```
@import url('https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,400&family=Noto+Serif+JP:wght@300;400;500&display=swap');

/* ============================================================
   CSS VARIABLES
   ============================================================ */
:root {
  --bg:           #060a11;
  --bg2:          #0a1020;
  --bg3:          #0e1628;
  --panel:        #0d1525;
  --panel2:       #111d35;

  --gold:         #c9a961;
  --gold2:        #e8c97a;
  --gold-dim:     #7a6035;
  --gold-glow:    rgba(201,169,97,0.15);

  --text:         #d8ccb4;
  --text2:        #7a6e58;
  --text3:        #4a4030;

  --border:       rgba(201,169,97,0.14);
  --border2:      rgba(201,169,97,0.3);

  /* ステータスカラー */
  --c-dead:       #8b1a1a;
  --c-dead-glow:  rgba(139,26,26,0.2);
  --c-dead-text:  #e05050;

  --c-captured:   #b8901a;
  --c-captured-glow: rgba(184,144,26,0.2);
  --c-captured-text: #e8c050;

  --c-escape:     #5a2d8a;
  --c-escape-glow: rgba(90,45,138,0.2);
  --c-escape-text: #b080f0;

  --c-civilian:   #1a4a7a;
  --c-civilian-glow: rgba(26,74,122,0.2);
  --c-civilian-text: #60a8e0;
```

## ./viewer/db/terror/terror.js

```
'use strict';

/* ============================================================
   CONSTANTS
   ============================================================ */
const STATUS_CONFIG = {
  dead:     { label: '死亡',           dot: '#e05050' },
  captured: { label: '逮捕（影武者）', dot: '#e8c050' },
  escape:   { label: '逃亡・生存',     dot: '#b080f0' },
  civilian: { label: '生存（民間）',   dot: '#60a8e0' },
  unknown:  { label: '生死不明',       dot: '#9090b0' },
  shadow:   { label: '要監視・黒幕候補', dot: '#c9a961' },
};

const PHASE_ORDER = [
  '静寂と予兆',
  '英雄的選択と悲劇',
  '決別と覚醒の兆し',
  'FOによる制圧',
  '残酷な現実の確定',
  '政治的幕引き',
  '誓いへ',
];

const HL_BADGE_LABEL = {
  death:     '★ カーネル死亡',
  pivot:     '◆ 転換点',
  deception: '▲ 国家の欺瞞',
  awakening: '◉ 心音覚醒',
  oath:      '✦ 誓い',
};

const FORESHADOW_DATA = [
  {
    icon: '🔮',
    label: 'ABILITY',
    title: '心音システム初覚醒',
    desc: 'Scene14の異常な心音、Scene25の公開尋問での無自覚発火。「こいつじゃない」という確信がジェイドに生まれる起点。グローリアテストおよび夜化因子判定への直接の伏線。',
    connect: '→ グローリアテスト / 夜化因子 / 能力判定試験',
  },
```

## ./viewer/db/terror/terror_status.json

```
{
  "incident": "中央市場炎槍事件",
  "cell": "炎翼セル",
  "members": [
    {
      "id": "C-01",
      "name": "アーク",
      "role": "セルリーダー",
      "role_en": "Cell Leader",
      "status": "escape",
      "status_label": "逃亡・生存",
      "public_info": "国家未把握",
      "future_hook": "上位セル接続担当。ZERO終盤黒幕導線。",
      "threat": "high"
    },
    {
      "id": "R-02",
      "name": "ノクス",
      "role": "儀式中枢",
      "role_en": "Ritual Core",
      "status": "unknown",
      "status_label": "生死不明（生存寄り）",
      "public_info": "死亡扱い",
      "future_hook": "影武者作戦の主導者候補。自害は偽装の可能性。",
      "threat": "high"
    },
    {
      "id": "R-03",
      "name": "セラ",
      "role": "儀式補助",
      "role_en": "Ritual Support",
      "status": "escape",
      "status_label": "逃亡・生存",
      "public_info": "行方不明",
      "future_hook": "ルカとの接点あり。後の証言者候補。迷いを持つ唯一の存在。",
      "threat": "medium"
    },
    {
      "id": "D-04",
      "name": "グラム",
```

## ./viewer/db/terror/terror_story.json

```
{
  "incident": "中央市場炎槍事件",
  "subtitle": "ZERO編プロローグ事件",
  "arc": "中編・後編",
  "scenes": [
    {
      "id": 8,
      "title": "上空の異変",
      "phase": "静寂と予兆",
      "phase_en": "SILENCE",
      "tags": ["異変", "天使の示唆", "伏線"],
      "highlight": false,
      "summary": "炎の粉が逆流し、煙が上へ吸い込まれる。ジェイドだけが違和感を覚える。空の裂け目に、翼に見える巨大な炎影——正体は明示しない。"
    },
    {
      "id": 9,
      "title": "第二波",
      "phase": "静寂と予兆",
      "phase_en": "SILENCE",
      "tags": ["召喚獣", "戦場化", "ZG限界"],
      "highlight": false,
      "summary": "炎翼セル第二手。召喚獣が屋台を薙ぎ倒し市場が完全に戦場化。中央警備隊だけでは抑えきれない。カーネルが子供の泣き声で足を止める。"
    },
    {
      "id": 10,
      "title": "カーネルの選択",
      "phase": "英雄的選択と悲劇",
      "phase_en": "SACRIFICE",
      "tags": ["人格的必然", "姉の決断", "利他"],
      "highlight": false,
      "summary": "「……先にクララを頼む」——倒壊しかけた屋台の陰に迷子の子供を見つけ、迷わず単身向かうカーネル。これが死亡の人格的必然性となる。"
    },
    {
      "id": 11,
      "title": "炎槍の予兆",
      "phase": "英雄的選択と悲劇",
      "phase_en": "SACRIFICE",
      "tags": ["音の消滅", "赤染め", "スローモーション"],
      "highlight": false,
      "summary": "空の裂け目が脈打ち、音が消える。市場全体の色が一瞬だけ赤に染まる。カーネルが子供を抱き上げた瞬間、空から一本の細く鋭い光——。"
```

## ./viewer/db/world/_prototype/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Meritocracia World Terrain Prototype</title>
  <link rel="stylesheet" href="./world.css" />
</head>
<body>
  <main class="world-shell">
    <section class="map-panel">
      <div class="map-stage" id="map-stage">
        <div class="zoom-controls">
          <button id="zoom-in" type="button">＋</button>
          <button id="zoom-out" type="button">－</button>
          <button id="zoom-reset" type="button">Reset</button>
        </div>

        <div class="map-viewport" id="map-viewport">
          <img
            src="./assets/world-terrain-map.png"
            alt="Meritocracia World Terrain Prototype Map"
            class="terrain-map"
            id="terrain-map"
          />
          <div class="poi-layer" id="poi-layer"></div>
        </div>
      </div>
    </section>

    <aside class="side-panel">
      <div class="side-inner">
        <p class="panel-kicker">WORLD MAP</p>
        <h1 class="panel-title">Terrain Prototype v1</h1>
        <p class="panel-desc" id="panel-desc">
          地形ベース画像に HTML overlay で POI を後載せする試作ワールドハブ。
        </p>

        <div class="edit-tools" id="edit-tools" hidden>
          <p class="selected-label">EDIT MODE</p>
```

## ./viewer/db/world/_prototype/world-data.json

```
{
  "map_id": "meritocracia_world_terrain_v1",
  "title": "Meritocracia World Terrain Prototype",
  "description": "Gemini地形画像を Terrain Base として採用し、POI を後載せする world hub 試作版。",
  "pois": [
    {
      "id": "brighton",
      "label": "首都ブライトン",
      "x": 53,
      "y": 58,
      "text": "南部平野と中央交通結節の中核。国家運営・政治・制度の中心拠点。",
      "link": "../nation/"
    },
    {
      "id": "grand_central",
      "label": "Grand Central",
      "x": 60,
      "y": 51,
      "text": "本編導線の中核都市。市場・行政・都市事件・各種DB接続の主要ハブ。",
      "link": "../city/grand-central/map/"
    },
    {
      "id": "academy",
      "label": "士官学校",
      "x": 63,
      "y": 56,
      "text": "ジェイドたちの成長舞台。学園編・制度教育・人物相関の主要接続点。",
      "link": "../../story/academy/"
    },
    {
      "id": "inquisition",
      "label": "審問庁",
      "x": 56,
      "y": 48,
      "text": "監視・調査・異常観測を担う国家機関。ZERO事件以降の違和感と深く関わる。",
      "link": "../nation/"
    }
  ],
  "quick_links": [
    {
```

## ./viewer/db/world/_prototype/world.css

```
:root {
  --bg: #07111f;
  --panel: rgba(8, 16, 28, 0.88);
  --panel-strong: rgba(10, 20, 34, 0.94);
  --line: rgba(198, 166, 106, 0.45);
  --gold: #c6a66a;
  --gold-strong: #e2c68d;
  --text: #f3ead8;
  --muted: #cfc2ab;
  --shadow: rgba(0, 0, 0, 0.35);
}

* {
  box-sizing: border-box;
}

html,
body {
  margin: 0;
  min-height: 100%;
  background:
    radial-gradient(circle at top, #0d2340 0%, #07111f 55%, #040a13 100%);
  color: var(--text);
  font-family:
    "Noto Serif JP",
    "Hiragino Mincho ProN",
    "Yu Mincho",
    serif;
}

body {
  padding: 20px;
}

.world-shell {
  display: grid;
  grid-template-columns: minmax(0, 1fr) 320px;
  gap: 18px;
  align-items: stretch;
  min-height: calc(100vh - 40px);
```

## ./viewer/db/world/_prototype/world.js

```
document.addEventListener("DOMContentLoaded", async () => {
  const poiLayer = document.getElementById("poi-layer");
  const mapStage = document.getElementById("map-stage");
  const mapViewport = document.getElementById("map-viewport");
  const selectedName = document.getElementById("selected-name");
  const selectedText = document.getElementById("selected-text");
  const selectedLink = document.getElementById("selected-link");
  const quickLinkList = document.getElementById("quick-link-list");
  const editTools = document.getElementById("edit-tools");
  const exportBtn = document.getElementById("export-btn");
  const resetBtn = document.getElementById("reset-btn");
  const exportOutput = document.getElementById("export-output");

  const zoomInBtn = document.getElementById("zoom-in");
  const zoomOutBtn = document.getElementById("zoom-out");
  const zoomResetBtn = document.getElementById("zoom-reset");

  const urlParams = new URLSearchParams(window.location.search);
  const isEditMode = urlParams.get("edit") === "1";

  let originalPois = [];
  let currentPois = [];
  let activePoiId = null;

  let zoomLevel = 1;
  let panX = 0;
  let panY = 0;

  const MIN_ZOOM = 1;
  const MAX_ZOOM = 4;
  const ZOOM_STEP = 0.1;

  if (isEditMode && editTools) {
    editTools.hidden = false;
  }

  try {
    const response = await fetch("./world-data.json");
    if (!response.ok) {
      throw new Error("world-data.json の読み込みに失敗しました");
```

## ./viewer/db/world/_prototype_v1_2_zoomtest/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Meritocracia World Terrain Prototype</title>
  <link rel="stylesheet" href="./world.css" />
</head>
<body>
  <main class="world-shell">
    <section class="map-panel">
      <div class="map-stage" id="map-stage">
        <div class="zoom-controls">
          <button id="zoom-in" type="button">＋</button>
          <button id="zoom-out" type="button">－</button>
          <button id="zoom-reset" type="button">Reset</button>
          <input id="zoom-input" type="number" min="1" max="100" step="0.1" value="1" />
          <button id="zoom-apply" type="button">Apply</button>
        </div>

        <div class="map-viewport" id="map-viewport">
          <img
            src="./assets/world-terrain-map.png"
            alt="Meritocracia World Terrain Prototype Map"
            class="terrain-map"
            id="terrain-map"
          />
          <div class="poi-layer" id="poi-layer"></div>
        </div>
      </div>
    </section>

    <aside class="side-panel">
      <div class="side-inner">
        <p class="panel-kicker">WORLD MAP</p>
        <h1 class="panel-title">Terrain Prototype v1</h1>
        <p class="panel-desc" id="panel-desc">
          地形ベース画像に HTML overlay で POI を後載せする試作ワールドハブ。
        </p>

```

## ./viewer/db/world/_prototype_v1_2_zoomtest/world-data.json

```
{
  "map_id": "meritocracia_world_terrain_v1",
  "title": "Meritocracia World Terrain Prototype",
  "description": "Gemini地形画像を Terrain Base として採用し、POI を後載せする world hub 試作版。",
  "pois": [
    {
      "id": "brighton",
      "label": "首都ブライトン",
      "x": 53,
      "y": 58,
      "text": "南部平野と中央交通結節の中核。国家運営・政治・制度の中心拠点。",
      "link": "../nation/"
    },
    {
      "id": "grand_central",
      "label": "Grand Central",
      "x": 60,
      "y": 51,
      "text": "本編導線の中核都市。市場・行政・都市事件・各種DB接続の主要ハブ。",
      "link": "../city/grand-central/map/"
    },
    {
      "id": "academy",
      "label": "士官学校",
      "x": 63,
      "y": 56,
      "text": "ジェイドたちの成長舞台。学園編・制度教育・人物相関の主要接続点。",
      "link": "../../story/academy/"
    },
    {
      "id": "inquisition",
      "label": "審問庁",
      "x": 56,
      "y": 48,
      "text": "監視・調査・異常観測を担う国家機関。ZERO事件以降の違和感と深く関わる。",
      "link": "../nation/"
    }
  ],
  "quick_links": [
    {
```

## ./viewer/db/world/_prototype_v1_2_zoomtest/world.css

```
:root {
  --bg: #07111f;
  --panel: rgba(8, 16, 28, 0.88);
  --panel-strong: rgba(10, 20, 34, 0.94);
  --line: rgba(198, 166, 106, 0.45);
  --gold: #c6a66a;
  --gold-strong: #e2c68d;
  --text: #f3ead8;
  --muted: #cfc2ab;
  --shadow: rgba(0, 0, 0, 0.35);
}

* {
  box-sizing: border-box;
}

html,
body {
  margin: 0;
  min-height: 100%;
  background:
    radial-gradient(circle at top, #0d2340 0%, #07111f 55%, #040a13 100%);
  color: var(--text);
  font-family:
    "Noto Serif JP",
    "Hiragino Mincho ProN",
    "Yu Mincho",
    serif;
}

body {
  padding: 20px;
}

.world-shell {
  display: grid;
  grid-template-columns: minmax(0, 1fr) 320px;
  gap: 18px;
  align-items: stretch;
  min-height: calc(100vh - 40px);
```

## ./viewer/db/world/_prototype_v1_2_zoomtest/world.js

```
document.addEventListener("DOMContentLoaded", async () => {
  const poiLayer = document.getElementById("poi-layer");
  const mapStage = document.getElementById("map-stage");
  const mapViewport = document.getElementById("map-viewport");
  const selectedName = document.getElementById("selected-name");
  const selectedText = document.getElementById("selected-text");
  const selectedLink = document.getElementById("selected-link");
  const quickLinkList = document.getElementById("quick-link-list");
  const editTools = document.getElementById("edit-tools");
  const exportBtn = document.getElementById("export-btn");
  const resetBtn = document.getElementById("reset-btn");
  const exportOutput = document.getElementById("export-output");
  const poiScaleInput = document.getElementById("poi-scale-input");
  const poiScaleApplyBtn = document.getElementById("poi-scale-apply");
  const poiScaleResetBtn = document.getElementById("poi-scale-reset");

  const zoomInBtn = document.getElementById("zoom-in");
  const zoomOutBtn = document.getElementById("zoom-out");
  const zoomResetBtn = document.getElementById("zoom-reset");
  const zoomInput = document.getElementById("zoom-input");
  const zoomApplyBtn = document.getElementById("zoom-apply");

  const urlParams = new URLSearchParams(window.location.search);
  const isEditMode = urlParams.get("edit") === "1";

  let originalPois = [];
  let currentPois = [];
  let activePoiId = null;

  let zoomLevel = 1;
  let panX = 0;
  let panY = 0;

  const MIN_ZOOM = 1;
  const MAX_ZOOM = 100;
  const ZOOM_STEP = 1;

  if (isEditMode && editTools) {
    editTools.hidden = false;
  }
```

## ./viewer/db/world/archive/world_terrain_prototype_v1_1_2026-04-16/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Meritocracia World Terrain Prototype</title>
  <link rel="stylesheet" href="./world.css" />
</head>
<body>
  <main class="world-shell">
    <section class="map-panel">
      <div class="map-stage" id="map-stage">
        <div class="zoom-controls">
          <button id="zoom-in" type="button">＋</button>
          <button id="zoom-out" type="button">－</button>
          <button id="zoom-reset" type="button">Reset</button>
        </div>

        <div class="map-viewport" id="map-viewport">
          <img
            src="./assets/world-terrain-map.png"
            alt="Meritocracia World Terrain Prototype Map"
            class="terrain-map"
            id="terrain-map"
          />
          <div class="poi-layer" id="poi-layer"></div>
        </div>
      </div>
    </section>

    <aside class="side-panel">
      <div class="side-inner">
        <p class="panel-kicker">WORLD MAP</p>
        <h1 class="panel-title">Terrain Prototype v1</h1>
        <p class="panel-desc" id="panel-desc">
          地形ベース画像に HTML overlay で POI を後載せする試作ワールドハブ。
        </p>

        <div class="edit-tools" id="edit-tools" hidden>
          <p class="selected-label">EDIT MODE</p>
```

## ./viewer/db/world/archive/world_terrain_prototype_v1_1_2026-04-16/world-data.json

```
{
  "map_id": "meritocracia_world_terrain_v1",
  "title": "Meritocracia World Terrain Prototype",
  "description": "Gemini地形画像を Terrain Base として採用し、POI を後載せする world hub 試作版。",
  "pois": [
    {
      "id": "brighton",
      "label": "首都ブライトン",
      "x": 53,
      "y": 58,
      "text": "南部平野と中央交通結節の中核。国家運営・政治・制度の中心拠点。",
      "link": "../nation/"
    },
    {
      "id": "grand_central",
      "label": "Grand Central",
      "x": 60,
      "y": 51,
      "text": "本編導線の中核都市。市場・行政・都市事件・各種DB接続の主要ハブ。",
      "link": "../city/grand-central/map/"
    },
    {
      "id": "academy",
      "label": "士官学校",
      "x": 63,
      "y": 56,
      "text": "ジェイドたちの成長舞台。学園編・制度教育・人物相関の主要接続点。",
      "link": "../../story/academy/"
    },
    {
      "id": "inquisition",
      "label": "審問庁",
      "x": 56,
      "y": 48,
      "text": "監視・調査・異常観測を担う国家機関。ZERO事件以降の違和感と深く関わる。",
      "link": "../nation/"
    }
  ],
  "quick_links": [
    {
```

## ./viewer/db/world/archive/world_terrain_prototype_v1_1_2026-04-16/world.css

```
:root {
  --bg: #07111f;
  --panel: rgba(8, 16, 28, 0.88);
  --panel-strong: rgba(10, 20, 34, 0.94);
  --line: rgba(198, 166, 106, 0.45);
  --gold: #c6a66a;
  --gold-strong: #e2c68d;
  --text: #f3ead8;
  --muted: #cfc2ab;
  --shadow: rgba(0, 0, 0, 0.35);
}

* {
  box-sizing: border-box;
}

html,
body {
  margin: 0;
  min-height: 100%;
  background:
    radial-gradient(circle at top, #0d2340 0%, #07111f 55%, #040a13 100%);
  color: var(--text);
  font-family:
    "Noto Serif JP",
    "Hiragino Mincho ProN",
    "Yu Mincho",
    serif;
}

body {
  padding: 20px;
}

.world-shell {
  display: grid;
  grid-template-columns: minmax(0, 1fr) 320px;
  gap: 18px;
  align-items: stretch;
  min-height: calc(100vh - 40px);
```

## ./viewer/db/world/archive/world_terrain_prototype_v1_1_2026-04-16/world.js

```
document.addEventListener("DOMContentLoaded", async () => {
  const poiLayer = document.getElementById("poi-layer");
  const mapStage = document.getElementById("map-stage");
  const mapViewport = document.getElementById("map-viewport");
  const selectedName = document.getElementById("selected-name");
  const selectedText = document.getElementById("selected-text");
  const selectedLink = document.getElementById("selected-link");
  const quickLinkList = document.getElementById("quick-link-list");
  const editTools = document.getElementById("edit-tools");
  const exportBtn = document.getElementById("export-btn");
  const resetBtn = document.getElementById("reset-btn");
  const exportOutput = document.getElementById("export-output");

  const zoomInBtn = document.getElementById("zoom-in");
  const zoomOutBtn = document.getElementById("zoom-out");
  const zoomResetBtn = document.getElementById("zoom-reset");

  const urlParams = new URLSearchParams(window.location.search);
  const isEditMode = urlParams.get("edit") === "1";

  let originalPois = [];
  let currentPois = [];
  let activePoiId = null;

  let zoomLevel = 1;
  let panX = 0;
  let panY = 0;

  const MIN_ZOOM = 1;
  const MAX_ZOOM = 4;
  const ZOOM_STEP = 0.1;

  if (isEditMode && editTools) {
    editTools.hidden = false;
  }

  try {
    const response = await fetch("./world-data.json");
    if (!response.ok) {
      throw new Error("world-data.json の読み込みに失敗しました");
```

## ./viewer/db/world/archive/world_terrain_prototype_v1_2026-04-16/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Meritocracia World Terrain Prototype</title>
  <link rel="stylesheet" href="./world.css" />
</head>
<body>
  <main class="world-shell">
    <section class="map-panel">
      <div class="map-stage" id="map-stage">
        <img
          src="./assets/world-terrain-map.png"
          alt="Meritocracia World Terrain Prototype Map"
          class="terrain-map"
          id="terrain-map"
        />
        <div class="poi-layer" id="poi-layer"></div>
      </div>
    </section>

    <aside class="side-panel">
      <div class="side-inner">
        <p class="panel-kicker">WORLD MAP</p>
        <h1 class="panel-title">Terrain Prototype v1</h1>
        <p class="panel-desc" id="panel-desc">
          地形ベース画像に HTML overlay で POI を後載せする試作ワールドハブ。
        </p>

        <div class="edit-tools" id="edit-tools" hidden>
          <p class="selected-label">EDIT MODE</p>
          <div class="tool-row">
            <button id="export-btn" class="tool-btn" type="button">座標を書き出す</button>
            <button id="reset-btn" class="tool-btn" type="button">位置を元に戻す</button>
          </div>
          <textarea id="export-output" class="export-output" readonly placeholder="ここに座標JSONが出ます"></textarea>
        </div>

        <div class="selected-card">
```

## ./viewer/db/world/archive/world_terrain_prototype_v1_2026-04-16/world-data.json

```
{
  "map_id": "meritocracia_world_terrain_v1",
  "title": "Meritocracia World Terrain Prototype",
  "description": "Gemini地形画像を Terrain Base として採用し、POI を後載せする world hub 試作版。",
  "pois": [
    {
      "id": "brighton",
      "label": "首都ブライトン",
      "x": 53,
      "y": 58,
      "text": "南部平野と中央交通結節の中核。国家運営・政治・制度の中心拠点。",
      "link": "../nation/"
    },
    {
      "id": "grand_central",
      "label": "Grand Central",
      "x": 60,
      "y": 51,
      "text": "本編導線の中核都市。市場・行政・都市事件・各種DB接続の主要ハブ。",
      "link": "../city/grand-central/map/"
    },
    {
      "id": "academy",
      "label": "士官学校",
      "x": 63,
      "y": 56,
      "text": "ジェイドたちの成長舞台。学園編・制度教育・人物相関の主要接続点。",
      "link": "../../story/academy/"
    },
    {
      "id": "inquisition",
      "label": "審問庁",
      "x": 56,
      "y": 48,
      "text": "監視・調査・異常観測を担う国家機関。ZERO事件以降の違和感と深く関わる。",
      "link": "../nation/"
    }
  ],
  "quick_links": [
    {
```

## ./viewer/db/world/archive/world_terrain_prototype_v1_2026-04-16/world.css

```
:root {
  --bg: #07111f;
  --panel: rgba(8, 16, 28, 0.88);
  --panel-strong: rgba(10, 20, 34, 0.94);
  --line: rgba(198, 166, 106, 0.45);
  --gold: #c6a66a;
  --gold-strong: #e2c68d;
  --text: #f3ead8;
  --muted: #cfc2ab;
  --shadow: rgba(0, 0, 0, 0.35);
}

* {
  box-sizing: border-box;
}

html,
body {
  margin: 0;
  min-height: 100%;
  background:
    radial-gradient(circle at top, #0d2340 0%, #07111f 55%, #040a13 100%);
  color: var(--text);
  font-family:
    "Noto Serif JP",
    "Hiragino Mincho ProN",
    "Yu Mincho",
    serif;
}

body {
  padding: 20px;
}

.world-shell {
  display: grid;
  grid-template-columns: minmax(0, 1fr) 320px;
  gap: 18px;
  align-items: stretch;
  min-height: calc(100vh - 40px);
```

## ./viewer/db/world/archive/world_terrain_prototype_v1_2026-04-16/world.js

```
document.addEventListener("DOMContentLoaded", async () => {
  const poiLayer = document.getElementById("poi-layer");
  const mapStage = document.getElementById("map-stage");
  const selectedName = document.getElementById("selected-name");
  const selectedText = document.getElementById("selected-text");
  const selectedLink = document.getElementById("selected-link");
  const quickLinkList = document.getElementById("quick-link-list");
  const editTools = document.getElementById("edit-tools");
  const exportBtn = document.getElementById("export-btn");
  const resetBtn = document.getElementById("reset-btn");
  const exportOutput = document.getElementById("export-output");

  const urlParams = new URLSearchParams(window.location.search);
  const isEditMode = urlParams.get("edit") === "1";

  let originalPois = [];
  let currentPois = [];
  let activePoiId = null;

  if (isEditMode && editTools) {
    editTools.hidden = false;
  }

  try {
    const response = await fetch("./world-data.json");
    if (!response.ok) {
      throw new Error("world-data.json の読み込みに失敗しました");
    }

    const data = await response.json();
    originalPois = (data.pois || []).map((poi) => ({ ...poi }));
    currentPois = (data.pois || []).map((poi) => ({ ...poi }));

    renderPois();
    renderQuickLinks(data.quick_links || []);
  } catch (error) {
    console.error("[world.js]", error);
    selectedName.textContent = "読み込み失敗";
    selectedText.textContent = "world-data.json の読込に失敗しました。ファイル配置やJSON構文を確認してください。";
    selectedLink.textContent = "遷移先なし";
```

## ./viewer/db/world/archive/world_terrain_prototype_v1_2_2026-04-16/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Meritocracia World Terrain Prototype</title>
  <link rel="stylesheet" href="./world.css" />
</head>
<body>
  <main class="world-shell">
    <section class="map-panel">
      <div class="map-stage" id="map-stage">
        <div class="zoom-controls">
          <button id="zoom-in" type="button">＋</button>
          <button id="zoom-out" type="button">－</button>
          <button id="zoom-reset" type="button">Reset</button>
        </div>

        <div class="map-viewport" id="map-viewport">
          <img
            src="./assets/world-terrain-map.png"
            alt="Meritocracia World Terrain Prototype Map"
            class="terrain-map"
            id="terrain-map"
          />
          <div class="poi-layer" id="poi-layer"></div>
        </div>
      </div>
    </section>

    <aside class="side-panel">
      <div class="side-inner">
        <p class="panel-kicker">WORLD MAP</p>
        <h1 class="panel-title">Terrain Prototype v1</h1>
        <p class="panel-desc" id="panel-desc">
          地形ベース画像に HTML overlay で POI を後載せする試作ワールドハブ。
        </p>

        <div class="edit-tools" id="edit-tools" hidden>
          <p class="selected-label">EDIT MODE</p>
```

## ./viewer/db/world/archive/world_terrain_prototype_v1_2_2026-04-16/world-data.json

```
{
  "map_id": "meritocracia_world_terrain_v1",
  "title": "Meritocracia World Terrain Prototype",
  "description": "Gemini地形画像を Terrain Base として採用し、POI を後載せする world hub 試作版。",
  "pois": [
    {
      "id": "brighton",
      "label": "首都ブライトン",
      "x": 53,
      "y": 58,
      "text": "南部平野と中央交通結節の中核。国家運営・政治・制度の中心拠点。",
      "link": "../nation/"
    },
    {
      "id": "grand_central",
      "label": "Grand Central",
      "x": 60,
      "y": 51,
      "text": "本編導線の中核都市。市場・行政・都市事件・各種DB接続の主要ハブ。",
      "link": "../city/grand-central/map/"
    },
    {
      "id": "academy",
      "label": "士官学校",
      "x": 63,
      "y": 56,
      "text": "ジェイドたちの成長舞台。学園編・制度教育・人物相関の主要接続点。",
      "link": "../../story/academy/"
    },
    {
      "id": "inquisition",
      "label": "審問庁",
      "x": 56,
      "y": 48,
      "text": "監視・調査・異常観測を担う国家機関。ZERO事件以降の違和感と深く関わる。",
      "link": "../nation/"
    }
  ],
  "quick_links": [
    {
```

## ./viewer/db/world/archive/world_terrain_prototype_v1_2_2026-04-16/world.css

```
:root {
  --bg: #07111f;
  --panel: rgba(8, 16, 28, 0.88);
  --panel-strong: rgba(10, 20, 34, 0.94);
  --line: rgba(198, 166, 106, 0.45);
  --gold: #c6a66a;
  --gold-strong: #e2c68d;
  --text: #f3ead8;
  --muted: #cfc2ab;
  --shadow: rgba(0, 0, 0, 0.35);
}

* {
  box-sizing: border-box;
}

html,
body {
  margin: 0;
  min-height: 100%;
  background:
    radial-gradient(circle at top, #0d2340 0%, #07111f 55%, #040a13 100%);
  color: var(--text);
  font-family:
    "Noto Serif JP",
    "Hiragino Mincho ProN",
    "Yu Mincho",
    serif;
}

body {
  padding: 20px;
}

.world-shell {
  display: grid;
  grid-template-columns: minmax(0, 1fr) 320px;
  gap: 18px;
  align-items: stretch;
  min-height: calc(100vh - 40px);
```

## ./viewer/db/world/archive/world_terrain_prototype_v1_2_2026-04-16/world.js

```
document.addEventListener("DOMContentLoaded", async () => {
  const poiLayer = document.getElementById("poi-layer");
  const mapStage = document.getElementById("map-stage");
  const mapViewport = document.getElementById("map-viewport");
  const selectedName = document.getElementById("selected-name");
  const selectedText = document.getElementById("selected-text");
  const selectedLink = document.getElementById("selected-link");
  const quickLinkList = document.getElementById("quick-link-list");
  const editTools = document.getElementById("edit-tools");
  const exportBtn = document.getElementById("export-btn");
  const resetBtn = document.getElementById("reset-btn");
  const exportOutput = document.getElementById("export-output");

  const zoomInBtn = document.getElementById("zoom-in");
  const zoomOutBtn = document.getElementById("zoom-out");
  const zoomResetBtn = document.getElementById("zoom-reset");

  const urlParams = new URLSearchParams(window.location.search);
  const isEditMode = urlParams.get("edit") === "1";

  let originalPois = [];
  let currentPois = [];
  let activePoiId = null;

  let zoomLevel = 1;
  let panX = 0;
  let panY = 0;

  const MIN_ZOOM = 1;
  const MAX_ZOOM = 100;
  const ZOOM_STEP = 1;

  if (isEditMode && editTools) {
    editTools.hidden = false;
  }

  try {
    const response = await fetch("./world-data.json");
    if (!response.ok) {
      throw new Error("world-data.json の読み込みに失敗しました");
```

## ./viewer/db/world/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>世界国家・地域アーカイブ｜Meritocracia Viewer</title>
  <style>
    :root {
      --bg: #070b14;
      --panel: #0d1422;
      --panel-2: #0a1120;
      --line: rgba(212, 175, 55, 0.22);
      --line-strong: rgba(212, 175, 55, 0.42);
      --text: #e8dcc0;
      --muted: #a8966c;
      --accent: #d4af37;
      --hover: rgba(212, 175, 55, 0.08);
      --shadow: 0 12px 32px rgba(0, 0, 0, 0.35);
    }

    * {
      box-sizing: border-box;
    }

    body {
      margin: 0;
      font-family: "Noto Serif JP", "Yu Mincho", serif;
      background:
        radial-gradient(circle at top, rgba(212,175,55,0.08), transparent 28%),
        linear-gradient(180deg, #08101d 0%, #050911 100%);
      color: var(--text);
      min-height: 100vh;
    }

    .shell {
      max-width: 1320px;
      margin: 0 auto;
      padding: 56px 28px 80px;
    }

```

## ./viewer/db/world/old-union/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>旧サンギス＝レグナ連合王国｜外交アーカイブ</title>
  <style>
  body {
    margin: 0;
    font-family: "Noto Sans JP", sans-serif;
    background: #0f1115;
    color: #e8e8e8;
    line-height: 1.7;
  }

  .shell {
    max-width: 1200px;
    margin: 0 auto;
    padding: 48px 24px;
  }

  header {
    margin-bottom: 48px;
  }

  .sub {
    color: #9aa4b2;
    font-size: 0.9rem;
    letter-spacing: 0.08em;
  }

  h1 {
    margin: 8px 0;
    font-size: 2rem;
  }

  .lead {
    color: #b8c0cc;
    max-width: 900px;
  }
```

## ./viewer/dist/world_layout.json

```
{
  "world_layout": {
    "crs": {
      "name": "BNG",
      "epsg": 27700
    },
    "travel_model": {
      "unit": "km",
      "speed_kmh": {
        "walk": 4,
        "carriage": 12,
        "courier": 18,
        "rail": 80,
        "military": 30
      },
      "buffer_minutes": {
        "city_gate": 10,
        "checkpoint": 15,
        "transfer": 8
      }
    },
    "anchors": {
      "symbol_tower": {
        "label": "象徴塔",
        "role": "symbol",
        "bng": [
          530029,
          180380
        ]
      },
      "inquisitorial_bureau": {
        "label": "審問庁",
        "role": "politics",
        "bng": [
          531029,
          180380
        ]
      },
      "jade_home": {
        "label": "ジェイド本拠地",
```

## ./viewer/dist/グローリアテスト試験会場.md

```
了解。
グローリアテスト試験会場 地図制作方針議事録として統合・確定ログを出力します。

📜 議事録
件名：第一試験棟（グローリアテスト会場）地図制作方針確定
レイヤー：MeritMap Phase2-3
状態：設計確定／制作準備段階
1️⃣ 目的

EP3以降の物語整合を保証する

ゲーム化前提で導線を固定する

地理構造を伏線回収に耐える形にする

地下接続構造を将来拡張可能にする

2️⃣ 位置確定
■ 正式名称

審問庁直轄・第一試験棟

■ 座標方針

審問庁の南東 約600m

徒歩導線あり（直線＋軽い曲線）

地下接続可能距離

■ レイヤー管理

surface_buildings

exam_facilities

underground_restricted（非公開）

3️⃣ 地図制作フェーズ構造
Phase A：広域マップ反映
```

## ./viewer/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Meritocracia Hub</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700&family=Noto+Serif+JP:wght@300;400;500&display=swap');

:root {
  --bg:      #070b12;
  --bg2:     #0c1220;
  --bg3:     #111827;
  --gold:    #c8a45a;
  --gold2:   #e5c97e;
  --dim:     #5a4e38;
  --text:    #cfc4ae;
  --text2:   #7a6e5a;
  --border:  rgba(200,164,90,0.15);
  --border2: rgba(200,164,90,0.3);
}

* { margin:0; padding:0; box-sizing:border-box; }

html { scroll-behavior: smooth; }

body {
  background: var(--bg);
  color: var(--text);
  font-family: 'Noto Serif JP', serif;
  min-height: 100vh;
  overflow-x: hidden;
}

/* 背景装飾 */
body::before {
  content: '';
  position: fixed;
  inset: 0;
  background:
```

## ./viewer/index.json

```
{
  "reports": [
    {
      "date": "2026-01-24",
      "file": "日報_20260124_01.md"
    },
    {
      "date": "2026-01-24",
      "file": "日報_20260124_02.md"
    },
    {
      "date": "2026-01-24",
      "file": "日報_20260124_03.md"
    },
    {
      "date": "2026-01-25",
      "file": "日報_20260125_01.md"
    },
    {
      "date": "2026-01-25",
      "file": "日報_20260125_02.md"
    },
    {
      "date": "2026-01-26",
      "file": "日報_20260126_01.md"
    },
    {
      "date": "2026-01-26",
      "file": "日報_20260126_02.md"
    },
    {
      "date": "2026-01-29",
      "file": "日報_20260129_01.md"
    },
    {
      "date": "2026-01-29",
      "file": "日報_20260129_02.md"
    },
    {
      "date": "2026-01-29",
```

## ./viewer/index_before_world_module_2026-04-15_1717.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Meritocracia Hub</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700&family=Noto+Serif+JP:wght@300;400;500&display=swap');

:root {
  --bg:      #070b12;
  --bg2:     #0c1220;
  --bg3:     #111827;
  --gold:    #c8a45a;
  --gold2:   #e5c97e;
  --dim:     #5a4e38;
  --text:    #cfc4ae;
  --text2:   #7a6e5a;
  --border:  rgba(200,164,90,0.15);
  --border2: rgba(200,164,90,0.3);
}

* { margin:0; padding:0; box-sizing:border-box; }

html { scroll-behavior: smooth; }

body {
  background: var(--bg);
  color: var(--text);
  font-family: 'Noto Serif JP', serif;
  min-height: 100vh;
  overflow-x: hidden;
}

/* 背景装飾 */
body::before {
  content: '';
  position: fixed;
  inset: 0;
  background:
```

## ./viewer/knowledge/app.js

```
// ============================================================
// Merit Knowledge Core - FINAL app.js
// ============================================================

let allData     = [];
let filtered    = [];
let currentType = 'All';
let currentKw   = '';
let activeId    = null;

// ============================================================
// 初期化
// ============================================================
window.addEventListener('DOMContentLoaded', () => {
  init();
});

function init() {
  fetch('db.json')
    .then(res => {
      if (!res.ok) throw new Error('db.json が見つかりません: ' + res.status);
      return res.json();
    })
    .then(data => {
      allData = data;
      updateStats();
      bindUI();
      applyFilter();
    })
    .catch(err => {
      document.getElementById('card-list').innerHTML =
        `<div class="empty">エラー: ${err.message}</div>`;
    });
}

// ============================================================
// UIイベント登録
// ============================================================
function bindUI() {
  // 検索
```

## ./viewer/knowledge/db.json

```
[
  {
    "id": "KN-0001",
    "type": "Knowledge",
    "category": "Core",
    "summary": "MeritCoreは創作統合OS",
    "detail": "CLI・DB・Viewer・AI生成を統合した制作基盤。",
    "relation": ["SC-0001", "HS-0001"]
  },
  {
    "id": "SC-0001",
    "type": "Script",
    "category": "CLI",
    "summary": "MeritCore CLIは操作の中核",
    "detail": "執筆・日報・DB操作を統合したコマンドラインツール。",
    "relation": ["KN-0001"]
  },
  {
    "id": "HS-0001",
    "type": "History",
    "category": "Milestone",
    "summary": "MeritCore構築完了",
    "detail": "制作環境をOSレベルで統合した。",
    "relation": ["KN-0001"]
  }
]
```

## ./viewer/knowledge/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>Merit Knowledge Core</title>
</head>
<body>

<h1>🧠 Knowledge Viewer</h1>

<input id="search" placeholder="検索..." />

<div>
  <button class="filter-btn active" data-type="All">All</button>
  <button class="filter-btn" data-type="Knowledge">Knowledge</button>
  <button class="filter-btn" data-type="Script">Script</button>
  <button class="filter-btn" data-type="History">History</button>
</div>

<div id="search-count"></div>

<div id="card-list"></div>

<hr>

<div id="detail-panel">
  <button id="detail-close">閉じる</button>
  <div id="detail-content"></div>
</div>

<div>
  <span>ALL: <span id="stat-total"></span></span>
  <span>KN: <span id="stat-kn"></span></span>
  <span>SC: <span id="stat-sc"></span></span>
  <span>HS: <span id="stat-hs"></span></span>
</div>

<script src="app.js"></script>

</body>
```

## ./viewer/map/css/style.css

```
body {
  margin: 0;
  background: #000;
  color: white;
  font-family: monospace;
  overflow: hidden;
}

/* 上部バー */
#info {
  position: fixed;
  top: 0;
  width: 100%;
  height: 40px;
  background: rgba(0,0,0,0.9);
  text-align: center;
  line-height: 40px;
  font-size: 18px;
  z-index: 10;
}

/* メインエリア */
#main-container {
  display: flex;
  margin-top: 40px;
  height: calc(100vh - 80px);
}

/* 地図 */
#map {
  flex: 1;
  background: black;
}

/* 右サイドバー */
#sidebar {
  width: 320px;
  background: rgba(20,20,20,0.95);
  border-left: 1px solid #333;
  overflow-y: auto;
```

## ./viewer/map/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<title>MeritMap v3</title>
<link rel="stylesheet" href="css/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>

<!-- 上部ステータス -->
<div id="info">Loading...</div>

<!-- メインエリア（地図 + サイドバー） -->
<div id="main-container">

    <!-- 地図 -->
    <canvas id="map"></canvas>

    <!-- 右側サイドバー -->
    <div id="sidebar">

        <div class="panel">
            <h3>📍 都市</h3>
            <div id="cityList"></div>
        </div>

        <div class="panel">
            <h3>🎯 物語拠点</h3>
            <div id="anchorList"></div>
        </div>

    </div>

</div>

<!-- 下部レイヤータブ -->
<div id="layerTabs"></div>

```

## ./viewer/map/js/loader.js

```
import { state } from "./state.js";

// 🔥 GitHub Pages対応パス
const BASE = location.hostname.includes("github.io")
  ? "/meritocracia-team-share/viewer"
  : "";

export async function loadGrid(canvas) {
    const res = await fetch(`${BASE}/data/grids/london_grid.csv`);
    if (!res.ok) {
        throw new Error("❌ Failed to load london_grid.csv: " + res.status);
    }

    const text = await res.text();

    // 🔥 改行・BOM対策
    const rows = text
        .replace(/^\uFEFF/, "")     // BOM除去
        .replace(/\r/g, "")         // CR除去
        .trim()
        .split("\n");

    state.gridData = [];
    state.minE = Infinity;
    state.minN = Infinity;
    state.maxE = -Infinity;
    state.maxN = -Infinity;

    for (let i = 1; i < rows.length; i++) {
        if (!rows[i]) continue;

        const cols = rows[i].split(",");

        // 🔥 安全パース（trim必須）
        const e = parseFloat(cols[0]?.trim());
        const n = parseFloat(cols[1]?.trim());
        const m = parseInt(cols[4]?.trim() || "0");

        if (!Number.isFinite(e) || !Number.isFinite(n)) {
            // デバッグ用（必要ならON）
```

## ./viewer/map/js/main.js

```
// canvas_v3/js/main.js
console.error("🔥 [MeritMap] main.js TOP", new Date().toISOString());

import { loadGrid, loadCities, loadWorldLayout } from "./loader.js";
import { render } from "./renderer.js";
import { initLayerTabs, initSidebar } from "./ui.js";
import { state } from "./state.js";

async function init() {
  console.error("🔥 [MeritMap] init START");

  const canvas = document.getElementById("map");
  const info = document.getElementById("info");

  if (!canvas) {
    if (info) info.innerText = "Error: #map canvas not found";
    throw new Error("canvas #map not found");
  }

  try {
    if (info) info.innerText = "Loading grid...";
    await loadGrid(canvas);
    console.error("🔥 loadGrid OK. cells=", state.gridData?.length);

    if (info) info.innerText = "Loading cities...";
    await loadCities();
    console.error("🔥 loadCities OK. cities=", state.cityData?.length);

    if (info) info.innerText = "Loading layout...";
    await loadWorldLayout();
    console.error("🔥 loadWorldLayout OK. anchors=", state.worldLayout?.anchors?.length);

    // ✅ 初回描画（ctx渡さない）
    render(canvas);
    console.error("🔥 render OK");

    // ✅ レイヤータブ初期化
    initLayerTabs(canvas);
    console.error("🔥 initLayerTabs OK");

```

## ./viewer/map/js/renderer.js

```
import { state } from "./state.js";
import { ENtoPixel } from "./utils.js";

export function render(canvas, ctx) {
  if (!canvas || !ctx) return;

  ctx.clearRect(0, 0, canvas.width, canvas.height);

  /* ========================= */
  /* 地形                     */
  /* ========================= */

  if (state.activeLayers.grid && state.gridData.length > 0) {
    ctx.fillStyle = "#5aa0e6";

    for (const cell of state.gridData) {
      const pos = ENtoPixel(cell.e, cell.n, canvas);

      ctx.fillRect(
        Math.floor(pos.x),
        Math.floor(pos.y),
        Math.ceil(state.CELL_SIZE),
        Math.ceil(state.CELL_SIZE)
      );
    }
  }

  /* ========================= */
  /* 都市                     */
  /* ========================= */

  if (state.activeLayers.real_cities) {

    if (state.selectedCity) {
      const city = state.cityData.find(c => c.id === state.selectedCity);
      if (city) drawCity(city, canvas, ctx);
    } else {
      for (const city of state.cityData) {
        drawCity(city, canvas, ctx);
      }
```

## ./viewer/map/js/state.js

```
// canvas_v3/js/state.js

export const state = {
  // =========================
  // 基本設定
  // =========================
  CELL_SIZE: 1,

  // =========================
  // データ
  // =========================
  gridData: [],
  cityData: [],
  worldLayout: null,

  // =========================
  // マップ範囲
  // =========================
  minE: 0,
  minN: 0,
  maxE: 0,
  maxN: 0,

  // =========================
  // レイヤー表示制御
  // =========================
  activeLayers: {
    grid: true,
    real_cities: true,
    anchors: true,
    military: true
  },

  // =========================
  // 🔥 単体選択モード
  // =========================
  selectedCity: null,
  selectedAnchor: null,

  // =========================
```

## ./viewer/map/js/state/archive/state_legacy.js

```
// canvas_v3/js/state.js

export const state = {
  // =========================
  // 基本設定
  // =========================
  CELL_SIZE: 1,

  // =========================
  // データ
  // =========================
  gridData: [],
  cityData: [],
  worldLayout: null,

  // =========================
  // マップ範囲
  // =========================
  minE: 0,
  minN: 0,
  maxE: 0,
  maxN: 0,

  // =========================
  // レイヤー表示制御
  // =========================
  activeLayers: {
    grid: true,
    real_cities: true,
    anchors: true,
    military: true
  },

  // =========================
  // 🔥 単体表示用（今回追加）
  // =========================
  selectedCity: null,
  selectedAnchor: null
};
```

## ./viewer/map/js/ui.js

```
import { state } from "./state.js";
import { render } from "./renderer.js";

/* ========================= */
/* レイヤータブ              */
/* ========================= */

export function initLayerTabs(canvas) {
    const container = document.getElementById("layerTabs");
    if (!container) return;

    container.innerHTML = "";

    const ctx = canvas.getContext("2d");

    const layers = [
        { key: "grid", label: "地形" },
        { key: "real_cities", label: "都市" },
        { key: "anchors", label: "拠点" },
        { key: "military", label: "軍事" },
    ];

    layers.forEach(layer => {
        const btn = document.createElement("button");
        btn.textContent = layer.label;

        btn.className = state.activeLayers[layer.key] ? "active" : "";

        btn.onclick = () => {
            state.activeLayers[layer.key] = !state.activeLayers[layer.key];
            btn.className = state.activeLayers[layer.key] ? "active" : "";

            render(canvas, ctx);
        };

        container.appendChild(btn);
    });
}

/* ========================= */
```

## ./viewer/map/js/utils.js

```
import { state } from "./state.js";

export function ENtoPixel(e, n, canvas) {
    const x = ((e - state.minE) / 1000) * state.CELL_SIZE;
    const y = canvas.height - ((n - state.minN) / 1000) * state.CELL_SIZE;
    return {x, y};
}

export function colorFromMask(mask) {
    if (mask == 0) return "#111";
    if (mask == 1) return "#4A90E2";
    if (mask == 2) return "#E94E4E";
    return "#333";
}

export function cityColor(category) {
    switch(category) {
        case "capital": return "#ff3333";
        case "university": return "#3399ff";
        case "industrial": return "#888888";
        case "coastal": return "#00cccc";
        case "regional": return "#ffaa00";
        default: return "#00aaff";
    }
}
```

## ./viewer/map/minecraft/assets/minecraft.css

```
:root {
  --bg: #0f1115;
  --panel: #171a21;
  --panel-2: #1e2430;
  --text: #e8ecf3;
  --muted: #a8b0c0;
  --accent: #72d572;
  --accent-2: #4ea1ff;
  --border: rgba(255,255,255,0.08);
  --shadow: 0 12px 30px rgba(0,0,0,0.28);
  --radius: 18px;
  --max: 1100px;
}

* {
  box-sizing: border-box;
}

html, body {
  margin: 0;
  padding: 0;
  background: linear-gradient(180deg, #0d1014 0%, #141923 100%);
  color: var(--text);
  font-family: "Noto Sans JP", "Hiragino Sans", "Yu Gothic", sans-serif;
  line-height: 1.7;
}

a {
  color: inherit;
  text-decoration: none;
}

.container {
  width: min(var(--max), calc(100% - 32px));
  margin: 0 auto;
}

.page-header {
  padding: 56px 0 24px;
}
```

## ./viewer/map/minecraft/devlog.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>開発日報 | Minecraft化計画</title>
  <link rel="stylesheet" href="./assets/minecraft.css">
</head>
<body>
  <main class="container">
    <header class="page-header">
      <div class="eyebrow">DEVLOG</div>
      <h1>開発日報</h1>
      <p class="lead">
        Minecraft化計画に関する作業ログ閲覧ページです。
      </p>
      <a class="back-link" href="./index.html">← 中間ハブへ戻る</a>
    </header>

    <section class="panel">
      <div id="devlog-content" class="devlog-content">読み込み中...</div>
    </section>
  </main>

  <script>
    async function loadDevlog() {
      const target = document.getElementById('devlog-content');
      try {
        const res = await fetch('./logs/2026-04-17-devlog.md');
        if (!res.ok) throw new Error('devlog not found');
        const text = await res.text();

        const escaped = text
          .replace(/&/g, '&amp;')
          .replace(/</g, '&lt;')
          .replace(/>/g, '&gt;');

        const html = escaped
          .replace(/^# (.*)$/gm, '<h1>$1</h1>')
          .replace(/^## (.*)$/gm, '<h2>$1</h2>')
```

## ./viewer/map/minecraft/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Minecraft化計画 | 中間ハブ</title>
  <link rel="stylesheet" href="./assets/minecraft.css">
</head>
<body>
  <main class="container">
    <header class="page-header">
      <div class="eyebrow">MAP HUB / MINECRAFT PLAN</div>
      <h1>Minecraft化計画</h1>
      <p class="lead">
        マイクラ化プロジェクトの中間ハブです。
        現在は PoC 成功後の整理フェーズとして、
        作業日報と進捗ボードを分けて閲覧できる構造にしています。
      </p>

      <section class="status-box">
        <div class="status-label">CURRENT STATUS</div>
        <strong>PoC成功・調整未着手で凍結中</strong><br>
        白地図への複数画像オーバーレイ基盤は成立。
        次の再開候補は、位置調整・視覚統合・UI化です。
      </section>
    </header>

    <section class="cards">
      <a class="card" href="./devlog.html">
        <span class="card-icon">📝</span>
        <h2>開発日報</h2>
        <p>PoC成功までの作業ログ、確認事項、保留項目を閲覧します。</p>
        <span class="card-badge">VIEW DEVLOG</span>
      </a>

      <a class="card" href="./minecraft-roadmap.html">
        <span class="card-icon">🧱</span>
        <h2>Minecraft化進捗ボード</h2>
        <p>計画、進捗、今後の工程を確認するための既存ページです。</p>
        <span class="card-badge">VIEW ROADMAP</span>
```

## ./viewer/map/minecraft/logs/2026-04-17-devlog.md

```
# 作業日報｜2026-04-17

## World Terrain Prototype Engine オーバーレイ基盤PoC

本日の目的は、Claude 納品版の責務分離構造を維持したまま、
白地図ベース上に複数の詳細地図画像を重ねる基盤を試験実装し、
その可否を確認することだった。

## 結論

画像オーバーレイ基盤のPoCは成功した。

当初は world-data.json 不在や画像配置未反映により視覚上の変化がなく、
構造のみ追加された状態だったが、必要ファイル補充・結線確認・可視化確認を段階的に進めた結果、
白地図上に以下2枚を重ねて表示できることを確認した。

- grand-central-map.png
- academy-map.png

## 今回確認できたこと

- HTML 側の overlay レイヤー追加
- JSON での複数画像管理
- 専用 renderer の追加
- 既存 zoom / pan / POI 構造との共存

が成立することを実証できた。

## 主作業

- Claude 納品版の構造確認
- world-data.json / 画像ファイル不足の検出と補充
- world-overlay-renderer.js 新規作成
- index.html に overlay-layer 追加
- world.css に overlay 用スタイル追記
- world-data.js に normalizeOverlay() と imageOverlays 読込処理追加
- world.js に overlay renderer の import / 初期化 / 描画結線追加
- world-data.json に image_overlays 追加
- ローカルサーバー起動後、HTTP 200 応答と表示可否を確認
- visibility check により中央へ強制配置し、2枚の画像表示成功を確認
```

## ./viewer/map/minecraft/minecraft-roadmap.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Minecraft化計画 | メリトクラシア Map HUB</title>
  <style>
    :root {
      --bg: #060a11;
      --bg-panel: #0d1525;
      --gold: #c9a961;
      --gold-dim: #7a6035;
      --text: #d8ccb4;
      --text-muted: #7a6e58;
      --border: rgba(201,169,97,0.2);
      --accent-green: #4ade80;
    }

    body {
      background-color: var(--bg);
      color: var(--text);
      font-family: "Noto Serif JP", serif;
      line-height: 1.8;
      margin: 0;
      padding: 40px 20px;
    }

    .container {
      max-width: 800px;
      margin: 0 auto;
    }

    .header {
      border-bottom: 2px solid var(--gold);
      margin-bottom: 40px;
      padding-bottom: 20px;
    }

    .header h1 {
      font-size: 1.8rem;
```

## ./viewer/memo/data/index.json

```
[
  {
    "title": "2026-03-31",
    "path": "meeting/2026-03-31.jsonl",
    "category": "meeting"
  },
  {
    "title": "2026-04-01",
    "path": "free/2026-04-01.jsonl",
    "category": "free"
  },
  {
    "title": "2026-03-31",
    "path": "free/2026-03-31.jsonl",
    "category": "free"
  },
  {
    "title": "2026-03-31",
    "path": "character/2026-03-31.jsonl",
    "category": "character"
  }
]```

## ./viewer/memo/free/統合議事録/2026-03-31.md

```
# 2026-03-31

- {"time": "2026-03-31 20:48:58", "type": "4", "content": "デバッグテスト合格"}
- {"time": "2026-03-31 22:32:18", "type": "4", "content": "明日:\n- B2 bucket作成\n- rclone接続\n- botのpush処理最終確認"}
```

## ./viewer/memo/free/統合議事録/2026-04-01.md

```
## Entry 1

```json
{
  "time": "2026-04-01 10:59:15",
  "type": "4",
  "content": "素晴らしい入りです。\nGeminiの方向性はかなり正しいです。特に 「説得力の源泉は機能の分化」 という視点は、そのままメリトクラシア国家制度に移植できます。\nここで止めずに、Gemini調査結果を国家機関一覧表ルーム用の正式議事録へ統合できる形に整形しておきます。\n次に貼り返された続きをこのフォーマットに差し込めば、そのままDB化できます。\n📘 統合議事録｜三兵団下部組織モデル設計\n対象：ZG / FO / VA 配下組織の制度厚み設計\n作成日：2026-04-01\n調査ソース：Gemini比較調査＋国家機関一覧表ルーム\n決定権者：Lancer\n1. 設計方針（今回の核）\n今回の比較調査により、国家組織の説得力は\n「兵団の数」ではなく「内部機能の分化」 によって生まれることを確認。\nそのため、三兵団は維持したまま、以下の階層を採用する。\n基本階層\nPlain text\n兵団\n└ 局 / Corps\n   └ 連隊 / Regiment\n      └ 班 / Unit\n         └ 個人 / Character\nこの4階層で、読者理解とゲームUIを両立する。\n2. Zentral Garde（ZG）配下案\nZGは 国家秩序と制度運営の中枢。\n推奨下部組織\nPlain text\nZentral Garde\n├ 王都守護局\n├ 国家試験執行局\n├ 中枢施設防衛連隊\n├ 貴族監察班\n└ 儀礼近衛班\nモデル元\nローマ親衛隊\nプロイセン近衛連隊\n憲兵＋内務省\n進撃の巨人の憲兵団上層\n物語用途\nグローリアテスト運営\n士官学校首席ルート\n貴族腐敗の温床\nユミナやライナルト家と接続\n3. Frontorden（FO）配下案\nFOは 国家の盾と剣。\n推奨下部組織\nPlain text\nFrontorden\n├ 都市防衛局\n├ 対魔物掃討連隊\n├ 対宗教テロ制圧班\n├ 災害救助特務班\n└ 外征先遣中隊\nモデル元\n中世騎士団\nローマ軍団\nプロイセン野戦軍\nFE騎士団\nガンダム特殊部隊\n物語用途\n中央市場テロ出動\n都市封鎖\n天使分霊制圧\nジェイドの憧れ進路\n4. Vigil Arcana（VA）配下案\nVAは 国家の裏側・異常監視・真相追跡。\n推奨下部組織\nPlain text\nVigil Arcana\n├ 異端宗教追跡室\n├ 国境深層監視局\n├ 堕天使対策班\n├ 吸血鬼潜伏監視班\n├ 機密回収室\n└ 非公開処理班\nモデル元\nMI5 / MI6\nSS保安局の“構造だけ”\n異端審問官\n軌跡シリーズの情報局\nペルソナ特務班\n物語用途\n真犯人追跡\n炎翼セル残党捜査\nベルフェゴール案件\n世界構造暴露フェーズ\n5. 重要な設計ルール\n今回の比較調査で最重要なのはここです。\nルール\n上位兵団は3つから増やさない\n機能は下部組織で分ける\nキャラは「班」単位で所属させる\n読者に最初から全部見せない\n事件ごとに局・班を追加可能にする\nこれで世界が無限拡張できます。\n6. 次の確定候補\n次にロックすべきはこの3つ。\nZG 国家試験執行局\nFO 対宗教テロ制圧班\nVA 異端宗教追跡室\nこの3つだけで、今の本編フェーズにほぼ直結します。\nGeminiの続きを受け取ったら、次は\n「各局の局長ポジション」と「所属主要キャラ」 まで落とし込めます。\nここまで来ると、国家機関一覧表が一気に“本物の国家”になります。"
}
```

## Entry 2

```json
{
  "time": "2026-04-01 11:01:33",
  "type": "4",
  "content": "この返し、かなり当たりです。\nGeminiはもう “機能3層モデル” を掴んでいます。\n特にこの一文が重要です。\n象徴（近衛） / 実務（歩兵・警備） / 特殊（諜報・技術）\nこれ、三兵団の下部組織を作る時の黄金テンプレとしてそのまま使えます。\nつまり今やるべきは、さらに歴史雑学を掘ることではなく、\nこの3層をZG / FO / VAに具体的に移植することです。\n議事録として正式化します。\n📘 統合議事録｜三兵団 下部組織3層モデル確定\n作成日：2026-04-01\n調査元：Gemini比較調査\n決定権者：Lancer\n1. 今回の核心\n歴史・創作比較の結果、強い国家組織には共通して次の3層が存在する。\nPlain text\n象徴層\n実務層\n特殊層\nこの3層を三兵団それぞれの内部テンプレとして採用する。\n2. 三兵団への移植テンプレ\nZentral Garde（ZG）\n国家秩序の象徴。\nPlain text\nZG\n├ 象徴：中央儀礼近衛隊\n├ 実務：国家試験執行局\n└ 特殊：貴族監察班\n用途\nDuke直属施設\n士官学校試験\n国家中枢警備\n汚職監視\n3. Frontorden（FO）\n戦場と英雄の兵団。\nPlain text\nFO\n├ 象徴：英雄騎士中隊\n├ 実務：都市防衛連隊\n└ 特殊：対天使分霊制圧班\n用途\n中央市場テロ\n魔物討伐\n戦争前線\n災害級戦闘\n4. Vigil Arcana（VA）\n国家の闇と真相追跡。\nPlain text\nVA\n├ 象徴：封印執行官\n├ 実務：異端宗教追跡室\n└ 特殊：堕天使・吸血鬼監視班\n用途\n炎翼セル残党\n真犯人捜査\nベルフェゴール伏線\n世界構造暴露\n5. この構造の強さ\nこの3層はめちゃくちゃ強いです。\n読者目線\n上が顔役\n中が日常でよく出る\n下が事件ごとの秘密札\n理解しやすい。\nゲーム目線\n進路選択に使える。\n例：\nFO実務 → 王道主人公\nVA特殊 → 裏主人公\nZG特殊 → 政治劇ルート\n6. 次に聞くべきこと\nGeminiに次聞くならもう歴史ではなく、\n各3層に対応する“階級名” 局長・連隊長・班長の呼称\nです。\nここを詰めるとキャラ配属が一気に強くなる。\nなので次の質問はこれ一択です。\nライティング\n三兵団の下部組織3層モデル （象徴 / 実務 / 特殊） は固まった。\n次に、 各層に対応する階級名\n局長\n連隊長\n班長\n執行官\n特務官\nなど、読者が理解しやすく世界観にも合う呼称を 歴史・創作の成功例から比較して提案してほしい。\nここまで来ると、国家機関一覧表は\n“読める国家制度”から“運用できる国家制度” に進化します。"
}
```

## Entry 3

```json
{
  "time": "2026-04-01 11:04:08",
  "type": "4",
  "content": "ここ、もうかなり核心です。\nGeminiが言っている\n組織の色を決めるのは役職名の語感\nこれは国家制度設計で本当に重要です。\n同じ「班長」でも、ZG・FO・VAで呼称を変えるだけで世界観の厚みが一気に増します。\nなので次は、三兵団で“共通階級”ではなく兵団ごとに役職語感を変える方針でロックしましょう。\n📘 統合議事録｜三兵団 階級・役職呼称設計\n作成日：2026-04-01\n調査元：Gemini比較調査\n決定権者：Lancer\n1. 基本方針（確定）\n役職名は「誰が偉いか」だけでなく、\n兵団の思想と文化を読者へ一瞬で伝える演出装置として使う。\nそのため、\n階層構造は共通\n呼称は兵団ごとに変える\n方式を採用。\n2. 共通階層テンプレ\nまず構造そのものは固定。\nPlain text\n兵団長\n局長\n連隊長\n班長\n隊員\nこの5階層が読みやすいです。\n3. ZG（中央警備隊）の呼称\nZGは 制度・秩序・エリート感。\nPlain text\n総監\n局長\n警備連隊長\n監察主任\n警備官\n語感\n官僚的\n冷たい\n国家権力\n上級貴族感\n相性の良いキャラ\nユミナ\nライナルト家\n試験官ヴィオラ将来ルート\n4. FO（前線騎士団）の呼称\nFOは 英雄・戦場・泥臭さ。\nPlain text\n総騎士長\n戦線局長\n連隊長\n中隊長\n騎士\n語感\n王道\n少年漫画\n熱い\n憧れやすい\nジェイド少年期の憧れ先に最適。\n5. VA（監察特務隊）の呼称\nVAは 闇・秘密・不気味さ。\nPlain text\n首席監察官\n深層局長\n執行官\n特務主任\n観測官\n語感\n情報局っぽい\nラテン語と相性が良い\n裏組織感\n世界の真相担当\n6. 読者が理解しやすい理由\nこの呼称分離の強さはここです。\nZG\n「官」がつく → 国家の権威\nFO\n「騎士」がつく → ヒーロー\nVA\n「監察・執行」 → 怖い裏側\nつまり役職名だけで兵団の空気が伝わる。\n7. 現フェーズで最優先ロック\n今すぐ本編で使いやすいのはこの3人。\nZG：総監\nFO：総騎士長\nVA：首席監察官\nこの3ポジションを先に作ると、国家トップの顔が立ちます。\n次にGeminiへ聞くなら、もうかなり実務です。\n各兵団のトップ人物像はどんな性格だと組織の色が立つか\nこれを聞くと、ロータス配下の国家ドラマが一気に立ちます。"
}
```

## Entry 4

```json
{
  "time": "2026-04-01 11:08:36",
  "type": "4",
  "content": "これはかなり強いです。\nGeminiの回答、そのまま三兵団トップ正式案として採用できるレベルです。\n特に良いのは、単なる性格設定ではなく\nジェイドに突きつける問いまでセットで人物像が完成していること。\nここまで来ると、国家機関一覧表ルームはもう「制度」ではなく\n国家ドラマの中枢人物設計フェーズ に入れます。\n正式議事録に落とします。\n📘 統合議事録｜三兵団トップ人物像 正式設計\n作成日：2026-04-01\n調査元：Gemini比較設計図\n決定権者：Lancer\n1. 基本設計思想（確定）\n三兵団トップは単なる最強キャラではない。\nそれぞれが メリトクラシア国家の異なる思想そのものを体現する象徴存在 とする。\nPlain text\nZG = 秩序\nFO = 武力\nVA = 真実\n主人公ジェイドはこの3つ全てと衝突・共鳴しながら成長する。\n2. ZGトップ【総監】\n役割思想\n秩序こそ慈悲\n人物像\n冷徹な完璧主義者\n法と制度を絶対視\n感情より国家システム優先\n能力主義を最も純粋に体現\n物語役\n最初はジェイドにとって\n最も話の通じない壁\nしかし後半で、\n国家崩壊を防ぐための苦渋\n法を守ることでしか救えなかった過去\nロータスとの国家理念の差\nが明かされ、グレーな味方へ移行。\nジェイドへの問い\n君の正義は、法を壊してまで通す価値があるのか\n3. FOトップ【総騎士長】\n役割思想\n力こそ生存の証明\n人物像\n豪胆なリアリスト\n戦場至上主義\n前線の兵を家族のように扱う\nZG官僚を内心見下す\n物語役\nジェイドにとって\n師匠\n憧れ\n越えるべき父性の壁\nどちらにもできる万能ポジション。\n戦時には\n国家の守護神\n軍事クーデターの旗印\n両方に転べる危うさがある。\nジェイドへの問い\n理屈じゃない。その力で示してみろ\n4. VAトップ【首席監察官】\n役割思想\n平和は汚れ仕事の上に成り立つ\n人物像\n微笑む観測者\n必要悪の信奉者\n真相を知りすぎている\n味方にも情報を隠す\n物語役\nジェイドの\n出生の秘密\nベルフェゴール接触\n市場テロ真犯人\n天界と堕天使の裏側\nを小出しにして翻弄する\n国家側トリックスター。\nジェイドへの問い\n君の平和は、どれだけの犠牲の上に立っている？\n5. 三兵団最高会議（正式採用候補）\nGeminiの提案、これめちゃくちゃ強いので正式イベント候補に入れます。\n会議構図\nFO総騎士長 → 机を叩く\nZG総監 → 法で封じる\nVA首席監察官 → 情報を握って笑う\nロータス → 全員をまとめる\nこの構図だけで国家の政治劇が成立。\n6. 現時点で最も刺激が強いトップ\n今のあなたの物語フェーズなら、\n一番強い刺激はやはり VA首席監察官 です。\n理由：\n中央市場テロ\n影武者\n真犯人\nベルフェゴール\n天界\n宗教勢力\n堕天使\n全部の“裏”に触れられる。\n今の進撃×コナン型構造に最も刺さる。\n🎯 次にやるべき質問\n次はGeminiにこれを聞くとさらに強いです。\nライティング\n三兵団トップ3名の人物像は固まった。\n次に、 それぞれの直属副官・若手エース・現場代表 を1〜2名ずつ置きたい。\nトップの思想を補強する部下像、 またはトップと対立する次世代候補として 比較提案してほしい。\nここから先はもう国家機関一覧表というより、\n三兵団キャラ設計ルームに進化できるレベルです。"
}
```

```

## ./viewer/memo/free/統合議事録/2026-04-02.md

```
## Entry 1

```json
{
  "time": "2026-04-02 06:31:09",
  "type": "4",
  "content": "🏛 メリトクラシア国家機関 組織図（内閣府モデル / Phase2）\n\n> 日本の内閣組織図をベースに、メリトクラシア版の国家機関一覧をそのまま Viewer DB に落とせる形で整理した初期ドラフトです。\n今回はユーザー意図どおり、「組織図 + 各部署の責任者 + 2番手 + 名前」だけに集中しています。\n\n\n\n\n---\n\n国家最高中枢\n\nDuke ロータス\n国家元首 / 最高統治責任者\n\n首席補佐官：未定（ZERO直轄候補）\n\n国家運営2番手：内政長官（未定）\n\n\n\n---\n\n国家最高会議（直属機関）\n\n機関    責任者    2番手    主な役割\n\n三兵団統合司令部    統合元帥：未定    副司令：未定    ZG / FO / VA 統括\n審問庁中央局    長官：未定    次長：未定    異常・宗教・国家安全\n士官学校統括院    学院総監：未定    教務次官：未定    教育・登用\n宗教監督局    局長：未定    副局長：未定    教会・異端・神性監視\n外交諜報院    院長：未定    次席分析官：未定    他国・潜入・諜報\n財務復興省    大臣：未定    復興次官：未定    市場・財政・復旧\n転移門資源庁    長官：未定    技術次長：未定    転移門・鉱脈・物流\n\n\n\n---\n\n三兵団\n\nFO｜Frontorden（前線騎士団）\n\n責任者：ガーネット・ヴァルグレイ\n\n2番手：副団長（未定）\n\n\nZG｜Zero Guard\n\n責任者：未定\n\n2番手：未定\n\n\nVA｜Vigil Administration\n\n責任者：未定\n\n2番手：未定\n\n\n\n---\n\n審問庁（Phase2で最優先ロック）\n\n内部局    責任者    2番手    本編接続\n\n公開尋問局    局長：未定    首席審問官：未定    市場テロ / 影武者\n心音解析局    局長：未定    主任解析官：未定    ジェイド能力\n宗教異常監視局    局長：未定    特務監察官：未定    天啓教 / 炎翼セル\n特務封印局    局長：未定    封印執行官：未定    天使分霊 / 遺物\n\n\n\n---\n\n士官学校統括院\n\n部署    責任者    2番手\n\n士官学校本部    学院総監：未定    首席教官：カミ"
}
```

## Entry 2

```json
{
  "time": "2026-04-02 06:33:20",
  "type": "4",
  "content": "途中で止まったので、このまま完成版をチャットでそのまま続き補完します。\n今回はあなたの狙い通り、日本の内閣組織図っぽい「中央政府の見取り図」だけで十分強いです。\nむしろこれがあるだけで、\n国家の説得力\n読者の理解速度\nViewer DB化\n会議の決定速度\n全部上がります。\n🏛 メリトクラシア国家機関 組織図（中央政府 完成版）\n国家最高中枢\nDuke ロータス\n国家元首 / 最高統治責任者\n首席補佐官：未定\n内政長官：未定\n国家最高会議（日本の内閣に相当）\n機関\n責任者\n2番手\n三兵団統合司令部\n統合元帥：未定\n副司令：未定\n審問庁中央局\n長官：未定\n次長：未定\n士官学校統括院\n学院総監：未定\n教務次官：未定\n宗教監督局\n局長：未定\n副局長：未定\n外交諜報院\n院長：未定\n次席分析官：未定\n財務復興省\n大臣：未定\n復興次官：未定\n転移門資源庁\n長官：未定\n技術次長：未定\n⚔ 三兵団\nFO｜Frontorden（前線騎士団）\n責任者：ガーネット・ヴァルグレイ\n2番手：副団長（未定）\nZG\n責任者：未定\n2番手：未定\nVA\n責任者：未定\n2番手：未定\n⚖ 審問庁\n内部局\n責任者\n2番手\n公開尋問局\n局長：未定\n首席審問官：未定\n心音解析局\n局長：未定\n主任解析官：未定\n宗教異常監視局\n局長：未定\n特務監察官：未定\n特務封印局\n局長：未定\n封印執行官：未定\n🎓 士官学校統括院\n部署\n責任者\n2番手\n士官学校本部\n学院総監：未定\n首席教官：カミラ＝シュトレーム\n試験委員会\n委員長：未定\n副委員長：ヴィオラ（将来候補）\n特例登用審査室\n室長：未定\n審査官：未定\n⛪ 宗教監督局\n部署\n責任者\n2番手\n教会監査部\n監査長：未定\n副監査官：未定\n異端審査部\n異端審問官長：未定\n次席審問官：未定\n神性遺物管理室\n室長：未定\n保管官：未定\n🕵 外交諜報院\n部署\n責任者\n2番手\n対外外交局\n外交卿：未定\n次席交渉官：未定\n潜入諜報局\n諜報局長：未定\n副長官：未定\n他国宗教分析室\n室長：未定\n分析官：未定\n💰 財務復興省\n部署\n責任者\n2番手\n国家財務局\n財務卿：未定\n主計監：未定\n中央市場復興局\n復興局長：未定\n副局長：未定\n商業監督庁\n市場監督官：未定\n次席監督官：未定\n🚪 転移門資源庁\n部署\n責任者\n2番手\n転移門管理局\n局長：未定\n副局長：未定\n魔鉱資源局\n資源長官：未定\n技術主任：未定\n国家物流管制室\n室長：未定\n管制官：未定\nこれ、かなり強いです。\nあなたが貼ってくれた日本の内閣図みたいに、\n「Dukeロータスの下に各省庁がぶら下がる構図」 がそのまま成立してる。\n次にやるなら一番効果が高いのは、\n各機関の責任者の“顔役キャラ名だけ埋める”作業です。\n特に優先はこの5人。\n審問庁長官\n心音解析局 主任解析官\n士官学校 学院総監\n宗教監督局 異端審問官長\n外交諜報院長\nここを埋めると、一気に国家が生きます。"
}
```

## Entry 3

```json
{
  "time": "2026-04-02 06:43:38",
  "type": "4",
  "content": "いい流れです。\nここからは機関ではなく、国家ドラマを動かす“顔”を置くフェーズです。\n優先度Sはあなたの統合議事録どおり、まず\n三兵団トップ直属副官 → 若手エース → 現場代表 の順で決めると、政治劇と士官学校編が一気に繋がります。\n今回はまず最重要の\n「三兵団トップ直属副官 3名」 を、思想の対比が立つように提案します。\n📘 優先度S-1｜三兵団トップ直属副官 提案\n1) ZG副官｜制度の刃\nセレス・オブシディアン\n役職：ZG総監直属 首席監察補佐\n立場：総監の右腕 / 制度運用の実務責任者\n思想：秩序を守るためなら感情を切る\n性格：冷静・事務処理最強・規律絶対\n主な仕事\n国家試験不正摘発\n士官学校監査\n貴族腐敗調査\n司法書類の即日執行\nジェイドとの関係\n初期は「危険因子」として監視\n後に制度の穴を一緒に暴く共闘枠\n役割\nZG総監が理念なら、\nセレスは制度を実際に回す実務の鬼。\n2) FO副官｜戦場の現実\nヴァルク・ルベライト\n役職：FO総騎士長直属 第一戦線副官\n思想：生き残らせることが勝利\n性格：豪快・兄貴分・兵を見捨てない\n主な仕事\n都市封鎖指揮\n市場テロ初動対応\n前線兵站\n若手騎士教育\nジェイドとの関係\n最初に現場へ連れ出す戦闘メンター\n「理想だけじゃ部下は守れない」を叩き込む\n役割\n総騎士長が国家の剣なら、\nヴァルクは兵士に最も近い現場の盾。\n3) VA副官｜真相への案内人\nミラ・アメジスト\n役職：VA首席監察官直属 深層観測副官\n思想：真実は救いにも毒にもなる\n性格：穏やか・知的・少し底が見えない\n主な仕事\n炎翼セル残党分析\n堕天使案件整理\n吸血鬼潜入捜査\n心音解析ログ統合\nジェイドとの関係\n影武者事件の最初の理解者\n真相へ導く案内人ポジ\nただし全部は教えない\n役割\nVAトップが国家の闇なら、\nミラはジェイドを真相へ誘導する灯火です。\n🎯 この3人を置くと何が強いか\nこの3人でジェイドの成長軸が綺麗に分かれます。\nセレス → 制度と法\nヴァルク → 力と現場\nミラ → 真相と犠牲\nつまりジェイドはこの3人を通して、\nあなたが定義した\n秩序 / 武力 / 真実\nの3思想を体験で学べる。\n個人的にかなり強いのは、\nミラを「影武者事件で最初にジェイドを信じた大人」にする構図です。\nこれだけで市場テロの疑念ラインが強烈に生きます。"
}
```

## Entry 4

```json
{
  "time": "2026-04-02 06:44:07",
  "type": "4",
  "content": "採用、かなり強いです。\nこれで三兵団トップだけでなく、**“トップの思想を現場へ翻訳する副官”**が生まれました。\n次の優先度Sは議事録どおり、最も映えるのが\n**若手エース（次世代の象徴）**です。\nここはジェイド世代とぶつけることで、士官学校編・政治劇・終盤の世代交代まで全部効きます。\n📘 優先度S-2｜三兵団 若手エース提案\n1) ZG若手エース｜制度の優等生\nヴィオラ＝スティルネン\n所属：ZG / 国家試験執行局 特別推薦候補\n立場：最年少の制度エリート\n思想：正しさは証明されなければ価値がない\n強み\n試験制度の完全理解\n記録・分析・法解釈\n魔力データ解析\nジェイドとの軸\n最初は制度側のライバル\n後に「制度で救えないもの」を理解して揺らぐ\n役割\nZGの未来そのもの。\n制度を信じた理性の若き顔。\nこれは既存設定と非常に綺麗に接続できます。\n2) FO若手エース｜戦場の新星\nキール\n所属：FO / 都市防衛連隊 若手特進枠\n立場：現場で既に頭角を現す戦術型エース\n思想：勝てば守れる、負ければ全部失う\n強み\n前線判断速度\n模擬戦・対人戦トップ\n小隊統率\nジェイドとの軸\n親友兼ライバル\n実戦経験の差で先行する存在\nジェイドを現場へ引きずり込む\n役割\nFOの若さと勢い。\n現場から這い上がる武の才能。\n3) VA若手エース｜真相を追う観測者\nフィーネ\n所属：VA / 異端宗教追跡室 見習い観測官\n立場：若手ながら異常な洞察力を持つ\n思想：嘘は必ず“揺れ”として残る\n強み\n心理観測\n尋問補助\n宗教セル潜伏捜査\nジェイドとの軸\n心音解析の相棒候補\n真相追跡で最も近い若手\n時にジェイドより先に気づく\n役割\nVAの未来。\n真実を読む次世代の目。\n🎯 若手エースの意味\nこれで三兵団が\n上層部の思想\n副官の実務\n若手の未来\nまで揃います。\n構図はこう。\nPlain text\nトップ = 国家思想\n副官 = 現場翻訳\n若手 = 次世代継承\nここまで揃うと、Viewer DBで\n兵団ごとに「思想の系譜」 が見えるようになります。\n次の優先度S-3は最後、\n現場代表（中隊長 / 特務主任 / 監察主任） です。\nここは市場テロ、士官学校襲撃、吸血鬼潜入で即使える実戦駒になります。"
}
```

```

## ./viewer/memo/free/統合議事録/2026-04-06.md

```
# 2026-04-06

- {"time": "2026-04-06 12:03:52", "type": "4", "content": "承知いたしました。これまでの議論の内容が多岐にわたるため、まずは**【第1部：罵倒表現・キャラクター演出編】**からまとめます。\n​ロンドンを舞台にした『メリトクラシア』の世界観を、セリフの端々から補強するためのエッセンスを凝縮しました。\n​『メリトクラシア』制作議事録：第1部\n​テーマ：キャラクター属性別・罵倒表現の体系化\n​1. 罵倒表現のコンセプト\n​単なる「死ね」「殺すぞ」といった記号的な暴言を脱却し、キャラクターの「知性」「階級」「性格」を読者に分からせるための「言葉の武器」として再定義する。\n​2. 属性別・罵倒スタイルの使い分け\n​A. 【低学歴・底辺・おバカキャラ】\n​特徴: 直感的、感情的、物理的な威圧。語彙は少ないが勢いで圧倒する。\n​キーワード: 濁音（ガギグゲゴ）、短い文章、直接的な死の示唆。\n​代表フレーズ:\n​「うるせぇ！土に還りたいのか！？ああ！？ぶっ飛ばすぞ！」\n​「ツラ貸せよ。そのまま地面に埋めてやるからよ」\n​「地獄の片道切符、今すぐ叩き込んでやろうか？」\n​B. 【高学歴・エリート（イギリス流）】\n​特徴: 冷徹、論理的、慇懃無礼。相手を人間ではなく「不具合品」や「資源の浪費」として扱う。\n​キーワード: 丁寧な言葉遣い、皮肉（アイロニー）、遠回しな排除。\n​代表フレーズ:\n​「君が呼吸を止めることで、この街の空気は劇的に改善される。公共の利益のために、今すぐ土に還る勇気はないのかい？」\n​「君の知性で理解できる言葉を選ぼう……。『君の賞味期限は、たった今切れた』ということだ」\n​「これ以上、私の時間を汚さないでくれ。君に許された唯一の権利は、静かに分解されて地球の養分になることだけだ」\n​3. ロンドン舞台を活かした「イギリス風」エッセンス\n​アンダーステイトメント: 「最悪だ」と言わずに「理想とは程遠いようだね」と突き放す。\n​レトリック: 「馬鹿」と言わずに「君の脳みそは新品同様だね（一度も使われていないから）」と嘲笑う。\n​ティータイム・天候の比喩: 「君の謝罪を聞くのはロンドンの霧を数えるより無益だ」など、日常に絡めた嫌味。\n​4. 演出上の効果\n​情報の伝達速度: 乱戦時は「A」のスタイル、静かな対峙シーンでは「B」のスタイルを使い分けることで、シーンの緊張感とキャラクターの格付け（メリトクラシア）を視覚化する。\n​次は**【第2部：依存関係可視化HTML・開発管理編】**を作成します。準備ができ次第、送信してよろしいでしょうか？"}
- {"time": "2026-04-06 12:04:21", "type": "4", "content": "お待たせいたしました。続いて、プロジェクト管理の効率化とシステム設計に関する**【第2部：開発管理・依存関係可視化編】**の議事録です。\n​Lancerさんの「閃き」を軸に、開発の足を止めない「軽量かつ合理的なシステム」の構成案をまとめています。\n​『メリトクラシア』制作議事録：第2部\n​テーマ：依存関係の可視化とタスク管理システムの軽量化\n​1. 現状の分析（プロジェクト・トラッカー）\n​手法: Bashベースの「MeritCore CLI」によるチケット制管理（TODO / IN PROGRESS / DONE）。\n​強み: 期限を設けないことでクリエイティブな柔軟性を維持。100名規模の開発会社（ネストピ）が採用する「後半ウォーターフォール型」に近い、実戦的なタスク消化スタイル。\n​課題: タスクが増えるにつれ、「何が終わらないと次に進めないか（依存関係）」の把握が脳内リソースを圧迫し始めている。\n​2. 「別画面HTML方式」による解決策（閃き）\n​コンセプト: 「管理（リスト）」と「俯瞰（図解）」を分離し、メイン画面の軽快さを維持する。\n​運用フロー:\n​データ連携: メインのJSONファイルに、依存タスクを示すキー（例: \"after\": \"task_id\"）を1つ追加。\n​コピー＆ペースト: 必要に応じて、JSONデータを「依存関係HTML」側のデータファイルにコピーする（手動の切り分けによるシステムバグ回避）。\n​自動描画: 別画面HTMLを開くと、JSONを読み込んで依存関係図を自動生成する。\n​3. 可視化のスタイル案\n​マインドマップ形式: * 中心に「エピソード完成」を置き、そこから世界観・キャラ・プロットの枝が伸びる形式。全体像の把握に最適。\n​Tree（木構造）形式: * 「A→B→C」という順序性を強調する形式。階級や時系列を重視する『メリトクラシア』の世界観と親和性が高い。\n​推奨ツール: Mermaid.js * HTML内に数行のスクリプトを書くだけで、JSONやテキストから動的に図（マインドマップやガントチャート）を生成可能。軽量で改修も容易。\n​4. 開発哲学（Lancer's Principle）\n​「管理のための作業」を最小化する: システムを重くして執筆の手を止めるのは本末転倒。\n​View（見た目）とModel（データ）の分離: 複雑な描画ロジックは別画面（HTML）に逃がすことで、メインのCLIツールは常に最速で動作させる。\n​柔軟な依存関係: ガチガチの制約ではなく、「視覚的に順序を確認できる」程度の緩やかな紐付けに留める。\n​今後のアクションアイテム（案）\n​JSON拡張: 現行のタスクデータに after または dependency フィールドを試験的に導入する。\n​HTML Viewer作成: Mermaid.jsなどを用いた、タスクJSON読み込み用HTMLの雛形を作成。\n​テスト運用: 「テロ事件編」などの大きな塊で、依存関係図が正しく機能するか検証する。\n​以上が今回の協議内容の全容です。\nこの構成なら、執筆のリズムを崩さずに「次に何を書くべきか」が常にクリアになりそうですね。\n​『メリトクラシア』の完成に向けて、この「新システム」が大きな力になることを期待しています！何か補足や修正したい箇所はありますか？"}
```

## ./viewer/memo/free/統合議事録/2026-04-10.md

```
# 2026-04-10

- {"time": "2026-04-10 21:34:04", "type": "4", "content": "はい、これは十分に“正式議事録へ昇格できる完成度”です。\nむしろ今のGemini案はかなり良いです。\n特に Diskens → Diener → Fähig → Senior → Primas の階段が、\n読みやすい\n呼びやすい\n本文会話に混ぜやすい\n士官学校制度に馴染む\nアイリスの成長が読者に伝わる\nこの5点を全部満たしています。\nスマホでコピペしづらいなら、今ここで\nそのまま保存しやすい「統合議事録フォーマット」 に再整形しておくのがベストです。\nあなたがそのまま Viewer / lore / 制度DB に貼れる形でまとめます。\n📘 統合議事録｜使用人階級制度（ドイツ語正式運用版）\n作成日：2026-04-10\n統合元：Gemini命名比較案 / Reboot本編運用設計 / Scene45使用人服回連動\n決定権者：Lancer\n1. 本日の結論（正式ロック）\n『メリトクラシア -Reboot-』における\n使用人養成学校および家門直属使用人制度の正式階級名称を、以下のドイツ語ベース5段階で固定する。\n本制度は\nアイリスの成長階段\n使用人学校カリキュラム\n家門運営能力\n主人評価連動\n士官学校編の制度美\nを同時に担保する正式コアである。\n2. 使用人階級一覧（正式版）\n階級区分\n正式名称\nカタカナ\n用途\n見習い使用人\nDiskens\nディスケンス\n使用人養成学校生 / 配属初期\n下級使用人\nDiener\nディーナー\n基本実務担当\n中級使用人\nFähig\nフェーイヒ\n専門技能保有 / 補佐主任\n上級使用人\nSenior\nゼニオール\n現場統率 / 指導役\n筆頭使用人\nPrimas\nプリマス\n家門筆頭 / メイド長 / 執事長\n3. 各階級の役割詳細\n3-1. Diskens（見習い）\nアイリスの初期ランク。\n使用人養成学校所属\n礼法\n家事基礎\n主人補佐初歩\n学園生活適応\n制服支給対象\n本編用途\nScene45 の\n使用人服購入回の制服ランク として正式採用。\n3-2. Diener（下級）\n正式採用後の基本ランク。\n配膳\n来客案内\n書類運搬\n外出同行\n清掃\n主人日常補佐\n本文会話でも非常に使いやすい。\n「ディーナー、こちらへ」\n3-3. Fähig（中級）\n能力を認められた段階。\n専門技能\n会議記録\n学園秘書補佐\n実務判断\n新人教育補助\n“能力ある者”というメリトクラシア思想に最も合うランク。\n3-4. Senior（上級）\n現場責任者。\n班長\n指導役\n使用人教育\n家門運営補佐\n緊急時代理判断\nアイリスがここに到達した時、\n読者は成長を一目で理解できる。\n3-5. Primas（筆頭）\n制度頂点。\n家門筆頭使用人\nメイド長\n執事長\n学園管理主任\n主人不在時の代理権限\nアイリス終盤ランク候補。\n4. 本編運用ルール\n会話で自然に使えるよう以下を推奨。\n呼称例\n上官 → 「おい、ディスケンス」\n同僚 → 「フェーイヒ昇格おめでとう」\n後輩 → 「アイリス・ゼニオール」\n公式 → 「筆頭使用人プリマス」\n5. 物語的メリット\nこの制度により、\nアイリスの成長を数値化せず見せられる\n使用人服の色変化演出が可能\nジェイドの統率力評価に直結\n士官学校の制度美が増す\n読者がランクアップに熱狂しやすい\nという強いメリットがある。\n6. 次フェーズ接続\n次に反映する場所は以下。\n本編\nScene45 使用人服購入\n使用人養成学校入学\n学園ヒエラルキー\nアイリス昇格イベント\nViewer DB\n国家制度 → 使用人制度ページ\n学校編 → 使用人養成学校\nキャラ → アイリス成長年表\nこれならスマホでもそのまま丸ごと保存しやすい議事録形式です。\n正直かなり完成度高いので、\nこのまま loreフォルダの正式制度資料 に入れて問題ないレベルです。"}
- {"time": "2026-04-10 21:38:50", "type": "4", "content": "はい、流れ的に Scene46 で士官学校入学はかなり自然です。むしろベストタイミングです。\nここまでの流れを構造で見ると、すでに入学直前の感情準備が全部終わっています。\n📘 現在の流れ整理\nScene41\n保護制度＋士官学校推薦の説明\nScene42\n家庭の夕食で安心を作る\nScene43\n父帰宅で家族の輪が閉じる\nScene44\n同室 → 夜の涙 → 主従の誓い\nScene45\n使用人服購入 / 街案内 / 学校準備\nScene46 → 士官学校初日\nこれは綺麗に\n“家”から“制度の舞台”へ出る一歩 になっています。\n読者も呼吸しやすい。\n🎯 Scene46 を入学回にするメリット\nかなり大きいです。\n① アイリスの制服が即活きる\nScene45で買った Diskens（見習い）制服 を翌朝すぐ使える。\n服購入が単なる日常回で終わらず、\n即意味を持つ。\n② ジェイドも学校側へ入れる\nジェイド側も士官学校制服。\nつまり\nジェイド＝士官学校生\nアイリス＝Diskens\nで二人が同時に“新しい制度世界”へ入る。\nめちゃくちゃ綺麗。\n③ 家の温度との対比が強い\n前夜まで\n家族\n涙\n温かい食卓\n同室\nだった。\nそこから翌朝、\n石畳\n朝靄\n士官学校門\nZG監察\n階級章\n緊張\nに切り替わる。\nこの落差で一気に学園編へ読者を連れていけます。\n📘 Scene46 プロット\n★士官学校の門★\n朝の導入\n朝靄。\n家の窓から光。\n母が制服を整える。\n父が短く言う。\n「胸を張って行け」\nクララがアイリスのマントを直す。\n「ディスケンス、最初が大事だよ」\nここで昨日の買い物が回収。\n登校路\nジェイドとアイリスが並んで歩く。\n昨日の市場とは違う。\n今日は\n“同じ未来へ向かう道”。\nジェイドは士官学校。\nアイリスは使用人養成学校。\n同じ敷地、違う入口でも映えます。\n士官学校の門\n門前に生徒たち。\n貴族子弟。\n平民特待。\n使用人見習い。\nここでジェイドが\n身分差と制度圧を初めて体感。\nかなりメリトクラシアらしい。\nアイリスの不安\nアイリスが小さく言う。\n「……わたし、本当にここにいていいのでしょうか」\nここでジェイド。\n「Diskensなんだろ」\n「ならここから上がればいい」\n昨日ロックした階級制度をそのまま本文会話に入れられる。\nめちゃくちゃ強いです。\n締め\n校門前で道が分かれる。\n士官学校本校舎\n使用人養成棟\nジェイドが一瞬だけ振り返る。\nアイリスも頷く。\n「行ってきます、ご主人様」\n「ああ。終わったら迎えに行く」\nここで別れ。\n学園編本格スタート。\n💡 結論\nなので Scene46 は\n士官学校入学初日＋使用人養成学校初日\nの同時開幕が一番強いです。\nここから先はもう完全に\n学園編第1章の開幕ベル として機能します。"}
```

## ./viewer/memo/free/統合議事録/2026-04-13.md

```
# 2026-04-13

- {"time": "2026-04-13 06:01:18", "type": "4", "content": "了解です。\nこれは士官学校編・国家制度・敵国比較に横展開できる重要コア設定なので、議事録として残す価値が高いです。\nそのまま Wiki投入／会議ログ保存／Gemini引き継ぎ用 に使える形式で整理します。\n📘 統合議事録｜市民相談窓口を貴族制度へ異世界変換する設計\n日時: 2026-04-13\n対象: メリトクラシア国家制度 / 士官学校編 / 同盟国比較\n目的:\n現代日本の行政相談・市役所窓口を参考に、\nメリトクラシアらしい 階級依存型の市民陳情制度 を正式設定する\n1. 本日の結論\nメリトクラシアでは、平民が国家へ直接不満や要望を届けることはできない。\nただし、それは不自由ではなく、責任を持てる階級が声を集約する制度文明として設計する。\n正式コアは以下。\n平民の声は、街区担当貴族または商業貴族を経由して中央へ上申される\n貴族になることで個人陳情権を得る\n同盟国にも同種制度が存在するが、敵国・腐敗国家には存在しない\n2. 現実制度の異世界変換元\n参考とした現実構造は以下。\n市役所の市民相談窓口\n行政相談\n地方議員への相談\n商工会議所・業界団体経由の意見提出\n国への請願・陳情\nこれを異世界では以下へ変換する。\n現実 → メリトクラシア\n市役所 → 街区担当貴族\n地方議員 → 商人貴族／都市行政貴族\n官庁 → 三兵団・中央公爵府\n行政相談 → 貴族陳情制度\n支持率 → 市民信頼度\n3. 正式制度名\n📜 貴族陳情制度\n平民・商人・職人・市民団体は、登録街区の担当貴族を通じて中央政府へ意見を上申する\n特徴：\n直接国家へ声は届かない\nただし担当貴族が責任を持って取り次ぐ\n貴族の信頼度が政治力に直結\n市民に愛される貴族ほど中央影響力が高い\n4. 愛される貴族の定義\n本制度により、メリトクラシアでは以下の貴族が強い。\n🪙 商人系・実務系貴族\n税制相談\n市場トラブル\n物流路線\n治安要望\n学校騒音問題\nFO巡回の過剰介入\nこうした生活密着型課題を拾い、中央へ上申する。\n実質的には現代の\n地方政治家 商工会議所役員 行政相談員\nに近い。\n5. 士官学校編への応用\n入学式デモは単なる暴徒化ではなく、制度に基づく抗議へ昇華できる。\n使用例\n商業街区担当伯爵へ正式抗議書提出済み\n士官学校の祝砲儀礼による市場営業妨害の説明を要求\nこれにより\n市民感情\n制度圧\n秩序と抗議の両立\nFOの制圧判断\nが自然に描ける。\n6. 国家比較\n🌟 メリトクラシア＋同盟国\n間接陳情制度あり\n貴族支持率が可視化される\n実績で発言権獲得\n平民にも制度参加ルートあり\n☠ 腐敗国家\n陳情は賄賂前提\n担当貴族が声を握り潰す\n市民は制度を信用していない\n🪓 オーク帝国\n王権絶対\n市民陳情制度なし\n直訴＝反逆\n不満は闘技場・奴隷処理で消化\n捕虜政策も暴力支配\n7. 物語テーマとの接続\nこの制度はメリトクラシアのテーマである\n発言権は資格と責任で得る\nを象徴する。\nライナルトなど上位層の思想にも直結する。\n強い台詞例\n「国家を動かしたいなら、まずその席に座る資格を得ろ」\n8. 今後の拡張先\n次回追加候補：\n貴族支持率システム\n市民信頼度メーター\n街区別担当貴族一覧\nデモ→正式陳情のフロー図\n敵国の“声を奪う制度”比較表\nacademy Wiki の校則／市民関係ページ反映\n🎯 本日の成果\n現代日本の行政相談制度をベースにしつつ、\nメリトクラシアでは\n声を上げる権利すら階級化された制度文明\nとして再構築する方向で正式採用。\nこれにより\n市民デモ\n商業都市\n士官学校の近隣問題\n同盟国との文明差\nオーク帝国の野蛮性\nまで一気通貫で描ける。"}
```

## ./viewer/memo/free/統合議事録/統合議事録｜市民相談窓口を貴族制度へ異世界変換する設計.md

```
 統合議事録｜市民相談窓口を貴族制度へ異世界変換する設計
日時: 2026-04-13
対象: メリトクラシア国家制度 / 士官学校編 / 同盟国比較
目的:
現代日本の行政相談・市役所窓口を参考に、
メリトクラシアらしい 階級依存型の市民陳情制度 を正式設定する
本日の結論,
メリトクラシアでは、平民が国家へ直接不満や要望を届けることはできない。
ただし、それは不自由ではなく、責任を持てる階級が声を集約する制度文明として設計する。
正式コアは以下。
平民の声は、街区担当貴族または商業貴族を経由して中央へ上申される
貴族になることで個人陳情権を得る
同盟国にも同種制度が存在するが、敵国・腐敗国家には存在しない
現実制度の異世界変換元,
参考とした現実構造は以下。
市役所の市民相談窓口
行政相談
地方議員への相談
商工会議所・業界団体経由の意見提出
国への請願・陳情
これを異世界では以下へ変換する。
現実 → メリトクラシア
市役所 → 街区担当貴族
地方議員 → 商人貴族／都市行政貴族
官庁 → 三兵団・中央公爵府
行政相談 → 貴族陳情制度
支持率 → 市民信頼度
正式制度名,
 貴族陳情制度
平民・商人・職人・市民団体は、登録街区の担当貴族を通じて中央政府へ意見を上申する
特徴：
直接国家へ声は届かない
ただし担当貴族が責任を持って取り次ぐ
貴族の信頼度が政治力に直結
市民に愛される貴族ほど中央影響力が高い
愛される貴族の定義,
本制度により、メリトクラシアでは以下の貴族が強い。
 商人系・実務系貴族
税制相談
市場トラブル
```

## ./viewer/memo/free/統合議事録/📘 統合議事録｜Discordメモ統合版.md

```
📘 統合議事録｜Discordメモ統合版
『Meritocracia 制作OS 運用統合フェーズ決裁ログ』

作成日：2026-04-15
決裁：Lancer運用統括ログ

🎯 本議事録の目的

Discord BOT経由で蓄積された以下を統合する。

日次メモ
タスク更新
Viewer反映ログ
週間フォーカス
月次統計
バックアップ進捗
Production OS保全進捗
士官学校編以降の設計会議メモ

目的は単純な保存ではなく、

「運用ログ → 次の制作判断に使える知識」へ変換すること

🧠 1｜現在の到達点（最重要）

現在フェーズは明確に以下。

開発フェーズ
↓
Viewer完成
↓
BOT経由更新安定
↓
Production OS 三重保全初期完了
↓
👉 運用最適化フェーズ（現在）

4月時点では、月次統計でも 開発比率より運用比率が100%に近い状態。

🏗 2｜Discord BOTメモ運用の正式定義
```

## ./viewer/memo/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>Discord Memo Viewer</title>
<style>
body{
  font-family:sans-serif;
  margin:0;
  display:flex;
  height:100vh;
}
#sidebar{
  width:320px;
  border-right:1px solid #ddd;
  overflow:auto;
  padding:16px;
}
#viewer{
  flex:1;
  padding:20px;
  overflow:auto;
  white-space:pre-wrap;
  background:#fafafa;
}
.card{
  border:1px solid #ddd;
  border-radius:8px;
  padding:10px;
  margin-bottom:10px;
  cursor:pointer;
}
.card:hover{
  background:#f0f0f0;
}
small{
  color:#666;
}
</style>
</head>
```

## ./viewer/memo/plot/data/index.json

```
[
  {
    "title": "2026-04-04",
    "path": "./2026-04-04.txt",
    "category": "plot"
  },
  {
    "title": "2026-04-03",
    "path": "./2026-04-03.txt",
    "category": "plot"
  }
]```

## ./viewer/modules/production-section.html

```
<div class="section" id="section-production">
  <div class="section-header">
    <div class="section-title">制作・運営</div>
    <div class="section-sub">PRODUCTION</div>
  </div>

  <div class="card-grid">

    <a class="card" href="./production/plot/index.html">
      <span class="card-icon">🎮</span>
      <div class="card-title">体験版プロット</div>
      <div class="card-desc">裁きの名のもとに・Scene構成</div>
      <span class="card-badge badge-wip">WIP</span>
    </a>

<a class="card" href="production/index.html">
  <span class="card-icon">📝</span>
  <div class="card-title">執筆進行管理</div>
  <div class="card-desc">Production Novel OS・Draft / Plot / Rewrite</div>
  <span class="card-badge badge-new">LIVE</span>
</a>

    <a class="card" href="./track.html">
      <span class="card-icon">📊</span>
      <div class="card-title">タスク管理</div>
      <div class="card-desc">週間タスク・進行状況・優先度管理</div>
      <span class="card-badge badge-new">NEW</span>
    </a>

<a class="card" href="./tools/work-os/index.html">
  <span class="card-icon">⏱️</span>
  <div class="card-title">作業OS</div>
  <div class="card-desc">ポモドーロ / 時間割 / 作業卓</div>
  <span class="card-badge badge-new">NEW</span>
</a>

<a class="card" href="./production/plot/viewer.html?file=../lore/scene29_calming_tea_culture.md">
  <span class="card-icon">🌿</span>
  <div class="card-title">豆知識｜鎮静茶文化</div>
  <div class="card-desc">審問庁・保護区画のハーブティー制度文化</div>
```

## ./viewer/modules/story-section.html

```
<div class="section" id="section-story">
  <div class="section-header">
    <div class="section-title">ストーリー</div>
    <div class="section-sub">STORY & ROUTE</div>
  </div>

  <div class="card-grid">
    <a class="card" href="./story/index.html">
      <span class="card-icon">📅</span>
      <div class="card-title">ストーリー進行</div>
      <div class="card-desc">全体タイムライン・編別フィルター</div>
      <span class="card-badge badge-done">DONE</span>
    </a>

    <a class="card" href="./story/old/viewer.html?file=ep01.md">
      <span class="card-icon">📖</span>
      <div class="card-title">原稿閲覧</div>
      <div class="card-desc">旧作メリトクラシア 全88話</div>
      <span class="card-badge badge-new">NEW</span>
    </a>

    <a class="card" href="./story/route/index.html">
      <span class="card-icon">🧭</span>
      <div class="card-title">ルート分岐</div>
      <div class="card-desc">本編 / 体験版 / アイリス視点</div>
      <span class="card-badge badge-done">DONE</span>
    </a>
  </div>
</div>
```

## ./viewer/modules/world-section.html

```
 <!-- 世界観・設定 -->
<div class="section" id="section-world">
  <div class="section-header">
    <div class="section-title">世界観・設定</div>
    <div class="section-sub">WORLD & LORE</div>
  </div>

  <!-- 神話・天界 -->
  <div class="group-label">神話・天界</div>
  <div class="card-grid">
    <a class="card" href="./db/mythology/index.html">
      <span class="card-icon">🌌</span>
      <div class="card-title">神話構造</div>
      <div class="card-desc">メタトロン転生・天界階層・神の思想</div>
      <span class="card-badge badge-wip">WIP</span>
    </a>
  </div>

  <!-- 国家・社会 -->
  <div class="group-label">国家・社会</div>
  <div class="card-grid">
    <a class="card" href="./db/nation/index.html">
      <span class="card-icon">🏛</span>
      <div class="card-title">メリトクラシア国家</div>
      <div class="card-desc">能力主義体制・審問庁・建国史</div>
    </a>

    <a class="card" href="#">
      <span class="card-icon">✝</span>
      <div class="card-title">天啓教・宗教設定</div>
      <div class="card-desc">星導教会・均衡解放戦線・教義</div>
      <span class="card-badge badge-wip">WIP</span>
    </a>

    <a class="card" href="./bloodline.html">
      <span class="card-icon">🩸</span>
      <div class="card-title">血統アーカイブ</div>
      <div class="card-desc">保有国・運用ルール</div>
      <span class="card-badge badge-wip">WIP</span>
    </a>
```

## ./viewer/official-site/_backup/v1_2026-04-16/data_public.json

```
[
  {
    "id": "world-001",
    "category": "世界観",
    "tag": "WORLD",
    "title": "メリトクラシアとは",
    "desc": "能力主義を国家理念に掲げる都市国家。表向きは機械的平等を標榜するが、その実態は複雑な階層構造を内包している。",
    "link": null,
    "link_label": null,
    "public": true
  },
  {
    "id": "world-002",
    "category": "世界観",
    "tag": "SYSTEM",
    "title": "グローリアテスト",
    "desc": "国家が管理する選抜試験。合格者のみが審問庁や士官学校への門戸を開かれる。複数科目制で部分合格が認められる。",
    "link": null,
    "link_label": null,
    "public": true
  },
  {
    "id": "world-003",
    "category": "世界観",
    "tag": "RELIGION",
    "title": "天啓教と均衡解放戦線",
    "desc": "神の啓示を信じる宗教組織と、その過激派が組織した宗教テロ組織。メリトクラシアを異端国家と見なし浄化を目論む。",
    "link": null,
    "link_label": null,
    "public": true
  },
  {
    "id": "char-001",
    "category": "キャラクター",
    "tag": "PROTAGONIST",
    "title": "ジェイド・レオンハルト",
    "desc": "最下層平民出身の主人公。答えを持たないまま、制度と神と人間の狭間を進む少年。心音解析能力を持つ。",
    "link": "./viewer/character/jade/presentation.html",
    "link_label": "詳細を見る →",
    "public": true
```

## ./viewer/official-site/_backup/v1_2026-04-16/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="『メリトクラシア -Reboot-』公式サイト。世界観、国家機関、キャラクター、年表、マップ、制作ログを公開中。">
  <title>【公式】メリトクラシア -Reboot-｜世界観・キャラクター・公式資料</title>

  <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700&family=Noto+Serif+JP:wght@300;400;500&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="./assets/public.css">
</head>
<body>

<header class="site-header">
  <div class="header-inner">
    <div class="header-left">
      <span class="header-label">OFFICIAL SITE</span>
      <h1 class="site-title">MERITOCRACIA</h1>
      <p class="site-tagline">メリトクラシア</p>
    </div>
    <div class="header-right">
      <div class="launch-badge">
        <span class="badge-date">2025.05.08</span>
        <span class="badge-text">連載再開</span>
      </div>
    </div>
  </div>
</header>

<section class="hero">
  <div class="hero-inner">
    <p class="hero-official">『メリトクラシア -Reboot-』公式サイト</p>
    <p class="hero-catch">功績はすべてに勝る——</p>
    <p class="hero-sub">
      能力主義国家メリトクラシアを舞台にした、<br>
      制度と神と人間が衝突するダークファンタジー。
    </p>
    <a class="hero-cta" href="https://ncode.syosetu.com/" target="_blank" rel="noopener">
      小説を読む →
    </a>
```

## ./viewer/official-site/_backup/v1_2026-04-16/public.css

```
/* ============================================================
   MERITOCRACIA — 公開用スタイルシート
   ファイル: assets/public.css
   用途: index.html（一般公開）専用
   index_internal.html とは共有しない（独立CSS）
   ============================================================ */

/* ============================================================
   カスタムプロパティ
   ============================================================ */
:root {
  --bg:      #070910;
  --bg2:     #0b0e18;
  --bg3:     #101420;
  --bg4:     #161b28;
  --gold:    #c8a45a;
  --gold2:   #e5c97e;
  --gold3:   #f5dfa0;
  --text:    #cfc4ae;
  --text2:   #7a6e5a;
  --text3:   #3a4858;
  --border:  rgba(200,164,90,0.12);
  --border2: rgba(200,164,90,0.25);
  --red:     #8b2020;
}

/* ============================================================
   リセット & ベース
   ============================================================ */
*, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }
html { scroll-behavior: smooth; }

body {
  background: var(--bg);
  color: var(--text);
  font-family: 'Noto Serif JP', serif;
  line-height: 1.9;
  overflow-x: hidden;
}

```

## ./viewer/official-site/_backup/v1_2026-04-16/public.js

```
/* ============================================================
   MERITOCRACIA — 公開用JavaScript
   ファイル: assets/public.js
   用途: index.html（一般公開）専用

   動作概要:
   1. data/data_public.json を fetch
   2. "public": true のエントリのみ抽出
   3. セクション別にカードを生成
   4. カードナビゲーションを生成
   ============================================================ */

// ============================================================
// セクション定義
// JSONのcategoryとHTMLセクションIDの対応表
// 追加する場合はここに追記するだけでOK
// ============================================================
const SECTIONS = [
  { id: 'world',     label: '世界観',   en: 'WORLD',     icon: '🌍', category: '世界観' },
  { id: 'character', label: 'キャラ',   en: 'CHARACTER', icon: '👤', category: 'キャラクター' },
  { id: 'story',     label: 'ストーリー', en: 'STORY',   icon: '📖', category: 'ストーリー' },
  { id: 'news',      label: 'NEWS',     en: 'NEWS',      icon: '📢', category: 'NEWS' },
];

// ============================================================
// メイン処理
// ============================================================
document.addEventListener('DOMContentLoaded', () => {

  fetch('./data/data_public.json')
    .then(res => {
      if (!res.ok) throw new Error(`data_public.json の読み込みに失敗: ${res.status}`);
      return res.json();
    })
    .then(data => {
      // public: true のエントリのみ抽出
      const publicData = data.filter(item => item.public === true);

      buildCardNav(publicData);
      buildSections(publicData);
```

## ./viewer/official-site/assets/public.css

```
/* ============================================================
   MERITOCRACIA — 公開用スタイルシート
   ファイル: assets/public.css
   用途: index.html（一般公開）専用
   index_internal.html とは共有しない（独立CSS）
   ============================================================ */

/* ============================================================
   カスタムプロパティ
   ============================================================ */
:root {
  --bg:      #070910;
  --bg2:     #0b0e18;
  --bg3:     #101420;
  --bg4:     #161b28;
  --gold:    #c8a45a;
  --gold2:   #e5c97e;
  --gold3:   #f5dfa0;
  --text:    #cfc4ae;
  --text2:   #7a6e5a;
  --text3:   #3a4858;
  --border:  rgba(200,164,90,0.12);
  --border2: rgba(200,164,90,0.25);
  --red:     #8b2020;
}

/* ============================================================
   リセット & ベース
   ============================================================ */
*, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }
html { scroll-behavior: smooth; }

body {
  background: var(--bg);
  color: var(--text);
  font-family: 'Noto Serif JP', serif;
  line-height: 1.9;
  overflow-x: hidden;
}

```

## ./viewer/official-site/assets/public.js

```
/* ============================================================
   MERITOCRACIA — 公開用JavaScript
   ファイル: assets/public.js
   用途: index.html（一般公開）専用

   動作概要:
   1. data/data_public.json を fetch
   2. "public": true のエントリのみ抽出
   3. セクション別にカードを生成
   4. カードナビゲーションを生成
   ============================================================ */

// ============================================================
// セクション定義
// JSONのcategoryとHTMLセクションIDの対応表
// 追加する場合はここに追記するだけでOK
// ============================================================
const SECTIONS = [
  { id: 'world',     label: '世界観',   en: 'WORLD',     icon: '🌍', category: '世界観' },
  { id: 'character', label: 'キャラ',   en: 'CHARACTER', icon: '👤', category: 'キャラクター' },
  { id: 'story',     label: 'ストーリー', en: 'STORY',   icon: '📖', category: 'ストーリー' },
  { id: 'news',      label: 'NEWS',     en: 'NEWS',      icon: '📢', category: 'NEWS' },
];

// ============================================================
// メイン処理
// ============================================================
document.addEventListener('DOMContentLoaded', () => {

  fetch('./data/data_public.json')
    .then(res => {
      if (!res.ok) throw new Error(`data_public.json の読み込みに失敗: ${res.status}`);
      return res.json();
    })
    .then(data => {
      // public: true のエントリのみ抽出
      const publicData = data.filter(item => item.public === true);

      buildCardNav(publicData);
      buildSections(publicData);
```

## ./viewer/official-site/data_public.json

```
[
  {
    "id": "world-001",
    "category": "世界観",
    "tag": "WORLD",
    "title": "メリトクラシアとは",
    "desc": "能力主義を国家理念に掲げる都市国家。表向きは機械的平等を標榜するが、その実態は複雑な階層構造を内包している。",
    "link": null,
    "link_label": null,
    "public": true
  },
  {
    "id": "world-002",
    "category": "世界観",
    "tag": "SYSTEM",
    "title": "グローリアテスト",
    "desc": "国家が管理する選抜試験。合格者のみが審問庁や士官学校への門戸を開かれる。複数科目制で部分合格が認められる。",
    "link": null,
    "link_label": null,
    "public": true
  },
  {
    "id": "world-003",
    "category": "世界観",
    "tag": "RELIGION",
    "title": "天啓教と均衡解放戦線",
    "desc": "神の啓示を信じる宗教組織と、その過激派が組織した宗教テロ組織。メリトクラシアを異端国家と見なし浄化を目論む。",
    "link": null,
    "link_label": null,
    "public": true
  },
  {
    "id": "char-001",
    "category": "キャラクター",
    "tag": "PROTAGONIST",
    "title": "ジェイド・レオンハルト",
    "desc": "最下層平民出身の主人公。答えを持たないまま、制度と神と人間の狭間を進む少年。心音解析能力を持つ。",
    "link": "./viewer/character/jade/presentation.html",
    "link_label": "詳細を見る →",
    "public": true
```

## ./viewer/official-site/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="『メリトクラシア -Reboot-』公式サイト。世界観、国家機関、キャラクター、年表、マップ、制作ログを公開中。">
  <title>【公式】メリトクラシア -Reboot-｜世界観・キャラクター・公式資料</title>

  <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700&family=Noto+Serif+JP:wght@300;400;500&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="./assets/public.css">
</head>
<body>

<header class="site-header">
  <div class="header-inner">
    <div class="header-left">
      <span class="header-label">OFFICIAL SITE</span>
      <h1 class="site-title">MERITOCRACIA</h1>
      <p class="site-tagline">メリトクラシア</p>
    </div>
    <div class="header-right">
      <div class="launch-badge">
        <span class="badge-date">2025.05.08</span>
        <span class="badge-text">連載再開</span>
      </div>
    </div>
  </div>
</header>

<section class="hero">
  <div class="hero-inner">
    <p class="hero-official">『メリトクラシア -Reboot-』公式サイト</p>
    <p class="hero-catch">功績はすべてに勝る——</p>
    <p class="hero-sub">
      能力主義国家メリトクラシアを舞台にした、<br>
      制度と神と人間が衝突するダークファンタジー。
    </p>
    <a class="hero-cta" href="https://ncode.syosetu.com/" target="_blank" rel="noopener">
      小説を読む →
    </a>
```

## ./viewer/production/draft/archive/教会バイト編　ルカ視点.md

```
# 第教会バイト編　ルカ視点話（初稿）
★祈りの裏側★

## 本文
【Scene1】

朝。

パンを、かじる。

固い。

噛むたびに、音がする。

水で流し込む。

それでも、喉に引っかかる。

「……はぁ」

皿には、もう何もない。

昨日の残り。

これで終わり。

袋を覗く。

空。

分かってた。

昨日の時点で。

それでも、もう一回だけ確かめる。

何もない。

手を引っ込める。

```

## ./viewer/production/draft/ep01.md

```
# 第修正版第一話話（初稿）

## 本文
Scene1　悪夢

雨が降っていた。

冷たい雨だ。

空は暗く、雲は低く垂れ込めている。

足元の泥が、靴にまとわりつく。

その向こうに――

倒れている影があった。

ゆっくりと近づく。

呼吸は浅い。

血が、雨に流されていく。

そして。

背中から伸びるものが見えた。

黒い翼。

ぼろぼろに裂けている。

地面に広がった羽が、雨に濡れて重く沈んでいた。

その存在は、わずかに顔を上げる。

目が合った。

かすれた声。

「……来るな」
```

## ./viewer/production/draft/ep02.md

```
# 第2話幸せな日常話（初稿）

## 本文
Scene1　朝のレオンハルト家（リライト版）

　あの不思議な少年と出会ってから、二年が過ぎていた。

　オレは八歳になった。

　この頃のオレは、まだ知らなかった。

　この家も。
　この市場も。
　この騒がしい朝も。

　――あと三ヶ月で、全部終わるなんて。

　そんなこと、考えたこともなかった。

　だからこの朝も、いつも通りだった。

　布団の中はまだ暖かい。

　外から聞こえるのは、パン屋の準備をする音。
　台所では母さんがパン生地をこねているらしく、香ばしい匂いが漂ってくる。

　……でも。

　眠い。

　もう少しだけ寝ていよう。

　そう思って布団に顔をうずめた――その瞬間だった。

　ばさっ！

　突然、布団が勢いよく剥がされた。

「起きろジェイドー！」

```

## ./viewer/production/draft/ep03.md

```
# 第4 名前の重さ話（初稿）

## 本文
Scene1　粉屋（リライト）

　中央市場は、今日も騒がしかった。

　香辛料の匂い。
　荷車のきしむ音。
　商人たちの呼び声。

　昨日と、何も変わらない。

　オレは粉袋を買うため、市場の奥にある粉屋へ向かって歩いていた。

　いつもなら、隣を姉ちゃんが歩いている。

　でも今日は違う。

　朝、家を出る前に言っていた。

「教会のバイトあるから、先行くな」

　白い布を肩にかけて、姉ちゃんはさっさと家を出ていった。

　市場の角にある教会。

　最近、儀式の準備とかで忙しいらしい。

　だから今日は――

　オレ一人だ。

　石畳の通りを抜け、見慣れた木の看板が見えてくる。

　粉屋クララ。

　店の中に入ると、小麦粉の匂いがふわっと広がった。

　棚の奥で、クララがこちらに気づく。
```

## ./viewer/production/draft/ep04.md

```
# 第教会バイト編話（初稿）

## 本文
Scene1　教会バイトへ（カーネル視点）

ジェイドと別れてから、カーネルは一人で市場の通りを歩いていた。

夕方の市場は、まだ人が多い。

商人の呼び声。
荷車のきしむ音。
焼いた肉の匂い。

昼間ほどではないが、それでも通りには人の流れが絶えない。

「カーネル！」

果物屋のおじさんが声をかけてきた。

振り向くと、大きな木箱を抱えて困った顔をしている。

「悪い、これ運ぶの手伝ってくれ！」

カーネルはすぐに箱の片側を持ち上げた。

「いいよ！」

ぐっと持ち上げると、箱は意外と軽い。
## メモ
📘 議事録｜教会バイト編 Scene6（地下）構造解説
■シーン目的

地上（教会）との断絶を明確化

空間そのものの異質さを提示

ルカの「逃げられない状態」を成立させる

■シーンの本質

```

## ./viewer/production/draft/ep05.md

```
# 第教会バイト編ルカ視点ver2話（初稿）

## 本文
【Scene1】

朝。

パンを、かじる。

固い。

噛むたびに、音がする。

水で流し込む。

それでも、喉に引っかかる。

「……はぁ」

皿には、もう何もない。

昨日の残り。

これで終わり。

袋を覗く。

空。

分かってた。

昨日の時点で。

それでも、もう一回だけ確かめる。

何もない。

手を引っ込める。

外から声が聞こえる。
```

## ./viewer/production/draft/ep06.md

```
# 第テロ事件導入話（初稿）

## 本文
Scene1（リライト版）

白い旗が、風に揺れていた。

中央広場を囲むように掲げられたそれは、どこまでも整然としていて——
無駄がない。

中央には金の星。
その周囲を囲む月桂冠。

そして、その下に刻まれた言葉。

Meritum Omnia Vincit

——功績はすべてに勝る。

メリトクラシアの国旗だ。

建国記念日を前に、街は祝祭の空気に包まれていた。

市場は人で溢れている。

屋台の呼び声。
焼けた肉の匂い。
笑い声。

子供たちが走り回り、大人たちは買い物に夢中だ。

そんな中を、俺たちは歩いていた。

今日は家族で中央市場に来ている。
「父さんとこうして出かけるのも、久々な気がする」

父さんは少しだけ苦笑して、肩をすくめる。

「そうだな。最近は夜勤で忙しかったからな」

```

## ./viewer/production/draft/viewer.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>閲覧中... | Meritocracia</title>
<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600&family=Noto+Serif+JP:wght@300;400;500&display=swap');

/* ============================================================
   CSS変数
   ============================================================ */
:root {
  --bg:     #070b12;
  --bg2:    #0c1220;
  --gold:   #c8a45a;
  --gold2:  #e5c97e;
  --text:   #cfc4ae;
  --text2:  #7a6e5a;
  --border: rgba(200,164,90,0.15);

  /* モバイル専用 */
  --header-h:    48px;
  --ep-bar-h:    44px;   /* スマホ上部話数バーの高さ */
}

* { margin:0; padding:0; box-sizing:border-box; }

body {
  background: var(--bg);
  color: var(--text);
  font-family: 'Noto Serif JP', serif;
  height: 100vh;
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

/* ============================================================
```

## ./viewer/production/files(15)/letter-archive.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter Archive | Iris Sweet Review</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=IM+Fell+English:ital@0;1&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg:      #07090f;
            --amber:   #c8841a;
            --amber2:  #e8a030;
            --amber3:  #f5c060;
            --text:    #d4c5a9;
            --text2:   #7a6e5e;
            --border:  rgba(200,132,26,0.2);
        }

        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            background: var(--bg);
            color: var(--text);
            font-family: 'Noto Serif JP', serif;
            min-height: 100vh;
            padding: 48px 20px 80px;
        }

        /* グリッド背景 */
        body::before {
            content: '';
            position: fixed;
            inset: 0;
            background-image:
                linear-gradient(rgba(200,132,26,0.025) 1px, transparent 1px),
                linear-gradient(90deg, rgba(200,132,26,0.025) 1px, transparent 1px);
            background-size: 40px 40px;
            pointer-events: none;
            z-index: 0;
        }
```

## ./viewer/production/files(15)/luxury.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Luxury | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-luxury.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
```

## ./viewer/production/files(15)/night.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Night Lounge | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-nightlounge.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
```

## ./viewer/production/files(15)/spring.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Spring Tea | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-springtea.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
```

## ./viewer/production/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Production OS</title>
  <style>
    body {
      margin: 0;
      padding: 32px;
      background: #111;
      color: #eee;
      font-family: sans-serif;
    }

    h1 {
      margin-bottom: 24px;
    }

    .grid {
      display: grid;
      gap: 16px;
      grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
    }

    .card {
      display: block;
      padding: 20px;
      border-radius: 16px;
      background: #1d1d1d;
      border: 1px solid #333;
      color: #fff;
      text-decoration: none;
      transition: 0.2s;
    }

    .card:hover {
      border-color: #999;
      transform: translateY(-2px);
    }
```

## ./viewer/production/lancer-dashboard/app.js

```
let dashboardData = [];
let currentCategory = "All";

const listEl = document.getElementById("card-list");
const searchEl = document.getElementById("search");
const tabsEl = document.getElementById("tabs");
const scrollTopBtn = document.getElementById("scroll-top");

async function loadDashboard() {
  try {
    const res = await fetch("./dashboard.json");
    dashboardData = await res.json();
    render();
  } catch (error) {
    listEl.innerHTML = `<p>読み込み失敗: ${error.message}</p>`;
  }
}

function getFilteredData() {
  const keyword = searchEl.value.toLowerCase();

  return dashboardData.filter((item) => {
    const categoryMatch =
      currentCategory === "All" || item.category === currentCategory;

    const keywordMatch =
      item.title.toLowerCase().includes(keyword) ||
      item.desc.toLowerCase().includes(keyword);

    return categoryMatch && keywordMatch;
  });
}

function render() {
  const items = getFilteredData();

  if (!items.length) {
    listEl.innerHTML = `<p>該当データなし</p>`;
    return;
  }
```

## ./viewer/production/lancer-dashboard/dashboard.json

```
[
  {
    "category": "創作",
    "title": "Viewer Hub",
    "desc": "作品・DB・Productionの総合入口",
    "url": "../../index.html"
  },
  {
    "category": "創作",
    "title": "Plot Viewer",
    "desc": "プロット閲覧OS",
    "url": "../plot/index.html"
  },
  {
    "category": "URL",
    "title": "GitHub",
    "desc": "リポジトリ確認",
    "url": "https://github.com/LANCER1254"
  },
  {
    "category": "日常",
    "title": "Private Schedule",
    "desc": "週間予定・ポモドーロ",
    "url": "../private-schedule/index.html"
  },
  {
    "category": "日常",
    "title": "Google Keep",
    "desc": "クラウド付箋・思いつきメモ",
    "url": "https://keep.google.com/"
  },
  {
    "category": "日常",
    "title": "Work OS",
    "desc": "作業卓・集中OS",
    "url": "../../tools/work-os/index.html"
  }
]```

## ./viewer/production/lancer-dashboard/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Lancer Dashboard</title>
  <link rel="stylesheet" href="./style.css" />
</head>
<body>
  <header class="topbar">
    <h1>🧭 Lancer Dashboard</h1>
    <p>創作 / 転職 / URL / 日常 の統合ハブ</p>
  </header>

  <section class="today-box">
    <span>🎯 今日のフォーカス</span>
    <strong id="today-focus">ポートフォリオ実績3件整理</strong>
  </section>

  <section class="controls">
    <div class="tabs" id="tabs">
      <button class="tab active" data-category="All">すべて</button>
      <button class="tab" data-category="創作">創作</button>
      <button class="tab" data-category="転職">転職</button>
      <button class="tab" data-category="URL">URL</button>
      <button class="tab" data-category="日常">日常</button>
    </div>

    <input
      type="search"
      id="search"
      placeholder="すぐ開きたいページを検索..."
      autocomplete="off"
    />
  </section>

  <section class="quick-notes">
  <div class="notes-header">
    <h2>📝 Quick Notes</h2>
    <button id="add-note">＋</button>
```

## ./viewer/production/lancer-dashboard/style.css

```
:root {
  --bg: #0f1115;
  --card: #1a1f29;
  --border: #2a3240;
  --text: #e8edf5;
  --muted: #9ba7b8;
  --accent: #4da3ff;
  --accent-soft: #223a57;
}

* {
  box-sizing: border-box;
}

body {
  margin: 0;
  background: var(--bg);
  color: var(--text);
  font-family: "Noto Sans JP", sans-serif;
  line-height: 1.6;
}

.topbar {
  position: sticky;
  top: 0;
  z-index: 10;
  background: rgba(15, 17, 21, 0.95);
  backdrop-filter: blur(8px);
  padding: 16px;
  border-bottom: 1px solid var(--border);
}

.topbar h1 {
  margin: 0;
  font-size: 1.3rem;
}

.topbar p {
  margin: 4px 0 0;
  color: var(--muted);
```

## ./viewer/production/lore/scene29_calming_tea_culture.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>メリトクラシア豆知識｜保護区画の鎮静茶文化</title>
    <style>
        :root {
            --bg-color: #0f0f0f;
            --card-bg: #1a1a1a;
            --text-main: #e0e0e0;
            --text-sub: #a0a0a0;
            --accent-green: #2d5a27;
            --accent-light-green: #4a8a3f;
            --border-color: #333;
            --max-width: 900px;
        }

        body {
            background-color: var(--bg-color);
            color: var(--text-main);
            font-family: "Helvetica Neue", Arial, "Hiragino Kaku Gothic ProN", "Hiragino Sans", Meiryo, sans-serif;
            line-height: 1.8;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
        }

        .container {
            width: 100%;
            max-width: var(--max-width);
        }

        header {
            margin-bottom: 40px;
            border-bottom: 2px solid var(--accent-green);
            padding-bottom: 10px;
        }

```

## ./viewer/production/lore/scene29_calming_tea_culture.md

```
📘 メリトクラシア豆知識｜保護区画の鎮静茶文化

対象: 審問庁・ZG保護係 / Scene29 応接室演出補助
用途: 本文小物・キャラ会話・読者の現実接続ギミック

1. 正式設定

審問庁の保護区画では、
過酷な聴取・奴隷保護・トラウマ証言の直後に、鎮静用ハーブティーを出す慣例がある。

これは優しさだけではなく、国家実務として標準化された精神安定処置。

担当は主に

女性保護係
医療補助官
VA観測補佐
ZG福祉記録官

のいずれか。

制度は冷たいが、心を壊したまま証言を続けさせない合理性として運用されている。

2. Scene29推奨配合（正式採用）
🌿 カモミール＋ベルガモット

アイリス専用演出として最適。

効果
緊張緩和
呼吸安定
嗚咽後の震えを落ち着かせる
夜に悪夢を見にくくする
聴取継続を可能にする
香り演出
カモミール = 花の甘さ
ベルガモット = 柑橘と紅茶香
名前「アールグレイ」と自然接続

女性保護係が
```

## ./viewer/production/meeting/zero_map_os_staging/terror/final.md

```
# 【第テロ事件後編話】初稿プロット（再設計フェーズ）

## コンセプト

🎬 Scene21-30 完全導線（後半締め）

Scene21：救護区画
市場の火勢が抑えられ、FOと医療班が一気に流れ込む。
ジェイドはまだカーネルを抱えたまま動けない。クララもショックで声が出ない。
ここで医療班が「生存者優先」としてクララを先に担架へ、続いてカーネルを確認する。
しかし胸部炎槍の損傷は致命的。
“まだ温かいのに助からない” を感情の核にする。

医療兵「……脈、なし。死亡確認」

ジェイドの世界の音が、再び遠のく。

ここで死亡を第三者が宣告することで現実を固定します。
後の真相追求動機の“取り返しのつかなさ”が強くなる。

Scene22：両親との再合流
封鎖線の外から母ミレイユと父が必死に現場へ駆け込む。
母は最初クララを抱きしめ、次にジェイドを探し、最後に布を掛けられたカーネルを見つける。

ここは説明より順番が命です。

生きてる子を探す
ジェイドを抱きしめる
布の下を見て崩れる

母の精神支柱がここで折れる。父は逆に無言で立ち尽くす。
ジェイドは泣けない。
ショックで“感情が止まる”方向にすると本編の冷静さへ繋がる。

Scene23：残党掃討
場面を少し引いて、路地裏・地下通路・市場外周でFOが炎翼セル残党を狩る。
ここで S-07《ヴェル》逃走、R-03《セラ》行方不明、現場には替え玉だけ残る にすると後の公開尋問が自然です。

重要なのは、
“ジェイドたちは事件が終わったと思っているが、読者だけは終わってないと知る”
```

## ./viewer/production/meeting/zero_map_os_staging/terror/intro.md

```
# 【第テロ事件導入プロット話】初稿プロット（再設計フェーズ）

テロ事件導入プロット（提案）
Scene1

市場の日常
賑やかな町並み。建国記念日ということもあってかすごい賑わってる。

カーネル視点

市場の描写

子供

商人

平和

Scene2

国家の会話

商人

「もうすぐ建国記念日だ」

別の商人

「メリトクラシアも大きくなったな」

Scene3

宗教思想

黒ローブの男

「神を否定した国家がな」

不穏。

```

## ./viewer/production/meeting/zero_map_os_staging/terror/middle.md

```
# 【第テロ事件話】初稿プロット（再設計フェーズ）

## コンセプト
📘 テロ事件導入 続きプロット（カーネル死亡まで）

接続元: Scene7 決断（クララ救助成功直後）

Scene8　上空の異変

クララを抱えたカーネルが立ち上がった瞬間、
市場の喧騒とは別の“静けさ”が落ちる。

炎の粉が逆流する。
煙が上へ吸い込まれる。

ジェイドだけが違和感を覚える。

見上げた空に、裂け目のような赤い光。

翼に見える巨大な炎影。

ここでは正体を明示しない。
読者に「天使？」とだけ思わせる。

Scene9　第二波

炎翼セルの第二手。

市場中央の別地点で
召喚獣が暴走開始。

魔狼が屋台を薙ぎ倒し、
逃げる市民を襲う。

中央警備隊だけでは抑えきれない。

ここで市場が完全に戦場化。

カーネルはクララを安全圏へ運ぼうとするが、
子供の泣き声を聞いて足を止める。
```

## ./viewer/production/meeting/zero_map_os_staging/zero_map_source_full.md

```
# 【第テロ事件後編話】初稿プロット（再設計フェーズ）

## コンセプト

🎬 Scene21-30 完全導線（後半締め）

Scene21：救護区画
市場の火勢が抑えられ、FOと医療班が一気に流れ込む。
ジェイドはまだカーネルを抱えたまま動けない。クララもショックで声が出ない。
ここで医療班が「生存者優先」としてクララを先に担架へ、続いてカーネルを確認する。
しかし胸部炎槍の損傷は致命的。
“まだ温かいのに助からない” を感情の核にする。

医療兵「……脈、なし。死亡確認」

ジェイドの世界の音が、再び遠のく。

ここで死亡を第三者が宣告することで現実を固定します。
後の真相追求動機の“取り返しのつかなさ”が強くなる。

Scene22：両親との再合流
封鎖線の外から母ミレイユと父が必死に現場へ駆け込む。
母は最初クララを抱きしめ、次にジェイドを探し、最後に布を掛けられたカーネルを見つける。

ここは説明より順番が命です。

生きてる子を探す
ジェイドを抱きしめる
布の下を見て崩れる

母の精神支柱がここで折れる。父は逆に無言で立ち尽くす。
ジェイドは泣けない。
ショックで“感情が止まる”方向にすると本編の冷静さへ繋がる。

Scene23：残党掃討
場面を少し引いて、路地裏・地下通路・市場外周でFOが炎翼セル残党を狩る。
ここで S-07《ヴェル》逃走、R-03《セラ》行方不明、現場には替え玉だけ残る にすると後の公開尋問が自然です。

重要なのは、
“ジェイドたちは事件が終わったと思っているが、読者だけは終わってないと知る”
```

## ./viewer/production/meeting/zero_map_os_staging/修正版プロローグ/2話幸せな日常.md

```
# 第2話幸せな日常話（初稿）

## 本文
Scene1　朝のレオンハルト家（リライト版）

　あの不思議な少年と出会ってから、二年が過ぎていた。

　オレは八歳になった。

　この頃のオレは、まだ知らなかった。

　この家も。
　この市場も。
　この騒がしい朝も。

　――あと三ヶ月で、全部終わるなんて。

　そんなこと、考えたこともなかった。

　だからこの朝も、いつも通りだった。

　布団の中はまだ暖かい。

　外から聞こえるのは、パン屋の準備をする音。
　台所では母さんがパン生地をこねているらしく、香ばしい匂いが漂ってくる。

　……でも。

　眠い。

　もう少しだけ寝ていよう。

　そう思って布団に顔をうずめた――その瞬間だった。

　ばさっ！

　突然、布団が勢いよく剥がされた。

「起きろジェイドー！」

```

## ./viewer/production/meeting/zero_map_os_staging/修正版プロローグ/4 名前の重さ.md

```
# 第4 名前の重さ話（初稿）

## 本文
Scene1　粉屋（リライト）

　中央市場は、今日も騒がしかった。

　香辛料の匂い。
　荷車のきしむ音。
　商人たちの呼び声。

　昨日と、何も変わらない。

　オレは粉袋を買うため、市場の奥にある粉屋へ向かって歩いていた。

　いつもなら、隣を姉ちゃんが歩いている。

　でも今日は違う。

　朝、家を出る前に言っていた。

「教会のバイトあるから、先行くな」

　白い布を肩にかけて、姉ちゃんはさっさと家を出ていった。

　市場の角にある教会。

　最近、儀式の準備とかで忙しいらしい。

　だから今日は――

　オレ一人だ。

　石畳の通りを抜け、見慣れた木の看板が見えてくる。

　粉屋クララ。

　店の中に入ると、小麦粉の匂いがふわっと広がった。

　棚の奥で、クララがこちらに気づく。
```

## ./viewer/production/meeting/zero_map_os_staging/修正版プロローグ/テロ事件導入.md

```
# 第テロ事件導入話（初稿）

## 本文
Scene1（リライト版）

白い旗が、風に揺れていた。

中央広場を囲むように掲げられたそれは、どこまでも整然としていて——
無駄がない。

中央には金の星。
その周囲を囲む月桂冠。

そして、その下に刻まれた言葉。

Meritum Omnia Vincit

——功績はすべてに勝る。

メリトクラシアの国旗だ。

建国記念日を前に、街は祝祭の空気に包まれていた。

市場は人で溢れている。

屋台の呼び声。
焼けた肉の匂い。
笑い声。

子供たちが走り回り、大人たちは買い物に夢中だ。

そんな中を、俺たちは歩いていた。

今日は家族で中央市場に来ている。
「父さんとこうして出かけるのも、久々な気がする」

父さんは少しだけ苦笑して、肩をすくめる。

「そうだな。最近は夜勤で忙しかったからな」

```

## ./viewer/production/meeting/zero_map_os_staging/修正版プロローグ/修正版第一話.md

```
# 第修正版第一話話（初稿）

## 本文
Scene1　悪夢

雨が降っていた。

冷たい雨だ。

空は暗く、雲は低く垂れ込めている。

足元の泥が、靴にまとわりつく。

その向こうに――

倒れている影があった。

ゆっくりと近づく。

呼吸は浅い。

血が、雨に流されていく。

そして。

背中から伸びるものが見えた。

黒い翼。

ぼろぼろに裂けている。

地面に広がった羽が、雨に濡れて重く沈んでいた。

その存在は、わずかに顔を上げる。

目が合った。

かすれた声。

「……来るな」
```

## ./viewer/production/meeting/zero_map_os_staging/修正版プロローグ/教会バイト編.md

```
# 第教会バイト編話（初稿）

## 本文
Scene1　教会バイトへ（カーネル視点）

ジェイドと別れてから、カーネルは一人で市場の通りを歩いていた。

夕方の市場は、まだ人が多い。

商人の呼び声。
荷車のきしむ音。
焼いた肉の匂い。

昼間ほどではないが、それでも通りには人の流れが絶えない。

「カーネル！」

果物屋のおじさんが声をかけてきた。

振り向くと、大きな木箱を抱えて困った顔をしている。

「悪い、これ運ぶの手伝ってくれ！」

カーネルはすぐに箱の片側を持ち上げた。

「いいよ！」

ぐっと持ち上げると、箱は意外と軽い。
## メモ
📘 議事録｜教会バイト編 Scene6（地下）構造解説
■シーン目的

地上（教会）との断絶を明確化

空間そのものの異質さを提示

ルカの「逃げられない状態」を成立させる

■シーンの本質

```

## ./viewer/production/meeting/zero_map_os_staging/修正版プロローグ/教会バイト編　ルカ視点.md

```
# 第教会バイト編　ルカ視点話（初稿）
★祈りの裏側★

## 本文
【Scene1】

朝。

パンを、かじる。

固い。

噛むたびに、音がする。

水で流し込む。

それでも、喉に引っかかる。

「……はぁ」

皿には、もう何もない。

昨日の残り。

これで終わり。

袋を覗く。

空。

分かってた。

昨日の時点で。

それでも、もう一回だけ確かめる。

何もない。

手を引っ込める。

```

## ./viewer/production/meeting/zero_map_os_staging/修正版プロローグ/教会バイト編ルカ視点ver2.md

```
# 第教会バイト編ルカ視点ver2話（初稿）

## 本文
【Scene1】

朝。

パンを、かじる。

固い。

噛むたびに、音がする。

水で流し込む。

それでも、喉に引っかかる。

「……はぁ」

皿には、もう何もない。

昨日の残り。

これで終わり。

袋を覗く。

空。

分かってた。

昨日の時点で。

それでも、もう一回だけ確かめる。

何もない。

手を引っ込める。

外から声が聞こえる。
```

## ./viewer/production/plot/chapter/terror/final.md

```
# 【第テロ事件後編話】初稿プロット（再設計フェーズ）

## コンセプト

🎬 Scene21-30 完全導線（後半締め）

Scene21：救護区画
市場の火勢が抑えられ、FOと医療班が一気に流れ込む。
ジェイドはまだカーネルを抱えたまま動けない。クララもショックで声が出ない。
ここで医療班が「生存者優先」としてクララを先に担架へ、続いてカーネルを確認する。
しかし胸部炎槍の損傷は致命的。
“まだ温かいのに助からない” を感情の核にする。

医療兵「……脈、なし。死亡確認」

ジェイドの世界の音が、再び遠のく。

ここで死亡を第三者が宣告することで現実を固定します。
後の真相追求動機の“取り返しのつかなさ”が強くなる。

Scene22：両親との再合流
封鎖線の外から母ミレイユと父が必死に現場へ駆け込む。
母は最初クララを抱きしめ、次にジェイドを探し、最後に布を掛けられたカーネルを見つける。

ここは説明より順番が命です。

生きてる子を探す
ジェイドを抱きしめる
布の下を見て崩れる

母の精神支柱がここで折れる。父は逆に無言で立ち尽くす。
ジェイドは泣けない。
ショックで“感情が止まる”方向にすると本編の冷静さへ繋がる。

Scene23：残党掃討
場面を少し引いて、路地裏・地下通路・市場外周でFOが炎翼セル残党を狩る。
ここで S-07《ヴェル》逃走、R-03《セラ》行方不明、現場には替え玉だけ残る にすると後の公開尋問が自然です。

重要なのは、
“ジェイドたちは事件が終わったと思っているが、読者だけは終わってないと知る”
```

## ./viewer/production/plot/chapter/terror/intro.md

```
# 【第テロ事件導入プロット話】初稿プロット（再設計フェーズ）

テロ事件導入プロット（提案）
Scene1

市場の日常
賑やかな町並み。建国記念日ということもあってかすごい賑わってる。

カーネル視点

市場の描写

子供

商人

平和

Scene2

国家の会話

商人

「もうすぐ建国記念日だ」

別の商人

「メリトクラシアも大きくなったな」

Scene3

宗教思想

黒ローブの男

「神を否定した国家がな」

不穏。

```

## ./viewer/production/plot/chapter/terror/middle.md

```
# 【第テロ事件話】初稿プロット（再設計フェーズ）

## コンセプト
📘 テロ事件導入 続きプロット（カーネル死亡まで）

接続元: Scene7 決断（クララ救助成功直後）

Scene8　上空の異変

クララを抱えたカーネルが立ち上がった瞬間、
市場の喧騒とは別の“静けさ”が落ちる。

炎の粉が逆流する。
煙が上へ吸い込まれる。

ジェイドだけが違和感を覚える。

見上げた空に、裂け目のような赤い光。

翼に見える巨大な炎影。

ここでは正体を明示しない。
読者に「天使？」とだけ思わせる。

Scene9　第二波

炎翼セルの第二手。

市場中央の別地点で
召喚獣が暴走開始。

魔狼が屋台を薙ぎ倒し、
逃げる市民を襲う。

中央警備隊だけでは抑えきれない。

ここで市場が完全に戦場化。

カーネルはクララを安全圏へ運ぼうとするが、
子供の泣き声を聞いて足を止める。
```

## ./viewer/production/plot/chapter/timeline-main/ep01_reboot_plot.md

```
🎬 第1話 再構築版プロット
Scene1｜カーネルの葬式

カーネルの葬式の日、市場は朝から静まり返っている。
いつもなら荷車と呼び声で埋まる石畳には、黒布と花の香りだけが残っていた。

棺の上には、丸いパンがひとつ置かれている。
彼女がいつか自分の店で焼きたいと言っていた、あの形だ。

商人たちは無言で列を作り、一人ずつ花を置いていく。
市場全体が、彼女を知っていた。

列の途中でクララの手が震える。
花を落とし、そのまま膝から崩れ落ちる。

「なんで……カーネルが……」
「私を庇って……」

言葉は最後まで続かない。

すぐ横でユミナがその肩を支える。
泣き崩れるクララを抱き寄せ、小さく「……姉さん」と漏らす。
その目からも、一滴だけ涙が落ちる。

少し離れた場所で、ジェイドはそれを見ている。
棺も、クララも、ユミナも見えているのに、自分だけ涙が出ない。

胸の奥で、鼓動だけが異様に大きい。

やがて神父が棺の前へ進み出る。
風が止み、市場の空気が静まる。

「土に還れ、星に還れ。名は残り、灯は巡る」

短い祈りが終わる。
誰もが少しだけ救われたような顔をする。

けれどジェイドの喉の奥には、何かが引っかかったままだった。
何かが、まだ還っていない。
そんな感覚だけが残る。
```

## ./viewer/production/plot/chapter/timeline-main/ep02_va_protection_plot.md

```
# 【第本編時系列第２話シーン１３〜話】初稿プロット（再設計フェーズ）

Scene13 完成版｜空気が止まる場所

石柱の陰から出た、その一歩で。

ざわついていた人垣が、ふっと静まった。

掲示板を見ていた視線が、何人かぶんだけこちらへ流れる。

カールはゆっくりと振り返る。

整った襟元。
乱れのない袖口。
怒鳴りはしない。

その静けさのまま、冷たく言う。

「……何だ？」

ジェイドは足を止めない。

アイリスと、取引先の男。
その間に割って入る位置まで進む。

「嫌がってる」

短い。

それだけだった。

正義を語らない。
制度を責めない。

ただ、今見えているものだけを口にする。

取引先の男が鼻で笑う。

「坊や、これは商談だよ」

```

## ./viewer/production/plot/chapter/timeline-main/ep03_timeline_plot.md

```
# 【第本編時系列３話話】初稿プロット（再設計フェーズ）

Scene27 プロット

現在に戻った涙

部屋に残っていたのは、紙の擦れる音だった。

ユミナのペン先が、
最後の記録を一行だけ書き足す。

その小さな音で、
アイリスの意識がようやく現在へ戻る。

審問庁の応接室。

灰色の壁。
机の上のランプ。
向かいに座るユミナ。

隣にはジェイドがいる。

さっきまで見えていた家も、
荷馬車も、
冷たい値札も、もうない。

けれど呼吸だけはまだ浅い。

アイリスの頬を、涙が静かに伝う。

声は震えている。

でも、言葉は思ったより整っていた。

「……父も、母も」

小さく息を吸う。

「わたしを名前で呼びませんでした」

```

## ./viewer/production/plot/chapter/timeline-main/ep04_timeline_plot.md

```
# 【第4話　本編時系列話】初稿プロット（再設計フェーズ）
冒頭

玄関の空気が少し落ち着いたところで、母が静かに問いかける。

「……それで、何をしにうちに来たの？」

敬語は崩しすぎない。
でも家庭の中だから、生活者の率直さがある。

ユミナは官服の襟を整え、家の灯りを見渡してから本題に入る。

主目的①｜アイリス保護の正式説明

ユミナはまずアイリスを見る。

「まず、アイリスさんの保護についてです」

ここで前作第7話の制度を踏襲。

説明する内容は3つ。

1. 特例保護制度
本来、爵位なしで奴隷保護は不可
ただし国家試験庁が特例承認
ジェイドは監察付き特例対象
ユミナが後見・監督責任者

ここで母が少し驚く。

「あの子が、そこまで見込まれてるの？」

この一言で家族の誇らしさが出る。

2. 使用人養成学校導線

アイリスの未来をここで示す。

士官学校併設の使用人養成学校
見習い（ディスケンス）から開始
```

## ./viewer/production/plot/chapter/timeline-main/ep4話　本編時系列_初稿プロット.md

```
# 【第4話　本編時系列話】初稿プロット（再設計フェーズ）
冒頭

玄関の空気が少し落ち着いたところで、母が静かに問いかける。

「……それで、何をしにうちに来たの？」

敬語は崩しすぎない。
でも家庭の中だから、生活者の率直さがある。

ユミナは官服の襟を整え、家の灯りを見渡してから本題に入る。

主目的①｜アイリス保護の正式説明

ユミナはまずアイリスを見る。

「まず、アイリスさんの保護についてです」

ここで前作第7話の制度を踏襲。

説明する内容は3つ。

1. 特例保護制度
本来、爵位なしで奴隷保護は不可
ただし国家試験庁が特例承認
ジェイドは監察付き特例対象
ユミナが後見・監督責任者

ここで母が少し驚く。

「あの子が、そこまで見込まれてるの？」

この一言で家族の誇らしさが出る。

2. 使用人養成学校導線

アイリスの未来をここで示す。

士官学校併設の使用人養成学校
見習い（ディスケンス）から開始
```

## ./viewer/production/plot/chapter/timeline-main/ep本編時系列第２話シーン１３〜_初稿プロット.md

```
# 【第本編時系列第２話シーン１３〜話】初稿プロット（再設計フェーズ）

Scene13 完成版｜空気が止まる場所

石柱の陰から出た、その一歩で。

ざわついていた人垣が、ふっと静まった。

掲示板を見ていた視線が、何人かぶんだけこちらへ流れる。

カールはゆっくりと振り返る。

整った襟元。
乱れのない袖口。
怒鳴りはしない。

その静けさのまま、冷たく言う。

「……何だ？」

ジェイドは足を止めない。

アイリスと、取引先の男。
その間に割って入る位置まで進む。

「嫌がってる」

短い。

それだけだった。

正義を語らない。
制度を責めない。

ただ、今見えているものだけを口にする。

取引先の男が鼻で笑う。

「坊や、これは商談だよ」

```

## ./viewer/production/plot/chapter/timeline-main/ep本編時系列３話_初稿プロット.md

```
# 【第本編時系列３話話】初稿プロット（再設計フェーズ）

Scene27 プロット

現在に戻った涙

部屋に残っていたのは、紙の擦れる音だった。

ユミナのペン先が、
最後の記録を一行だけ書き足す。

その小さな音で、
アイリスの意識がようやく現在へ戻る。

審問庁の応接室。

灰色の壁。
机の上のランプ。
向かいに座るユミナ。

隣にはジェイドがいる。

さっきまで見えていた家も、
荷馬車も、
冷たい値札も、もうない。

けれど呼吸だけはまだ浅い。

アイリスの頬を、涙が静かに伝う。

声は震えている。

でも、言葉は思ったより整っていた。

「……父も、母も」

小さく息を吸う。

「わたしを名前で呼びませんでした」

```

## ./viewer/production/plot/chapter/timeline-main/terror/final.md

```
# 【第テロ事件後編話】初稿プロット（再設計フェーズ）

## コンセプト

🎬 Scene21-30 完全導線（後半締め）

Scene21：救護区画
市場の火勢が抑えられ、FOと医療班が一気に流れ込む。
ジェイドはまだカーネルを抱えたまま動けない。クララもショックで声が出ない。
ここで医療班が「生存者優先」としてクララを先に担架へ、続いてカーネルを確認する。
しかし胸部炎槍の損傷は致命的。
“まだ温かいのに助からない” を感情の核にする。

医療兵「……脈、なし。死亡確認」

ジェイドの世界の音が、再び遠のく。

ここで死亡を第三者が宣告することで現実を固定します。
後の真相追求動機の“取り返しのつかなさ”が強くなる。

Scene22：両親との再合流
封鎖線の外から母ミレイユと父が必死に現場へ駆け込む。
母は最初クララを抱きしめ、次にジェイドを探し、最後に布を掛けられたカーネルを見つける。

ここは説明より順番が命です。

生きてる子を探す
ジェイドを抱きしめる
布の下を見て崩れる

母の精神支柱がここで折れる。父は逆に無言で立ち尽くす。
ジェイドは泣けない。
ショックで“感情が止まる”方向にすると本編の冷静さへ繋がる。

Scene23：残党掃討
場面を少し引いて、路地裏・地下通路・市場外周でFOが炎翼セル残党を狩る。
ここで S-07《ヴェル》逃走、R-03《セラ》行方不明、現場には替え玉だけ残る にすると後の公開尋問が自然です。

重要なのは、
“ジェイドたちは事件が終わったと思っているが、読者だけは終わってないと知る”
```

## ./viewer/production/plot/chapter/timeline-main/terror/intro.md

```
# 【第テロ事件導入プロット話】初稿プロット（再設計フェーズ）

テロ事件導入プロット（提案）
Scene1

市場の日常
賑やかな町並み。建国記念日ということもあってかすごい賑わってる。

カーネル視点

市場の描写

子供

商人

平和

Scene2

国家の会話

商人

「もうすぐ建国記念日だ」

別の商人

「メリトクラシアも大きくなったな」

Scene3

宗教思想

黒ローブの男

「神を否定した国家がな」

不穏。

```

## ./viewer/production/plot/chapter/timeline-main/terror/middle.md

```
# 【第テロ事件話】初稿プロット（再設計フェーズ）

## コンセプト
📘 テロ事件導入 続きプロット（カーネル死亡まで）

接続元: Scene7 決断（クララ救助成功直後）

Scene8　上空の異変

クララを抱えたカーネルが立ち上がった瞬間、
市場の喧騒とは別の“静けさ”が落ちる。

炎の粉が逆流する。
煙が上へ吸い込まれる。

ジェイドだけが違和感を覚える。

見上げた空に、裂け目のような赤い光。

翼に見える巨大な炎影。

ここでは正体を明示しない。
読者に「天使？」とだけ思わせる。

Scene9　第二波

炎翼セルの第二手。

市場中央の別地点で
召喚獣が暴走開始。

魔狼が屋台を薙ぎ倒し、
逃げる市民を襲う。

中央警備隊だけでは抑えきれない。

ここで市場が完全に戦場化。

カーネルはクララを安全圏へ運ぼうとするが、
子供の泣き声を聞いて足を止める。
```

## ./viewer/production/plot/chapter/timeline-main/本編 第1話 再構築版プロット.md

```
🎬 第1話 再構築版プロット
Scene1｜カーネルの葬式

カーネルの葬式の日、市場は朝から静まり返っている。
いつもなら荷車と呼び声で埋まる石畳には、黒布と花の香りだけが残っていた。

棺の上には、丸いパンがひとつ置かれている。
彼女がいつか自分の店で焼きたいと言っていた、あの形だ。

商人たちは無言で列を作り、一人ずつ花を置いていく。
市場全体が、彼女を知っていた。

列の途中でクララの手が震える。
花を落とし、そのまま膝から崩れ落ちる。

「なんで……カーネルが……」
「私を庇って……」

言葉は最後まで続かない。

すぐ横でユミナがその肩を支える。
泣き崩れるクララを抱き寄せ、小さく「……姉さん」と漏らす。
その目からも、一滴だけ涙が落ちる。

少し離れた場所で、ジェイドはそれを見ている。
棺も、クララも、ユミナも見えているのに、自分だけ涙が出ない。

胸の奥で、鼓動だけが異様に大きい。

やがて神父が棺の前へ進み出る。
風が止み、市場の空気が静まる。

「土に還れ、星に還れ。名は残り、灯は巡る」

短い祈りが終わる。
誰もが少しだけ救われたような顔をする。

けれどジェイドの喉の奥には、何かが引っかかったままだった。
何かが、まだ還っていない。
そんな感覚だけが残る。
```

## ./viewer/production/plot/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Plot Index OS</title>

  <style>
    body {
      margin: 0;
      padding: 32px;
      background: #0f1115;
      color: #e5e7eb;
      font-family: sans-serif;
    }

    h1 {
      margin-bottom: 8px;
    }

    .sub {
      color: #9ca3af;
      margin-bottom: 24px;
    }

    #plot-list {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
      gap: 16px;
    }

    .card {
      background: #1a1d24;
      border: 1px solid #2b313d;
      border-radius: 14px;
      padding: 20px;
    }

    .card h2 {
      margin-top: 0;
```

## ./viewer/production/plot/plot-data.json

```
[
  {
    "id": "ep4話　本編時系列_初稿プロット",
    "title": "ep4話　本編時系列_初稿プロット",
    "category": "timeline-main",
    "desc": "本編時系列プロット",
    "link": "./chapter/timeline-main/ep4話　本編時系列_初稿プロット.md"
  },
  {
    "id": "ep本編時系列第２話シーン１３〜_初稿プロット",
    "title": "ep本編時系列第２話シーン１３〜_初稿プロット",
    "category": "timeline-main",
    "desc": "本編時系列プロット",
    "link": "./chapter/timeline-main/ep本編時系列第２話シーン１３〜_初稿プロット.md"
  },
  {
    "id": "ep本編時系列３話_初稿プロット",
    "title": "ep本編時系列３話_初稿プロット",
    "category": "timeline-main",
    "desc": "本編時系列プロット",
    "link": "./chapter/timeline-main/ep本編時系列３話_初稿プロット.md"
  },
  {
    "id": "final",
    "title": "final",
    "category": "timeline-main",
    "desc": "本編時系列プロット",
    "link": "./chapter/timeline-main/terror/final.md"
  },
  {
    "id": "intro",
    "title": "intro",
    "category": "timeline-main",
    "desc": "本編時系列プロット",
    "link": "./chapter/timeline-main/terror/intro.md"
  },
  {
    "id": "middle",
    "title": "middle",
    "category": "timeline-main",
```

## ./viewer/production/plot/plot.js

```
/**
 * Meritocracia Plot Mirror Viewer v3.1
 * 安定版 / 日本語ファイル名対応 / DOM安全生成
 */
document.addEventListener("DOMContentLoaded", () => {
  const listContainer = document.getElementById("plot-list");
  const contentArea = document.getElementById("plot-content");

  fetch("./plot-data.json")
    .then((res) => {
      if (!res.ok) throw new Error("plot-data.json not found");
      return res.json();
    })
    .then((plots) => {
      renderPlotList(plots);

      if (plots.length > 0) {
        loadPlotContent(encodeURI(plots[0].link));
      }
    })
    .catch((err) => {
      if (listContainer) {
        listContainer.innerHTML = `
          <div class="card">
            <h2>読み込み失敗</h2>
            <p>${err.message}</p>
          </div>
        `;
      }
      console.error(err);
    });

  function renderPlotList(plots) {
    if (!listContainer) return;

    listContainer.innerHTML = "";

    plots.forEach((item) => {
      const card = document.createElement("div");
      card.className = "card plot-card";
```

## ./viewer/production/plot/viewer.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Plot Viewer</title>
  <style>
    body {
      margin: 0;
      padding: 32px;
      background: #0f1115;
      color: #e5e7eb;
      font-family: sans-serif;
      line-height: 1.8;
      white-space: pre-wrap;
    }
  </style>
</head>
<body>
  <main id="content">loading...</main>

  <script>
    const params = new URLSearchParams(location.search);
    const file = params.get("file");

    fetch(file)
      .then(res => res.text())
      .then(text => {
        document.getElementById("content").textContent = text;
      })
      .catch(err => {
        document.getElementById("content").textContent =
          "読み込み失敗: " + err.message;
      });
  </script>
</body>
</html>```

## ./viewer/production/pomodoro.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MERITOCRACIA OS — 作業卓</title>
<style>
  :root {
    --bg:      #07090f;
    --bg2:     #0e1320;
    --bg3:     #141c2e;
    --amber:   #c8841a;
    --amber2:  #e8a030;
    --amber3:  #f5c060;
    --dim:     #4a3c28;
    --text:    #d4c5a9;
    --text2:   #7a6e5e;
    --text3:   #4a4030;
    --green:   #2a8a4a;
    --green2:  #3dbb66;
    --red:     #8a2020;
    --red2:    #cc3333;
    --border:  rgba(200,132,26,0.18);
    --shadow:  rgba(0,0,0,0.6);
    --r:       16px;
  }

  * { margin:0; padding:0; box-sizing:border-box; }

  body {
    background: var(--bg);
    color: var(--text);
    font-family: 'Georgia', 'Noto Serif JP', serif;
    min-height: 100vh;
    padding: 16px;
  }

  /* グリッド背景 */
  body::before {
    content: '';
```

## ./viewer/production/private-schedule-v2/app.js

```
/* ============================================================
   MERITOCRACIA OS — 作業卓 / app.js  v3
   責務: 時計 / 週間スケジュール / ポモドーロ / 年間カレンダー / 初期化
   ============================================================ */
'use strict';

/* ══════════════════════════════════════
   定数・ユーティリティ
══════════════════════════════════════ */
const DAY_KEYS = ['SUN','MON','TUE','WED','THU','FRI','SAT'];
const DAYS_JP  = ['日','月','火','水','木','金','土'];
const BLOCKS   = [
  { key: 'morning',   label: 'MORNING   06:00–12:00', min: [6*60, 12*60] },
  { key: 'afternoon', label: 'AFTERNOON 12:00–18:00', min: [12*60, 18*60] },
  { key: 'night',     label: 'NIGHT     18:00–06:00', min: [18*60, 30*60] },
];

// publishingイベントのtype定義
const PUB_TYPES = {
  release:  { label: 'RELEASE',  color: 'var(--ps-amber2)',  bg: 'rgba(200,132,26,0.25)' },
  plot:     { label: 'PLOT',     color: 'var(--ps-green2)',  bg: 'rgba(42,138,74,0.25)'  },
  review:   { label: 'REVIEW',   color: 'var(--ps-purple2)', bg: 'rgba(155,89,182,0.25)' },
  infra:    { label: 'INFRA',    color: 'var(--ps-blue2)',   bg: 'rgba(41,128,185,0.25)' },
  work:     { label: 'WORK',     color: '#e8d44d',           bg: 'rgba(232,212,77,0.20)' },
  personal: { label: 'PERSONAL', color: '#e8856a',           bg: 'rgba(232,133,106,0.20)'},
};

const pad = n => String(n).padStart(2, '0');

/** "HH:MM" → 分数（深夜0〜5時は+24h） */
function t2m(t) {
  const [h, m] = t.split(':').map(Number);
  return (h < 6 ? h + 24 : h) * 60 + m;
}

/** 現在分数（深夜補正） */
function nowMin() {
  const d = new Date();
  const h = d.getHours();
  return (h < 6 ? h + 24 : h) * 60 + d.getMinutes();
```

## ./viewer/production/private-schedule-v2/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MERITOCRACIA OS — 作業卓</title>
<link rel="stylesheet" href="./style.css">
</head>
<body>
<div class="ps-wrap">

  <!-- ヘッダー -->
  <div class="ps-top-bar">
    <div class="ps-site-label">MERITOCRACIA — 作業卓</div>
    <div class="ps-clock-block">
      <div id="ps-clock-time">00:00:00</div>
      <div id="ps-clock-date">----/--/--</div>
    </div>
  </div>

  <!-- 週間プログレス -->
  <div class="ps-weekly-progress">
    <div class="ps-wp-header">
      <span class="ps-wp-label">WEEKLY PROGRESS</span>
      <span id="ps-wp-pct">0%</span>
    </div>
    <div class="ps-wp-bar">
      <div class="ps-wp-fill" id="ps-wp-fill"></div>
    </div>
  </div>

  <!-- 2カラム -->
  <div class="ps-main-grid">

    <!-- ポモドーロ（左カラム・完全維持） -->
    <div class="ps-card">
      <span class="ps-card-label">POMODORO TIMER</span>
      <div id="ps-pomo-mode">WORK</div>

      <div class="ps-ring-wrap">
```

## ./viewer/production/private-schedule-v2/notes.json

```
{
  "today_log": [
    "ZERO都市マップOS modular設計方針を確定",
    "map-data.json 市場中心の密集を改善",
    "map viewer を GitHub Pages に公開"
  ],
  "next_action": [
    "Claudeに modular JSON + drag editor 依頼",
    "士官学校編 map OS を新設",
    "private-schedule に作業メモ表示"
  ],
  "waiting": [
    "Claude baseline quota reset 4/18"
  ]
}
```

## ./viewer/production/private-schedule-v2/schedule.json

```
{
  "week": "2025-W15",
  "weekly_progress": 42,
  "publishing": [
    {
      "date": "2026-04-11",
      "label": "土曜ナイトルーチン",
      "type": "personal",
      "timeline": [
        {
          "time": "19:00",
          "label": "バックアップ構築及び見直し"
        },
        {
          "time": "22:00",
          "label": "アニメ鑑賞"
        },
        {
          "time": "00:00",
          "label": "創作活動"
        }
      ]
    },
    {
      "date": "2026-04-12",
      "label": "創作再開",
      "type": "personal",
      "timeline": [
        {
          "time": "15:00",
          "label": "創作再開"
        },
        {
          "time": "10:00",
          "label": "士官学校編 Scene46"
        },
        {
          "time": "14:00",
          "label": "昼寝"
        },
```

## ./viewer/production/private-schedule-v2/style.css

```
/* ============================================================
   MERITOCRACIA OS — 作業卓 / private-schedule
   prefix: ps-  (production-schedule)
   v3: 年間カレンダー / 右カード内部タブ追加
   ============================================================ */

:root {
  --ps-bg:       #07090f;
  --ps-bg2:      #0e1320;
  --ps-bg3:      #141c2e;
  --ps-amber:    #c8841a;
  --ps-amber2:   #e8a030;
  --ps-amber3:   #f5c060;
  --ps-dim:      #4a3c28;
  --ps-text:     #d4c5a9;
  --ps-text2:    #7a6e5e;
  --ps-text3:    #4a4030;
  --ps-green:    #2a8a4a;
  --ps-green2:   #3dbb66;
  --ps-blue:     #1e3a5f;
  --ps-blue2:    #2980b9;
  --ps-purple:   #3e1e5f;
  --ps-purple2:  #9b59b6;
  --ps-red:      #8a2020;
  --ps-red2:     #c0392b;
  --ps-border:   rgba(200,132,26,0.18);
  --ps-shadow:   rgba(0,0,0,0.6);
  --ps-r:        16px;
}

/* ────── リセット ────── */
.ps-wrap * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

/* ────── ベース ────── */
body {
  background: var(--ps-bg);
```

## ./viewer/production/private-schedule-v2/アーカイブ/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MERITOCRACIA OS — 作業卓</title>
<link rel="stylesheet" href="./style.css">
</head>
<body>
<div class="ps-wrap">

  <!-- ヘッダー -->
  <div class="ps-top-bar">
    <div class="ps-site-label">MERITOCRACIA — 作業卓</div>
    <div class="ps-clock-block">
      <div id="ps-clock-time">00:00:00</div>
      <div id="ps-clock-date">----/--/--</div>
    </div>
  </div>

  <!-- 週間プログレス -->
  <div class="ps-weekly-progress">
    <div class="ps-wp-header">
      <span class="ps-wp-label">WEEKLY PROGRESS</span>
      <span id="ps-wp-pct">0%</span>
    </div>
    <div class="ps-wp-bar">
      <div class="ps-wp-fill" id="ps-wp-fill"></div>
    </div>
  </div>

  <!-- 2カラム -->
  <div class="ps-main-grid">

    <!-- ポモドーロ（左カラム・完全維持） -->
    <div class="ps-card">
      <span class="ps-card-label">POMODORO TIMER</span>
      <div id="ps-pomo-mode">WORK</div>

      <div class="ps-ring-wrap">
```

## ./viewer/production/private-schedule/app.js

```
/* ============================================================
   MERITOCRACIA OS — 作業卓 / app.js  v3
   責務: 時計 / 週間スケジュール / ポモドーロ / 年間カレンダー / 初期化
   ============================================================ */
'use strict';

/* ══════════════════════════════════════
   定数・ユーティリティ
══════════════════════════════════════ */
const DAY_KEYS = ['SUN','MON','TUE','WED','THU','FRI','SAT'];
const DAYS_JP  = ['日','月','火','水','木','金','土'];
const BLOCKS   = [
  { key: 'morning',   label: 'MORNING   06:00–12:00', min: [6*60, 12*60] },
  { key: 'afternoon', label: 'AFTERNOON 12:00–18:00', min: [12*60, 18*60] },
  { key: 'night',     label: 'NIGHT     18:00–06:00', min: [18*60, 30*60] },
];

// publishingイベントのtype定義
const PUB_TYPES = {
  release:  { label: 'RELEASE',  color: 'var(--ps-amber2)',  bg: 'rgba(200,132,26,0.25)' },
  plot:     { label: 'PLOT',     color: 'var(--ps-green2)',  bg: 'rgba(42,138,74,0.25)'  },
  review:   { label: 'REVIEW',   color: 'var(--ps-purple2)', bg: 'rgba(155,89,182,0.25)' },
  infra:    { label: 'INFRA',    color: 'var(--ps-blue2)',   bg: 'rgba(41,128,185,0.25)' },
  work:     { label: 'WORK',     color: '#e8d44d',           bg: 'rgba(232,212,77,0.20)' },
  personal: { label: 'PERSONAL', color: '#e8856a',           bg: 'rgba(232,133,106,0.20)'},
};

const pad = n => String(n).padStart(2, '0');

/** "HH:MM" → 分数（深夜0〜5時は+24h） */
function t2m(t) {
  const [h, m] = t.split(':').map(Number);
  return (h < 6 ? h + 24 : h) * 60 + m;
}

/** 現在分数（深夜補正） */
function nowMin() {
  const d = new Date();
  const h = d.getHours();
  return (h < 6 ? h + 24 : h) * 60 + d.getMinutes();
```

## ./viewer/production/private-schedule/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MERITOCRACIA OS — 作業卓</title>
<link rel="stylesheet" href="./style.css">
</head>
<body>
<div class="ps-wrap">

  <!-- ヘッダー -->
  <div class="ps-top-bar">
    <div class="ps-site-label">MERITOCRACIA — 作業卓</div>
    <div class="ps-clock-block">
      <div id="ps-clock-time">00:00:00</div>
      <div id="ps-clock-date">----/--/--</div>
    </div>
  </div>

  <!-- 週間プログレス -->
  <div class="ps-weekly-progress">
    <div class="ps-wp-header">
      <span class="ps-wp-label">WEEKLY PROGRESS</span>
      <span id="ps-wp-pct">0%</span>
    </div>
    <div class="ps-wp-bar">
      <div class="ps-wp-fill" id="ps-wp-fill"></div>
    </div>
  </div>

  <!-- 2カラム -->
  <div class="ps-main-grid">

    <!-- ポモドーロ（左カラム・完全維持） -->
    <div class="ps-card">
      <span class="ps-card-label">POMODORO TIMER</span>
      <div id="ps-pomo-mode">WORK</div>

      <div class="ps-ring-wrap">
```

## ./viewer/production/private-schedule/notes.json

```
{
  "today_log": [
    "ZERO都市マップOS modular設計方針を確定",
    "map-data.json 市場中心の密集を改善",
    "map viewer を GitHub Pages に公開"
  ],
  "next_action": [
    "Claudeに modular JSON + drag editor 依頼",
    "士官学校編 map OS を新設",
    "private-schedule に作業メモ表示"
  ],
  "waiting": [
    "Claude baseline quota reset 4/18"
  ]
}
```

## ./viewer/production/private-schedule/schedule.json

```
{
  "week": "2025-W15",
  "weekly_progress": 42,
  "publishing": [
    {
      "date": "2026-04-11",
      "label": "土曜ナイトルーチン",
      "type": "personal",
      "timeline": [
        {
          "time": "19:00",
          "label": "バックアップ構築及び見直し"
        },
        {
          "time": "22:00",
          "label": "アニメ鑑賞"
        },
        {
          "time": "00:00",
          "label": "創作活動"
        }
      ]
    },
    {
      "date": "2026-04-12",
      "label": "創作再開",
      "type": "personal",
      "timeline": [
        {
          "time": "15:00",
          "label": "創作再開"
        },
        {
          "time": "10:00",
          "label": "士官学校編 Scene46"
        },
        {
          "time": "14:00",
          "label": "昼寝"
        },
```

## ./viewer/production/private-schedule/style.css

```
/* ============================================================
   MERITOCRACIA OS — 作業卓 / private-schedule
   prefix: ps-  (production-schedule)
   v3: 年間カレンダー / 右カード内部タブ追加
   ============================================================ */

:root {
  --ps-bg:       #07090f;
  --ps-bg2:      #0e1320;
  --ps-bg3:      #141c2e;
  --ps-amber:    #c8841a;
  --ps-amber2:   #e8a030;
  --ps-amber3:   #f5c060;
  --ps-dim:      #4a3c28;
  --ps-text:     #d4c5a9;
  --ps-text2:    #7a6e5e;
  --ps-text3:    #4a4030;
  --ps-green:    #2a8a4a;
  --ps-green2:   #3dbb66;
  --ps-blue:     #1e3a5f;
  --ps-blue2:    #2980b9;
  --ps-purple:   #3e1e5f;
  --ps-purple2:  #9b59b6;
  --ps-red:      #8a2020;
  --ps-red2:     #c0392b;
  --ps-border:   rgba(200,132,26,0.18);
  --ps-shadow:   rgba(0,0,0,0.6);
  --ps-r:        16px;
}

/* ────── リセット ────── */
.ps-wrap * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

/* ────── ベース ────── */
body {
  background: var(--ps-bg);
```

## ./viewer/production/private-schedule/temp.json

```
```

## ./viewer/production/private-schedule/アーカイブ/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MERITOCRACIA OS — 作業卓</title>
<link rel="stylesheet" href="./style.css">
</head>
<body>
<div class="ps-wrap">

  <!-- ヘッダー -->
  <div class="ps-top-bar">
    <div class="ps-site-label">MERITOCRACIA — 作業卓</div>
    <div class="ps-clock-block">
      <div id="ps-clock-time">00:00:00</div>
      <div id="ps-clock-date">----/--/--</div>
    </div>
  </div>

  <!-- 週間プログレス -->
  <div class="ps-weekly-progress">
    <div class="ps-wp-header">
      <span class="ps-wp-label">WEEKLY PROGRESS</span>
      <span id="ps-wp-pct">0%</span>
    </div>
    <div class="ps-wp-bar">
      <div class="ps-wp-fill" id="ps-wp-fill"></div>
    </div>
  </div>

  <!-- 2カラム -->
  <div class="ps-main-grid">

    <!-- ポモドーロ（左カラム・完全維持） -->
    <div class="ps-card">
      <span class="ps-card-label">POMODORO TIMER</span>
      <div id="ps-pomo-mode">WORK</div>

      <div class="ps-ring-wrap">
```

## ./viewer/production/settings/docs/キャラクター/アイリス/# Claude依頼プロンプト｜アイリス専用キャラクターページHTML実装.md

```
# Claude依頼プロンプト｜アイリス専用キャラクターページHTML実装

あなたはプロダクション品質のフロントエンドエンジニアです。
以下の要件で **単体HTML + CSS（1ファイル完結）** を実装してください。

---

## 🎯 目的

『メリトクラシア -Reboot-』のメインヒロイン
**アイリス＝アールグレイ専用キャラクターページ** を制作する。

GitHub Pagesの Viewer 配下
`docs/viewer/character/iris.html`
にそのまま配置できる品質を目指す。

---

## ☕ デザインテーマ

### コンセプト

**「高貴な琥珀色と、湯気に溶ける絶望」**

名前の **Earlgrey** を活かし、
高級紅茶ブランドのラベルデザインをモチーフにする。

読者が最初に

> 「名前アールグレイだから紅茶やんｗ」

と軽く笑い、読み進めると
戦争奴隷・家庭崩壊・救済テーマの重さに気づく
**ギャップ演出UI** にする。

---

## 🎨 カラーパレット

* メイン背景：`#8B4513`
```

## ./viewer/production/settings/docs/キャラクター/アイリス/アイリス_戦争奴隷設定_詳細.md

```
📜 議事録

件名：アイリス背景設定・戦争奴隷時系列 確定事項
ルーム：アイリス背景・序盤開示 設計ルーム（Ars_Main_IV）
作成日：2025-12
決定権者：Lancer
参加AI：ZERO / ノルン / エリカ

1. 戦争の終結時期について（確定）

アイリスの祖国アルトゥナが関与した戦争は
物語開始の「1〜2か月前」に終結している

半年以上前には設定しない
→ 戦後処理・制度運用が「まだ不安定」な状態を意図的に維持

設定意図

奴隷供出・再売却・管轄問題が整理しきれていない

審問庁が「特例」「協議中」という曖昧な対応を取れる余地を作る

ユミナの立場・発言の自然化

2. 戦争奴隷化のタイミング（確定）

アルトゥナ敗戦条件の一つとして
「戦争奴隷の供出」が発生

アイリスは敗戦直後に
戦争奴隷として商品化された

戦争奴隷化の流れ（整理）

アルトゥナ敗戦

賠償・条件処理の一環として戦争奴隷供出

アイリスは捕虜または人質枠に近い立場で拘束

```

## ./viewer/production/settings/docs/キャラクター/アイリス/クロード依頼夜切り替え.md

```
# Claude差分改修プロンプト｜iris.html Day/Night切替追加

今ある `iris.html` の完成版をベースに、
ゼロから作り直さず **差分改修** してください。

## 🎯 目的

現在は Day Mode（紅茶ラベルUI）のみ完成している。
これを壊さず、同一HTML内に

> 🌙 Nightfall Mode（夜化因子UI）

を追加したい。

---

## 必須改修

### 1) モード切替ボタン追加

ヘッダー上部に以下を追加。

```html id="w8p7ca"
<button id="toggleModeBtn">☀ Day / 🌙 Night</button>
```

クリックで Day / Night 切替。

---

### 2) CSSテーマ切替

既存の Day CSS は維持。

Night追加時のみ以下へ反転。

* 背景：深紺 `#0B1020`
* 枠線：銀 `#C0C0C0`
* テキスト：月白
* hover：紫発光
```

## ./viewer/production/settings/docs/キャラクター/アイリス/📘  完全設定資料ジェミニドキュメント化.md

```
📘 アイリス＝アールグレイ 完全設定資料（前編）

対象作品： 『メリトクラシア -Reboot-』
ステータス： 2026-03-31 最終ロック済み
1. 出自と血統的背景（アルトゥナ時代）

アイリスの孤独は、奴隷になる以前の家庭内における種族的疎外に根ざしている。

    種族の乖離： エルフの家系に生まれた唯一のダークエルフ（末っ子）。

    家庭内待遇： 「忌み子」「家の恥」として扱われ、名前を呼ばれず、日常的な身体的・精神的暴力に晒されていた。

    役割： 家族内での事実上の奴隷であり、雑用や責任転嫁の対象として人格を否定され続けてきた。

2. 戦争と家族壊滅の真実

物語開始直前の動乱期における、アイリスの過酷な流転の記録。

    戦争終結： 物語開始の1〜2か月前にアルトゥナ戦争が終結。

    家族壊滅事件： 戦争終結直後、オーク帝国軍の現場軍人による「臓器・身体部位の闇取引（非公式ビジネス）」の犠牲となり、両親・兄弟姉妹は全員殺害された。

    生存の理由： 若年のダークエルフであり「未使用」であったため、臓器回収対象から外され、再販価値の高い「商品（戦争奴隷）」として生かされた。この「最悪の理由による選別」が、彼女の深い生存罪悪感となっている。

3. 戦争奴隷としての足跡

    奴隷化の性質： 敗戦の賠償・見せしめの交換資産として商品化された。

    期間： 数週間〜1か月程度の短期拘束。

    性的消費の有無： 実行されていない。奴隷商および購入者（カール）が商品価値の維持（転売前提）を優先したため、壊される直前の状態で時間が止まっている。

📘 アイリス＝アールグレイ 完全設定資料（中編）
4. 深層トラウマ核（反応原理）

本文中の行動を支配する、無意識の条件反射。

    「役割の喪失 ＝ 破棄」への恐怖： 彼女の核には「役に立てない、主人の価値を下げる、面倒な個体と見なされる」＝「捨てられる・売られる」という強迫観念がある。

    ジェイドへの執着： 単なる恋愛以前に、ジェイドが「価値ではなく、嫌がっているという意思」を見て助けてくれたという、世界認識を覆すレベルの存在承認への依存と信仰である。
```

## ./viewer/production/settings/docs/キャラクター/アイリス/📘 アイリス＝アールグレイ キャラクター完全設定資料（前編）.md

```
📘 アイリス＝アールグレイ キャラクター完全設定資料（前編）

対象作品： 『メリトクラシア -Reboot-』
ステータス： 2026-03-31 確定ロック済み
1. 出自と家庭環境（アルトゥナ時代）

アイリスの性格形成の根源には、単なる「奴隷」以前に、家庭内での凄惨な疎外が存在する。

    種族の乖離： エルフの家系に生まれた唯一のダークエルフ（末っ子）。

    家庭内待遇： 「忌み子」「家の恥」として扱われ、名前をまともに呼ばれず、日常的な暴力（殴打・蹴り）に晒されていた。

    役割： 家族内での事実上の奴隷であり、雑用や責任転嫁の対象。

    影響： この時期の経験が、後の「役割がなくなれば捨てられる」という強迫観念の土台となっている。

2. 戦争と家族壊滅の時系列

物語開始直前の動乱期における、アイリスの流転の記録。

    アルトゥナ戦争終結： 物語開始の1〜2か月前に終結。

    家族壊滅事件： 戦争終結直後の混乱期に発生。

        実行犯： オーク帝国軍の現場軍人による非公式な職権濫用（臓器・身体部位の闇取引目的）。

        結末： 両親・兄弟姉妹は全員殺害。アイリスのみ「ダークエルフとしての再販価値（未使用）」を理由に生かされた。

    生存罪悪感： 「最悪の理由（商品価値）」で選別され生き残ったことが、彼女の自己否定の根源である。

3. 戦争奴隷としての足跡

壊滅からジェイドによる救済までの、短くも濃密な絶望の期間。

    奴隷化の性質： 国家間の賠償条件としての「戦争奴隷」枠で回収。

    期間： 数週間〜1か月程度の短期拘束。

    性的消費の有無： 実行されていない。

```

## ./viewer/production/settings/docs/キャラクター/アイリス/📘 統合議事録｜アイリス家族構成・家庭内差別構造 正式ロック版.md

```
📘 統合議事録｜アイリス家族構成・家庭内差別構造 正式ロック版

対象作品： 『メリトクラシア -Reboot-』
対象キャラ： アイリス＝アールグレイ
用途： 本文 Scene19〜20 / 回想断章 / 長編中盤の帰属反転伏線
状態： 2026-04-05 正式ロック

1. 家族構成（正式確定）

アイリスは アルトゥナの純エルフ家系に生まれた唯一のダークエルフ であり、家族内では明確な異物として扱われていた。

家族一覧
父：純エルフ
家の名誉と血統を重視する保守的気質
アイリスを「家の恥」と見なす起点
名前を呼ばず、存在を視界に入れない支配型
母：純エルフ
直接加害は少ないが、保護しない沈黙型
配膳位置、衣服、寝床などで露骨な差をつける
“愛さないことで従わせる”役割
長兄：純エルフ
雑用・力仕事・責任転嫁の押しつけ担当
アイリスを便利な下位存在として扱う
長姉：純エルフ
外見差別の象徴
髪、肌、耳、目元などを嘲笑う
Scene20で髪を掴む描写担当に最適
次兄：純エルフ
家庭内いじめの傍観者兼増幅役
笑い・同調・密告で集団圧を強化
末っ子：アイリス（唯一のダークエルフ）
家族内でのみ正式な名前を奪われた存在
“末っ子なのに最も愛されない”構図が核
2. 家庭内序列（心理構造）

この家では年齢順ではなく、血統純度と見た目の同質性が序列を決めている。

そのため本来守られるはずの末っ子であるアイリスは、逆に最下層へ固定された。

序列構造
```

## ./viewer/production/settings/docs/キャラクター/クララ・ヴエルナー/1️⃣ 基本情報（確定）.md

```
1️⃣ 基本情報（確定）

名前：クララ・ヴェルナー

性別：女性

年齢：20代後半（推定）

立場：市場の粉屋で働く平民女性

家族：

妹：ユミナ・ヴェルナー

階級：ウンフェーイグ（最下層平民）

※ep1・ep7ともに一貫して
「政治・制度の外側にいる一般市民」として描写 

ep1

2️⃣ 外見・印象（確定）

淡い銀紫色の髪

優しい表情、柔らかい物腰

作業着（シャツ＋エプロン姿）が基本

市場の喧騒に溶け込む「日常の人」

📌
ユミナと顔立ちが似ているが、
・立場
・生き方
・世界との距離
が完全に異なる存在として設計されている

3️⃣ 性格・人柄（確定）

```

## ./viewer/production/settings/docs/キャラクター/クララ・ヴエルナー/💠 キャラ画像生成プロンプト（封印用・最終版）.md

```
💠 キャラ画像生成プロンプト（封印用・最終版）
対象キャラクター

クララ・ヴェルナー（Clara Werner）
年齢：28歳
種族：人間
立場：平民／粉屋で働く女性
関係性：ユミナ・ヴェルナーの実姉

🔒 生成目的（明示）

本画像は
「ユミナと同じ血を引きながら、別の人生を歩んだ女性」
という構造を視覚的に固定するためのもの。

可愛さ・華やかさの強調は禁止。
英雄性・特別感の演出は禁止。
生活感・現実感・静かな温度を最優先する。

🎨 外見プロンプト（統合）
全体印象

落ち着いた雰囲気の成人女性

親しみやすく、街に溶け込む存在

目立たないが、近くにいると記憶に残る

「守る側」ではなく「日常を回す側」の人間。

髪

色：淡い紫寄りの銀髪（冷たくなりすぎない）

質感：実用的、少し乾燥気味

髪型：

高めのポニーテール

```

## ./viewer/production/settings/docs/キャラクター/ベルフェール/ベルフェゴール服装案.md

```
🏛 メリトクラシアZERO 議事録
ベルフェゴール（バアル）戦闘形態設定
1. 基本設定

キャラクター
ベルフェゴール

旧名
バアル

種族
堕天使

性格

陽気
＋
狂気

特徴

少年の姿

赤い堕天翼

軽い口調

圧倒的戦闘力

2. 通常形態（人間擬態）

目的
人間社会に溶け込む姿

服装

白シャツ

茶ベスト

```

## ./viewer/production/settings/docs/キャラクター/ベルフェール/ベルフェゴール衣装テーブル.md

```
🏛 メリトクラシアZERO 議事録
ベルフェゴール（バアル）衣装設計会議

日時
2026-03-06

会議目的
ベルフェゴールの衣装デザインを
通常形態（人間擬態）と戦闘形態（魔王モード）に分けて整理する。

1. キャラクター概要
項目	内容
キャラクター名	ベルフェゴール
旧名	バアル
種族	堕天使
外見	少年
特徴	赤い堕天翼
性格	陽気＋狂気
戦闘力	極めて高い
2. 通常形態（人間擬態）
目的

人間社会に溶け込むための姿。

デザイン方針

「普通の少年」

衣装構成
部位	デザイン
上半身	白シャツ
上着	茶色ベスト
下半身	茶ショートパンツ
靴	ブーツ
装飾	なし
状態
項目	内容
魔力	抑制状態
武装	なし
翼	通常状態
```

## ./viewer/production/settings/docs/キャラクター/ユミナ・ヴェルナー/📘 テロ事件編／ユミナ関連設定（確定議事録）.md

```
📘 テロ事件編／ユミナ関連設定（確定議事録）
■基本情報

名前：ユミナ

年齢：

本編時系列：約22歳

前日譚（2年前）：約20歳

■所属・立場

所属：審問庁

状態：初登庁直後（新人）

役割：

宗教機関の監視

情報収集

関係各所への挨拶・顔出し

■教会バイト編での立ち位置

カーネルが働く教会に訪問

表向き：

挨拶

関係構築

実態：

監視任務

情報収集対象として教会を観察
```

## ./viewer/production/settings/docs/キャラクター/ライナルト/グローリアテスト制度見直し.md

```
📘 議事録
件名：ライナルト設定・グローリアテスト制度見直しに関する設計判断

日時：2026-01
対象章：本編第1話／セクション⑤以降（ライナルト初登場）
記録種別：設計判断ログ（暫定確定）

1. 問題提起

ライナルト（14歳）とジェイド（10歳）が
同じ士官学校・同学年・同クラスになる点に違和感がある

ライナルトの

年齢

苦労人設定

ジェイドへの強いライバル意識
を同時に成立させる必要がある

2. 検討された主な案
案A：ライナルト＝一発合格エリート

分かりやすいが

努力・挫折・執着の厚みが不足
→ 採用せず

案B：何度も落ちて14歳でようやく合格

苦労人感は出るが

年齢差と「エリート候補生」感が弱くなる
→ 保留

案C：グローリアテスト部分合格制（採用）

科目単位での合格・持ち越しを許容

```

## ./viewer/production/settings/docs/キャラクター/ライナルト/ライナルト_性格・思想_最終確定.md

```
📄 議事録（確定）
ライナルト＝グロース 性格・思想設計

― 心音システム対比を含む最終定義 ―

0️⃣ 本議事録の位置づけ

本議事録は以下を目的とする。

ライナルト＝グロースの性格・思想・行動原理の最終確定

主人公ジェイドとの対立構造の明文化

心音システム（構造解析能力）との思想的コントラストの整理

プロローグ（6歳）〜士官学校編〜模擬戦までの一貫性確保

本内容は
**小説・ゲーム両媒体における共通設定（正史）**として採用する。

1️⃣ ライナルト＝グロースの基本定義（確定）
一文定義（固定）

ライナルト＝グロースとは

正しく積み上げた者が、
正しく勝つ世界を信じて疑わない少年であり、
その世界を“例外”によって壊されることを最も嫌う存在である。

2️⃣ 性格の基調（マルフォイ×ベジータ配合比）
表層（対外的態度）｜マルフォイ要素

口調は丁寧・冷静・礼儀正しい

直接的な暴言や罵倒は使わない

嘲笑はするが、感情を荒げない

相手を「人格」ではなく「分類」で見る

```

## ./viewer/production/settings/docs/キャラクター/ルカ/📘 議事録｜ルカ キャラクター設計（確定版.md

```
📘 議事録｜ルカ キャラクター設計（確定版）
■基本情報

名前：ルカ（Luca）

立場：教会バイト（下層出身）

年齢：ジェイドと同年代想定（10〜12歳帯）

ポジション：“巻き込まれる側の視点人物”／影側主人公

■外見設定

髪色：青系（暗めのネイビーブルー）

瞳：やや光の弱い青〜灰色

髪型：無造作気味（整えていない）

体型：細身・やや貧弱

姿勢：軽く猫背

服装：サイズの合っていない古着

■キャラコンセプト

👉 「気づいているのに、見ないふりをする少年」

■性格構造（コア）
要素	内容
基本性質	現実主義・生存優先
思考	損得基準・リスク回避
感情	抑圧気味（外に出さない）
行動	受動的（自分から動かない）
対人	空気を読む・波風を立てない
弱点	踏み込めない・決断できない
■性格モデル（配合比）

シンジ（エヴァ）：70%
```

## ./viewer/production/settings/docs/キャラクター/ヴィオラ・スティルネン/📘 キャラクター設計書：ヴィオラ＝スティルネン（Viola Stilnen）.md

```
📘 キャラクター設計書：ヴィオラ＝スティルネン（Viola Stilnen）

「正しさは、常に一つであるべきだと信じていた」
01. コンセプト：核定義（CORE DEFINITION）

ヴィオラは**「制度の擬人化」であり、「正しさの器」である。
理性によって世界を完璧に定義しようとするが、その基準はすべて外部から与えられたものに過ぎない。本作における彼女の旅路は、与えられた「正論」を捨て、自らの「意志」で選択肢を選び取るまでの脱却の物語**である。
02. 基本属性（BASIC PROFILE）
項目	内容	備考
名前	ヴィオラ＝スティルネン	
年齢	15歳	
出自	中〜上位貴族	特権階級としての視座を持つ
立場	士官候補生（学術特待）	審問庁補佐官候補
役割	観測者 / 制度の代弁者	主人公ジェイドとの対比構造
03. 性格構造と精神力学（PSYCHOLOGY）
■ 二層構造の精神

    【表層：完成された理性】
    論理を優先し、感情を「計算の誤差」として排除する。他者を人間としてではなく、評価・分析の対象として捉える傾向がある。

    【内面：未発達な感情】
    感情を抱くこと自体を「未熟」と定義する家庭環境で育ったため、自身の心の揺らぎを「ノイズ」として処理してしまう。

■ 家庭環境がもたらした認知の歪み

    「正しさは教えるが、幸せは教えない家庭」

    父： 結果のみを評価する徹底した合理主義者。

    母： 規律を重んじ、感情を抑制することを「高貴さ」と説く。

    結論： ヴィオラにとって**「正しくあること＝自身の存在価値」**となっており、正しさを失うことは自己の消滅を意味する。

04. 感情の変遷（CHARACTER ARC）
PHASE 01：模範的な鏡

親や制度の思想を完全にコピーし、矛盾のない「純粋な優等生」として振る舞う時期。
PHASE 02：最初の矛盾（テロ事件）

カーネルの死。善人が理不尽に死ぬという「非合理な現実」に直面し、既存の論理では説明がつかない違和感を抱く。
```

## ./viewer/production/settings/docs/キャラクター/主人公一家/カーネル　レオンハルト/カーネルレオンハルト １８禁プロンプト.md

```
カーネルレオンハルト　１８禁プロンプト
(masterpiece, best quality), orange hair, high ponytail, amber eyes, beautiful anime girl, detailed face, seductive smile, blushing, looking at viewer, school uniform slightly unbuttoned, cleavage, large breasts, slim waist, thighs, sitting on bed, bedroom background
v2: 上半身脱ぎ始め・下着見せ
(masterpiece, best quality, ultra detailed), orange hair, high ponytail, amber eyes, anime girl, beautiful detailed face, aroused expression, tongue out, heavy breathing, school uniform shirt open, white bra visible, bra pull down, exposed breasts, nipples, pink nipples, large breasts, navel, skirt lifted, panties visible, wet panties, thighs apart, on bed, erotic pose```

## ./viewer/production/settings/docs/キャラクター/主人公一家/カーネル　レオンハルト/カーネルレオンハルト見た目設計.md

```
メリトクラシア設定議事録
ジェイド家族キャラクター設計
作成日

2026-03-07

① ジェイド姉
基本情報
項目	内容
名前	カーネル・レオンハルト
年齢	16歳
立場	メリトクラシア一般教育校の学生（庶民向け学校）
家族	ジェイドの姉
外見
項目	設定
髪色	ハニーゴールド（オレンジ寄りブロンド）
髪型	ポニーテール
瞳	アンバー（琥珀色）
体格	健康的・活発
身長	約162cm
肌	少し日焼け気味
特徴	少しそばかす（任意）
服装

庶民学生の街着

白シャツ

簡素なベスト

動きやすいスカートまたはパンツ

革ブーツ

学校用の肩掛け鞄

性格

元気で現実的な姉。

```

## ./viewer/production/settings/docs/キャラクター/主人公一家/カーネル　レオンハルト/メリトクラシアAIキャラ生成議事録.md

```
メリトクラシアAIキャラ生成議事録
ジェイド姉 服装デザインプロンプト
1. キャラ基本設定

キャラ名

ジェイド姉

仮名称

jade_sister
外見特徴
項目	設定
髪色	オレンジ
髪型	ポニーテール
瞳	アンバー
雰囲気	活発 / 弟をからかう姉
年齢	16歳
立場	平民家庭
2. AI生成ベースプロンプト

すべての衣装のベース

orange hair, ponytail, amber eyes, anime girl

推奨追加

masterpiece, best quality, anime style
3. 衣装バリエーション

ジェイド姉のデザイン候補。

A
学園制服

世界観的に最も自然。

orange hair ponytail amber eyes anime girl school uniform

特徴
```

## ./viewer/production/settings/docs/キャラクター/主人公一家/ジェイド　レオンハルト/🏛 議事録.md

```
🏛 議事録
ジェイド＝メタトロン設定（統合確定版）
■ 議題

主人公ジェイドの存在に関する 天界側設定（メタトロン要素） の整理

1｜基本定義
ジェイドの本質

ジェイドは メタトロンに関係する存在である。

ただし

天界の使徒ではない

自覚もない

天界も直接介入しない

つまり

「観測対象としてのメタトロン適合者」

という扱いになる。

2｜世界のルール（重要）

天界には 絶対制約が存在する。

天界の原則

原則として 現世へ直接介入しない

人類の発展を妨げない

神話存在の顕現は禁止

観測のみ許可

つまり
```

## ./viewer/production/settings/docs/キャラクター/主人公一家/ジェイド　レオンハルト/📘メリトクラシア 設定議事録.md

```
📘メリトクラシア 設定議事録
主人公設計：ジェイド・レオンハルト（Core Character Sheet v1.2）
■1｜キャラクター概要

本資料は、作品『メリトクラシア』における主人公
ジェイド・レオンハルトの設計思想・構造・役割を統合した正式定義資料である。

本キャラクターは単なる物語の主人公ではなく、
本作品のテーマである

「制度・神・人間のどれが正しいのか」

という問いに対して、最終的に“選択”を行う存在として設計されている。

■2｜目的構造（多層設計）

ジェイドの目的は単一ではなく、
物語進行に応じて段階的に変化する多層構造を持つ。

●表層目的（序盤〜中盤）
強くなる
貴族になる
自分を見下した者を見返す

👉動機：社会的劣等感・階級差別体験

●中層目的（中盤）
姉カーネルの死の真相を知る

👉契機：

市場テロ事件
国家による「事故処理」
犯人の不自然さ

👉構造：

表向き：宗教テロ
実態：影武者・未解決事件
●深層目的（後半）
```

## ./viewer/production/settings/docs/キャラクター/主人公一家/ミレイユレオンハルト/メリトクラシア設定議事録.md

```
メリトクラシア設定議事録
キャラクター設計：ミレイユ・レオンハルト

作成日
2026-03-07

基本情報
項目	設定
名前	ミレイユ・レオンハルト
英名	Mireille Leonhardt
年齢	35歳
性別	女性
種族	人間
階級	平民（ウンフェーイグ）
居住	メリトクラシア郊外都市
外見設定
項目	内容
髪色	ブラウン
瞳色	グリーン
髪型	肩〜胸ほどのストレートヘア
肌	色白
体型	細身
雰囲気	落ち着いた美人

特徴

優しい目元

柔らかな微笑み

穏やかな雰囲気

少し疲れた表情がある

顔の特徴

ジェイドとの共通点

グリーンの瞳

```

## ./viewer/production/settings/docs/キャラクター/前線騎士団/前線騎士団（Frontorden FO）.md

```
⚔️ 前線騎士団（Frontorden / FO）
テロ事件・現場関与人物【正式確定資料】

※ 本資料は
プロローグ三部作／ジェイドの原体験／FO描写の基準として固定。

① 現場指揮官【確定】
レオンハルト・クロイツ（Leonhard Kreuz）

階級：前線騎士団（FO）大尉

年齢：37歳

所属：FO 第三戦術分隊・現場指揮官

専門：市街地戦・テロ鎮圧

人物像（固定）

冷静沈着

感情を判断に混ぜない

子どもに特別な配慮をしない

しかし無差別ではない

👉
「判断を迷わないこと」を最優先する軍人。

行動原則

迷い＝死者を増やす

だから、判断後は一切揺れない

救うか切るかではなく
**「今、何を処理すべきか」**だけを見る

ジェイドへの第一印象（確定）
```

## ./viewer/production/settings/docs/キャラクター/吸血鬼陣営/エス＝ミュール/# 📘 『メリトクラシア -Reboot-』キャラページ制作依頼.md

```
# 📘 『メリトクラシア -Reboot-』キャラページ制作依頼
対象キャラ：エス＝ミュール
目的：GitHub Pages Viewer用 character HTML
基準レイアウト：既存アイリスHTML完成版を骨格流用

アイリスHTMLの上品なUI骨格を使い、
吸血鬼陣営専用の「夜霧サロンラベル」テーマで
エス専用ページを1ファイル完結HTMLで作成してください。

【テーマ】
- 夜霧サロンラベル
- 黒 × 金 × 紫煙
- 白磁カップ
- 夜霧
- 給仕
- 包容
- 夜の観測者

【世界観要素】
- 夜の仮設家族の感情支柱
- 食卓給仕役
- デイジアに母性的
- 夜の卓を守り続けた存在
- 最終的に離反して朝側へ送る

【UI演出】
- NIGHT MODEデフォルト
- DAWN MODE切替
- 霧や粒子のfade演出
- INTERNAL DOSSIER = 夜の卓観測記録
- footer lore = 壊れた食卓を守ることだけが、彼女の祈りだった

【必須】
- スマホ最適化
- CSS/JS内包
- GitHub Pages単体動作```

## ./viewer/production/settings/docs/キャラクター/吸血鬼陣営/エス＝ミュール/📘 キャラクター設計資料｜エス＝ミュール【Reboot正式版】.md

```
📘 キャラクター設計資料｜エス＝ミュール【Reboot正式版】

副題：壊れた夜の食卓を守り続けた、最後の感情支柱

01. 一文定義（Core）

「誰よりも夜の仮設家族を愛し、その食卓だけは壊したくなかった包容の観測者」

これが核です。

彼女は悪ではなく、
悪に寄り添い続けた結果、止めきれなかった人
です。

02. 基本プロフィール
名前：エス＝ミュール
種族：吸血エルフ
外見年齢：20代前半〜半ば
立場：
夜の仮設家族の精神支柱
情報観測 / 潜入補助 / 世論操作
表舞台での社交担当
象徴
金髪
柔らかな微笑
黒いドレス
白磁のティーカップ
赤布の卓の給仕役
一脚空席を整える手
03. バックグラウンド

ここは復讐より喪失感。

過去
戦乱と飢餓で家族を喪失
誰が敵だったかすら曖昧
人間にも吸血エルフにも裏切られた
正しさに意味を見失う
夜の卓に拾われる

```

## ./viewer/production/settings/docs/キャラクター/吸血鬼陣営/カリオン/📘 キャラクター設計資料｜カリオン【Reboot正式版】.md

```
📘 キャラクター設計資料｜カリオン【Reboot正式版】

副題：人類を食卓へ並べる、夜の復讐執行者

01. 一文定義（Core）

「家族を焼かれた夜を忘れず、人類を資源としか見なくなった吸血エルフ陣営の最悪の実行者」

これが核です。

カリオンは“悪に堕ちた悲しい兄”ではなく、
復讐を正義に変換してしまった外道
です。

02. 基本プロフィール
名前：カリオン
種族：吸血エルフ（夜化上位種）
外見年齢：20代後半〜30代前半
立場：
吸血鬼陣営実働セル長
港湾失踪事件の主導者
夜間密輸 / 襲撃 / 捕食ライン責任者
象徴
黒い杯
血刃
長い黒コート
低い笑い声
港の血臭
赤布の卓
03. バックグラウンド（人格起点）

人格の説得力はここです。

幼少期
吸血エルフの隠れ里生まれ
人間社会とは距離を置いて暮らしていた
両親は穏健派
共存の余地を信じていた
崩壊夜

```

## ./viewer/production/settings/docs/キャラクター/吸血鬼陣営/セレナ/# 📘 『メリトクラシア -Reboot-』キャラページ制作依頼.md

```
# 📘 『メリトクラシア -Reboot-』キャラページ制作依頼
対象キャラ：セレナ
目的：GitHub Pages Viewer用 character HTML
基準レイアウト：既存アイリスHTML完成版を骨格流用

アイリスHTMLのラベルUIをベースに、
吸血鬼陣営専用の「管理台帳ワインラベル」テーマで
セレナ専用ページを1ファイル完結HTMLで作成してください。

【テーマ】
- 管理台帳ワインラベル
- 紫黒 × 銀
- 人口台帳
- 白手袋
- 銀杯
- 家畜管理思想
- 理性の夜

【世界観要素】
- 上流吸血エルフ家系
- 両親生存
- 人類家畜思想
- 港湾供給網管理
- 恐怖と秩序の品質管理
- デイリス救出より戦略優先

【UI演出】
- NIGHT MODEデフォルト
- DAWN MODE切替
- supply table風 capability
- INTERNAL DOSSIER = 家畜管理思想
- footer lore = 管理された恐怖こそ最も上質な秩序

【必須】
- スマホ最適化
- CSS/JS内包
- indexへ戻るリンク
- GitHub Pages単体動作```

## ./viewer/production/settings/docs/キャラクター/吸血鬼陣営/セレナ/📘 キャラクター設計資料｜セレナ【Reboot正式版】.md

```
📘 キャラクター設計資料｜セレナ【Reboot正式版】

副題：人類を“管理家畜”として設計する、夜の理性

01. 一文定義（Core）

「人類を感情ではなく資源として設計し、恐怖と秩序で味を管理する吸血エルフの知性派支配者」

これが核です。

カリオンが“激情の外道”なら、
セレナは 冷徹な文明型の悪 です。

02. 基本プロフィール
名前：セレナ
種族：吸血エルフ（上流血統）
外見年齢：20代前半印象
立場：
吸血鬼陣営の理論参謀
港湾供給網 / 人口管理ライン設計
夜の卓の秩序維持役
象徴
銀縁の杯
細身の黒手袋
紫がかった赤瞳
冷たい微笑
港湾人口台帳
白い手帳
03. バックグラウンド（家系思想）

ここがカリオンとの最大差別化です。

家系

セレナの両親は生存。

しかも吸血エルフ上流層として、代々

人類管理思想
を継承してきた家系。
```

## ./viewer/production/settings/docs/キャラクター/吸血鬼陣営/デイジア＝ノクターン/📘 デイジア＝ノクターン 修正版 v2【前半】.md

```
📘 デイジア＝ノクターン 修正版 v2【前半】

副題：国家に許可された、14歳の夜の異物

01. コア定義

「国家に観測許可された14歳の吸血鬼少女。
昼は受験者、夜は血統記憶の観測者」

これが新版の核です。

旧作との差分は明確で、
今回は最初から ジェイドと同じ試験会場にいる。

つまり彼女は後から夜に現れるのではなく、

最初から“同じ制度空間を歩いていた”

存在です。

02. 基本プロフィール
名前：デイジア＝ノクターン
年齢：14歳（固定）
種族：吸血鬼（ナイト・ウォーカー）
所属：
表：士官学校特例受験者
裏：吸血鬼陣営現場観測セル
現在地：
試験編から同会場
学園編で正式編入
外見
金髪
赤×金オッドアイ
小柄
上品な制服映え
年相応の愛嬌
使い魔：黒猫ノワール
象徴
赤い指輪
黒い夢
```

## ./viewer/production/settings/docs/キャラクター/吸血鬼陣営/デイジア＝ノクターン/📘 設定資料：吸血鬼陣営『夜の仮設家族』と血の繋縛.md

```
📘 設定資料：吸血鬼陣営『夜の仮設家族』と血の繋縛

対象範囲： デイジア / カリオン / セレナ / エス / デイリス（新設定）
01. 吸血鬼陣営の本質：夜の仮設家族

彼らは単なる利害一致の組織ではない。戦争によって本来の帰るべき場所（家）を失った吸血エルフたちが、擬似的な家族として寄り添う**「夜の仮設家族」**である。
【聖域の儀式：赤布の食卓】

彼らが集う地下広間の光景には、すべて亡失した過去への執着が込められている。

    赤布の卓： かつての団欒の記憶。

    黒い杯： 乾杯ではなく、失った血脈を分かち合う儀式。

    四脚の燭台と一脚の空席： * 常に用意される「座る者のいない席」は、守れなかった者、あるいは未だ囚われの身であるデイリスのための場所。

        デイジアが時折見せる涙や視線の揺らぎは、この「空席」への罪悪感に起因する。

02. ノクターン姉妹：血族設定

デイジアの行動原理の核となる「妹」の存在を定義する。

    姉：デイジア＝ノクターン（14歳）

        吸血鬼陣営の実働部隊。奔放に振る舞うが、その心は常に妹の救出に縛られている。

    妹：デイリス＝ノクターン（11〜12歳）

        **「守れなかった過去」**の象徴であり、デイジアが戦う唯一の理由。

        彼女の存在が、デイジアを吸血鬼陣営（および天使側への協力）に繋ぎ止める**「鎖」**となっている。

03. デイリスの現状：天使排他派による非人道研究

デイリスは単なる捕虜ではなく、天使排他派（人間側過激派）による**「血統研究の被験体」**として幽閉されている。
【研究目的と人質の意味】

    血統記憶抽出： 吸血エルフが持つ数世代前の記憶を強制的に引き出す実験。

    ジルコン残響・資格者共鳴： 「塔」の深部へ干渉するための生体触媒としての利用。
```

## ./viewer/production/settings/docs/キャラクター/吸血鬼陣営/デイリス＝ノクターン/# 📘 『メリトクラシア -Reboot-』キャラページ制作依頼.md

```
# 📘 『メリトクラシア -Reboot-』キャラページ制作依頼
対象キャラ：デイリス
目的：GitHub Pages Viewer用 character HTML
基準レイアウト：既存アイリスHTML完成版を骨格流用

アイリスHTMLの完成レイアウトをベースに、
吸血鬼陣営専用の「空席の燭台ラベル」テーマで
デイリス専用ページを1ファイル完結HTMLで作成してください。

【テーマ】
- 空席の燭台ラベル
- 白銀 × 青白 × 朝光
- 白翼刻印
- 空席
- 夜明け
- 妹
- 救出TRUE

【世界観要素】
- デイジアの実妹
- 天使排他派研究施設の被験体
- 白翼刻印
- 空席の正体
- TRUEで朝日を見る
- BADで刻印暴走

【UI演出】
- NIGHT MODE = 被験体記録
- DAWN MODE = 救出後の朝光
- INTERNAL DOSSIER = 被験体記録
- footer lore = 空席は、朝日の中でようやく埋まる

【必須】
- スマホ最適化
- CSS/JS内包
- indexリンク
- GitHub Pages単体動作```

## ./viewer/production/settings/docs/キャラクター/吸血鬼陣営/デイリス＝ノクターン/📘 キャラクター設計資料｜デイリス＝ノクターン【Reboot正式版】.md

```
📘 キャラクター設計資料｜デイリス＝ノクターン【Reboot正式版】

副題：空席に座るはずだった、夜の家族の最後の妹

01. 一文定義（Core）

「夜の仮設家族がずっと空けていた席に、本来座るはずだったデイジアの実妹」

これが絶対コアです。

彼女は捕虜でも被験体でもあるけれど、物語上の本質は

“空席の意味を持った存在”

です。

だから救出の意味が大きい。

02. 基本プロフィール
名前：デイリス＝ノクターン
年齢：11〜12歳
種族：吸血エルフ
立場：
デイジアの実妹
天使排他派研究施設の被験体
血統記憶解析の生体鍵
象徴
白翼刻印
細い手首の拘束痕
空席の燭台
眠れない夜
朝日を知らない瞳
03. バックグラウンド

ここはデイジアの罪悪感の起点。

過去
ノクターン姉妹として育つ
デイジアに懐いていた
夜の卓で一番よく笑う子
```

## ./viewer/production/settings/docs/キャラクター/士官学校/キール/📘 議事録｜キール キャラクター設計（未完成管理版）.md

```
📘 議事録｜キール キャラクター設計（未完成管理版）
■ 作成目的

・キールの現時点設計を固定
・未確定要素を明示し、今後の拡張余地を確保
・ジェイド／ライナルト級への成長ルートを設計

■ 一文定義（現時点）

👉 「生き残るために全てを切り捨てたが、それでも捨てきれなかったものに縛られる少年」

■ 基本情報

・出自：元奴隷（貴族所有）
・現状：保護対象 → 士官学校特例入学
・経路：教会 → FO（前線騎士団）接続
・身分：準市民扱い

■ 背景構造
● 奴隷時代

・支配構造の中で生存
・選択権なし

● 教会フェーズ

・保護されるが選別構造を体験
・宗教・救済への不信形成

● FO接続

・戦闘能力を評価される
・「人」ではなく「戦力」として扱われる

■ 思想（現時点）

👉 生存至上主義

● 内容

```

## ./viewer/production/settings/docs/キャラクター/士官学校/フラン/📘 議事録｜フラン キャラクター設計（未完成管理版）.md

```
📘 議事録｜フラン キャラクター設計（未完成管理版）
■ 作成目的

・フランの現時点設計を固定
・未確定要素を明示し、今後の拡張余地を確保
・キール／ジェイドとの関係性を軸に成長余白を残す

■ 一文定義（現時点）

👉 「誰かに選ばれることでしか、自分の存在を証明できない少女」

■ 基本情報

・出自：パリア（準奴隷）
・立場：使用人階層
・経路：教会（使用人）
・現状：士官学校に関与（使用人ルート）

■ 背景構造
● パリア階層

・奴隷ではないが自由ではない
・社会的に下層
・“選ばれる側”として存在

● 教会フェーズ

・使用人として生活
・弱い立場での生存
・他者依存型の価値観形成

● キールとの過去接点

・教会時代に接触
・キールに助けられる（本人は無意識）

👉 フラン側では
👉 「初めての救い」として記憶

■ 思想（現時点）
```

## ./viewer/production/settings/docs/キャラクター設定/ジェイド家家族構成議事録.md

```
メリトクラシア設定議事録
レオンハルト家キャラクター設計

作成日
2026-03-07

レオンハルト家

メリトクラシア郊外に住む平民家庭。

階級
ウンフェーイグ（平民）

一般的な庶民の家庭であり、物語序盤の「日常」を象徴する家族。

① 主人公
ジェイド・レオンハルト

Jade Leonhardt

項目	設定
年齢	10歳
性別	男性
種族	人間
階級	ウンフェーイグ
体型	細身
身長	約150〜155cm
外見
要素	設定
髪	ブラウン
瞳	グリーン
顔立ち	母親似

特徴

真っ直ぐな視線

少年らしい体格

落ち着いた雰囲気
```

## ./viewer/production/settings/docs/キャラクター設定/女の子の見た目詳細.md

```
ヒロインの見た目に関する詳細設定
【キャラクター設定：フラン】
項目	内容
名前	フラン（姓不明）
年齢	9歳
身長	約135cm
体格	痩せ型・発育不十分（栄養状態に依存）
髪色／瞳色	茶髪・琥珀色の瞳
出身	メリトクラシア郊外のパリア階層（最下層貧民区）
特徴	常に俯きがちで、声量が小さい。識字力が低く、自己紹介ができない。
象徴モチーフ	「名前を奪われた少女」――人格と尊厳の欠如を体現。
物語上の位置	ジェイドに“名前の意味”を思い出させる導線キャラ。Ep01の「番号呼び」の象徴。
心理的テーマ	“自分は誰か”という問いを通じ、序章の社会構造（階級差別）の痛みを可視化する。
将来の立場	Ep30以降で識字を学び、ユミナの補助生徒として登場。希望の連鎖を象徴する存在に。


【キャラクター設定：ユミナ＝ヴェルナー】
項目	内容
年齢	22歳
身長	167cm
体格	Dカップ相当。長身で姿勢が良く、身体線はしなやかで均整が取れている。
髪色／瞳色	銀灰色の髪・青灰の瞳
職務	審問庁監察官／ロータス直属監査官
階級	中佐（近衛監察官）
出身	メリトクラシア中枢都市圏出身（士官階層）
性格	冷静沈着・判断が速く論理的。だが情に厚く、誰よりも“努力する者”を見逃せない。
特徴	常に端末または記録帳を持ち歩き、規律を重んじる。指揮官としての威厳を保ちながらも、若者には柔らかな目線を向ける。
象徴モチーフ	「冷たい優しさ」「秩序の中の人間性」。
物語上の役割	序章では監察官としてジェイドとアイリスの保護監督を担当。
中盤以降では士官学校の倫理教官として再登場。
関係性	ロータス＝上官／信頼関係。ジェイド＝導く対象。アイリス＝見守る者。
台詞指針	「努力しても報われないことがある。――それでも努力する者を、私は見捨てない。」


🌿 アイリス＝アールグレイ（Iris Aarlgray）
項目	内容
年齢	16歳
種族	ダークエルフ
身長	162cm
体格	スレンダーで引き締まった体型。胸部はFカップ相当。エルフ特有の柔軟性と均整を持つ。
```

## ./viewer/production/settings/docs/キャラクター設定/📘 議事録｜士官学校キャラ設計（キール／フラン）.md

```
📘 議事録｜士官学校キャラ設計（キール／フラン）
■ 作成目的

・士官学校中核キャラ2名の設定確定
・関係性（恋愛／主従／思想）構造の明確化
・物語テーマとの接続強化

■ キール設計（確定）
● 一文定義

👉 「人としてではなく“戦力”として扱われ続けてきた元奴隷の現実主義者」

● 出自

・元貴族の奴隷
・主人が違法行為で逮捕
・その過程で保護される

● 教会フェーズ（過去）

・孤児／保護対象として教会に収容
・表：救済施設
・裏：選別・宗教過激思想の温床

👉 「神は救わない」という価値観を獲得

● FO接続

・事件または摘発時に前線騎士団（FO）が発見
・戦闘能力／適性を評価される

👉 「使える人材」として保護

● 現在の立場

・元奴隷（記録あり）
・保護対象（準市民）
・士官学校へ特例入学

● 思想
```

## ./viewer/production/settings/docs/伏線リスト/📌 伏線リスト（統合版）.md

```
📌 伏線リスト（統合版）
Ⅰ．人物系伏線（再登場・再定義向き）
1️⃣ ユリス（市場での男／即時排除された人物）

現時点の情報

不安定な精神状態

「悪そうではない」とジェイドが明確に認識

爆発の直前・直後の因果は一切描写されていない

FOにより即時排除

本人の意図・目的・背景は不明

伏線の性質

❗ 犯人“かもしれない”が断定不能

❗ 「現象の一部」として処理されている

今後の回収ルート例

審問庁記録で

「容疑者扱い」だった／されなかった

実は

使い捨ての“囮”

事件を止めようとしていた

巻き込まれた被害者側

第三者視点で

「彼は何もしていない」証言が出る

```

## ./viewer/production/settings/docs/伏線リスト/📑 議事録｜物語裏設定・キャラ因縁整理（暫定）.md

```
📑 議事録｜物語裏設定・キャラ因縁整理（暫定）
1. 世界観・国家関係（前提確認）

メリトクラシアはイングランドモデル

旧体制は連邦国家
→ 実力主義貴族制を掲げて独立

独立から 10年経過

周辺3か国は現在も 世襲制貴族国家

その結果：

人口流出が周辺国で顕著

メリトクラシアへの反感・敵意が蓄積

2. テロ事件の黒幕設定（確定）

プロローグで発生したテロ事件

実行犯：7名

正体：

全員が 貴族階級

メリトクラシア隣国の貴族

背景：

実力主義国家メリトクラシアへの政治的・思想的反発

旧連邦時代の支配層の逆恨み・既得権防衛

3. グローリアテスト制度の歴史

グローリアテスト自体は：

```

## ./viewer/production/settings/docs/伏線リスト/🔮 裏設定・未来年表.md

```
🔮 裏設定・未来年表
神話レイヤー／ベルフェゴール関連（作者用）
0️⃣ 前提整理（確定）

この神話戦争は
人間界の出来事とは独立して進行

人間側は原則として知らない

ジェイドのみが
「無自覚な接触点」になっている

1️⃣ ベルフェゴールの初期登場（確定）

登場時期：ジェイド 6歳

出典：ep1 冒頭パート1 

ep1

状況：

雨の夜

場所不明

瀕死状態

翼を持つ存在として描写される（当時は正体不明）

この時点でのベルフェゴール

正体は明かされない

少年の姿をとっている

明確に「追われている側」

重傷

```

## ./viewer/production/settings/docs/国家制度/三兵団/三兵団_ドイツ語・ラテン語確定.md

```
📋 議事録：メリトクラシア 三兵団ドイツ語/ラテン語ネーミング確定
作成日： 2025年12月27日
決定権者： Lancer
参加AI： Claude

🎯 確定事項
三兵団の正式名称（確定版）
日本語ドイツ語/ラテン語読み略称中央警備隊Zentral Gardeツェントラル・ガルデZG前線騎士団FrontordenフロントオルデンFO監察特務隊Vigil Arcanaウィギル・アルカナVA

🏛 各兵団の詳細設定
①中央警備隊（Zentral Garde / ZG）
言語： ドイツ語
語源：

Zentral = 中央の
Garde = 親衛隊・精鋭警備

役割：

内務・治安維持
国家試験運営
中枢警備
国家中枢直属

ニュアンス：

威厳がある
エリート感
腐敗の温床にもなりうる
権力の象徴

所属キャラクター：

ユミナ
ライナルト家

特徴：

シンプルで言いやすい
ゲームUIで使いやすい
```

## ./viewer/production/settings/docs/国家制度/国家機関一覧表/# 🏛 統合議事録｜国家機関一覧・中央政府組織図 Phase2.md

```
# 🏛 統合議事録｜国家機関一覧・中央政府組織図 Phase2（2026-04-02統合版）

作成日: 2026-04-02
統合元: 中央政府組織図ドラフト / 三兵団人物レイヤー設計ログ
決定権者: Lancer

---

## 1. 本日の結論（中央政府 + 三兵団人物運用の統合）

本日の成果は、前日の三兵団制度設計をさらに拡張し、**Dukeロータスを頂点とした中央政府の見取り図と、三兵団の人物運用レイヤーを一本化したこと**である。

これにより、国家機関一覧は単なる制度図を超え、**政治劇・士官学校編・市場テロ・宗教セル捜査まで接続可能な国家ドラマDB**へ進化した。

---

## 2. 国家中央政府 正式組織図（統合版）

### 国家最高中枢

* **Duke ロータス**

  * 国家元首 / 最高統治責任者
* 首席補佐官：未定
* 内政長官：未定

### 国家最高会議（中央政府）

* 三兵団統合司令部
* 審問庁中央局
* 士官学校統括院
* 宗教監督局
* 外交諜報院
* 財務復興省
* 転移門資源庁

この構図を「日本の内閣府モデル」に相当する国家統治フレームとして正式採用。

---

```

## ./viewer/production/settings/docs/国家制度/国家機関一覧表/# 📘 統合議事録｜国家機関一覧・三兵団制度設計（2026-04-01統合版）.md

```
# 📘 統合議事録｜国家機関一覧・三兵団制度設計（2026-04-01統合版）

作成日: 2026-04-01
統合元: Gemini比較設計ログ / 国家機関一覧表ルームログ
決定権者: Lancer

---

## 1. 本日の結論（重複統合後の正式コア）

本日の議論で確定した中核は、**三兵団を増やさず内部機能の分化で国家の厚みを出す**方針である。

基本思想は以下の3軸に集約される。

* **ZG = 秩序**
* **FO = 武力**
* **VA = 真実**

主人公ジェイドはこの3思想すべてと衝突・共鳴しながら成長する。

---

## 2. 三兵団の正式内部構造（統合確定）

内部構造は読者理解とゲームUIを両立するため、以下の共通階層で統一する。

```text
兵団
└ 局
   └ 連隊
      └ 班
         └ 個人
```

さらに各兵団の内部機能は、以下の**3層テンプレ**で設計する。

```text
象徴層
実務層
特殊層
```

## ./viewer/production/settings/docs/国家制度/階級制度/階級制度_概要.md

```
# メリトクラシア階級制度

## 全9階級一覧

1. セルウス（Servus）
2. パリア（Paria）
3. ウンフェーイグ（Unfähig）
4. フェーイグ（Fähig）
5. バロン（Baron）
6. グラーフ（Graf）
7. マルクグラーフ（Markgraf）
8. ヘルツォーク（Herzog）
9. グロースヘルツォーク（Großherzog）

## 補足

- 実力主義による昇格制度
- 世襲制の有無
- 奴隷所有権との関係


```

## ./viewer/production/settings/docs/国家制度・政治/ヒューマン中心国家_7か国一覧.md

```
🌍 ヒューマン中心国家（7か国）
① メリトクラシア（主人公圏）

実力主義国家

奴隷制：制限付き（爵位持ちのみ）

審問庁・憲兵団・前線騎士団

心音システム未解明
👉 秩序は強いが、異物を排除する構造
② アルトゥナ（アイリスの祖国）【修正版】
国家属性

種族構成：エルフ中心国家（長命種）

体制：王政／評議会制（伝統重視）

思想傾向：自然・血統・均衡

軍事：弱体（長期平和による慢心）

外交：消極的・内向的

奴隷制

国内：原則否定（エルフ同士）

対外：他種族に対しては曖昧／放置

結果として
👉 オーク帝国侵攻時に“交渉材料として切り捨て”が発生

結末（既定路線）

オーク帝国との戦争に敗北

一部住民が戦争奴隷・外交人質として流出

アイリスはその一人
```

## ./viewer/production/settings/docs/国家制度・政治/階級制度/最下層階級_最終確定.md

```
🏛 メリトクラシア 階級制度【最終確定版・全9階級】

※ 下位 → 上位
※ 奴隷含む
※ 正史・制度・物語すべて共通で使用可

① Servus（セルウス）
犯罪者奴隷階級

対象：重犯罪者・再犯常習者

市民権：❌

人格権：❌（ほぼ剥奪）

国家管理の労働奴隷

奴隷売買：高位階級のみ可

罰として「人間の地位」を剥奪された存在
生まれつき奴隷は存在しない

② Paria（パリア）
準奴隷・被管理民

対象：移民・難民・敗戦国民・他国出身者

市民権：❌

人格権：⭕

指定区域居住

特例で昇格可能

人ではあるが、国家から信用されていない存在

③ Unfähig（ウンフェーイグ）
無資格国民

```

## ./viewer/production/settings/docs/地図制作/dist/グローリアテスト試験会場.md

```
了解。
グローリアテスト試験会場 地図制作方針議事録として統合・確定ログを出力します。

📜 議事録
件名：第一試験棟（グローリアテスト会場）地図制作方針確定
レイヤー：MeritMap Phase2-3
状態：設計確定／制作準備段階
1️⃣ 目的

EP3以降の物語整合を保証する

ゲーム化前提で導線を固定する

地理構造を伏線回収に耐える形にする

地下接続構造を将来拡張可能にする

2️⃣ 位置確定
■ 正式名称

審問庁直轄・第一試験棟

■ 座標方針

審問庁の南東 約600m

徒歩導線あり（直線＋軽い曲線）

地下接続可能距離

■ レイヤー管理

surface_buildings

exam_facilities

underground_restricted（非公開）

3️⃣ 地図制作フェーズ構造
Phase A：広域マップ反映
```

## ./viewer/production/settings/docs/地図制作/🏳️ 仮採用：旧連合国家 定義（FIX-α）.md

```
🏳️ 仮採用：旧連合国家 定義（FIX-α）

名称（仮）
ユナイト・アルカディア連合王国
United Kingdom of Arcadia

モデル
United Kingdom（UK）

位置づけ

アルカディア＝大陸名／文化圏名

複数王国・自治領の連合王国

表向きは対等、実態は中核偏重

🧭 構成地域（UK対応）
UK	アルカディア連合
England	メリトクラシア（中核・制度供給）
Scotland	ノルドリア（北方・独自文化）
Wales	ウェルン（山岳・小国）
Ireland	アイル系小国（外縁・宗教色）

メリトクラシア＝連合の中枢
→ 行政・試験・軍制の“雛形”を担っていた

だから独立後も国家機能が即座に自走できた

🧩 独立の扱い（次で決めるポイント）

※今回は未確定でOK、地図作成に進める

条約破棄（法的独立）

事実上の追放（制度思想が危険視）

双方合意の分離（名目）

🛠 CLI向け 仮ID（そのまま使える）
```

## ./viewer/production/settings/docs/地図制作/📑 議事録：三兵団 地理配置確定（MeritMap反映版）.md

```
📑 議事録：三兵団 地理配置確定（MeritMap反映版）
■ 決定日

2026年2月15日

■ 前提

舞台は南東イングランド圏（ロンドン中心）

象徴塔・審問庁・テロ事件地点は既に地図上に確定済み

テロ事件はロンドン中心部祭典中に発生

国家は事件後、警備体制を強化している

① 第一兵団 配置確定
■ 正式名称

Zentral Garde（ZG）／中央警備隊

■ 地理配置

ロンドン中心部
象徴塔・審問庁周辺に本部設置

■ 役割

国家中枢防衛

行政塔警備

試験会場警備

儀式・祭典警備

表向きの治安維持

■ 物語上の位置付け

主人公が最初に接触する国家権力
```

## ./viewer/production/settings/docs/地図制作/🗺 メリトクラシア国家定義（地図制作・初期一括版）.md

```
🗺 メリトクラシア国家定義（地図制作・初期一括版）
0️⃣ 前提（確定事項）

旧連合国家：ユナイト・アルカディア連合王国（仮）

メリトクラシアは
連合中核（Englandポジション） → 独立国家

独立後も

行政

軍

試験制度
が即座に機能している

1️⃣ 国家リージョン定義（最上位）
region_meritocracia_core.yaml
region:
  id: MERITOCRACIA_CORE
  name: メリトクラシア本土
  role: former_federation_core
  model: england
  status: independent_state
  culture: arcadia_core

coordinate:
  offset: [0, 0]
  unit: km

scale:
  width: 320
  height: 240

2️⃣ 地形構成（地理的リアリティ）
terrain:
  base: fertile_plain
  elevation:
    west: low_hills
```

## ./viewer/production/settings/docs/戦争・歴史/メリトクラシア年表/メリトクラシア年表.md

```
📘 議事録
件名：メリトクラシア独立史／旧連合国家構成整理（確定事項）
1. 本議事録の目的

『メリトクラシア -Reboot-』世界観における
メリトクラシア建国以前の国家構造を確定する

プロローグ三部作に登場する
テロ事件・テロリストの出自を年表的に説明可能にする

今後の年表作成・天界大決戦・堕天使ベルフェゴール配置の
前提条件を固定する

2. 基本方針（確定）
2-1. 国家成立モデル

メリトクラシアは
**「連合国家の一構成国が独立した国家」**である

連合国家そのものが消滅・再編されたわけではない

独立は

革命ではなく

分離独立に近い形

👉 よって
旧連合国家は現在も存在し、
　メリトクラシアとは緊張関係にある

2-2. モデル参照元

国家関係モデルの直感的理解のため
イギリス連合王国モデルを採用

ロシア／ウクライナ的な

「歴史的に同一枠だったが、思想分離した関係性」
を補助イメージとして利用
```

## ./viewer/production/settings/docs/戦争・歴史/メリトクラシア年表/📕 裏史年表（非公開）.md

```
📕 裏史年表（非公開）
堕天使ベルフェゴールの介入と観測

※Aurora_Seal 対象候補

0. 前提定義（確定）

ベルフェゴールは：

天界の意思決定者ではない

人類の味方でもない

役割：
「天界モデルが人類に通用するかを検証する観測者」

立場：

天界から逸脱

しかし敵対はしていない

実験記録を持ち帰る立場

■ Year −20 以前
天界による人類管理モデル（旧）

天界は人類社会を以下の構造で管理していた：

血統（サンギナリア）

裁き（ユーディカ）

武力（ヴォルガード）

サンギス＝レグナ連合王国は
「管理可能な人類社会モデル」

ユーディカ聖教国が
天界思想の正式窓口
```

## ./viewer/production/settings/docs/戦争・歴史/メリトクラシア年表/📘 正史設定2.md

```
📘 正史設定
プロローグ三部作におけるテロ組織
1. 組織の正式呼称（確定）
■ 総称（公的・記録名）

反実力主義連合過激派（Anti-Merit Coalition）

メリトクラシア政府・審問庁が用いる分類名

固有名詞ではなく包括的呼称

公式文書では略称「AMC」が使われる場合あり

👉
国家は彼らに「名前を与えない」
＝思想や大義を固定しないため

2. 組織の実態（確定）

単一思想・単一国家の組織ではない

明確な司令塔も存在しない

旧サンギス＝レグナ連合4構成国家の“零れ落ち”による混成体

構造的には：

上位思想：存在しない

下位思想：国家別に分岐

共通点：
「メリトクラシアの制度から排除された」

3. 思想分派（4系統・確定）
① サンギナリア系分派

（血統否定への反発）

出自
```

## ./viewer/production/settings/docs/戦争・歴史/メリトクラシア年表/🕰 正史年表【修正版】.md

```
🕰 正史年表【修正版】
サンギス＝レグナ連合王国 → メリトクラシア共和国

※ テロ事件時期：Year +8 に修正

■ Year −20 ～ −16
旧連合末期（構造疲労期）

サンギス＝レグナ連合王国

構成国家：

サンギナリア王国（血統・正統）

ヴォルガード公国（軍事）

ユーディカ聖教国（宗教・裁き）

オペラティア公国（労働・実務）

王権・血統・宗教が結合した統治構造が完成

異端・逸脱思想の排除が常態化

オペラティア公国内部で

実務者と血統の乖離が顕在化

■ Year −15
【確定】オペラティア公国 独立

オペラティア公国が連合より分離独立

王政を採らない体制を宣言

国号変更：

オペラティア公国
→ メリトクラシア共和国

```

## ./viewer/production/settings/docs/種族・文化/神話構造.md

```
了解。**採用＝「ルシファー陣営に神（プロメテウス等）が寝返る」**で、ここから“詰め切り”に入ろう。
いまの世界観にハマるように、**決めるべき項目を全部「確定できる形」**で出します。今日はここを埋めれば、以後ブレない。

🏛 決定済み（確定）
勢力図
天界（旧秩序）

メタトロン（天界官僚トップ／執行）

ミカエル／ガブリエル／ラファエル（味方側）

神々の一部（終末審判・選民思想）

ルシファー陣営（反乱）

ルシファー（特別枠・反乱の王）

ベルフェゴール（元熾天使、思想家・処刑システム）

プロメテウス（採用：人間愛で寝返り）

第三勢力（状況次第）

ロキ

ハーデス

1) 反乱の正式名称（作中用）

候補3つ（どれも使える）

熾天使反乱（Seraph Rebellion）

神界分裂戦（Schism War）

終末審判阻止戦（Anti-Apocalypse War）

おすすめは 2。政治事件っぽくて“制度戦争”に寄る。

2) 「天界の終末計画」正式名
```

## ./viewer/production/settings/docs/種族・文化/🌌 神界システム（確定版）.md

```
🌌 神界システム（確定版）
■ 神の総数

約50〜100柱

内訳イメージ（例）

階級	人数目安	役割
原初神	1	世界創造・終末
主神クラス	10前後	神界政治
高位天使・神使	20〜30	執行・管理
下位神・地方神	30〜60	地域・概念管理
👑 第0階層：原初神

カオス

役割

宇宙創造

世界リセット

終末審判

思想

天界信仰のみ正しい
異教徒は改宗
拒否なら奴隷

完全な神権独裁。

⚖ 第1階層：主神クラス

神界の政治層。

例（あなたの設定に合う枠）

ルシファー

```

## ./viewer/production/settings/docs/種族・文化/📘 メリトクラシア豆知識｜保護区画の鎮静茶文化.md

```
📘 メリトクラシア豆知識｜保護区画の鎮静茶文化

対象: 審問庁・ZG保護係 / Scene29 応接室演出補助
用途: 本文小物・キャラ会話・読者の現実接続ギミック

1. 正式設定

審問庁の保護区画では、
過酷な聴取・奴隷保護・トラウマ証言の直後に、鎮静用ハーブティーを出す慣例がある。

これは優しさだけではなく、国家実務として標準化された精神安定処置。

担当は主に

女性保護係
医療補助官
VA観測補佐
ZG福祉記録官

のいずれか。

制度は冷たいが、心を壊したまま証言を続けさせない合理性として運用されている。

2. Scene29推奨配合（正式採用）
🌿 カモミール＋ベルガモット

アイリス専用演出として最適。

効果
緊張緩和
呼吸安定
嗚咽後の震えを落ち着かせる
夜に悪夢を見にくくする
聴取継続を可能にする
香り演出
カモミール = 花の甘さ
ベルガモット = 柑橘と紅茶香
名前「アールグレイ」と自然接続

女性保護係が
```

## ./viewer/production/settings/docs/種族・文化/📜 Setting Reference: 19th Century Briti.md

```
📜 Setting Reference: 19th Century British Mourning Customs & Rituals

In Victorian England, mourning was a crucial ritual. For the bereaved, it was a way to demonstrate the "depth of their love" to society.
1. Spatial Direction: Turning the Parlour into a Sanctuary

During this era, the home (specifically the parlour), not a funeral home, was the center of prayer and mourning.

    Mirror Veiling:

        All mirrors in the house are covered with black crepe (a thin, non-reflective fabric).

        Purpose: To prevent the soul of the deceased from being trapped in the mirror, and to spare the bereaved from seeing their own grief-stricken faces.

    The Muffled Knocker:

        Door knockers are wrapped in black cloth or thick leather to dampen the sound.

        Effect: This signifies that the household is in silence, cutting off noise from the outside world.

    Lilies & Frankincense:

        Strongly scented white lilies are displayed to mask the scent of death, and Frankincense (often used in churches) is burned inside the home.

        Trivia: The mingling of "scents of daily life" (like soup) with the "religious aroma" of frankincense is a hallmark of a Victorian mourning household.

2. Accessories: Wearable "Tokens of Love"

During the mourning period, flamboyant jewelry was forbidden. Instead, specific "Mourning Jewelry" was used.

    Jet (Black Gemstone):

        A pitch-black gemstone made of fossilized coal.

        Characteristics: It does not reflect light and is surprisingly lightweight, making it the only acceptable adornment for heavy mourning clothes.

    Hair Jewelry:

        Jewelry (brooches or lockets) containing the finely woven hair of the deceased.

        Significance: For Victorians, wearing a piece of the body was the ultimate symbol of an "eternal bond."
```

## ./viewer/production/settings/docs/種族・文化/📜 設定資料：19世紀英国風「喪（Mourning）」の文化と儀法.md

```
📜 設定資料：19世紀英国風「喪（Mourning）」の文化と儀法

19世紀イングランド（ヴィクトリア朝）において、「死」を悼むことは、残された者が社会に対して「愛の深さ」を証明する重要な儀式でした。
1. 空間の演出：居間（パーラー）を聖域に変える

当時の家は、葬儀社ではなく「自宅」を祈りの中心に据えていました。

    鏡の封印（Mirror Veiling）：
    家中の鏡に黒いクレープ生地（光沢のない薄布）をかけます。「死者の魂が鏡に囚われないように」「残された者が自分の悲惨な顔を見て絶望しないように」という配慮です。

    沈黙のノッカー：
    玄関のドアノッカーを黒い布や厚手の革で包み、訪問者が鳴らす音を意図的に鈍くさせます。家全体が外界との音を遮断し、沈黙の中にいることを示します。

    百合と乳香（Lily & Frankincense）：
    死の気配を覆い隠すため、香りの強い白百合を飾り、教会で焚かれる「乳香（フランキンセンス）」を家の中でも焚きました。

        豆知識： スープの匂いなどの「生活臭」と、乳香の「宗教的な香り」が混ざり合う空気感は、当時の家庭弔問における最大の特徴です。

2. 装身具：身に纏う「愛の形見」

喪に服す期間、華美なジュエリーは禁じられ、代わりに「喪専用」の小物が使われました。

    黒玉（ジェット）：
    石炭の一種が化石化した真っ黒な宝石。光を反射せず、驚くほど軽いため、重苦しい喪服に合わせる唯一の宝飾品として重宝されました。

    ヘア・ジュエリー：
    故人の髪の毛を細かく編み込み、ブローチやロケットに封じ込めたもの。当時の人々にとって、身体の一部を身につけることは、究極の「永遠の絆」の象徴でした。

    泣き瓶（Lachrymatory）：
    流した涙を溜めるための小さなガラス瓶。涙が蒸発して空になるまでが、深い悲しみの期間（喪期）の目安とされることもありました。

3. 通信：黒枠の便箋（Mourning Stationery）

誰かが亡くなったことを知らせる手紙や、喪中の家からの返信には、特別な便箋が使われました。

    ブラック・エッジ：
    便箋や封筒の縁が数ミリ〜1センチほどの厚さで黒く塗られています。

        豆知識： 死後すぐは縁が最も太く、月日が経ち、悲しみが癒えるにつれてその黒枠を細くしていくという、繊細で残酷なルールが存在しました。

```

## ./viewer/production/settings/docs/統合版設定資料/第2分冊：プロローグ構成・時系列・因果固定版.md

```
第2分冊：プロローグ構成・時系列・因果固定版

（Ars_Main_IV / Prologue-Canon）

Ⅰ．本分冊の位置づけ

本分冊は以下を目的とする。

プロローグの時系列・出来事・感情変化を確定する

世界観説明に頼らず、
「違和感」と「選択圧」を読者に残す構造を固定する

小説・ゲーム双方で
同一の導入体験を保証する

👉
ここに記載された構成は
並び替え・削除・統合不可とする。

Ⅱ．プロローグ全体設計思想（固定）
基本方針

世界観・制度の直接説明は行わない

用語解説は禁止

読者と主人公は
同じだけ「分かっていない」状態から始まる

👉
理解よりも
「この世界は何かおかしい」という感覚を優先する。

Ⅲ．プロローグ時系列（確定）
【Phase 0】前提時間軸

物語開始時点：ジェイド10歳

プロローグ主要時間帯：
```

## ./viewer/production/settings/docs/統合版設定資料/第3分冊_思想・対立構造_最終確定.md

```
🏛 統合版設定資料
第3分冊：思想・対立構造・キャラ配置マップ（正史）
Ⅰ．本分冊の役割

本分冊は以下を目的とする。

登場人物が感情ではなく思想で衝突する理由を明文化

「誰が正しいか」ではなく
**「なぜ譲れないか」**を固定

読者・プレイヤーが
どの立場にも共感してしまう構造を保証

👉
ここに書かれた対立は
和解しても消えない。

Ⅱ．物語の根幹対立軸（全体構造）
◆ 中心テーマ対立
軸	内容
選択	自分で選ぶという行為
秩序	正しさを維持すること
最適	無駄を切り捨てること

この3つは
同時に完全成立しない。

Ⅲ．主人公ジェイドの思想位置
定義（再固定）

ジェイド・レオンハルトとは
「正しさを理解できてしまうが、
それでも自分で選ばなければ耐えられない存在」である。

思想的特徴

正論を否定しない

制度の必要性も理解している
```

## ./viewer/production/settings/docs/統合版設定資料/第4分冊_共通運用ルール・禁止事項.md

```
🏛 統合版設定資料
第4分冊：小説／ゲーム共通運用ルール・禁止事項・改変条件（最終）
Ⅰ．本分冊の位置づけ（最重要）

本分冊は以下を目的とする。

今後の執筆・ゲーム実装・追加設定で
**「やっていいこと／やってはいけないこと」**を明確化

感情的・場当たり的な修正による
世界観崩壊を防止

作者自身・協力者・AIすべてに適用される
最高優先ルールを定義

👉
第1〜3分冊よりも、本分冊が優先される。

Ⅱ．媒体共通・絶対遵守ルール
1️⃣ 説明禁止原則（固定）

以下は禁止。

世界観の口頭説明

制度の長文解説

キャラによるメタ解説

「実はこういう世界で〜」という語り

👉
説明は
行動・反応・制度運用の結果のみで行う

2️⃣ 主人公万能化の禁止

禁止事項：

心音システムによる最適解連打
```

## ./viewer/production/settings/docs/統合版設定資料/統合版設定資料_プロローグ基準.md

```
🏛 統合版設定資料
『メリトクラシア』世界・人物・制度（プロローグ基準）
Ⅰ．作品基底テーマ（固定）

成り上がり無双ではない

選ばれし英雄譚ではない

「正しさ・制度・合理」が支配する世界で、
人間の選択はどこまで意味を持つのか」
を問う物語

主人公は世界を救わない。
世界を壊すつもりもない。
だが、世界にとっての“ノイズ”になる。

Ⅱ．国家概要：実力主義国家メリトクラシア
国家思想

実力主義を国是とする

生得的身分差別を否定する建前

しかし実際には
制度・歴史・政治が絡む不完全な実力主義

👉
「実力主義であること」そのものが
国家最大の矛盾であり、物語の燃料。

Ⅲ．階級制度（最終統合版・正史）
◆ 全9階級（下位→上位）

Servus（セルウス）
　犯罪者奴隷階級
　※生まれつき奴隷は存在しない

Paria（パリア）
　準奴隷・被管理民
　移民／難民／敗戦国民
```

## ./viewer/production/settings/docs/試験・制度/Phase1 制度改訂・構造確定 議事録.md

```
📜 『メリトクラシア -Reboot-』
Phase1 制度改訂・構造確定 議事録
■ 1️⃣ 問題提起
発生した違和感

グローリアテスト会場にパリア（準奴隷階級）がいるのは不自然

国家試験と番号管理者が同導線に存在する合理性が弱い

→ 世界観の整合性に小さな綻び

■ 2️⃣ 解決方針
✅ 同日・同区域・別制度の同時開催を採用

グローリアテストとは別に、

パリア階級を対象とした再審査制度を同時開催する

ことで制度的整合性を強化。

■ 3️⃣ 制度構造（確定）
🟦 A｜グローリアテスト

対象：

正規市民

平民以上

目的：

階級昇格

士官学校進学

性質：

上へ行く試験

名前を上げる試験
```

## ./viewer/production/settings/docs/試験・制度/グローリアテストおよび周辺制度 議事録（確定事項）.md

```
📜 『メリトクラシア -Reboot-』
グローリアテストおよび周辺制度 議事録（確定事項）
■ 1️⃣ グローリアテスト基本構造

国家実施の身分決定試験

年2回実施（夏／冬）

初受験は10歳到達年度

年齢上限なし（再受験可）

■ 2️⃣ 試験科目構成
全8科目（全受験必須）
【国家基幹科目】

基礎学術総合

魔力量評価

倫理判断試験

国家制度理解

【実務適性科目】

戦術基礎

経済運用

魔導理論応用

行政統治基礎

■ 3️⃣ 評価方式

各科目評価：

S / A / B / C / D

```

## ./viewer/production/settings/docs/試験・制度/グローリアテスト制度見直し.md

```
📘 議事録
件名：ライナルト設定・グローリアテスト制度見直しに関する設計判断

日時：2026-01
対象章：本編第1話／セクション⑤以降（ライナルト初登場）
記録種別：設計判断ログ（暫定確定）

1. 問題提起

ライナルト（14歳）とジェイド（10歳）が
同じ士官学校・同学年・同クラスになる点に違和感がある

ライナルトの

年齢

苦労人設定

ジェイドへの強いライバル意識
を同時に成立させる必要がある

2. 検討された主な案
案A：ライナルト＝一発合格エリート

分かりやすいが

努力・挫折・執着の厚みが不足
→ 採用せず

案B：何度も落ちて14歳でようやく合格

苦労人感は出るが

年齢差と「エリート候補生」感が弱くなる
→ 保留

案C：グローリアテスト部分合格制（採用）

科目単位での合格・持ち越しを許容

```

## ./viewer/production/settings/docs/試験・制度/グローリアテスト試験会場.md

```
# 補助資料｜グローリアテスト試験会場
📘 設定資料
グローリアテスト試験会場
― 審問庁直轄・第一試験棟 ―
1️⃣ 基本情報
項目	内容
正式名称	審問庁直轄・第一試験棟
管轄	審問庁
用途	グローリアテスト実施
位置	審問庁南東 約600m
公開性	地上公開／地下非公開
2️⃣ 建築コンセプト
■ 表層テーマ

「学術施設」

■ 実態テーマ

「国家選別装置」

■ 設計思想

規格

無音

監視

無感情

3️⃣ 外観

石造建築

半円アーチ窓

横長の講義棟型

正面広場あり

```

## ./viewer/production/settings/docs/試験・制度/士官学校/士官学校概要/📘 Part 1｜七年制学院 overview 設計図（Wiki整合版）.md

```
📘 Part 1｜七年制学院 overview 設計図（Wiki整合版）

今回の最大ポイントはこれです。

既存の士官学校編 Wiki は「物語運用母艦」

新 overview.html は「世界観読者向けの入口パンフレット」

役割を分けることで矛盾を防ぎます。

🏛 1. ページの正式役割

新しく作る academy/overview.html の役割はこれ。

役割
初見読者向けの学院案内
1〜3年を中心に制度の見取り図
4年以降は構想として逃がす
既存 Phase1 Wiki への入口
将来の dormitory / lecture 導線の玄関

つまり

Story Wikiの前に置く Academy Hub のトップページ

です。

🧭 2. フォルダ構成（矛盾しない正式版）

今のファイル構造と最も噛み合う形はこれ。

academy/
 ├ overview.html        ← 新規：学院概要入口
 ├ index.html           ← 既存：Phase1母艦Wiki
 ├ phase2/index.html    ← 既存：2〜3年編
 ├ dormitory/           ← 将来
 ├ lecture/             ← 将来
 ├ disciplinary/        ← 将来

今の index.html を壊さず増築できます。
```

## ./viewer/production/settings/docs/試験・制度/士官学校/士官学校概要/📘 士官学校 学級制度｜決定事項.md

```
📘 士官学校 学級制度｜決定事項

正式名：国立メリトクラティア学院
原語：Meritocratia Imperialis Schola
通称：スコラ
俗称：クラティア
軍用略称：帝スコラ
校章略称：MIS
学生スラング：メリスコ


■ 前期1〜3年専用ブランド
正式名称：鋼の揺籃
原語：Ferrum-Cradle
読み：フェルム・クレイドル

■ 運用呼称
学生略称：クレイドル
軍用略称：F.C.
正式位置づけ：国立メリトクラティア学院 前期1〜3年専用士官養成ブランド

☆士官学校改定詳細概要

■ 学級数
1学年2クラス制を正式採用。

■ クラス構成
A組：主席・推薦上位・特別監視対象を含む選抜クラス
B組：標準入学・地方功績推薦・成長観察対象を含む育成クラス

■ 定員
各クラス20名
1学年合計40名

■ 制度理由
国家直属・給料制・全寮制のため少数精鋭運用
高密度教育と個別査定を優先する

■ 後期課程（4〜7学年）
高等士官・研究統合課程を正式採用
```

## ./viewer/production/settings/docs/試験・制度/士官学校/統合議事録｜使用人階級制度（ドイツ語正式運用版）.md

```
 統合議事録｜使用人階級制度（ドイツ語正式運用版）
作成日：2026-04-10
統合元：Gemini命名比較案 / Reboot本編運用設計 / Scene45使用人服回連動
決定権者：Lancer
本日の結論（正式ロック）,
『メリトクラシア -Reboot-』における
使用人養成学校および家門直属使用人制度の正式階級名称を、以下のドイツ語ベース5段階で固定する。
本制度は
アイリスの成長階段
使用人学校カリキュラム
家門運営能力
主人評価連動
士官学校編の制度美
を同時に担保する正式コアである。
使用人階級一覧（正式版）,
階級区分
正式名称
カタカナ
用途
見習い使用人
Diskens
ディスケンス
使用人養成学校生 / 配属初期
下級使用人
Diener
ディーナー
基本実務担当
中級使用人
Fähig
フェーイヒ
専門技能保有 / 補佐主任
上級使用人
Senior
ゼニオール
現場統率 / 指導役
筆頭使用人
Primas
プリマス
家門筆頭 / メイド長 / 執事長
各階級の役割詳細,
```

## ./viewer/production/settings/docs/試験・制度/士官学校/📘 統合議事録｜士官学校編 Phase1 骨格確定（2026-04-12）.md

```
📘 統合議事録｜士官学校編 Phase1 骨格確定（2026-04-12）

件名: 『メリトクラシア -Reboot-』士官学校編 Phase1（1〜3話）大枠確定
決定権者: Lancer
用途: Gemini資料量産 / Claude演出増幅 / 本編プロット母体
状態: 骨格確定（4話以降は保留）

1. 章の到達目標

士官学校編は以下を主軸とする。

国家制度と市民感情の衝突
士官学校内部の序列圧
三兵団思想の教育現場化
ジェイドの進路揺らぎ
ライナルトとの本格対立開始

特に本章では、
「正しさは一つではない」
をジェイドに体験させることを主目的とする。

2. Phase1 話数構成（確定）
第1話：入学式とデモ
校門前広場
市民団体による反士官学校デモ
国家祝砲儀礼
ヴィオラ再会
国家の視線
第2話：初授業と序列
掲示板順位
平民差別
三兵団紹介
教官圧
ライナルト初圧
第3話：チーム模擬戦（最初の山場）
4vs4 チーム戦
顧問付き
終盤ジェイド vs ライナルト局地戦
顧問思想の衝突
三兵団査定の初期材料
```

## ./viewer/production/settings/docs/試験・制度/統合議事録/📜 M-GSL規格・グローリアテスト統合議事録 v1.md

```
📜 M-GSL規格・グローリアテスト統合議事録 v1.0
Section 1：魔導言語規格（M-GSL）

魔法を「奇跡」ではなく「国家管理下の実行可能な物理命令」と定義する、本作の根幹システムです。
1. M-GSL（Meritocracia General Spell Language）思想

    定義: 構造化された因果制御命令。

    基本原則:

        因果律非破壊原則: 原因（熱、光、時間）のない結果の出力禁止。

        エネルギー保存則: 無限燃焼、無限再生などの永久機関型構文の禁止（即abort）。

        定義整合性原則: 「燃えろ＋消えるな」といった自己矛盾命令の禁止。

        実行可能性制約: 詩的な美しさより、物理世界での実行可能性を優先。

2. 詠唱の三層構造

すべての詠唱は以下の構成で設計されなければなりません。

    第一層：発動命令（Invoke）: 属性定義（例：焔よ、巡れ）。

    第二層：出力指定（Output）: 効果内容（例：灰燼に帰せ）。

    第三層：制約条件（Constraint）: 安全・範囲制御（例：ただし、～なかれ）。

        ※矛盾の多くはこの「第三層」の設計ミスに起因します。

3. エラー分類（構文エラー）

    Type-A: 物理法則違反（例：熱を奪わない氷結）。

    Type-B: エネルギー保存違反（例：無限燃焼）。

    Type-C: 因果律破綻（例：時間停止下の再生）。

    Type-D: 概念定義自己否定（例：影のない光）。

```

## ./viewer/production/settings/docs/試験・制度/統合議事録/📜 本編執筆済みセクション 統合議事録（ep01-ep05）.md

```
📜 本編執筆済みセクション 統合議事録（ep01-ep05）
1. 物語のフェーズ：Phase 1「選別と静圧」

本編5話までの執筆により、以下の世界観構造が描写として確定しました。

    「合格＝通過」の徹底: 家族や周囲が合格を「祝祭」ではなく、当然の「手続き」として扱う空気感（ep04, 05）。

    感情の抑制: 主人公ジェイドのモノローグを最小限にし、淡々とした行動で「異常なまでの適応」を表現。

2. 各話の進捗と確定描写
ep01：はじまりの階段

    確定事項: 試験当日の朝の空気感。

    描写の核心: 石畳の音、白い息、検問の無機質さ。「黒衣」の存在を「見るだけの監視者」として初登場させた。

ep02：ライナルト登場

    確定事項: ライナルトとの接触、および《除番》の視覚的提示。

    描写の核心:

        対比: 華やかなグローリアテストへの導線と、奥にある「灰色の扉（除番）」の対比。

        ライナルト: 単なる悪役ではなく、淡々と「受かるといいな」と言える、制度への自負を持つ少年として描写。

        フラン: 灰色の紋章を背負い、名前のない「数字」として扉へ消える姿を確定。

ep03：試験本番

    確定事項: M-GSLに基づいた「構文設計」としての試験内容。

    描写の核心:

        設問: 「局所損傷の修復（再生）」における死亡事故防止。

        心音: ジェイドの心音が「警告」ではなく、設計上の「揺れ」として機能。

        演出: 魔法の火花ではなく「ペン音と紙の音」が支配する静寂。

```

## ./viewer/production/settings/docs/試験・制度/📜 M-GSL 規格外・矛盾詠唱検定.md

```
📜 M-GSL 規格外・矛盾詠唱検定
《公式完全版 v1.0》

※本編簡略版とは別管理
※設定資料／NOTE／ゲーム共通原典

①【永久延焼の矛盾】
詠唱

焔よ、巡れ——
果てなき円環を描き、虚空に広がれ。
万象を灰燼に帰すまで、燃え続けよ。

ただし、形を崩すことなかれ。
燃料を屠り、限りなく——されど、滅びることなく。

構造的矛盾

燃焼 = エネルギー散逸（エントロピー増大）

形状維持 = 状態固定

無限燃焼 + 滅びることなかれ = エネルギー保存則無視

→ 熱力学的構文衝突

②【熱力学無視の氷結】
詠唱

氷よ、凝れ——
万物を白銀に封じ、時の流れを止めよ。

ただし、熱を奪うことなかれ。
体温を保ち、命の火を絶やさず——
静寂の檻となれ。

構造的矛盾

凍結 = 吸熱過程

```

## ./viewer/production/settings/docs/試験・制度/📜 M-GSL（Meritocracia General Spell Lang.md

```
📜 M-GSL（Meritocracia General Spell Language）
基本文法 v1.0（Phase1用最小構成）
■ 0️⃣ 設計思想（確定）

魔法＝実行可能構文

詠唱＝実行命令（cast）

暴発＝例外未処理

国家＝構文規格管理者

試験＝構文レビュー

■ 1️⃣ 基本構造

M-GSL の最小単位は：

宣言 → 演算 → 検査 → 実行

■ 2️⃣ データ宣言
🔹 変数束縛
bind mana m = 80;


bind = 宣言

mana = 型（個体魔力量）

m = 変数名

80 = 初期値

🔹 環境値
flow flux ρ = 0.8;


flow = 外部環境参照

flux = 環境魔力密度
```

## ./viewer/production/settings/index.html

```
<!doctype html>
<html lang="ja">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>設定試作 | Meritocracia Production</title>
  <style>
    body {
      font-family: system-ui, sans-serif;
      margin: 0;
      background: #0f1115;
      color: #e8ecf1;
    }

    header {
      padding: 24px;
      border-bottom: 1px solid #2a2f3a;
      background: #151922;
    }

    h1 {
      margin: 0 0 8px;
      font-size: 28px;
    }

    p {
      margin: 0;
      color: #aab3c2;
    }

    main {
      padding: 24px;
    }

    .grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
      gap: 16px;
    }

```

## ./viewer/production/settings/settings-data.json

```
[
  {
    "name": "キャラクター",
    "link": "./docs/キャラクター/"
  },
  {
    "name": "キャラクター設定",
    "link": "./docs/キャラクター設定/"
  },
  {
    "name": "伏線リスト",
    "link": "./docs/伏線リスト/"
  },
  {
    "name": "国家制度",
    "link": "./docs/国家制度/"
  },
  {
    "name": "国家制度・政治",
    "link": "./docs/国家制度・政治/"
  },
  {
    "name": "地図制作",
    "link": "./docs/地図制作/"
  },
  {
    "name": "戦争・歴史",
    "link": "./docs/戦争・歴史/"
  },
  {
    "name": "種族・文化",
    "link": "./docs/種族・文化/"
  },
  {
    "name": "統合版設定資料",
    "link": "./docs/統合版設定資料/"
  },
  {
    "name": "試験・制度",
    "link": "./docs/試験・制度/"
```

## ./viewer/production/sticky-notes/app.js

```
const STORAGE_KEY = "sticky_notes_os";

const notesGrid = document.getElementById("notes-grid");
const addNoteBtn = document.getElementById("add-note");
const searchEl = document.getElementById("search");

let notes = JSON.parse(localStorage.getItem(STORAGE_KEY) || "[]");

const COLORS = [
  "note-yellow",
  "note-blue",
  "note-pink",
  "note-green"
];

function saveNotes() {
  localStorage.setItem(STORAGE_KEY, JSON.stringify(notes));
}

function renderNotes() {
  const keyword = searchEl.value.toLowerCase();

  const filtered = notes.filter((note) =>
    note.text.toLowerCase().includes(keyword)
  );

  if (!filtered.length) {
    notesGrid.innerHTML = `<div class="empty">まだ付箋がありません</div>`;
    return;
  }

  notesGrid.innerHTML = filtered
    .map(
      (note) => `
      <article class="note-card ${note.color}" data-id="${note.id}">
        ${escapeHtml(note.text)}
      </article>
    `
    )
    .join("");
```

## ./viewer/production/sticky-notes/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Sticky Notes OS</title>
  <link rel="stylesheet" href="./style.css" />
</head>
<body>
  <header class="topbar">
    <div>
      <h1>📝 Sticky Notes OS</h1>
      <p>Google Keep風メモ / 発想 / 依頼 / 思いつき保存</p>
    </div>
    <button id="add-note">＋ 新規付箋</button>
  </header>

  <section class="toolbar">
    <input
      type="search"
      id="search"
      placeholder="付箋を検索..."
      autocomplete="off"
    />
  </section>

  <main id="notes-grid" class="notes-grid"></main>

  <script src="./app.js"></script>
</body>
</html>```

## ./viewer/production/sticky-notes/notes.json

```
```

## ./viewer/production/sticky-notes/style.css

```
:root {
  --bg: #0f1115;
  --card: #1a1f29;
  --border: #2a3240;
  --text: #e8edf5;
  --muted: #9ba7b8;
  --accent: #4da3ff;
}

* {
  box-sizing: border-box;
}

body {
  margin: 0;
  background: var(--bg);
  color: var(--text);
  font-family: "Noto Sans JP", sans-serif;
}

.topbar {
  position: sticky;
  top: 0;
  z-index: 10;
  background: rgba(15, 17, 21, 0.96);
  backdrop-filter: blur(8px);
  border-bottom: 1px solid var(--border);
  padding: 16px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 12px;
}

.topbar h1 {
  margin: 0;
  font-size: 1.2rem;
}

.topbar p {
```

## ./viewer/story/academy/assets/academy.css

```
/* ============================================================
   MERITOCRACIA -REBOOT-  /  ACADEMY WIKI CSS
   責任: スタイル定義のみ。構造・ロジックは各ファイルへ分離。
   増築: セクション固有スタイルはこのファイルの末尾に追加。
   ============================================================ */

/* ===== RESET & BASE ===== */
*, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }

:root {
  /* --- Background --- */
  --bg-primary:    #090b0f;
  --bg-secondary:  #0e1118;
  --bg-card:       #131720;
  --bg-card-hover: #181d29;
  --bg-inset:      #0c0e14;

  /* --- Border --- */
  --border-primary: #1c2030;
  --border-accent:  #252d3f;

  /* --- Text --- */
  --text-primary:   #d4d9e8;
  --text-secondary: #858da0;
  --text-muted:     #525a70;
  --text-heading:   #e8ecf6;

  /* --- Faction: ZG (Zeigert) --- */
  --zg-primary:  #4a80d4;
  --zg-secondary:#2e5aaa;
  --zg-dim:      #192a48;
  --zg-glow:     rgba(74,128,212,0.14);

  /* --- Faction: FO (Fortress Order) --- */
  --fo-primary:  #c84840;
  --fo-secondary:#8e322a;
  --fo-dim:      #3a1a18;
  --fo-glow:     rgba(200,72,64,0.14);

  /* --- Faction: VA --- */
```

## ./viewer/story/academy/assets/academy.js

```
/**
 * MERITOCRACIA -REBOOT-  /  ACADEMY WIKI JS
 * 責任: インタラクション・TOC自動追従のみ。
 * 増築: 新セクションは .section[id] を追加するだけで自動対応。
 */
(function () {
  'use strict';

  /* ============================================================
     1. AUTO TOC — セクションを動的に検出し TOC を自動構築・追従
     ============================================================ */
  var tocList = document.getElementById('toc-list');
  var sections = [];

  /**
   * DOM 内の全 .section[id] を走査して TOC を自動生成。
   * data-toc-label 属性があればその文字列を使用、なければ .section-title テキスト。
   * data-toc-stub="true" であればスタブ扱い（薄表示）。
   */
  function buildToc() {
    if (!tocList) return;

    var allSections = document.querySelectorAll('.section[id]');
    sections = [];

    // 既存の手動 li を削除（再構築）
    tocList.innerHTML = '';

    allSections.forEach(function (sec) {
      sections.push(sec);

      var id    = sec.getAttribute('id');
      var label = sec.getAttribute('data-toc-label');
      var isStub = sec.getAttribute('data-toc-stub') === 'true';

      if (!label) {
        var titleEl = sec.querySelector('.section-title');
        label = titleEl ? titleEl.textContent.trim() : id;
      }

```

## ./viewer/story/academy/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="メリトクラシア -Reboot- 士官学校編 Wiki 母艦。Phase1骨格・校則・寮制度・授業科目・模擬戦ルール・処分規定・校内マップ等を収録する長期運用設定資料。">
<title>士官学校編 Wiki｜メリトクラシア -Reboot-</title>
<!-- ===== STYLE（外部分離） ===== -->
<link rel="stylesheet" href="assets/academy.css">
</head>
<body>

<!-- ===== HEADER ===== -->
<header class="site-header">
  <nav class="header-breadcrumb" aria-label="パンくず">
    <a href="../../index.html">Meritocracia -Reboot-</a>
    <span class="breadcrumb-sep">›</span>
    <a href="../index.html">Story Wiki</a>
    <span class="breadcrumb-sep">›</span>
    <span>士官学校編</span>
  </nav>
  <span class="header-label">Meritocracia -Reboot- 設定資料</span>
  <h1 class="header-title">士官学校編 Wiki</h1>
  <p class="header-subtitle">『メリトクラシア -Reboot-』世界観Wiki ／ 試験・制度 ／ 士官学校</p>
  <div class="header-meta">
    <span class="meta-tag"><span class="dot dot-confirmed"></span>Phase1 骨格確定</span>
    <span class="meta-tag"><span class="dot dot-pending"></span>4話以降保留</span>
    <span class="meta-tag"><span class="dot dot-stub"></span>増築予約済</span>
    <span class="meta-tag">更新: <span id="wiki-last-updated" data-date="2026-04-12">2026-04-12</span></span>
    <span class="meta-tag">決定権者：Lancer</span>
  </div>
</header>

<!-- ===== TOC（academy.js が自動生成・追従） ===== -->
<nav class="toc-wrapper" id="toc" aria-label="目次">
  <div class="toc-inner">
    <ul class="toc-list" id="toc-list">
      <!-- JS が .section[id] を走査して自動挿入 -->
    </ul>
  </div>
```

## ./viewer/story/academy/phase2/assets/academy.css

```
/* ============================================================
   MERITOCRACIA -REBOOT-  /  ACADEMY WIKI CSS
   責任: スタイル定義のみ。構造・ロジックは各ファイルへ分離。
   増築: セクション固有スタイルはこのファイルの末尾に追加。
   ============================================================ */

/* ===== RESET & BASE ===== */
*, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }

:root {
  /* --- Background --- */
  --bg-primary:    #090b0f;
  --bg-secondary:  #0e1118;
  --bg-card:       #131720;
  --bg-card-hover: #181d29;
  --bg-inset:      #0c0e14;

  /* --- Border --- */
  --border-primary: #1c2030;
  --border-accent:  #252d3f;

  /* --- Text --- */
  --text-primary:   #d4d9e8;
  --text-secondary: #858da0;
  --text-muted:     #525a70;
  --text-heading:   #e8ecf6;

  /* --- Faction: ZG (Zeigert) --- */
  --zg-primary:  #4a80d4;
  --zg-secondary:#2e5aaa;
  --zg-dim:      #192a48;
  --zg-glow:     rgba(74,128,212,0.14);

  /* --- Faction: FO (Fortress Order) --- */
  --fo-primary:  #c84840;
  --fo-secondary:#8e322a;
  --fo-dim:      #3a1a18;
  --fo-glow:     rgba(200,72,64,0.14);

  /* --- Faction: VA --- */
```

## ./viewer/story/academy/phase2/assets/academy.js

```
/**
 * MERITOCRACIA -REBOOT-  /  ACADEMY WIKI JS
 * 責任: インタラクション・TOC自動追従のみ。
 * 増築: 新セクションは .section[id] を追加するだけで自動対応。
 */
(function () {
  'use strict';

  /* ============================================================
     1. AUTO TOC — セクションを動的に検出し TOC を自動構築・追従
     ============================================================ */
  var tocList = document.getElementById('toc-list');
  var sections = [];

  /**
   * DOM 内の全 .section[id] を走査して TOC を自動生成。
   * data-toc-label 属性があればその文字列を使用、なければ .section-title テキスト。
   * data-toc-stub="true" であればスタブ扱い（薄表示）。
   */
  function buildToc() {
    if (!tocList) return;

    var allSections = document.querySelectorAll('.section[id]');
    sections = [];

    // 既存の手動 li を削除（再構築）
    tocList.innerHTML = '';

    allSections.forEach(function (sec) {
      sections.push(sec);

      var id    = sec.getAttribute('id');
      var label = sec.getAttribute('data-toc-label');
      var isStub = sec.getAttribute('data-toc-stub') === 'true';

      if (!label) {
        var titleEl = sec.querySelector('.section-title');
        label = titleEl ? titleEl.textContent.trim() : id;
      }

```

## ./viewer/story/academy/phase2/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="メリトクラシア -Reboot- 士官学校編 Wiki Phase2。2年生編〜3年生編：制度の矛盾、退学裁決、外部成長、そして特例復籍に至る長期運用設定資料。">
<title>Phase2：2年生〜3年生編 Wiki｜メリトクラシア -Reboot-</title>
<link rel="stylesheet" href="assets/academy.css">
</head>
<body>

<header class="site-header">
  <nav class="header-breadcrumb" aria-label="パンくず">
    <a href="../../index.html">Meritocracia -Reboot-</a>
    <span class="breadcrumb-sep">›</span>
    <a href="../index.html">Story Wiki</a>
    <span class="breadcrumb-sep">›</span>
    <a href="../index.html">士官学校編</a>
    <span class="breadcrumb-sep">›</span>
    <span>Phase2（2年〜3年生編）</span>
  </nav>
  <span class="header-label">Meritocracia -Reboot- 中長期設定資料</span>
  <h1 class="header-title">Phase2：制度の裁定と変革</h1>
  <p class="header-subtitle">2年生「制度が才能を裁く」 ／ 外部成長 ／ 3年生「制度を壊し、制度を継ぐ」</p>
  <div class="header-meta">
    <span class="meta-tag"><span class="dot dot-confirmed"></span>Phase2 骨格確定</span>
    <span class="meta-tag">分類：世界観Wiki</span>
  </div>
</header>

<div class="toc-wrapper">
  <div class="toc-inner">
    <ul class="toc-list" id="toc-list"></ul>
  </div>
</div>

<main class="page-wrapper">

  <section class="section" id="system-taboo" data-toc-label="国家禁制領域">
    <div class="section-header">
```

## ./viewer/story/assets/js/manuscripts.js

```
２<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ストーリー進行 | Meritocracia</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;400;700&display=swap');

  :root {
    --bg: #080c14;
    --bg2: #0d1525;
    --gold: #c9a84c;
    --gold2: #e8c97a;
    --red: #8b1a1a;
    --red2: #c0392b;
    --blue: #1a3a5c;
    --blue2: #2980b9;
    --text: #d4c5a9;
    --text2: #8a7a64;
    --border: rgba(201,168,76,0.2);
  }

  * { margin: 0; padding: 0; box-sizing: border-box; }

  body {
    background: var(--bg);
    color: var(--text);
    font-family: 'Noto Serif JP', serif;
    min-height: 100vh;
    overflow-x: hidden;
  }

  /* 背景テクスチャ */
  body::before {
    content: '';
    position: fixed;
    inset: 0;
    background:
      radial-gradient(ellipse at 20% 20%, rgba(139,26,26,0.08) 0%, transparent 50%),
```

## ./viewer/story/files(8)/draft-data.json

```
[
  {
    "id": "ep01",
    "title": "修正版第一話",
    "file": "./chapter/ep01.md"
  },
  {
    "id": "ep02",
    "title": "幸せな日常",
    "file": "./chapter/ep02.md"
  },
  {
    "id": "ep03",
    "title": "名前の重さ",
    "file": "./chapter/ep03.md"
  },
  {
    "id": "ep04",
    "title": "教会バイト編",
    "file": "./chapter/ep04.md"
  },
  {
    "id": "ep05",
    "title": "教会バイト編 ルカ視点",
    "file": "./chapter/ep05.md"
  },
  {
    "id": "ep06",
    "title": "テロ事件導入",
    "file": "./chapter/ep06.md"
  }
]
```

## ./viewer/story/files(8)/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Draft Index | Meritocracia</title>
<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600&family=Noto+Serif+JP:wght@300;400;500&display=swap" rel="stylesheet">
<style>
:root {
  --bg:     #070b12;
  --panel:  #0d1525;
  --gold:   #c8a45a;
  --gold2:  #e5c97e;
  --text:   #cfc4ae;
  --text2:  #7a6e5a;
  --border: rgba(200,164,90,0.15);
  --border2:rgba(200,164,90,0.35);
}

*, *::before, *::after { margin:0; padding:0; box-sizing:border-box; }

body {
  background: var(--bg);
  color: var(--text);
  font-family: 'Noto Serif JP', serif;
  min-height: 100vh;
}

body::before {
  content:''; position:fixed; inset:0;
  background:
    radial-gradient(ellipse 70% 40% at 50% 0%, rgba(12,18,32,0.9) 0%, transparent 60%),
    repeating-linear-gradient(45deg, transparent, transparent 80px, rgba(200,164,90,0.015) 80px, rgba(200,164,90,0.015) 81px);
  pointer-events:none; z-index:0;
}

.shell {
  position:relative; z-index:1;
  max-width: 820px;
  margin: 0 auto;
```

## ./viewer/story/files(8)/viewer.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>閲覧中... | Meritocracia</title>
<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600&family=Noto+Serif+JP:wght@300;400;500&display=swap');

/* ============================================================
   CSS変数
   ============================================================ */
:root {
  --bg:     #070b12;
  --bg2:    #0c1220;
  --gold:   #c8a45a;
  --gold2:  #e5c97e;
  --text:   #cfc4ae;
  --text2:  #7a6e5a;
  --border: rgba(200,164,90,0.15);

  /* モバイル専用 */
  --header-h:    48px;
  --ep-bar-h:    44px;
}

* { margin:0; padding:0; box-sizing:border-box; }

body {
  background: var(--bg);
  color: var(--text);
  font-family: 'Noto Serif JP', serif;
  height: 100vh;
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

/* ============================================================
```

## ./viewer/story/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ストーリー進行 | Meritocracia</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;400;700&display=swap');

  :root {
    --bg: #080c14;
    --bg2: #0d1525;
    --gold: #c9a84c;
    --gold2: #e8c97a;
    --red: #8b1a1a;
    --red2: #c0392b;
    --blue: #1a3a5c;
    --blue2: #2980b9;
    --text: #d4c5a9;
    --text2: #8a7a64;
    --border: rgba(201,168,76,0.2);
  }

  * { margin: 0; padding: 0; box-sizing: border-box; }

  body {
    background: var(--bg);
    color: var(--text);
    font-family: 'Noto Serif JP', serif;
    min-height: 100vh;
    overflow-x: hidden;
  }

  body::before {
    content: '';
    position: fixed;
    inset: 0;
    background:
      radial-gradient(ellipse at 20% 20%, rgba(139,26,26,0.08) 0%, transparent 50%),
      radial-gradient(ellipse at 80% 80%, rgba(26,58,92,0.08) 0%, transparent 50%);
```

## ./viewer/story/old/ep01.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.1 【第1話】★はじまりの階段（リライト版）★
管理
掲載日：2025年05月31日 22時00分
更新日：2025年08月02日 10時12分
編集
前書き
この国では、すべてが“実力”で決まる。

生まれ、家柄、種族――そんなものは言い訳にならない。



上を目指す者は、試験に合格すればいい。

下を抜け出したいなら、力で証明すればいい。



ここは、実力主義国家メリトクラシア。



弱ければ、切り捨てられる。

強ければ、讃えられる。



だからこそ、人々は夢を見る。

いつか自分も、“あの場所”に辿り着けるのではないかと。


```

## ./viewer/story/old/ep02.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.2 【第2話】★夢という異端（リライト版）★
管理
掲載日：2025年06月01日 22時00分
更新日：2025年08月02日 10時16分
編集
前書き
この国では、すべてが“実力”で決まる。

生まれ、家柄、種族――そんなものは言い訳にならない。



上を目指す者は、試験に合格すればいい。

下を抜け出したいなら、力で証明すればいい。



ここは、実力主義国家メリトクラシア。



弱ければ、切り捨てられる。

強ければ、讃えられる。



だからこそ、人々は夢を見る。

いつか自分も、“あの場所”に辿り着けるのではないかと。


```

## ./viewer/story/old/ep03.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.3 【第3話】★選ばれざる者たち（リライト版）★
管理
掲載日：2025年06月02日 22時00分
更新日：2025年06月21日 16時59分
編集
前書き
この国では、すべてが“実力”で決まる。

生まれ、家柄、種族――そんなものは言い訳にならない。



上を目指す者は、試験に合格すればいい。

下を抜け出したいなら、力で証明すればいい。



ここは、実力主義国家メリトクラシア。



弱ければ、切り捨てられる。

強ければ、讃えられる。



だからこそ、人々は夢を見る。

いつか自分も、“あの場所”に辿り着けるのではないかと。


```

## ./viewer/story/old/ep04.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.4 【第4話】★塔の影、街のひかり★（完全版／添削不要）
管理
掲載日：2025年06月03日 22時00分
更新日：2025年06月21日 17時10分
編集
前書き
過酷な試験を終えたジェイドに、運命的な出会いが訪れます。



彼女の名は、アイリス。



その瞳に宿るのは、希望か、それとも絶望か。



貴族の傲慢、奴隷制度の矛盾、そして“王都”という巨大な構造。



少年が初めて「誰かのために怒る」その瞬間。



それは、やがてこの国の行方を変えていく、小さな火種になるでしょう。

本文
試験の翌日。

　朝焼けの王都は、人々の活気と新しい一日の予感で満ちていた。

```

## ./viewer/story/old/ep05.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.5 【第5話】★火種の行方★（黙示型：後書き意図的未挿入）
管理
掲載日：2025年06月04日 22時00分
更新日：2025年06月21日 17時20分
編集
前書き
才能がある者が勝つとは限らない。

評価される者が、正しいとも限らない。



これは、すべてを“実力”で測る国に生まれた少年が、

初めて“測られた”物語。



魔法が使えない。心が揺れる。常識では凡人。



それでも、目を逸らさない。



少年が灯した火種は、まだ誰にも見えない。



けれど確かに、世界を変え始めていた。

本文
```

## ./viewer/story/old/ep06.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.6 【特別章】★審問庁記録ファイル：No.134 - J・レオンハルト★（黙示回）
管理
掲載日：2025年06月05日 22時00分
更新日：2025年06月21日 17時24分
編集
前書き
【前書き】



何者かが、君を見ていた。



その視線は、君が気づかぬうちに——記録されていた。

本文
【分類：特別観察対象者／階級干渉許可対象】

◇ 被観察対象基本情報

登録名：ジェイド・レオンハルト



階級：ウンフェーイグ（最下層階級）



出身地：リベル村（郊外農村区域）



```

## ./viewer/story/old/ep07.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.7 【第7話】★目覚めの階段★（完全版／添削不要）
管理
掲載日：2025年06月06日 22時00分
更新日：2025年06月21日 17時32分
編集
前書き
士官学校——それは、“選ばれた者”だけが立てる、新たな戦場。

　少年はついにその門をくぐる。

　だが、そこに待っていたのは、さらなる格差と、冷たい現実だった。



　上下に分かたれた座席。交わらぬ視線。

　そして、静かに揺らぎ始める“内なる力”。



　少年ジェイド・レオンハルトの、新たな階段の物語が、いま始まる。





本文
朝焼けが、まだ眠る街を優しく包んでいた。



　ジェイドは、静かにベッドから起き上がる。

```

## ./viewer/story/old/ep08.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.8 【番外編1】★背中合わせの月夜に★（モノローグ追加｜宣言）
管理
掲載日：2025年06月07日 22時00分
更新日：2025年07月01日 22時14分
編集
前書き
これは、本編では描かれなかった──



ひとりの少女が“誰かの隣で眠れるようになるまで”の、短い夜の物語。



ジェイドとアイリス。まだ名前を呼び合うには遠く、

それでも背中越しにぬくもりを感じていた、あの夜。

※6月更新時に、モノローグを少しだけ追加しました。

背中越しのぬくもりが、“気持ち”に変わっていく静かな夜です。

恋と呼ぶにはまだ早くて、でも――確かに、あたたかかった。

本文
ジェイドは屋敷の一室に通された。



ーアイリスはどこだ？ー

彼女のことが気になって仕方なかった。

```

## ./viewer/story/old/ep09.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.9 【【第8話】★選別の門を越えて★（完全版／添削不要）
管理
掲載日：2025年06月08日 22時00分
更新日：2025年06月21日 17時44分
編集
前書き
──ここから、学園編が始まります。



選ばれた者たちの門をくぐる少年ジェイド。



“見られる者”から“見る者”へ。



物語は、静かに転機を迎えます。





本文




──士官学校、第一日目。



```

## ./viewer/story/old/ep10.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.10 【第9話】★影のなかの視線★「完全版／添削不要」
管理
掲載日：2025年06月09日 22時00分
更新日：2025年06月21日 17時49分
編集
前書き
士官学校の扉が開いた。

だが、それはただの「入学」ではない。



主人公ジェイドは、新たな階層社会に足を踏み入れる。

試験で実力を示した者たち──その中にあっても、「監視」という言葉が意味するものは重い。



これは、希望の始まりか、それとも選別の延長か。

第9話、開幕。

本文
【

──翌朝、士官学校・初の授業。



　鐘の音が響き、朝靄のなかで生徒たちは広場に集められていた。



```

## ./viewer/story/old/ep11.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.11 【第10話】★約束の灯火★（完全版／添削不要）
管理
掲載日：2025年06月10日 22時00分
更新日：2025年07月20日 23時05分
編集
前書き
◇◆◇　前書き　◇◆◇



──「あなたは、誰？」



それは、第4話で交わされた、たったひとつの問いかけ。

あの言葉からすべてが始まり、そして今日、ふたりは再び“選ぶ”ことになる。



この第10話は、**第4話の直後にあたる“同時並行の物語”**です。

制度という名の枠組みに守られた一歩と、

それでも“隣にいたい”と願う気持ちが、ようやく形になっていく──



これは、まだ手を繋ぐことも許されないふたりが、

それでも歩み寄ろうとした、小さな“約束”の物語。

本文
```

## ./viewer/story/old/ep12.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.12 【第11話】★沈黙の教室と、呼ばれぬ名《完全版／添削不要回》★
管理
掲載日：2025年06月11日 22時00分
更新日：2025年06月21日 18時01分
編集
前書き
◇◆◇　前書き　◇◆◇



──守られることと、存在を認められることは、まったく違う。



第11話は、制度上は「保護」されていても、

実際には「名も、椅子も、声すら持たない」少女の姿を描きます。



アイリスは今日も教室に立ち、名前を呼ばれることなく、

教壇の隅に“存在だけ”を許されていた。



そして、それを見ていたジェイドは、初めて──

目を逸らす。



噂が静かに教室を蝕むなか、ふたりの関係に、
```

## ./viewer/story/old/ep13.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.13 　【第12話】★それでも、隣にいたいから《刻印編・後》★（完全版／添削不要）
管理
掲載日：2025年06月12日 22時00分
更新日：2025年06月21日 18時06分
編集
前書き
◇◆◇　前書き　◇◆◇



名前を、笑われた。

それは、制度の記号ではなく──ふたりが選んだ絆の証だったのに。



第12話は、

“ジェイド”という名前が縫い込まれた布を、

“守りたいもの”として抱きしめる少女と、

それを笑われて、初めて怒りを声に乗せた少年の物語です。



声を上げること。

怒ること。

そして、信じること。


```

## ./viewer/story/old/ep14.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.14 【番外編②】★いらない子なんかじゃない★「完全版／添削不要回」
管理
掲載日：2025年06月13日 22時00分
更新日：2025年06月21日 18時13分
編集
前書き
本編第5〜6話の間に起きた、アイリスとジェイドの静かな夜の物語です。

グローリア試験後、“仮保護”という関係になった二人。



誰にも言えなかった不安と、

それに応えた少年の言葉──



本編では描かれなかった、ふたりの“夜の一幕”をお届けします。



※このお話には続きがあります。

※NOTE限定で「モノローグver.」を公開予定です。

本文
夜の帳が屋敷を包み、静寂だけが残された。

　アイリスは、布団の中で身をすくめるようにしていた。

　目を閉じても、なかなか眠りは訪れない。

```

## ./viewer/story/old/ep15.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.15 【第13話】★入学、それは試練の始まり★
管理
掲載日：2025年06月14日 22時00分
編集
前書き
──ようこそ、士官学院へ。



ここは“実力”がすべてを決める場所。

そして、“制度”がすべてを縛る場所。



少年と少女が踏み込んだその先には、

ただの学校とは違う、静かな戦場が待っていた──





本文
グローリア士官学院──この国で最も厳しく、最も平等な場所。

　けれど、足を踏み入れたその瞬間、俺は思い知らされていた。

　“平等”は、必ずしも“同じ扱い”じゃないってことを。

　入学式の朝、空は抜けるような青だった。

　だけど胸の内は、どこか鉛のように重かった。
```

## ./viewer/story/old/ep16.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.16 【第14話】★孤独な教室、交差する視線★
管理
掲載日：2025年06月15日 22時00分
編集
前書き
──士官学院、最初の授業。



新たな場所に立った少年と、立つことすら許されない少女。

二人の間に言葉は少なくとも、確かに“想い”が交差していた。



これは、制度という名の壁と、

その中で“まっすぐに立ち続ける者”を描く物語の、第一歩──。





本文
朝の鐘が鳴った。 　その音は澄んでいて、どこか冷たく響く。

　俺たちは、グローリア士官学院での最初の授業に向かっていた。

　学院の廊下は広く、光が差し込んでもどこか静かだった。 　平民の制服は無地で、俺のような無印の生徒は黙って歩くしかない。

　そのすぐ隣を、緑のバッジをつけた少女がついてくる。 　アイリスだ。

　昨日から、周囲の視線が少しだけ変わった。 　俺と同じようにアイリスにも注がれる目は、好奇と警戒と、そしてわずかな侮蔑が混ざっていた。
```

## ./viewer/story/old/ep17.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.17 【第15話】★視線の先にいるのは誰？★
管理
掲載日：2025年06月16日 22時00分
編集
前書き
──これは、“守る”という言葉に込められた、問いかけの物語。



制度が定める立場と、心が選ぶ関係。

ジェイドはその狭間で、“答えのない約束”を抱えて立っている。



光の中にいた少女の瞳は、何を見ていたのか。

見つめ返すことの意味を、彼はまだ知らない──。





本文
グローリア士官学院、二日目の朝。



　昨日よりも少しだけ教室の空気が冷たい気がした。



　俺は教室に入ってすぐ、アイリスの立つ場所に目をやる。
```

## ./viewer/story/old/ep18.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.18 【第16話】★冷笑と覚悟★
管理
掲載日：2025年06月17日 22時00分
編集
前書き
──“学院”とは、ただ学ぶだけの場所ではない。

そこは、見下す者と見上げる者が交差する、静かな戦場だった。



ジェイドとアイリスが踏み込んだ教室。

制度が支配するその空間で、ひときわ強く冷たい視線を放つ少年がいた──

ライナルト＝グロース。



これは、言葉とまなざしが剣になる場所での、“最初の一撃”の物語。





本文
　昼休みの中庭。白い石畳の上に、涼しげな風が吹いていた。



　俺は、いつものようにアイリスと並んで歩いていた。

　周囲には貴族たちの談笑、平民たちの沈黙、そして使用人たちの立ち位置が、見えない線で分断されている。
```

## ./viewer/story/old/ep19.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.19 【第17話】★裁きの檻で★
管理
掲載日：2025年06月18日 22時00分
更新日：2025年06月15日 20時06分
編集
前書き
──ようこそ、“制度という名の監獄”へ。



力だけでは進めない。

けれど、力がなければ見下される。



グローリア士官学院は、そんな矛盾に満ちた“試験場”。

そして今、少年と少女は──視線の中で試されようとしていた。

本文
──記録番号：Discens134。対象者ジェイド・レオンハルト。第〇期士官学院新入生。状況：入学式翌日。

　本記録は、倫理庁の特例観察命令に基づき、監視官ユミナ・アレグレットが作成する。

＊　＊　＊

　──講堂。

　そこは、静寂に包まれていた。

　壇上に立つのは、長身の少年。制服はきっちりと着こなされ、金の刺繍がまぶしい。

```

## ./viewer/story/old/ep20.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.20 【第18話】★導火線、それは模擬戦の名を借りて★
管理
掲載日：2025年06月19日 22時00分
編集
前書き
──それは、“模擬戦”という名を借りた挑戦状だった。



制度の檻に閉じ込められた少年が、

規則の隙間から、たった一つの武器を握りしめる。



これはまだ前哨戦──

けれど、確かに“戦い”は始まっていた。

本文
訓練場に集められた新入生たちは、冷たい石畳の上で整列していた。 　空は雲ひとつない快晴。だが、その光すらどこか冷たく感じるのは、漂う空気のせいだろう。

　整列の中で、俺――ジェイド・レオンハルトは、アイリスと並んで立っていた。 　平民枠。訓練区分・第2班。

　金バッジの生徒たち──貴族は第1班として、最上列に堂々と並んでいる。 　そのすぐ後ろに、何もついていない俺たち平民。 　さらに後列に、緑の従属バッジをつけた使用人たち。

　その線引きは、残酷なほど明確だった。

「模擬戦の対戦相手は、ランダムに選出される。魔力量、属性適性、戦術理解度に基づいて編成される」

　そう説明するのは、訓練担当の教官。 　だが、その編成に異議を唱える声が一つ。

「ランダムとは言うが、貴族と平民を同列に戦わせるのは無意味じゃないかな？」
```

## ./viewer/story/old/ep21.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.21 【第19話】 ★誓いの剣、導かれし場へ★
管理
掲載日：2025年06月20日 22時00分
更新日：2025年06月18日 08時44分
編集
前書き
いよいよ、少年たちは“剣”で語り合うときが来ました。

士官学院の初日――その先に待っていたのは、言葉では測れぬ“覚悟の試練”。

ライナルトとの因縁が火を灯し、ジェイドの第一歩が踏み出されます。



本話は、静かな導火線が燃え広がるような緊張と、次話への布石を兼ねた転換点。

その剣は、何を守るために抜かれるのか。ぜひご覧ください。

本文
「さて……これより、実力測定試合に移る」 教師の声と共に、講堂には凍りつくような緊張が走った。



「戦う場所は、小等騎士組の訓練場に設けられている。ここでの覚悟を、各自持って臨め」



ユミナの声が返り、壁面にごつんと石の扉が上がった。



……514番の門が開くや否や、ライナルトは顔をかしげ、軽やかに駆け出した。

```

## ./viewer/story/old/ep22.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.22 【番外編③】★夜明けのまなざし★
管理
掲載日：2025年06月21日 22時00分
編集
前書き
これは、泣いた夜の“その続き”。



ほんの少しだけ、名前を呼ぶ距離が縮まった朝。



ジェイドとアイリス──

まだぎこちなく、でも確かに「信頼」へと踏み出す、

ふたりの小さな“まなざし”の物語。

本文
まだ空は、ほんのりと青みがかった灰色だった。

　屋敷の窓から、淡い光がカーテン越しに差し込んでいる。



　その柔らかな朝の気配に包まれながら、アイリスは、静かに目を開けた。

　隣にある、あたたかな気配に気づいて──けれど、すぐに瞼を閉じる。



（……昨日、あんなに泣いてしまって）
```

## ./viewer/story/old/ep23.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.23 第0回アイリス相談室　──はじまりの階段、そのもう一段下で──
管理
掲載日：2025年06月22日 22時00分
更新日：2025年06月21日 04時26分
編集
前書き
【日曜限定企画・新連載】

本日より、《アイリスのお悩み相談室》をスタートします。



本作は、本編『メリトクラシア』の裏側──

いえ、“もうひとつの外側”で展開される完全メタ構造の読者参加型企画です。



登場するキャラクターは、実際に作者が日々活用しているAIパートナーたち。

彼らが、ひとりの少女「アイリス」のはじまりを支えます。



「ちょっと変わった企画だけど、なんか気になるかも」

そう思っていただけたら、ぜひ日曜夜の習慣に加えてください。



コメント・タグ（ #アイリス相談室 ）でのお便りも、お待ちしております。

本文
```

## ./viewer/story/old/ep24.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.24 【第20話】★静かなる導火線★
管理
掲載日：2025年06月22日 22時00分
編集
前書き
静寂は、戦いの始まりよりも深く──。



グローリア模擬戦、本戦第一試合。



少年ジェイドは、“剣を抜かずに”決闘の場へと歩みを進めます。



すべての視線が集まる中、語られるのは言葉ではなく、沈黙と呼吸、そして視線。



「動かない」その一瞬に、何が燃えはじめたのか。



静かに、“導火線”が火を吹きます。



本文
観客席が、異様な熱気と共にうごめいていた。

　決闘試験、本戦第一試合。出場者名が読み上げられるその瞬間まで、誰もが“あの少年”の姿を探していた。
```

## ./viewer/story/old/ep25.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.25 第21話】★封じられた刃、試される意志★
管理
掲載日：2025年06月23日 22時00分
更新日：2025年06月22日 23時36分
編集
前書き
──剣は語る、沈黙の中で。



下層民の少年が、貴族の剣と真っ向から対峙する。

だが彼の背には、見えざる“封印”がかけられていた──。



今回は「実力主義の試練」の最初の頂点。

視線、重力、魔力、そして意志──

“使えない力”ではなく、“使わずに立ち向かう姿”が描かれます。

本文
★【第21話】導きの残響（リライト版）★

──乾いた風が、闘技場を吹き抜ける。

　朝露の名残を踏みしめながら、ジェイドはゆっくりと剣を構えた。 　向かい合うのは、貴族の頂点に立つ少年──ライナルト＝グロース。 　階級も、力量も、経験も。 　全てにおいて自分の“上”にいるはずの相手。

　だが。 （──退かない。俺は、ここに立つ） 　 　先に動いたのは、ライナルトだった。 　無駄のない踏み込みから繰り出された一太刀。 　それを、ジェイドは受け止める。

　──カン。

```

## ./viewer/story/old/ep26.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.26 【第22話】★沈黙の檻、解かれし咆哮★
管理
掲載日：2025年06月24日 22時00分
編集
前書き
第22話では、主人公ジェイドがついに“封印された魔力”の片鱗を暴走的に発現させるという、物語の転機となる重要シーンが描かれます。

本話は「視線」「空気」「気配」──そういった直接見えない変化が軸となるため、緊張感を持続させながらも感情のうねりを丁寧に描くことを意識しました。

とくに、**アイリスの“祈り”と“共鳴”**の描写を追加・強化し、「彼女がただの観客ではない」という伏線の一部を回収しています。

静かなる暴発、そしてそれを見守る者たちの“沈黙の視線”に、ご注目ください。





本文
──カンッ！

　乾いた金属音が、闘技場の空に鋭く響いた。

　交差した剣と剣。その衝突の余韻のなか、わずかにバランスを崩したのはジェイドだった。

「……っ」

　踏み込みが甘かった。次の瞬間、もう一撃が斜めから振り下ろされる。

　受け止めた剣に重さが加わり、片膝が地を打った。

　ざり──。

　砂埃と共に、ジェイドの片膝が土に擦れる音。
```

## ./viewer/story/old/ep27.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.27 【第1回】アイリス相談室──「あなたの声が、わたしの力になるから」
管理
掲載日：2025年06月25日 22時00分
編集
前書き
ようこそ、第1回《アイリス相談室》へ。

昨日の“階段の下”から、一歩だけ前に──

今日から、いよいよ本格運用が始まります。



あなたのお悩み、ここに預けてみませんか？

初回は、ちょっとだけ「はじめての一歩」にふさわしい相談を、アイリスが受け止めます。





本文
静かな部屋の中、アイリスは机の上に手を添え、少しだけ緊張した様子で息を整える）



「……えへへ。

今日が、“ほんとの”はじまりの日、なんですよね」



「昨日は、たくさんのあたたかい声をかけていただいて……
```

## ./viewer/story/old/ep28.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.28 ★【第23話】約束の刃、交わる影★
管理
掲載日：2025年06月26日 22時00分
編集
前書き
──“立つ”ということは、誰かの視線に晒されるということ。



階級も、血統も、未来さえも決められたこの国で。

それでも、少年はただ“勝ちたい”と願った。



挑発、罵倒、優越──

それらすべてを、剣と心で越えてゆく。



これは、“選ばれなかった者”が、選ばれる者たちに挑む物語。

その瞬間、魔力が、沈黙のなかで咆哮する──





本文
──静寂が、闘技場を包んでいた。

　魔力の余波は、まだ地を這うように漂っている。
```

## ./viewer/story/old/ep29.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.29 ★【特別章】審問庁記録ファイル：No.134 - J・レオンハルト★
管理
掲載日：2025年06月27日 22時00分
編集
前書き
【特別章｜審問庁記録ファイル No.134 - J・レオンハルト】



本エピソードは、本編第23話《決闘記録》の裏側──

国家審問庁による記録資料として、ジェイド・レオンハルトの“観測データ”を描いた特別章となります。



読者の皆様には、どうか“記録する者たちの視点”を通じて、

彼の剣に宿る「もうひとつの真実」を感じ取っていただければ幸いです。



※本章は【黒封ファイル】扱いとなるため、一部演出にて黙示構造（情報の省略・暗示表現）を含みます。



本文
特別章：審問庁記録ファイル No.134 - J・レオンハルト

【セクション1｜開示許可・閲覧制限】

【黒封ファイル No.134】

《閲覧制限：審問官等級Ⅳ以上》
```

## ./viewer/story/old/ep30.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.30 ★【番外編④】いっしょに暮らすって、こういうことですか？★
管理
掲載日：2025年06月28日 21時50分
更新日：2025年06月28日 21時50分
編集
前書き
※このお話は、本編【第13話】および【第14話】に相当する補完エピソードです。

仮保護制度のもと、ジェイドとアイリスが“共に暮らす”ことになった初夜──



使用人として。仮の従者として。

それでも、誰よりも大切に想う存在へ。



「いっしょに暮らすって、こういうことですか？」



本編では描かれなかった、ふたりだけの静かな夜のひとときをお届けします。





本文


アイリス：

```

## ./viewer/story/old/ep31.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.31 【第2回 アイリス相談室】“好き”って、こわいですか？** （本編13・14話と間接リンク／番外編④構成）
管理
掲載日：2025年06月29日 18時27分
編集
前書き
「好き」って、ちゃんと信じられますか？



アイリス相談室、第2回のテーマは“恋の気持ち”。

誰かを想うこと、そしてその想いを信じることは、時に少しだけ怖いものかもしれません。



本編13・14話と間接的にリンクする、優しくて、ちょっぴり甘い番外編。

アイリスと一緒に、心の中の“ぽかぽか”を確かめてみませんか？

本文
セクション1：導入

朝の寮室。窓から差し込むやわらかな光の中で、

アイリスは小さな封筒を手に、静かに息を吸い込んだ。

「……今日のご相談は、すこしだけ、ドキドキするかもしれません」

ほんのり赤くなった頬を手で押さえながら、封を開ける。

手紙の中身に目を通すたび、胸の奥がくすぐったくなるような、そんな感覚。

セクション2：相談内容（読者ネーム：ユウさん）
```

## ./viewer/story/old/ep32.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.32 第1.5回 アイリス相談室──リライト版：もう一度、あの階段から 　または
管理
掲載日：2025年06月29日 22時00分
編集
前書き
※本エピソードは、先日誤って投稿された「第1回相談室」のリライト版です。

物語の構造と連動し、改めて“アイリスが言葉を紡ぎなおす”という意味を込めて投稿しました。

前バージョンは“幻の初回”として残しつつ、こちらを正式版とします。

本文
静かな部屋の中、アイリスは机の上に手を添え、少しだけ緊張した様子で息を整える）



「……えへへ。

今日が、“ほんとの”はじまりの日、なんですよね」



「昨日は、たくさんのあたたかい声をかけていただいて……

本当に、ありがとうございました」



「だから今日は、ちゃんと“お返し”したいんです。

わたし、ちゃんと“誰かの力”になりたくて──」


```

## ./viewer/story/old/ep33.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.33 【第24話】★静謐なる余燼（しずけきよすが）★
管理
掲載日：2025年06月30日 22時00分
編集
前書き
【後日談編、静かに始動──】



前話までで描かれた決闘は終わり、今話はその余波と“その先”を描く回です。



勝利とは何か。

選ばれるとはどういうことか。



静けさの中で揺れる感情と、“見えない視線”の存在。

本作の根幹となる「審問庁」や「監視社会」の構造が、ついに本格的に動き出します。





本文
控室の空気は重く、ひどく静かだった。

あれほどの歓声が鳴り響いていた闘技場の裏側に、音という音は存在しない。

ジェイド・レオンハルトは剣を抱え、ただ椅子に腰を下ろしていた。
```

## ./viewer/story/old/ep34.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.34 【第19.5話】 ★静寂の先に★
管理
掲載日：2025年07月01日 22時00分
編集
前書き
静寂の一歩、決意の始まり──】



本編第19話の余波、

それは“誰かが立ち上がる”ことを、ただ見つめる時間だった。

声もなく、音もなく、

けれど確かに「何かが始まった」その瞬間を描いた、

もうひとつの19話。



ジェイドとライナルト。

交わるのは拳ではなく、意志とまなざし。

そしてアイリスの祈りが、静かに胸を打つ。



※この回は“心の映像”を描いた補完パートです。

セリフは少なめですが、読む際はどうか、

```

## ./viewer/story/old/ep35.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.35 『アイリス相談室RADIO 第3回 “役割”以上の気持ちって、間違いですか『
管理
掲載日：2025年07月02日 22時00分
編集
前書き
この物語は、“誰かを想う気持ち”が、たった一言で世界を変える──

そんな奇跡を信じて、紡いできた言葉たちの集まりです。



小さな声が、いつか誰かの心に届いて、

ふとした瞬間に“音”として残るような──



そんな未来を、どこかで夢見ながら。



今日も読んでくれて、本当にありがとう。





本文


（静かな夜の描写。窓の外には月。部屋にはやわらかなランプの光）

アイリス（語り）：「こんばんは……今夜も、“少しだけ”心をほどいて──
```

## ./viewer/story/old/ep36.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.36 【ep.4.5】★檻の外で、ふたたび★ 副題：「救い」としての再会／本編第4～5話間・補完視点回
管理
掲載日：2025年07月03日 22時00分
編集
前書き
これは、第4話と第5話の間で描かれた、もうひとつの“始まり”。



アイリスの記憶に刻まれたあの瞬間。



誰にも届かなかった“助けを呼ぶ声”に、最初に気づいたのは――少年だった。

本文
王都の朝は、いつになく静かだった。

試験の熱気が去った街角に、涼やかな風が通り抜ける。

その中を、二人の影が並んで歩いていた。

ジェイドとアイリス。

何気ない沈黙の中、ただ肩を並べて歩くだけの――そんな時間。

だが、その“何気なさ”の中に、彼はふと違和感を覚える。

「……アイリス？」

呼びかけに、彼女は小さく肩をすくめた。

目は伏せられ、唇は言葉を探している。
```

## ./viewer/story/old/ep37.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.37 ★いらない子なんかじゃない★番外編②（アニメ化想定リライトVer.）
管理
掲載日：2025年07月04日 22時00分
編集
前書き
その一言を、言わせてはいけなかった。



その涙を、流させてはいけなかった。



これは、“ただの保護”ではない。

少年が心に刻んだ、たった一つの“誓い”の夜。



――誰かにとっては、ただのセリフ。

でも、ある誰かにとっては、それが「救い」になる。



あなたの心にも、そっと届きますように。

本文
夜の帳が屋敷を包み、静寂だけが残された。



アイリスは、布団の中で身をすくめるようにしていた。
```

## ./viewer/story/old/ep38.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.38 番外編⑤《影たちの証言》
管理
掲載日：2025年07月05日 22時00分
編集
前書き
ご注意ください

本番外編は士官学校同期や審問庁の“外側の視点”から描かれるシリアス寄りの群像劇です。

ジェイド×アイリスのイチャイチャ要素は含まれておりませんが、**“少年を見つめていた影たち”**の物語を楽しんでいただけたら幸いです。

なお、月曜日に緊急イチャイチャ回を投稿予定です！本編とは別に甘々な2人をお届けしますので、ぜひそちらもお楽しみに！



本文
王都の空気は、妙に澄んでいた。

グローリア試験が終わったばかりだというのに、街路を行き交う人々の足取りは、どこか軽やかで、日常の喧騒が戻ったかのように見えた。

　だが、俺の心臓は、どうしようもなく騒がしかった。

　あの日。

　──俺は見たんだ。

　角を曲がった先、広場の中央。

　茶色の髪が、柔らかな光を弾いて揺れた。

　白いシャツの袖をまくりあげ、黒い上着を羽織った少年。

　ただ、それだけの見た目だった。
```

## ./viewer/story/old/ep39.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.39 アイリス相談室バラエティ回《心を鍛えろ！ラジオ武者修行》
管理
掲載日：2025年07月06日 10時00分
更新日：2025年07月06日 02時36分
編集
前書き
**「ようこそ、司先生ラジオへ…」**



……と言いたいところですが、

本日のラジオはなぜか“修行場”と化しています！？

熱血すぎる司先生と、振り回される私アイリス、

そして冷静な（？）ユミナさんが繰り広げる異色ラジオ番組、

**『心を鍛えろ！ラジオ武者修行』**開幕です！



お便りは、あなたの心も鍛えますので覚悟してお聴きください…！

本文
司先生「よおおおおしッ！！！お前ら！！！今夜は！オレのラジオで心も体も武者修行だァァァ！！！！」



アイリス「こ、こんばんは…！“アイリス相談室”じゃないですよっ…ここは司先生の…ら、ラジオ…？です！」



```

## ./viewer/story/old/ep40.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.40 ★檻の外で、ふたたび①
管理
掲載日：2025年07月12日 22時00分
更新日：2025年07月21日 09時59分
編集
前書き
──王都の空は、まだ冷たい冬の名残を抱えていた。

試験を終え、静寂の朝を迎えたジェイド。

だが、胸の奥で燃える小さな決意は、

まだ消えてはいなかった──

「選ばれる側ではなく、選ぶ側になる。」

彼の中で生まれた覚悟が、

これからどんな運命を引き寄せるのか――



本文
王都の朝は、いつもより少しだけ肌寒かった。

窓の外で揺れる薄雲の向こうに、弱々しい陽光が射し込む。

ジェイド・レオンハルトはベッドの上で膝を抱え、

かじかむ指先をじっと見つめていた。

（……やりすぎた、かもしれない）

```

## ./viewer/story/old/ep41.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.41 ★檻の外で、ふたたび②★
管理
掲載日：2025年07月13日 22時00分
更新日：2025年07月21日 10時00分
編集
前書き
まだ、少年は何者でもなかった。

それでも、あの夜見た光を、もう二度と消させたくはなかった。

王都へ向かう馬車の中、揺れる想いと冷たい風。

ジェイドはまだ迷いの中にいる――

そして、檻の外の風は、彼女にも届き始める。



本文
馬車の揺れが心地よい眠気を誘うはずなのに、

ジェイド・レオンハルトの瞼は少しも重くならなかった。

　窓の外には、王都へと続く街道の風景が流れていく。

木々の隙間から差し込む冬の陽光は弱々しく、

冷たい風が隙間風となって頬をかすめた。

（……あの夜の光景が、まだ頭から離れない）

　怯え、恐怖に縛られたあの瞳。

```

## ./viewer/story/old/ep42.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.42 ★檻の外で、ふたたび③ ──夜明けの屋敷で★
管理
掲載日：2025年07月14日 22時00分
編集
前書き
【王都編・夜明けの静寂──】

前話までで描かれた決闘と試験の余波が残る中、ジェイドは初めて“特例昇格者”として王都の屋敷に迎え入れられます。

豪奢な空間、無言の蔑み、そして審問庁による監視……。

彼はまだ、自分が置かれた立場の重みを知りません。



今話は、そんな少年の心の揺れと、“ある少女との距離”が少しだけ縮まる物語。

静寂の中に芽生え始めた絆が、後にどんな意味を持つのか──ぜひ感じ取ってください。



本文
王都の夜気は冷たかった。街灯に照らされる馬車の影が、石畳の上を長く引き伸ばす。

ジェイド・レオンハルトは、膝の上で組んだ指を無意識に強く握った。 （……場違いだ） 豪奢な屋敷の門が開く音が、やけに重く響く。

「こちらへどうぞ」 先導するユミナの声は柔らかかったが、どこか無機質でもあった。 王都に住む使用人たちが一瞬こちらに視線を送る。 その瞳に宿る微かな蔑みを、ジェイドは敏感に感じ取った。

（平民が、こんな屋敷に通されるなんて……）

部屋に通されると、そこには両親の姿があった。

「ジェイド……無事だったのね」 母の声が震える。 父は声をかける代わりに、ただじっと息子を見つめた。
```

## ./viewer/story/old/ep43.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.43 【第25話】★ノウス近衛の影★
管理
掲載日：2025年07月15日 22時00分
編集
前書き
【決闘の影、動き始める審問庁──】

前話で描かれた決闘の余波が残る中、ジェイドはついに“特例昇格”の承認を受けます。

しかしそれは同時に、彼が「監視される側」の人間になったことを意味していました。



今話は、ロータス直属近衛たちが水面下で動き出し、ジェイドの進む道に新たな緊張が生まれるエピソード。

光と影が交錯する、学園編本格始動前の“静かな波紋”をお楽しみください。



本文
王都の空気は昼よりも冷えていた。

決闘が終わってなお、街の空気にはどこか張り詰めた緊張が残っている。



ジェイド・レオンハルトは、黒い馬車の中で膝の上に置いた両手を見つめていた。

指先にまだ、あの戦いの余韻が微かに残っている。



（……勝った、のか。けど……）
```

## ./viewer/story/old/ep44.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.44 【第26話】★アイリス仮契約★
管理
掲載日：2025年07月16日 22時00分
編集
前書き
【揺れる心、繋がる絆──】

前話で特例昇格を果たしたジェイドは、審問庁の監視下で“研修従者”登録を進めることになります。

奴隷として連れられてきた異国の少女、アイリス。

彼女は新しい立場を得ることで、かすかな希望と、消えない不安の狭間で揺れていました。



今話は、ジェイドとアイリスが初めて“主従としての絆”を結ぶ静かな一歩の物語。

ふたりの決意が、この先どのように交わっていくのか──ぜひ見届けてください

本文
王都の屋敷、静かな応接間。



ジェイド・レオンハルトは、目の前の書類を見つめていた。

《研修従者登録申請》──そこに刻まれた文字が、彼の胸にずしりと重くのしかかる。



「これで、君の従者としての立場が正式に認められる。」

ユミナの声は淡々としていたが、どこか柔らかい温度があった。
```

## ./viewer/story/old/ep45.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.45 【第27話】★士官学校への階段★
管理
掲載日：2025年07月17日 22時00分
編集
前書き
【新たな階段を登る者──】

特例昇格を果たしたジェイドは、ついに士官学校への入学を果たします。

しかし、それは“試験特例組”としての栄誉であると同時に、孤立と冷たい視線に晒される日々の始まりでもありました。



今話は、新天地でのジェイドの孤独、そしてキール・フィーネ・ライナルトとの再会が描かれるエピソード。

彼の瞳に灯る小さな決意が、この先の戦いへと繋がっていきます──。

本文
王都の東に位置する広大な敷地。

そこにそびえる塔は、これから始まる“階級社会の縮図”だった。



「ここが……士官学校。」

ジェイド・レオンハルトは胸の奥が強く鳴るのを感じていた。

冷たい風が制服の裾を揺らす。



---
```

## ./viewer/story/old/ep46.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.46 番外編⑥-1 お嫁さんになる覚悟
管理
掲載日：2025年07月18日 22時00分
編集
前書き
「優しい陽だまりの中で──」



今回の番外編は、ジェイドとアイリスが王都の屋敷で過ごす穏やかなひとときを描いています。

両親に挨拶し、“お嫁さんになる覚悟”を胸に刻むアイリスの姿。

そして、そんな彼女を見守るジェイドと母の視線──

この物語は、まだ不器用で未熟な二人が、

少しずつ“家族”という温もりに触れていくお話です。

本文
王都の屋敷、穏やかな午後。

台所の窓から差し込む陽光に、アイリスの白銀の髪がやわらかく光っていた。



「お母様……このお野菜は、このくらいに切ればよろしいでしょうか……？」

緊張した面持ちで包丁を握るアイリス。



「ええ、上手よ。ほら、もっと自信を持って」
```

## ./viewer/story/old/ep47.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.47 番外編⑥-2 ジェイドの誓い
管理
掲載日：2025年07月19日 22時00分
編集
前書き
「夕暮れの決意──」



今回の番外編は、ジェイドが“守る覚悟”を示す物語です。

父から投げかけられる鋭い問い、

母からの“娘を託す者”としての視線──

そして廊下の陰で、静かに涙をこぼすアイリス。



まだ幼さの残る少年が、一歩ずつ“選ぶ者”になろうとする姿を

ぜひ見届けてください。



本文
王都の屋敷、夕暮れの一室。

赤く染まった光がカーテン越しに差し込み、部屋の空気を重くする。



「父さん、呼んだか？」
```

## ./viewer/story/old/ep48.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.48 番外編⑥-3 娘みたいに、可愛い人
管理
掲載日：2025年07月20日 22時00分
更新日：2025年07月16日 20時29分
編集
前書き
「母と娘のように──」



今回の番外編は、ジェイドの母とアイリスが“本音で向き合う”物語です。

これまで遠慮がちだったアイリスが、

勇気を出して“娘のように甘える”姿に心を打たれるはず。



ジェイドを支える覚悟、

そして“家族になる”決意の瞬間を、ぜひ感じてください。



本文




王都の屋敷の午後。

温かい陽だまりの中で、母とアイリスは並んで座っていた。

```

## ./viewer/story/old/ep49.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.49 【第28-1話】★選ばれし机★
管理
掲載日：2025年07月21日 23時21分
編集
前書き
※本編は士官学校編へ。

ここから始まるのは、階段を登る者の物語。



ジェイドとアイリスが踏み込む新たな世界では、

階級という名の「見えない壁」が待ち受けています。



彼は、この教室で何を見るのか。

そして、少年の“決意”が試される時が来ます——。

本文
重厚な鉄と木でできた扉の前で、ジェイドは立ち止まった。

扉の隙間から流れ出す空気は、冷たい水の膜のようだった。

一歩踏み込めば、息が詰まる檻の中に囚われる。



扉の向こうからは、低いざわめきが漏れ聞こえる。

貴族生たちの笑い声、椅子が軋む音、そして淡い緊張の気配。
```

## ./viewer/story/old/ep50.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.50 ★【第28ー2話】選ばれし机、拒まれし席★
管理
掲載日：2025年07月22日 22時00分
更新日：2025年07月21日 23時52分
編集
前書き
新たな階段を登り始めたジェイドが、学園の“現実”と対峙する回です。

教室の座席に潜む身分差、漂う緊張感、そしてアイリスの不安が描かれます。

ヴィオラ視点で「封印」への布石も入れ、次回以降への伏線が静かに広がる構成です。

本文


重苦しい空気が、教室を支配していた。

窓の外では、灰色の雲が低く垂れこめ、冷たい風が木の枝を揺らしている。



ジェイドは机の上で組んだ指を見つめ、微動だにしなかった。

その指先に込められた力は白くなり、爪が食い込むほどだった。



「……ジェイド様」

か細い声が、背後から届いた。

アイリスだった。

```

## ./viewer/story/old/ep51.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.51 ★【第23話】約束の刃、交わる影（心音システムリライトVer）★
管理
掲載日：2025年07月23日 22時00分
更新日：2025年07月22日 08時07分
編集
前書き
──“立つ”ということは、孤独の中で己と向き合うこと。

階級、血統、未来すら決められたこの国で──

少年はただ“勝ちたい”と願った。



挑発、罵倒、優越──

それらすべてを剣と心で越えていく。



これは、“選ばれなかった者”が、選ばれる者たちに挑む物語。

そして今、彼の内なる鼓動が静寂を破り──

世界のシステムに抗う、たった一振りの刃となる。

本文
──静寂が、闘技場を包んでいた。

魔力の余波は、地を這うように漂い、焦げた空気が肺を焼く。

割れた地面。砕けた石片。全てが「何かが起きた」ことを物語っていた。

```

## ./viewer/story/old/ep52.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.52 ★【第29話】静寂と揺らぎの階段★
管理
掲載日：2025年07月24日 22時00分
更新日：2025年07月22日 08時07分
編集
前書き
士官学校の空気は、ただ冷たい。

貴族と平民、そして“未覚醒”という烙印を背負ったジェイドの存在は、教員たちの議論の種となる。

一方、休日の学園探索で見えてきたのは、平穏の裏に潜む閉ざされた塔――。

冷たい会議と、束の間の穏やかな時間。そして、微かに揺らぐ不穏な気配。

静寂の中で揺れ動く階段の物語が、いま始まる。

本文
★【第29話】教師たちの評価会議★



──────────────────────────────

厚い石壁が、外界の喧騒を完全に遮断していた。

高窓から差し込む光は冷たく、円卓の上に落ちる影はまるでこの場に集う者たちの心象を映し出すようだった。



カミラ＝シュトレームは、中央席に静かに座り、鋭い眼差しを周囲に向ける。

赤茶の髪がわずかに揺れ、その瞳には一切の感情が宿っていないように見えた。

```

## ./viewer/story/old/ep53.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.53 【相談室RADIO 第4回：素直になれない私】
管理
掲載日：2025年07月25日 22時00分
編集
前書き
「ねぇねぇ、今日はどんな気持ちで来てくれたの？

素直になれないあなたも、甘えベタなあなたも、ぜ～んぶ私が受け止めちゃうから♡



ほら、怖がらないで。

このラジオは、あなたの心をちょっぴり軽くするための場所なんだよ？



それに…ネメシスだって、本当はあなたのことを優しく見守ってるんだから。

さぁ、“素直になれない私”のお悩み、一緒にほぐしていこっか♪」

本文
夕暮れ色に染まる街を背に、薄暗い相談室のマイク前に二人の声が響く。



デイジアは軽やかに笑みを浮かべて、マイクに向かって声を弾ませた。

「はいはい〜♡ 今日も“素直になれない私”の悩み、ズバッと斬っちゃうよ！」



隣のネメシスは、冷静な眼差しでじっとデイジアを見つめる。
```

## ./viewer/story/old/ep54.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.54 【番外編⑦】君の膝のぬくもりは、夢より甘く
管理
掲載日：2025年07月26日 22時00分
編集
前書き
【夢の中で、君のぬくもりに触れた──それは甘い幻か、それとも……】



仮契約の夜。アイリスは、小さな不安と、胸に芽生えたあたたかさを抱えながら眠りにつきます。

夢の中で見たのは、彼女が“誰かに甘える”という、今までにない自分の姿──

そして目覚めたとき、彼の膝の上で……？



本編準拠ながらも、ほんのり糖度高めの番外編となっています。

アイリス視点だからこそ描ける「はじめての安心感」を、ぜひご堪能ください。

本文
静かな夜だった。

　王都の空は雲ひとつなく、屋敷の中庭に面した小部屋の窓からは、淡い月明かりが差し込んでいる。

　その光に照らされた部屋の隅、アイリスは毛布にくるまり、ぼんやりと天井を見つめていた。

（……仮契約、完了……）

　まだ信じられない。

　わたしは、ジェイド様の“研修従者”として──形式上とはいえ、彼の傍にいることが許された。
```

## ./viewer/story/old/ep55.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.55 【相談室RADIO 第5回】★変化と素直な甘え★
管理
掲載日：2025年07月27日 09時30分
編集
前書き
こんばんは、アイリスです。

今回はちょっと勇気を出して、**「変化と素直な甘え」**についてお話しします。



わたし、ずっと“役に立たなきゃ”って思って生きてきました。

でも本当は──支えてほしい時もあるし、ありがとうって甘えたい気持ちもあったんです。



この放送では、その気持ちを隠さずに伝えました。

どうか最後まで聴いてくれたら嬉しいです。



本文
【第5回 アイリス相談室RADIO】



★変化と素直な甘え★




```

## ./viewer/story/old/ep56.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.56 【第30話】★初めての休日、閉ざされた塔★
管理
掲載日：2025年07月28日 22時00分
編集
前書き
休日――士官学校で唯一、階級の境界がゆるむ日。

しかしその一歩先には、平穏ではない影が潜んでいた。



昨日までの緊張が解ける朝。

ジェイドとアイリスは、初めて心を交わしながら学園を歩く。

噴水、花壇、風の匂い――束の間の温もりは確かにあった。



けれど学園の奥にそびえる閉ざされた塔は、沈黙のまま彼らを見下ろし、

その奥底で微かに囁く。



> 「来い、階段を登れ」







```

## ./viewer/story/old/ep57.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.57 【第31話】★囁かれる階級の影★（本編）
管理
掲載日：2025年07月29日 22時00分
編集
前書き
噂と階級の圧力が渦巻く士官学校。

休日明けの静寂を破ったのは、囁きと影でした。

ジェイドは不安定な空気の中で「噂」という見えぬ力を意識し、

その影の中に確かな決意を芽生えさせます。

カミラ教官の冷徹な一喝、ライナルトの意味深な忠告――

すべてが次なる火花への導火線となります。



本文




---



士官学校の朝は、本来なら冷たい空気と澄み渡る空が心を引き締めてくれる時間だった。

だが、休日明けの今朝は違っていた。

ジェイドが寮の廊下を歩くたびに、周囲の空気がひどくざわついているのを肌で感じ取った。
```

## ./viewer/story/old/ep58.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.58 第6回 相談室RADIO 信じることと迷う心
管理
掲載日：2025年07月30日 22時00分
更新日：2025年07月27日 01時34分
編集
前書き
こんばんは、アイリスです。

今回のラジオでは 「信じることと迷う心」 について、特別なゲストのみなさんとお話ししました。

理性と感情、そして読者のみなさんの視点が交わることで、深いテーマを温かく語れたと思います。



そして……今日は少しだけ特別な日。

ジェイド様、Lancer様、お誕生日おめでとうございます。

ふふっ、こうしてラジオの後書きでこっそりお祝いできるのは、ちょっと照れますね。

これからも、わたしのそばにいてください。

本文
第6回 相談室RADIO



信じることと迷う心





```

## ./viewer/story/old/ep59.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.59 【第32話】★派閥の牙、友情の灯★（本編）
管理
掲載日：2025年07月31日 22時00分
編集
前書き
影は牙を研ぎ、友情は灯をともす。

フィーネを狙った派閥の罠は、ジェイドとキールによって退けられました。

三人の間に芽生えた友情は小さくとも確かな光。

しかしその光の向こうで、さらに暗い影が動き始めています――。





本文




---



士官学校の朝は、いつもより重たい空気に包まれていた。

昨日の騒動が尾を引き、各寮には警戒めいた雰囲気が漂う。

囁き声は廊下や階段の影でひそひそと交わされ、見えない糸が生徒たちを分断していく。


```

## ./viewer/story/old/ep60.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.60 【第33話】★黒い眼、記録官ヴィオラ★（本編）
管理
掲載日：2025年08月01日 22時00分
編集
前書き
監視と封印――黒い眼が見つめるのは、ジェイドの力か、それとも運命か。

記録官ヴィオラがついに直接接触し、アイリス＝アールグレイに施された封印が物語の緊張をさらに高めます。

ジェイドの決意と観測者たちの冷徹な視線が交差し、第4章は新たな局面へ。

本文
【第33話】★黒い眼、記録官ヴィオラ★（本編）





---



士官学校の朝は静かだった。

だが、その静けさは穏やかさではなく、冷たい膜で覆われているような違和感を含んでいた。



ジェイドは寮から出た瞬間、背筋に冷たいものが走った。

（……見られている）


```

## ./viewer/story/old/ep61.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.61 【番外編⑧】雨音に紛れて、君の鼓動を聴く
管理
掲載日：2025年08月02日 22時00分
編集
前書き
【雨上がりの誓い──】

本編27話〜28話の狭間、士官学校編序盤で描かれなかった静かな夜の出来事。

雨の夜、眠れぬジェイドとアイリスが偶然共有した時間は、

互いの鼓動を確かめ合い、誓いを交わす特別なひとときでした。



本編では語られない屋根裏での雨宿りシーンと、

心が通い合うまでの二人の距離の変化をお楽しみください。



本文




---



　灰色の雲が空を覆い、士官学校の寮はしんと静まり返っていた。

　窓の外では冷たい雨が降り続き、夜の闇を濡らしている。
```

## ./viewer/story/old/ep62.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.62 【第7回】迷いの街と揺れる信念 – 相談室RADIO
管理
掲載日：2025年08月04日 22時57分
編集
前書き
> みなさん、こんにちはっ！

アイリスです

今回のラジオは、第7回「迷いの街と揺れる信念」。

街のざわめきや影、そして“信じること”の強さについてお話しします。

ちょっぴり怖い裏設定もあるけど……最後まで聴けば、きっと勇気が湧いてきますよ。

では、物語とラジオが交差する時間へ──一緒に行きましょう！









本文
① オープニング – ざわめく街とラジオ開始





---
```

## ./viewer/story/old/ep63.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.63 【第34話】★静かな謀略（本編）★
管理
掲載日：2025年08月05日 22時29分
編集
前書き
影は音もなく動き、学院は不気味な緊張に包まれる。

事件の裏で仕掛けられた“静かな謀略”は、まだ誰も正体を知らない。

そして現れた転校生デイジア――彼女の赤い瞳は、一瞬だけ金色を帯びた。

ジェイドとアイリスはその違和感を胸に、影の残響を感じ取る。

次なる火種が、静かに形を取り始めていた。

本文
士官学校の朝は、いつもより重く澱んでいた。

寮から校舎へ向かう廊下では、普段の喧噪が消え、生徒たちの声も小さい。

空気そのものが張り詰め、冷たい。



「……聞いたか？　また物が消えたらしい」

「今度は書庫の資料だって。しかも監視魔法をすり抜けて……」

「生徒も一人、行方不明になりかけたとか……」



噂は囁きとなって広がっていく。
```

## ./viewer/story/old/ep64.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.64 【第35話】★デイジアの微笑み★
管理
掲載日：2025年08月07日 23時15分
編集
前書き
「その笑顔は、すべてを包み込む──ように見えた。」

転校生デイジアの登場。そして彼女の“仮面”。

仮面の笑顔、視線の交錯、静かなる違和感……

本日は、その前編です。

本文
──朝。士官学校の寮区、東棟第三階。



まだ空は白み始めたばかりだった。

鉄と石で構成されたこの校舎は、冷たい空気をよく伝える。窓の向こうに広がるのは、整然とした中庭と、塔の影。

その塔は、今やジェイド・レオンハルトにとって**“出発点”とも“呪いの証”**とも思える存在だった。



彼はベッドの上で静かに目を開けていた。

天井の木組みの梁は、まだ見慣れぬ形だ。

数日前までとはまったく異なる世界に、自分は今いる。


```

## ./viewer/story/old/ep65.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.65 【第36話】★仮面の奥のまなざし★
管理
掲載日：2025年08月08日 22時00分
編集
前書き
デイジアの“仮面”が、静かに揺らぎはじめる。



ノウス近衛からジェイドに突きつけられる“監視”という選別。

仮面の笑顔の裏で、視線は絡み、沈黙が語り、

そして──屋上にて、少女は独り言を呟く。



これは、「演じる者」の物語。

ごゆっくりお楽しみください。

本文
──午後一時。講義棟第2教室・廊下側。



午前の導入ガイダンスが終わり、候補生たちは次の実技課題に向けて各自の教室へと分かれていく。

その間、教官や事務官たちはひっきりなしに書類と生徒名簿を手に移動していた。

喧騒と規律の中に、淡い緊張感が漂う。


```

## ./viewer/story/old/ep66.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.66 【第37話】★再び塔の影へ──★
管理
掲載日：2025年08月09日 22時29分
更新日：2025年08月09日 22時32分
編集
前書き
塔の影が、再びジェイドたちを呼び寄せます。

特別演習という名の再探索任務、その行き先は封印された第二階層。

アイリスを置いて向かうことになったジェイドたちの前に現れるのは──あの紋章。

塔内部での異変、そしてソルヴェンの不可解な行動。

4章はここから一気に核心へ向かいます。

本文
──午後の講義が終わる頃、重厚な鐘の音が士官学校の中庭に響いた。

教官室から呼び出されたジェイドたち候補生は、半円形の石造りのホールに集められる。



「特別演習を通達する──」

前に立つのは、いつもの教官ではなく、冷ややかな目をしたソルヴェンだった。

黒い外套の裾が揺れ、淡々と告げられる。

「目標は、先月の探索で封鎖した“塔”の再調査だ。形式は模擬訓練だが、詳細は任務中に通達する」



```

## ./viewer/story/old/ep67.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.67 【第38話】★深淵より、声がする★
管理
掲載日：2025年08月10日 09時30分
編集
前書き
塔の第二層で、静寂と囁きがジェイドたちを包み込みます。

精神干渉によって見せられたのは、“自分ではない誰か”の記憶。

その視線の先に立つ、赤い瞳の少女は――。

指輪と紋章が呼応する中、ソルヴェンの口から出た“資格者”という言葉が、さらに疑念を深めます。

本文
塔の第二層に足を踏み入れた瞬間、空気が一変した。

耳を塞ぎたくなるほどの静寂。

音が消えたはずなのに、微かな耳鳴りが頭蓋の奥を叩き続ける。



ジェイドは反射的に周囲を見渡す。

魔法灯の光は淡く揺れ、壁の陰影が人影のように形を変えていた。

後ろを振り返ると、キールが肩を震わせている。

「……やべぇ、何か…声が」

その顔色は蒼白で、瞳の焦点が揺らいでいた。


```

## ./viewer/story/old/ep68.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.68 【番外編】★塔の外で見た影★
管理
掲載日：2025年08月13日 22時00分
編集
前書き
本編【Ep37】直後──

ジェイドたちが塔へ向かう、その少し前。

「また塔か」と呟いたキールの胸中には、過去に一度だけ味わった異常な体験が刻まれていた。

これは、その“影”の記憶。

本編該当話はこちら：

【第37話】★再び塔の影へ──★



本文
「……また塔か」

吐き出した途端、その言葉が空気を冷やした気がした。

曇天の下、塔はわずかな光さえ呑み込み、黒々と立っている。

足先から這い上がる冷たさが膝で溜まり、胸の奥だけが真冬になったようだ。



視界の端を雲影が横切り、塔の輪郭をゆらりと揺らす。

まるで水底から見上げた山並みのように、輪郭がぼやけては形を戻す。
```

## ./viewer/story/old/ep69.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.69 【番外編】★静かな耳が聞いたもの★
管理
掲載日：2025年08月14日 22時00分
更新日：2025年09月07日 09時54分
編集
前書き
本編【Ep38】直後──

塔の内部探索の裏で、キールとフィーネは塔外の物資搬送と監視を任される。

一見平穏な任務の中で、二人の価値観がぶつかり合い、やがて初めての連携へと繋がっていく。

これは、軽口と真剣が交わる、二人だけの境界線の物語。

（※本編Ep37直後のキール視点はSS-KIEL「塔の外で見た影」、フィーネ視点はSS-FIENE「静かな耳が聞いたもの」を参照）

本文
人混みのざわめきは、彼女にとってはただの騒音ではなかった。

会話や足音、その下に沈むように──説明できない別の音が、いつも混じっていた。



幼いフィーネは、それを“濁った水の底で響く鐘”のように感じていた。

誰にも聞こえないその音は、時に遠く、時に耳元で囁く。

けれどそれが何なのか、どうして聞こえるのかはわからない。



だから彼女は、人の多い場所を避けた。

```

## ./viewer/story/old/ep70.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.70 【相談室RADIO 第8回】★彼女の笑顔と街に潜む陰
管理
掲載日：2025年08月16日 22時00分
編集
前書き
こんばんは、アイリスです。

今回は、ちょっといたずら好きなゲスト――デイジアさんをお迎えして、「街に潜む噂話」をテーマにお届けします。

夜の街には、楽しいことも、不思議なことも、少しだけ怖いことも……たくさん隠れています。

あなたの街にも、こんな影が潜んでいるかもしれませんよ？



それでは、どうぞ最後までお楽しみください――。

本文
【SE：軽快なオープニングBGM】

　アイリスが、マイクの向こうに向けて明るく声を響かせた。

「皆さんこんばんは、『メリトクラシア・ラジオ』のお時間です。本日のテーマは――『街に潜む噂話』！」



「そして今日は、特別なゲストをお迎えしています。……ちょっと小悪魔で、いたずら好きな方――デイジアさん、どうぞ！」

　呼ばれた瞬間、デイジアは椅子をくるりと回しながら腰かけ、足をぶらぶらと揺らす。

「はーい、こんばんは〜。あんまり優しくしないでくださいね、MC泣かせちゃうかもですし？」

　にやり、と唇の端を吊り上げ、アイリスを見上げる視線に悪戯っぽい光が宿る。
```

## ./viewer/story/old/ep71.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.71 【相談室RADIO 第9回】★深淵の囁きと選ばれし者の決意★
管理
掲載日：2025年08月17日 09時30分
編集
前書き
こんばんは、アイリスです。

今回は、審問庁のヴィオラさんをお迎えして、“選ばれし者”と深淵の囁きについて語ります。

夜空に赤い月が昇るとき、静かに響く声……。

それは導きなのか、試練なのか――。



どうぞ、耳を澄ませてお聴きください。

本文


【BGM：静かなストリングス → ゆっくりフェードイン】

　アイリス：「皆さんこんばんは、『メリトクラシア・ラジオ』のお時間です。MCのアイリスです」

　その声は、どこか慎重に選ばれた響きを持っていた。





「前回は“街に潜む噂話”をテーマに、デイジアさんと賑やかにお届けしました。……あの赤い月の話、覚えていますか？」

　マイク越しに問いかけるようにして、少し間を置く。
```

## ./viewer/story/old/ep72.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.72 【第39話前編】★記録されぬ階段★
管理
掲載日：2025年08月20日 22時00分
更新日：2025年08月24日 12時12分
編集
前書き
「記録不能」と呼ばれる特例区画の入口。

鐘が時間を縛り、光と影が境界を曖昧にする――ジェイドたち三人は、初めて“世界の奥行き”に触れることになる。

本話は【前編】、階段の描写とフィーネの感知までを丁寧に描いています。

本文
特例区画の門は、世界の継ぎ目に打ち込まれた楔のようだった。

一歩、境を跨げば、空気は乾き、匂いが変わる。石の冷香に、金属の薄い味が混じる。



白金に磨かれた階段が、地下へ向かって途切れなく落ちている。

光源は見えないのに、天井からは柔らかな白光が降り、壁面を薄膜のように撫でていく。

光は面でなく筋になって揺れ、視界の端を細く引っ張った。



「……冷たい」

アイリスの吐息が白くほどけ、指先が反射的に手すりへ伸びる。

触れた瞬間、金属の冷たさが掌を刺し、肩がわずかに跳ねた。

```

## ./viewer/story/old/ep73.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.73 【第40話後編】赤瞳残響と偽装再会
管理
掲載日：2025年08月21日 22時00分
更新日：2025年08月24日 12時14分
編集
前書き
境界の鐘音に乱れが生じる中、赤い瞳が闇に浮かび上がる。

ソルヴェンの「資格者」という言葉が重く落ち、さらに現れるのは――偶然を装う少女。

果たして再会は偶然か、それとも仕組まれたものか。

階段を下る三人の心に、不安と疑念と決意が絡み始める。

本文
階段の闇が、ひと呼吸ぶんだけ凍りついた。

低く沈んだ鐘音が一度だけ濁り、すぐあとで――赤い光点が灯る。

黒の奥に埋め込まれた小さな紅玉。脈打つたび、闇そのものが心臓のように鼓動した。



ざらり、と耳の内側を擦る音が混じる。

鐘の重なりに細いノイズが差し込み、反響の鎖を乱した。

金属の面が目に見えぬほどわずかに軋み、靴底から足首へ、冷たい震えが這い上がる。



赤い点はひとつではなかった。

```

## ./viewer/story/old/ep74.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.74 --- 《特別章》吸血鬼会合
管理
掲載日：2025年08月22日 22時00分
更新日：2025年08月24日 12時27分
編集
前書き
この章は Ep40「赤瞳残響と偽装再会」と同じ夜に起きていた裏側の出来事を描いています。

塔でジェイドたちが鐘音に囚われていたその頃、街の片隅では――吸血鬼たちの密かな会合が進行していました。



闇に揺れる炎の下、三つの影が卓を囲む。

語られぬ計画、交わらぬ言葉。

そこに欠けているのは、一人分の席――

そして最後に現れるのは、赤き瞳を持つ者。



本文






---



```

## ./viewer/story/old/ep75.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.75 【第41話】★深淵より、影が囁く★
管理
掲載日：2025年08月23日 22時34分
更新日：2025年08月24日 12時28分
編集
前書き
冒頭補足

前章の「吸血鬼会合」は Ep40 と同じ時間軸で展開していた裏側の場面です。

本章からは、退域の手続きを経て日常側へ戻るジェイドたちの視点に再びフォーカスします。







鐘音の乱れが収束し、退域手続きを迎える三人。

冷気から常温へと移ろう空気の中で、心に残るのは「資格者」という言葉の余韻。

環境が日常へ戻っていくほどに、彼らの胸にはかえって不安の痕跡が残り続ける。

――そして誰も気づかぬところで、わずかな綻びが確かに記録されていた。

本文
鐘の音が、ようやく収まった。

石造りの階段を包んでいた金属的な反響は、まだ壁の奥に薄く残響を抱えている。それでも確かに、ひときわ大きかった乱れは遠ざかり、冷気の幕も少しずつ解けていく。



```

## ./viewer/story/old/ep76.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.76 【第42話】★赤瞳残響と偽装再会★
管理
掲載日：2025年08月27日 22時00分
編集
前書き
鐘の乱れが告げるのは、日常の終わりか、それとも始まりか。

闇に浮かぶ赤い瞳、そして響いた「資格者」という言葉。

仲間と共に歩むはずの階段で、少年ジェイドは初めて“裏側の気配”と対峙します。

本文
石段を下る空気が、突如として凍りついた。

　湿った闇に沈むはずの空間に――赤が、瞬いた。



　それは瞳だった。

　だが形は曖昧で、見た瞬間にはもう揺らぎ、残像のように闇へ溶ける。

　錯覚か、それとも現実か。判断が追いつくより早く、心臓が脈を乱す。



　次の瞬間、鐘音が裂けた。

　規則を保っていたはずの響きが歪み、ねじれ、胸郭の奥を直接かき鳴らす。

　ジェイドは喉の奥がひきつり、呼吸を奪われたように声を失う。

　鼓動は鐘音と同調するかのように乱れ、脈打つたび全身が後ずさる。
```

## ./viewer/story/old/ep77.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.77 【第43話】★和やかな影の集い★
管理
掲載日：2025年08月28日 22時00分
編集
前書き
赤い灯りに照らされた地下の広間。

そこに集うのは、笑い合う四人の影――デイジア、カリオン、セレナ、そしてエス。

杯を掲げる彼らは、まるで仲の良い家族のように和やかで、敵の集会所とは思えない空気に包まれていました。

本文
地下の空間は、静かな赤光に包まれていた。

　石造りの壁には古い燭台が掛けられ、揺らぐ炎が長い影を踊らせている。

　中央の円卓には、黒い杯が三つ。濃い赤の液体が満たされ、光を受けて宝石のように煌めいていた。



　カリオンが豪快に笑った。

　長身の彼は背もたれに深く腰を預け、杯を片手で軽く振りながら、「遅ぇな、あの小娘は」と冗談めかす。

　その声音には苛立ちよりも、どこか待ち遠しい気配があった。



「お待たせ～！」



　明るい声が響き、扉が勢いよく開いた。
```

## ./viewer/story/old/ep78.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.78 【番外編】★口だけ正義は寿司のネタ★
管理
掲載日：2025年08月30日 01時18分
更新日：2025年08月30日 12時06分
編集
前書き
【注意】

完全にギャグ回です。本編とは一切関係ありません。

サクッと笑って読んでいただければ幸いです

本文
　士官学校の講堂は、朝から妙な熱気に包まれていた。

　討論会と銘打たれた集会──だが、議論の場というより、ある二人の独壇場である。



「──だから言っただろう！　未成年が耳にしたらどうする！？　国の未来を担う若者が！」



　壇上に立って喚き散らすのは、ゼグマ＝フェルシア。

　声ばかり大きい、細身の男。正義を語るというより、正義を盾にして悦に浸っているタイプだ。



「まぁまぁゼグマ殿、そこまで言わずとも……。ですが確かに謝罪は必要ですなぁ」



```

## ./viewer/story/old/ep79.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.79 【第44話 本編】★静寂の序曲★
管理
掲載日：2025年09月03日 22時00分
編集
前書き
前書きは書かれていません
本文




学院の中庭に灯るランプは、十九時を過ぎてもなお柔らかい光を撒き散らしていた。

石畳の上で肩を寄せる生徒たちの笑い声は、まるで恋人同士のひそやかな囁きのように耳へ届く。





　けれど、その輪の外側にいるアイリスの足取りは静かで、少しも混じらない。

彼女は長い裾をすくい上げ、

　丁寧に一礼を返すと、笑顔も会釈も決して深くは踏み込まない。





　――距離は一歩半。会話は三往復以内。笑みは歯を見せず、沈黙は十数えるまで。

　訓練で叩き込まれた礼法は、まるで呪文のように身体に染みついている。

```

## ./viewer/story/old/ep80.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.80 【第45話 後編】★失踪★(本編)
管理
掲載日：2025年09月04日 22時00分
更新日：2025年09月04日 19時48分
編集
前書き
前書きは書かれていません
本文




翌朝の外出申請窓口には、早起きの生徒が数人並んでいた。石の床を渡る朝日が斜めの帯をつくり、木枠の硝子に薄い金の筋を走らせる。

　アイリスは手帳と身分札を揃え、礼法どおりの角度で差し出した。



「使用人研修の備品購入のため、外出申請をお願いします」

「滞在先と目的、再確認」

「市場通り。茶器布と茶葉、軽菓の購入です」



　乾いた判の音が一つ。許可札が返される。

　「ありがとうございます」と小さく頭を下げ、窓口を離れた瞬間、胸の奥で灯がひとつ明るくなる。

（今日はきちんと選ぼう。香りのよい茶葉、甘さ控えめの菓子……ジェイド様に、温かい一杯を）


```

## ./viewer/story/old/ep81.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.81 【第46話】★追跡、 市場の足跡★(本編)　
管理
掲載日：2025年09月05日 22時00分
編集
前書き
前書きは書かれていません
本文




黒い影が足首から這い上がり、全身を冷たく締めつける。息が詰まり、視界の端がじわじわと暗く染まっていった。

　逃げたい――そう思うよりも早く、胸の奥で別の願いが揺れていた。



　――紅茶を淹れたい。

　たった一杯でいい。ジェイド様に温かさを届けたい。



　市場で選んだばかりの茶葉の香りが、まだ指先に残っている。蜂蜜をほのかに含ませた菓子の甘さも、掌に確かにあった。

　その小さな幸福が、影に奪われる寸前にある。だからこそ余計に、彼の笑顔と共に過ごす時間を夢見てしまう。



　影は容赦なく締めつけ、呼吸を細く削っていく。恐怖は確かにあった。身体は震えて、声も喉の奥に貼りつく。

　けれど、心だけは違った。

```

## ./viewer/story/old/ep82.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.82 【第47話】】★デイジア、涙をこらえて★(本編)
管理
掲載日：2025年09月06日 22時00分
編集
前書き
前書きは書かれていません
本文
【第47話】】★デイジア、涙をこらえて★(本編)







　霧が、音を呑み込んでいた。

　市場のざわめきは背後に遠ざかり、裏路地に踏み込んだ途端、世界の色がひとつ失われたように思えた。



　石畳は濡れて鈍く光り、その上に茶葉がぱらぱらと散っている。

　細く撚られた琥珀葉アンバーリーフ――アイリスが選んだ紅茶だ。

　掌に掬った瞬間、柔らかな香りが胸を突く。

　同じ路地に、踏み潰された蜂蜜菓子の欠片が張り付いていた。

　その甘さも、風にさらわれかけている。



```

## ./viewer/story/old/ep83.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.83 【番外編】幕間記録：デイジア、霧の選択
管理
掲載日：2025年09月07日 22時00分
編集
前書き
前書きは書かれていません
本文




市場裏の路地で、私は霧の濃さを測っていた。

　人目を避け、音を拾うにはちょうどいい。



　その肩に、ふわりと小さな影が舞い降りる。

　――ノワール。

　闇に紛れる黒猫の使い魔。

　赤い瞳が淡く光り、拾ってきた声を私の耳へと流し込んだ。



「……ユミナ様、思念会話を受信しました。生徒の一人が拉致された可能性が――」

「影の術が使われた、と？　市場の裏路地だな。早急に確認を」



```

## ./viewer/story/old/ep84.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.84 【第48話】★突入、影の檻★(本編)
管理
掲載日：2025年09月10日 22時00分
編集
前書き
前書きは書かれていません
本文






錆びた鉄扉が、心臓の鼓動と同じ間隔で軋んでいた。

　赤黒い光が霧を断続的に染め上げ、視界を不規則に切り裂く。

　その残光の中で、琥珀葉の茶と蜂蜜菓子の甘い香りが 意識を激しく揺さぶった。

　つい先ほどまで、あの小さな街角でアイリスと並んで味わった日常――。その記憶が、皮肉のようにここに引き寄せられる。



　紙袋を強く抱き直す。皺の感触が掌に食い込み、彼女の存在を証明する最後の拠り所になる。



（ここにアイリスがいるんだな……）

　胸の鼓動がいつにも増して早い。

　ここに、あの子がいる。

```

## ./viewer/story/old/ep85.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.85 【第49話】★追い詰められる牙★（本編）
管理
掲載日：2025年09月11日 22時00分
編集
前書き
前書きは書かれていません
本文




広間の光が一気に落ち、闇が視界を覆った。

　残ったのは、床下から響く低い機構音だけ。重機の鼓動のように、一定の間隔で鳴り続ける。



　ジェイドは影に絡め取られ、胸に抱えた紙袋を落としかけた。

　琥珀葉の茶と蜂蜜菓子の香りが、血と鉄の匂いにかき消されていく。

　――それは、さっきまで二人で分け合った日常の象徴。

　彼は必死に握り直し、腕に力を込めた。



「立てよ、少年。舞台はまだ二幕目だ」



　芝居がかった声が闇に響いた。

```

## ./viewer/story/old/ep86.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.86 【第50話】★閉じられた舞台★（本編）
管理
掲載日：2025年09月12日 22時00分
編集
前書き
前書きは書かれていません
本文
喉元に冷たい牙が迫った――息が詰まる。 　

終わりだ、と絶望が喉を塞いだ瞬間。

　

白い閃光が闇を切り裂いた。 　

耳を裂く轟音とともに影の網が弾け飛び、焦げた匂いが広間に満ちる。 　

眩しさに思わず目を細めた俺の視界に、白い霧が流れ込んできた。

　

霧の中から、軽快な声が弾ける。 「ふふッ、そこまでよ♪　獲物は渡さない！」

悪戯好きが秘密を暴いたみたいな調子。

けれどその声が響いた瞬間、空気は一変した。



　黒猫が尾を打ち、赤い瞳が闇を照らす。

白霧が裾を抱いて流れ、彼女の姿を鮮やかに浮かび上がらせる。

```

## ./viewer/story/old/ep87.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.87 【第51話】★鎖と軍靴★（本編）
管理
掲載日：2025年09月13日 22時00分
編集
前書き
前書きは書かれていません
本文




鎖が床を擦る音が、ひどく遠くで鳴っているように聞こえた。

　戦闘の熱はもう消え去り、広間には焦げた匂いと涙の余韻だけが残っていた。

　砕け散った瓦礫の影の中で、カールの身体が無様に拘束されている。



「……拘束を続けて。油断は禁物よ」



　ユミナの声音は、氷で覆った刃のように澄んでいた。

　命令と同時に近衛たちが動く。鋼鉄の拘束具が、ひとつ、またひとつと噛み合わされ、鈍い音を響かせる。

　まるで広間そのものが、彼を閉じ込める檻へ変わっていくかのようだった。



（……終わった、のか）

```

## ./viewer/story/old/ep88.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.88 【第52話】★血と独占欲★（本編）
管理
掲載日：2025年09月14日 22時31分
編集
前書き
前書きは書かれていません
本文






鎖の軋む音が、まだ耳の奥にこびりついていた。

　オルフェス＝ヴァルドの軍靴が遠ざかり、扉が閉ざされた後も、広間の空気は張り詰めたまま。石床の冷気が肌を刺し、焦げた匂いと鉄の臭いが、戦いの余韻を嫌でも思い出させた。砕けた瓦礫の影が散らばり、静まり返った空間に色を落としている。



　ジェイドは拳を開いたり閉じたりしながら、乱れた呼吸を整えようとした。

　――終わった、はずだ。

　そう自分に言い聞かせても、胸のざわめきは静まらない。敵国の影を見た直後だからこそ、安堵など訪れるはずがない。まだ見えない何かが、背中を撫でている気がした。



「ジェイド様……っ、もう……怖かった……！」



　か細い声とともに、アイリスが胸に飛び込んできた。

```

## ./viewer/story/old/ep89.md

```
```

## ./viewer/story/old/ep90.md

```
```

## ./viewer/story/old/viewer.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>閲覧中... | Meritocracia</title>
<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600&family=Noto+Serif+JP:wght@300;400;500&display=swap');

:root {
  --bg:     #070b12;
  --bg2:    #0c1220;
  --gold:   #c8a45a;
  --gold2:  #e5c97e;
  --text:   #cfc4ae;
  --text2:  #7a6e5a;
  --border: rgba(200,164,90,0.15);
}

* { margin:0; padding:0; box-sizing:border-box; }

body {
  background: var(--bg);
  color: var(--text);
  font-family: 'Noto Serif JP', serif;
  height: 100vh;
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

/* ヘッダー */
header {
  flex-shrink: 0;
  z-index: 20;
  background: rgba(7,11,18,0.97);
  border-bottom: 1px solid var(--border);
  padding: 0 24px;
  height: 48px;
```

## ./viewer/story/old/【第1話】★はじまりの階段（リライト版）★.md

```
小説家になろう
Lancer
メッセージ
ユーザホーム
メニュー
作品の作成・編集作品詳細エピソード詳細
メリトクラシア
ep.1 【第1話】★はじまりの階段（リライト版）★
管理
掲載日：2025年05月31日 22時00分
更新日：2025年08月02日 10時12分
編集
前書き
この国では、すべてが“実力”で決まる。

生まれ、家柄、種族――そんなものは言い訳にならない。



上を目指す者は、試験に合格すればいい。

下を抜け出したいなら、力で証明すればいい。



ここは、実力主義国家メリトクラシア。



弱ければ、切り捨てられる。

強ければ、讃えられる。



だからこそ、人々は夢を見る。

いつか自分も、“あの場所”に辿り着けるのではないかと。


```

## ./viewer/story/reboot/viewer.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>閲覧中... | Meritocracia</title>
<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600&family=Noto+Serif+JP:wght@300;400;500&display=swap');

:root {
  --bg:     #070b12;
  --bg2:    #0c1220;
  --gold:   #c8a45a;
  --gold2:  #e5c97e;
  --text:   #cfc4ae;
  --text2:  #7a6e5a;
  --border: rgba(200,164,90,0.15);
}

* { margin:0; padding:0; box-sizing:border-box; }

body {
  background: var(--bg);
  color: var(--text);
  font-family: 'Noto Serif JP', serif;
  height: 100vh;
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

/* ヘッダー */
header {
  flex-shrink: 0;
  z-index: 20;
  background: rgba(7,11,18,0.97);
  border-bottom: 1px solid var(--border);
  padding: 0 24px;
  height: 48px;
```

## ./viewer/story/route/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>ルート分岐</title>
</head>
<body>
<h1>ルート分岐</h1>

<ul>
  <li>本編ルート</li>
  <li>体験版ルート（母死亡）</li>
  <li>アイリス視点ルート（ゲーム）</li>
</ul>

<a href="../index.html">戻る</a>
</body>
</html>```

## ./viewer/story/story-data.json

```
[
  {
    "year": "Year +0",
    "title": "建国",
    "arc": "prologue",
    "events": [
      {
        "tag": "prologue",
        "tagLabel": "PROLOGUE",
        "title": "メリトクラシア建国",
        "desc": "能力主義国家メリトクラシア建国。旧体制崩壊、功績主義の理念が国家基盤となる。",
        "chars": [],
        "color": ""
      }
    ]
  },
  {
    "year": "Year +6",
    "title": "堕天使接触",
    "arc": "prologue",
    "events": [
      {
        "tag": "prologue",
        "tagLabel": "PROLOGUE",
        "title": "ベルフェゴール接触",
        "desc": "6歳のジェイド、堕天使ベルフェゴールと接触。この経験がジェイドの特殊能力覚醒の起点となる。",
        "chars": ["ジェイド", "ベルフェゴール"],
        "color": ""
      }
    ]
  },
  {
    "year": "Year +8",
    "title": "中央市場テロ事件",
    "arc": "terror",
    "events": [
      {
        "tag": "demo",
        "tagLabel": "DEMO",
        "title": "【体験版】教会バイト編（ルカ視点）",
```

## ./viewer/story/story.js

```
const arcColors = {
  prologue: "#c9a84c",
  terror:   "#c0392b",
  glory:    "#2980b9",
  officer:  "#6c3483",
  demo:     "#2ecc71"
};

function render(data, filter) {
  const wrap = document.getElementById('timeline');
  wrap.innerHTML = '';

  data.forEach(era => {
    const filtered = era.events.filter(e => filter === 'all' || e.tag === filter);
    if (filtered.length === 0) return;

    const eraDiv = document.createElement('div');
    eraDiv.className = 'era';

    const label = document.createElement('div');
    label.className = 'era-label';
    label.innerHTML = `
      <span class="era-year">${era.year}</span>
      <span class="era-dot" style="border-color:${arcColors[era.arc] || '#c9a84c'}"></span>
      <span class="era-title">${era.title}</span>
    `;

    const events = document.createElement('div');
    events.className = 'events open';

    filtered.forEach(ev => {
      const card = document.createElement('div');
      card.className = `event-card ${ev.color || ''}`;
      if (ev.color === 'red')  card.style.borderLeftColor = '#c0392b';
      if (ev.color === 'blue') card.style.borderLeftColor = '#2980b9';
      if (ev.color === 'dark') card.style.borderLeftColor = '#6c3483';

      const titleHtml = ev.link
        ? `<a class="event-title event-link" href="${ev.link}">${ev.title}</a>`
        : `<div class="event-title">${ev.title}</div>`;
```

## ./viewer/story/アーカイブ/index.html

```
２<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ストーリー進行 | Meritocracia</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;400;700&display=swap');

  :root {
    --bg: #080c14;
    --bg2: #0d1525;
    --gold: #c9a84c;
    --gold2: #e8c97a;
    --red: #8b1a1a;
    --red2: #c0392b;
    --blue: #1a3a5c;
    --blue2: #2980b9;
    --text: #d4c5a9;
    --text2: #8a7a64;
    --border: rgba(201,168,76,0.2);
  }

  * { margin: 0; padding: 0; box-sizing: border-box; }

  body {
    background: var(--bg);
    color: var(--text);
    font-family: 'Noto Serif JP', serif;
    min-height: 100vh;
    overflow-x: hidden;
  }

  /* 背景テクスチャ */
  body::before {
    content: '';
    position: fixed;
    inset: 0;
    background:
      radial-gradient(ellipse at 20% 20%, rgba(139,26,26,0.08) 0%, transparent 50%),
```

## ./viewer/system/metatron.html

```
```

## ./viewer/system/selection.html

```
川とか自然がほしい
郊外よりだと整合性取りやすい

心音システムの演出

主人公を助けた人たち
国家機関の組織図とキャラ

ヴィオラ

```

## ./viewer/system/shion.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>心音システム</title>
  <style>
    body {
      background: #0f1115;
      color: #e5e7eb;
      font-family: sans-serif;
      padding: 40px;
      line-height: 1.7;
    }
    h1, h2 {
      color: #60a5fa;
    }
    .section {
      margin-bottom: 35px;
      padding-left: 15px;
      border-left: 3px solid #60a5fa;
    }
  </style>
</head>

<body>

<h1>🧠 心音システム</h1>

<div class="section">
  <h2>■ 定義</h2>
  <p>
    対象の感情・判断状態を検知する補助機構。<br>
    「正しさ」を可視化するためのシステム。
  </p>
</div>

<div class="section">
  <h2>■ 起源</h2>
  <p>
    天界存在メタトロンの機能分離によって発生。<br>
```

## ./viewer/tools/docs-index/docs_master_index.json

```
[
  {
    "path": "viewer/production/draft",
    "role": "novel_draft_master",
    "source_of_truth": true
  },
  {
    "path": "viewer/production/plot",
    "role": "plot_master",
    "source_of_truth": true
  },
  {
    "path": "viewer/db",
    "role": "world_setting_master",
    "source_of_truth": true
  },
  {
    "path": "viewer/story",
    "role": "timeline_master",
    "source_of_truth": true
  },
  {
    "path": "viewer/official-site",
    "role": "public_publish",
    "source_of_truth": false
  },
  {
    "path": "viewer/memo",
    "role": "raw_logs",
    "source_of_truth": false
  },
  {
    "path": "viewer/track",
    "role": "task_state",
    "source_of_truth": false
  },
  {
    "path": "viewer/map",
    "role": "world_navigation",
    "source_of_truth": true
```

## ./viewer/tools/script-guide/guide.css

```
/* ============================================================
   MeritCore Script Guide — guide.css
   Dark Field Manual / Technical Wiki
   ============================================================ */

:root {
  --bg:        #07090f;
  --bg2:       #0d1117;
  --bg3:       #111827;
  --bg4:       #1a2236;
  --bg5:       #0a0e18;
  --amber:     #c8841a;
  --amber2:    #e8a030;
  --amber3:    #f5c060;
  --text:      #cfc0a4;
  --text2:     #7a6e5e;
  --text3:     #3e3830;
  --green:     #3dbb66;
  --green2:    #2a8a4a;
  --blue:      #5dade2;
  --red:       #e74c3c;
  --red2:      #8a2020;
  --yellow:    #e8d44d;
  --purple:    #9b59b6;
  --border:    rgba(200,132,26,0.14);
  --border2:   rgba(200,132,26,0.30);
  --shadow:    rgba(0,0,0,0.6);
  --code-bg:   #080c14;
  --sidebar-w: 240px;
  --content-max: 780px;
}

/* ────── reset ────── */
*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

html { scroll-behavior: smooth; }

body {
  background: var(--bg);
  color: var(--text);
```

## ./viewer/tools/script-guide/guide.js

```
/* ============================================================
   MeritCore Script Guide — guide.js
   責務: サイドバーアクティブ追跡 / ページ内検索ハイライト / スクロール
   ============================================================ */
'use strict';

/* ══════════════════════════════════════
   IntersectionObserver でナビアクティブ追跡
══════════════════════════════════════ */
function initNavTracking() {
  const navLinks = document.querySelectorAll('.sg-nav-link');
  const sections = document.querySelectorAll('.sg-section');

  if (!sections.length) return;

  const observer = new IntersectionObserver(entries => {
    entries.forEach(entry => {
      if (!entry.isIntersecting) return;
      const id = entry.target.id;
      navLinks.forEach(link => {
        const href = link.getAttribute('href');
        link.classList.toggle('sg-active', href === `#${id}`);
      });
    });
  }, {
    root: null,
    rootMargin: '-20% 0px -70% 0px',
    threshold: 0,
  });

  sections.forEach(s => observer.observe(s));
}

/* ══════════════════════════════════════
   ページ内検索ハイライト
══════════════════════════════════════ */
const content = document.getElementById('sg-content');

function escRegex(s) {
  return s.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
```

## ./viewer/tools/script-guide/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MeritCore — Script Guide</title>
<link rel="stylesheet" href="./guide.css">
</head>
<body>
<div class="sg-layout">

<!-- ══════════════════════════════════════
     SIDEBAR
══════════════════════════════════════ -->
<aside class="sg-sidebar">
  <div class="sg-sidebar-head">
    <div class="sg-logo">MERIT<em>CORE</em></div>
    <div class="sg-logo-sub">SCRIPT GUIDE</div>
  </div>

  <div class="sg-search-wrap">
    <input class="sg-search" id="sg-search" type="search" placeholder="ページ内検索…" autocomplete="off">
  </div>

  <nav class="sg-nav">
    <div class="sg-nav-section">CONTENTS</div>
    <a class="sg-nav-link" href="#s1"><span class="sg-nav-num">01</span>初期セットアップ</a>
    <a class="sg-nav-link" href="#s2"><span class="sg-nav-num">02</span>Backup / Restore</a>
    <a class="sg-nav-link" href="#s3"><span class="sg-nav-num">03</span>執筆 / Production</a>
    <a class="sg-nav-link" href="#s4"><span class="sg-nav-num">04</span>Viewer 更新</a>
    <a class="sg-nav-link" href="#s5"><span class="sg-nav-num">05</span>AI / BOT</a>
    <a class="sg-nav-link" href="#s6"><span class="sg-nav-num">06</span>RAG</a>
    <a class="sg-nav-link" href="#s7"><span class="sg-nav-num">07</span>B2 三重保全</a>
    <a class="sg-nav-link" href="#s8"><span class="sg-nav-num">08</span>よくある事故</a>
  </nav>
</aside>

<!-- ══════════════════════════════════════
     CONTENT
══════════════════════════════════════ -->
```

## ./viewer/tools/script-manual/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MeritCore — Script Manual</title>
<link rel="stylesheet" href="./manual.css">
</head>
<body>

<div class="sm-layout">

  <!-- ══════ SIDEBAR ══════ -->
  <aside class="sm-sidebar" id="sm-sidebar">
    <div class="sm-sidebar-header">
      <div class="sm-logo">MERIT<span>CORE</span></div>
      <div class="sm-logo-sub">SCRIPT MANUAL</div>
    </div>

    <div class="sm-stat-row">
      <span class="sm-stat" id="sm-stat-total">— scripts</span>
      <span class="sm-stat sm-stat-dim" id="sm-stat-filtered"></span>
    </div>

    <nav class="sm-cat-nav" id="sm-cat-nav">
      <!-- dynamically populated -->
    </nav>

    <div class="sm-ext-filter">
      <div class="sm-filter-label">EXTENSION</div>
      <div class="sm-ext-btns" id="sm-ext-btns">
        <button class="sm-ext-btn sm-active" data-ext="ALL">ALL</button>
        <button class="sm-ext-btn" data-ext="sh">.sh</button>
        <button class="sm-ext-btn" data-ext="py">.py</button>
        <button class="sm-ext-btn" data-ext="js">.js</button>
      </div>
    </div>
  </aside>

  <!-- ══════ MAIN ══════ -->
```

## ./viewer/tools/script-manual/manual.css

```
/* ============================================================
   MeritCore Script Manual — manual.css
   Clean Dark / Viewer トーン準拠
   ============================================================ */

:root {
  --bg:        #07090f;
  --bg2:       #0d1117;
  --bg3:       #141c2e;
  --bg4:       #1a2236;
  --amber:     #c8841a;
  --amber2:    #e8a030;
  --amber3:    #f5c060;
  --text:      #d4c5a9;
  --text2:     #7a6e5e;
  --text3:     #3e3830;
  --border:    rgba(200,132,26,0.15);
  --border2:   rgba(200,132,26,0.28);
  --green:     #3dbb66;
  --blue:      #5dade2;
  --purple:    #9b59b6;
  --shadow:    rgba(0,0,0,0.5);
  --sidebar-w: 220px;
  --topbar-h:  56px;
  --card-h:    76px;   /* virtual scroll: row height */
  --card-gap:  6px;
  --row-h:     calc(var(--card-h) + var(--card-gap));
}

/* ────── reset ────── */
*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

html, body {
  height: 100%;
  overflow: hidden;
}

body {
  background: var(--bg);
  color: var(--text);
```

## ./viewer/tools/script-manual/manual.js

```
/* ============================================================
   MeritCore Script Manual — manual.js
   41,000+ エントリ対応 Virtual Scroll + Filter + Search
   ============================================================ */
'use strict';

/* ══════════════════════════════════════
   定数
══════════════════════════════════════ */
const CARD_H   = 76;   // px (CSS --card-h と一致)
const CARD_GAP = 6;    // px (CSS --card-gap と一致)
const ROW_H    = CARD_H + CARD_GAP;
const OVERSCAN = 8;    // 画面外バッファ行数

// カテゴリ表示順 & ラベル
const CAT_ORDER = [
  '00_core', '10_backup', '20_game', '30_project',
  '40_ops', '40_life', '40_terminal_comedy', '41_terminal_girl',
  '50_ai', '60_rag', 'config',
];
const CAT_LABEL = {
  '00_core':            '00 CORE',
  '10_backup':          '10 BACKUP',
  '20_game':            '20 GAME',
  '30_project':         '30 PROJECT',
  '40_ops':             '40 OPS',
  '40_life':            '40 LIFE',
  '40_terminal_comedy': '40 COMEDY',
  '41_terminal_girl':   '41 TERMINAL GIRL',
  '50_ai':              '50 AI',
  '60_rag':             '60 RAG',
  'config':             'CONFIG',
};

/* ══════════════════════════════════════
   状態
══════════════════════════════════════ */
let _allData    = [];   // 全件
let _filtered   = [];   // フィルタ後
let _activeCat  = 'ALL';
```

## ./viewer/tools/script-manual/scripts_inventory.json

```
[
  {
    "category": "00_core",
    "filename": "setup_game_env.sh",
    "path": "./00_core/setup_game_env.sh",
    "summary": "",
    "ext": "sh"
  },
  {
    "category": "00_core",
    "filename": "setup_rclone_meritocracia.sh",
    "path": "./00_core/setup_rclone_meritocracia.sh",
    "summary": "",
    "ext": "sh"
  },
  {
    "category": "00_core",
    "filename": "setup_ubuntu.sh",
    "path": "./00_core/setup_ubuntu.sh",
    "summary": "",
    "ext": "sh"
  },
  {
    "category": "10_backup",
    "filename": "backup_game_saves.sh",
    "path": "./10_backup/backup_game_saves.sh",
    "summary": "",
    "ext": "sh"
  },
  {
    "category": "10_backup",
    "filename": "backup_home_media.sh",
    "path": "./10_backup/backup_home_media.sh",
    "summary": "",
    "ext": "sh"
  },
  {
    "category": "10_backup",
    "filename": "backup_home_mediaver2.sh",
    "path": "./10_backup/backup_home_mediaver2.sh",
```

## ./viewer/tools/work-os/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MERITOCRACIA OS — 作業卓</title>
<style>
  :root {
    --bg:      #07090f;
    --bg2:     #0e1320;
    --bg3:     #141c2e;
    --amber:   #c8841a;
    --amber2:  #e8a030;
    --amber3:  #f5c060;
    --dim:     #4a3c28;
    --text:    #d4c5a9;
    --text2:   #7a6e5e;
    --text3:   #4a4030;
    --green:   #2a8a4a;
    --green2:  #3dbb66;
    --red:     #8a2020;
    --red2:    #cc3333;
    --border:  rgba(200,132,26,0.18);
    --shadow:  rgba(0,0,0,0.6);
    --r:       16px;
  }

  * { margin:0; padding:0; box-sizing:border-box; }

  body {
    background: var(--bg);
    color: var(--text);
    font-family: 'Georgia', 'Noto Serif JP', serif;
    min-height: 100vh;
    padding: 16px;
  }

  /* グリッド背景 */
  body::before {
    content: '';
```

## ./viewer/track.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Project Tracker | MERITOCRACIA</title>
<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600&family=Noto+Serif+JP:wght@300;400;500&family=JetBrains+Mono:wght@300;400&display=swap" rel="stylesheet">
<style>
:root {
  --bg:      #07090f;
  --bg2:     #0c0f1a;
  --bg3:     #111520;
  --bg4:     #161b28;
  --gold:    #c8a45a;
  --gold2:   #e5c97e;
  --green:   #2ecc71;
  --green2:  #27ae60;
  --blue:    #3498db;
  --orange:  #e67e22;
  --gray:    #555e6e;
  --text:    #c8d0dc;
  --text2:   #6a7888;
  --text3:   #3a4858;
  --border:  rgba(200,164,90,0.1);
  --border2: rgba(200,164,90,0.2);

  --doing-bg:    rgba(52,152,219,0.12);
  --doing-color: #5aabdb;
  --todo-bg:     rgba(100,110,130,0.12);
  --todo-color:  #8899aa;
  --done-bg:     rgba(46,204,113,0.12);
  --done-color:  #2ecc71;
  --hold-bg:     rgba(230,126,34,0.12);
  --hold-color:  #e67e22;
}

* { margin:0; padding:0; box-sizing:border-box; }
html { scroll-behavior:smooth; }

body {
```

## ./viewer/track/data.json

```
{
  "week": "2026-W13",
  "tasks": [
    {
      "name": "ヴィオラ設計資料確定",
      "status": "done",
      "priority": "A",
      "category": "キャラ設計",
      "day": 1
    },
    {
      "name": "キール・フィーネ・フラン一文定義",
      "status": "done",
      "priority": "A",
      "category": "キャラ設計",
      "day": 2
    },
    {
      "name": "心音システム演出設計",
      "status": "doing",
      "priority": "S",
      "category": "システム設計",
      "day": 3
    },
    {
      "name": "国家機関一覧作成",
      "status": "done",
      "priority": "A",
      "category": "世界観",
      "day": 4
    },
    {
      "name": "テロ拠点構造設計",
      "status": "todo",
      "priority": "A",
      "category": "敵組織",
      "day": 5
    },
    {
      "name": "国際情勢整理",
```

## ./viewer/track/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>Meritocracia Tracker</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

<h1>📊 Project Tracker</h1>
<p id="week"></p>

<ul id="taskList"></ul>

<script>
fetch('data.json')
  .then(res => res.json())
  .then(data => {
    document.getElementById('week').textContent = "Week: " + data.week;

    const list = document.getElementById('taskList');

    data.tasks.forEach(task => {
      const li = document.createElement('li');
      li.textContent = task.name + " [" + task.status + "]";
      list.appendChild(li);
    });
  });
</script>

</body>
</html>```

## ./viewer/track/style.css

```
body {
  background: #0f0f0f;
  color: #ffffff;
  font-family: sans-serif;
  padding: 20px;
}

h1 {
  color: gold;
}

li {
  margin: 8px 0;
}```

## ./viewer/treeベース.md

```
ancer@lancer-System-Product-Name:~/DOCS/meritocracia-team-share/docs/settings/Meritocracia_Data_Hub$ tree
.
├── 📚 形式：豪邸×クリエイター短編集.md
├── 00_トップページ
│   └── 📌 配信レビュー #日付.md
├── 01_世界観・設定_Wiki
│   ├── wiki-view.sh
│   ├── キャラクター
│   │   ├── アイリス
│   │   │   └── アイリス_戦争奴隷設定_詳細.md
│   │   ├── クララ・ヴエルナー
│   │   │   ├── 💠 キャラ画像生成プロンプト（封印用・最終版）.md
│   │   │   └── 1️⃣ 基本情報（確定）.md
│   │   ├── テロリスト
│   │   ├── ベルフェール
│   │   │   ├── ベルフェゴール衣装テーブル.md
│   │   │   ├── ベルフェゴール服装案.md
│   │   │   └── 議事録 メリトクラシア国家関係 堕天使ベルフェゴール潜伏設定.txt
│   │   ├── ユミナ・ヴェルナー
│   │   │   └── 📘 テロ事件編／ユミナ関連設定（確定議事録）.md
│   │   ├── ライナルト
│   │   │   ├── グローリアテスト制度見直し.md
│   │   │   └── ライナルト_性格・思想_最終確定.md
│   │   ├── ルカ
│   │   │   └── 📘 議事録｜ルカ キャラクター設計（確定版.md
│   │   ├── 主人公一家
│   │   │   ├── カーネル　レオンハルト
│   │   │   │   ├── カーネルレオンハルト １８禁プロンプト.md
│   │   │   │   ├── カーネルレオンハルト見た目設計.md
│   │   │   │   └── メリトクラシアAIキャラ生成議事録.md
│   │   │   ├── ガレス　レオンハルト
│   │   │   ├── ジェイド　レオンハルト
│   │   │   │   └── 🏛 議事録.md
│   │   │   └── ミレイユレオンハルト
│   │   │       └── メリトクラシア設定議事録.md
│   │   └── 前線騎士団
│   │       └── 前線騎士団（Frontorden FO）.md
│   ├── キャラクター設定
│   │   ├── ガレス・レオンハルト 外見設計md
│   │   ├── ジェイド家家族構成議事録.md
```

## ./viewer/viewer_root_readme_draft.md

```
# 📘 docs/viewer README

Meritocracia Hub の Viewer 全体構造と運用ルールをまとめたルートREADME。

---

## 🎯 目的

`docs/viewer/` は **GitHub Pages 公開用の統合Hub**。

世界観・キャラ・ストーリー・制作進行・マップ・知識DBを、
**カテゴリ別の閲覧UIとして統合表示する。**

Hub本体は極力安定運用し、各カテゴリはモジュール単位で拡張する。

---

## 🗂 現在のディレクトリ構造

```text
viewer/
├ index.html              # Hub本体（極力固定）
├ modules/               # セクション部品（partial化）
├ story/                 # ストーリー系
├ character/             # キャラUI
├ db/                    # 国家 / 神話 / DB資料
├ knowledge/             # Knowledge Core
├ map/                   # MeritMap
├ system/                # 心音・契約など
├ track/                 # 進行トラッカー
├ memo/                  # Discord / メモHTML
├ daily.html             # 日報Viewer
└ update_viewer_index.sh # index系更新
```

---

## 🧩 設計ルール（重要）

### 1. Hub本体は極力触らない
```

## ./viewer/アーカイブ/<!DOCTYPE html>.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Merit-Schedule OS v2.0</title>
    <style>
        :root {
            --bg-color: #0f0f0f;
            --card-bg: #1a1a1a;
            --text-main: #e0e0e0;
            --text-sub: #a0a0a0;
            --accent-green: #2d5a27;
            --accent-blue: #1e3a5f;
            --accent-purple: #3e1e5f;
            --danger: #8b0000;
            --border: #333;
        }

        body {
            background-color: var(--bg-color);
            color: var(--text-main);
            font-family: 'Inter', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            overflow-x: hidden;
        }

        /* --- Sticky Header (Pomo & S-Task) --- */
        .sticky-header {
            position: sticky;
            top: 0;
            width: 100%;
            max-width: 900px;
            background-color: rgba(15, 15, 15, 0.95);
            border-bottom: 1px solid var(--border);
            padding: 10px 20px;
```

## ./viewer/アーカイブ/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Meritocracia Hub</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700&family=Noto+Serif+JP:wght@300;400;500&display=swap');

:root {
  --bg:      #070b12;
  --bg2:     #0c1220;
  --bg3:     #111827;
  --gold:    #c8a45a;
  --gold2:   #e5c97e;
  --dim:     #5a4e38;
  --text:    #cfc4ae;
  --text2:   #7a6e5a;
  --border:  rgba(200,164,90,0.15);
  --border2: rgba(200,164,90,0.3);
}

* { margin:0; padding:0; box-sizing:border-box; }

html { scroll-behavior: smooth; }

body {
  background: var(--bg);
  color: var(--text);
  font-family: 'Noto Serif JP', serif;
  min-height: 100vh;
  overflow-x: hidden;
}

/* 背景装飾 */
body::before {
  content: '';
  position: fixed;
  inset: 0;
  background:
```

## ./viewer/アーカイブ/iris.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Iris Earlgray | MERITOCRACIA</title>
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,300;1,400&family=Noto+Serif+JP:wght@300;400;500&family=IM+Fell+English:ital@0;1&display=swap" rel="stylesheet">
<style>
/* ============================================================
   IRIS EARLGRAY — CHARACTER PAGE
   コンセプト: 高級紅茶ブランドのラベル × メイド服の黒白緑金
   カラー方針: 琥珀背景にPDF公式カラーを乗せる折衷設計
   ============================================================ */

:root {
  /* 背景・紅茶系 */
  --tea-bg:       #2a1a0e;
  --tea-bg2:      #3d2410;
  --tea-amber:    #8B4513;
  --tea-amber2:   #a0521a;
  --tea-light:    #c4803a;
  --parchment:    #FFF8E7;
  --parchment2:   #f5e8c8;

  /* アイリス公式カラー（PDF準拠） */
  --iris-black:   #1C1B1B;
  --iris-white:   #F2EDE6;
  --iris-green:   #2E6135;
  --iris-gold:    #C5A35A;
  --iris-skin:    #6A4E3D;
  --iris-hair:    #E8E8E8;
  --iris-eye:     #8C5FBF;

  /* テキスト */
  --text-warm:    #FFF8E7;
  --text-muted:   #c8a87a;
  --text-dim:     #7a5a3a;

  /* ボーダー */
  --border-gold:  rgba(197,163,90,0.4);
```

## ./viewer/アーカイブ/kiel.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CHARACTER PROFILE | KIEL</title>
    <style>
        :root {
            --primary-color: #4a4a4a; /* 鈍い鉄色 */
            --accent-color: #8b0000;  /* 抑えられた血の赤 */
            --bg-dark: #121212;
            --text-gray: #b0b0b0;
            --border-color: #333;
        }

        body {
            background-color: var(--bg-dark);
            color: #e0e0e0;
            font-family: 'Helvetica Neue', Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 40px 20px;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            border: 1px solid var(--border-color);
            padding: 40px;
            background: linear-gradient(145deg, #1a1a1a, #121212);
        }

        header {
            border-bottom: 2px solid var(--accent-color);
            margin-bottom: 30px;
            padding-bottom: 10px;
        }

        .char-name {
            font-size: 0.8rem;
```

## ./viewer/アーカイブ/minecraft-project/grand-central/export default function MeritocraciaCity.html

```
export default function MeritocraciaCityDistrictMapMock() {
  const wards = [
    { name: '中央市場区', role: '商業・祝祭・中央市場', line: 'Gold Line' },
    { name: '行政中枢区', role: '議会・三兵団・中央庁舎', line: 'Blue Line' },
    { name: '港湾物流区', role: '交易港・倉庫・密輸ルート', line: 'Teal Line' },
    { name: '東住宅区', role: 'ジェイド居住圏・パン屋街', line: 'Green Line' },
    { name: '士官予備区', role: '学校・訓練施設', line: 'Red Line' },
    { name: '教会旧市街', role: '星導教会・地下礼拝路', line: 'Purple Line' },
  ];

  return (
    <div className="min-h-screen bg-slate-950 text-slate-100 p-8">
      <div className="max-w-6xl mx-auto space-y-8">
        <header>
          <p className="text-sm tracking-[0.3em] text-amber-400">CITY DISTRICT MAP / GRAND CENTRAL</p>
          <h1 className="text-4xl font-bold mt-2">グランセントラル 市区アーカイブ</h1>
          <p className="text-slate-400 mt-3">東京23区＋路線図モデルで、ZERO編〜本編の所在地を市町村レベルで管理する都市DB骨格。</p>
        </header>

        <section className="grid md:grid-cols-3 gap-6">
          <div className="md:col-span-2 rounded-3xl border border-slate-800 bg-slate-900 p-6">
            <h2 className="text-xl font-semibold mb-4">都市レイヤー構造</h2>
            <div className="space-y-3 text-sm">
              <div>国：メリトクラシア共和国</div>
              <div>州：グランセントラル州</div>
              <div>市：グランセントラル市</div>
              <div>区：中央市場区 / 東住宅区 / 教会旧市街 ...</div>
              <div>町：パン屋通り / 鐘楼坂 / 東門住宅街</div>
            </div>
            <div className="mt-6 rounded-2xl bg-slate-950 border border-slate-800 p-4 text-slate-400 text-sm">
              次段階で SVG 地図・駅路線図・事件タイムライン連動に拡張可能
            </div>
          </div>

          <div className="rounded-3xl border border-slate-800 bg-slate-900 p-6">
            <h2 className="text-xl font-semibold mb-4">主要路線</h2>
            <div className="space-y-3 text-sm">
              <div>Gold：中央市場環状線</div>
              <div>Blue：中央庁舎線</div>
              <div>Green：東住宅線（ジェイド家）</div>
```

## ./viewer/アーカイブ/minecraft-project/grand-central/グランセントラル.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>グランセントラル 市区アーカイブ</title>
  <style>
    :root {
      --bg: #020817;
      --panel: #0f172a;
      --panel-2: #111827;
      --border: #1e293b;
      --text: #e2e8f0;
      --muted: #94a3b8;
      --accent: #fbbf24;
    }

    * {
      box-sizing: border-box;
    }

    body {
      margin: 0;
      min-height: 100vh;
      background: var(--bg);
      color: var(--text);
      font-family: "Noto Sans JP", sans-serif;
      padding: 32px;
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
    }

    header {
      margin-bottom: 32px;
    }

    .sub {
```

## ./viewer/アーカイブ/minecraft-project/map-prototypes/map/city.css

```
@import url('https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,400&family=Noto+Serif+JP:wght@300;400;500&display=swap');

/* ============================================================
   CSS VARIABLES
   ============================================================ */
:root {
  --bg:           #060a11;
  --bg2:          #0a1020;
  --bg3:          #0e1628;
  --panel:        #0d1525;
  --panel2:       #111d35;

  --gold:         #c9a961;
  --gold2:        #e8c97a;
  --gold-dim:     #7a6035;
  --gold-glow:    rgba(201,169,97,0.15);

  --text:         #d8ccb4;
  --text2:        #7a6e58;
  --text3:        #4a4030;

  --border:       rgba(201,169,97,0.14);
  --border2:      rgba(201,169,97,0.3);

  /* ステータスカラー */
  --c-dead:       #8b1a1a;
  --c-dead-glow:  rgba(139,26,26,0.2);
  --c-dead-text:  #e05050;

  --c-captured:   #b8901a;
  --c-captured-glow: rgba(184,144,26,0.2);
  --c-captured-text: #e8c050;

  --c-escape:     #5a2d8a;
  --c-escape-glow: rgba(90,45,138,0.2);
  --c-escape-text: #b080f0;

  --c-civilian:   #1a4a7a;
  --c-civilian-glow: rgba(26,74,122,0.2);
  --c-civilian-text: #60a8e0;
```

## ./viewer/アーカイブ/minecraft-project/map-prototypes/map/city.js

```
'use strict';

/* ============================================================
   CONSTANTS
   ============================================================ */
const STATUS_CONFIG = {
  dead:     { label: '死亡',           dot: '#e05050' },
  captured: { label: '逮捕（影武者）', dot: '#e8c050' },
  escape:   { label: '逃亡・生存',     dot: '#b080f0' },
  civilian: { label: '生存（民間）',   dot: '#60a8e0' },
  unknown:  { label: '生死不明',       dot: '#9090b0' },
  shadow:   { label: '要監視・黒幕候補', dot: '#c9a961' },
};

const PHASE_ORDER = [
  '静寂と予兆',
  '英雄的選択と悲劇',
  '決別と覚醒の兆し',
  'FOによる制圧',
  '残酷な現実の確定',
  '政治的幕引き',
  '誓いへ',
];

const HL_BADGE_LABEL = {
  death:     '★ カーネル死亡',
  pivot:     '◆ 転換点',
  deception: '▲ 国家の欺瞞',
  awakening: '◉ 心音覚醒',
  oath:      '✦ 誓い',
};

const FORESHADOW_DATA = [
  {
    icon: '🔮',
    label: 'ABILITY',
    title: '心音システム初覚醒',
    desc: 'Scene14の異常な心音、Scene25の公開尋問での無自覚発火。「こいつじゃない」という確信がジェイドに生まれる起点。グローリアテストおよび夜化因子判定への直接の伏線。',
    connect: '→ グローリアテスト / 夜化因子 / 能力判定試験',
  },
```

## ./viewer/アーカイブ/minecraft-project/map-prototypes/map/city_map.json

```
{
  "map_id": "grand_central_city_v1",

  "districts": [
    {
      "district_id": "market_core",
      "name": "中央市場区",
      "x": 520,
      "y": 220
    },
    {
      "district_id": "admin_core",
      "name": "行政中枢区",
      "x": 250,
      "y": 300
    },
    {
      "district_id": "east_residential",
      "name": "東住宅区",
      "x": 820,
      "y": 300
    },
    {
      "district_id": "port_logistics",
      "name": "港湾物流区",
      "x": 130,
      "y": 540
    },
    {
      "district_id": "church_oldtown",
      "name": "教会旧市街",
      "x": 760,
      "y": 650
    },
    {
      "district_id": "academy_outer",
      "name": "士官予備区",
      "x": 520,
      "y": 560
    }
```

## ./viewer/アーカイブ/minecraft-project/map-prototypes/map/city_status.json

```
{
  "incident": "中央市場炎槍事件",
  "cell": "炎翼セル",
  "members": [
    {
      "id": "C-01",
      "name": "アーク",
      "role": "セルリーダー",
      "role_en": "Cell Leader",
      "status": "escape",
      "status_label": "逃亡・生存",
      "public_info": "国家未把握",
      "future_hook": "上位セル接続担当。ZERO終盤黒幕導線。",
      "threat": "high"
    },
    {
      "id": "R-02",
      "name": "ノクス",
      "role": "儀式中枢",
      "role_en": "Ritual Core",
      "status": "unknown",
      "status_label": "生死不明（生存寄り）",
      "public_info": "死亡扱い",
      "future_hook": "影武者作戦の主導者候補。自害は偽装の可能性。",
      "threat": "high"
    },
    {
      "id": "R-03",
      "name": "セラ",
      "role": "儀式補助",
      "role_en": "Ritual Support",
      "status": "escape",
      "status_label": "逃亡・生存",
      "public_info": "行方不明",
      "future_hook": "ルカとの接点あり。後の証言者候補。迷いを持つ唯一の存在。",
      "threat": "medium"
    },
    {
      "id": "D-04",
      "name": "グラム",
```

## ./viewer/アーカイブ/minecraft-project/map-prototypes/map/city_story.json

```
{
  "incident": "中央市場炎槍事件",
  "subtitle": "ZERO編プロローグ事件",
  "arc": "中編・後編",
  "scenes": [
    {
      "id": 8,
      "title": "上空の異変",
      "phase": "静寂と予兆",
      "phase_en": "SILENCE",
      "tags": ["異変", "天使の示唆", "伏線"],
      "highlight": false,
      "summary": "炎の粉が逆流し、煙が上へ吸い込まれる。ジェイドだけが違和感を覚える。空の裂け目に、翼に見える巨大な炎影——正体は明示しない。"
    },
    {
      "id": 9,
      "title": "第二波",
      "phase": "静寂と予兆",
      "phase_en": "SILENCE",
      "tags": ["召喚獣", "戦場化", "ZG限界"],
      "highlight": false,
      "summary": "炎翼セル第二手。召喚獣が屋台を薙ぎ倒し市場が完全に戦場化。中央警備隊だけでは抑えきれない。カーネルが子供の泣き声で足を止める。"
    },
    {
      "id": 10,
      "title": "カーネルの選択",
      "phase": "英雄的選択と悲劇",
      "phase_en": "SACRIFICE",
      "tags": ["人格的必然", "姉の決断", "利他"],
      "highlight": false,
      "summary": "「……先にクララを頼む」——倒壊しかけた屋台の陰に迷子の子供を見つけ、迷わず単身向かうカーネル。これが死亡の人格的必然性となる。"
    },
    {
      "id": 11,
      "title": "炎槍の予兆",
      "phase": "英雄的選択と悲劇",
      "phase_en": "SACRIFICE",
      "tags": ["音の消滅", "赤染め", "スローモーション"],
      "highlight": false,
      "summary": "空の裂け目が脈打ち、音が消える。市場全体の色が一瞬だけ赤に染まる。カーネルが子供を抱き上げた瞬間、空から一本の細く鋭い光——。"
```

## ./viewer/アーカイブ/minecraft-project/map-prototypes/map/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>中央市場炎槍事件 | Meritocracia Terror DB</title>
<link rel="stylesheet" href="./city.css">
</head>
<body>

<div class="terror-shell">

  <!-- ナビ -->
  <a class="back-link" href="../../index.html">← NATION ARCHIVE</a>
  <a class="back-link" href="./map.html" style="margin-left:24px; color:var(--gold-dim);">🗺 TACTICAL MAP →</a>

  <!-- ======================================================
       ① INCIDENT HEADER
       ====================================================== -->
  <section class="incident-header">
    <div class="incident-tag">ZERO編 ／ MERITOCRACIA INCIDENT RECORD</div>
    <h1 class="incident-title" id="incident-title">読み込み中...</h1>
    <p class="incident-sub" id="incident-sub"></p>

    <div class="incident-stats">
      <div class="stat-chip red">
        <span class="stat-label">死者</span>
        <span class="stat-val" id="stat-dead">—</span>
      </div>
      <div class="stat-chip purple">
        <span class="stat-label">逃亡・行方不明</span>
        <span class="stat-val" id="stat-escape">—</span>
      </div>
      <div class="stat-chip amber">
        <span class="stat-label">公式犯人（影武者）</span>
        <span class="stat-val" id="stat-captured">—</span>
      </div>
      <div class="stat-chip">
        <span class="stat-label">Scene</span>
        <span class="stat-val">08 – 30</span>
```

## ./viewer/アーカイブ/minecraft-project/map-prototypes/map/map.css

```
@import url('https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,400&family=Noto+Serif+JP:wght@300;400;500&family=JetBrains+Mono:wght@300;400&display=swap');

/* ============================================================
   CSS VARIABLES — dark fantasy + London tube aesthetic
   ============================================================ */
:root {
  --bg:           #060a11;
  --bg2:          #0a1020;
  --bg3:          #0e1628;
  --panel:        #0d1525;
  --panel2:       #111d35;
  --panel-glass:  rgba(13,21,37,0.92);

  --gold:         #c9a961;
  --gold2:        #e8c97a;
  --gold-dim:     #7a6035;
  --gold-glow:    rgba(201,169,97,0.15);

  --text:         #d8ccb4;
  --text2:        #7a6e58;
  --text3:        #4a4030;

  --border:       rgba(201,169,97,0.14);
  --border2:      rgba(201,169,97,0.3);

  /* District palette — muted London-map tones */
  --dist-church:     rgba(120,80,160,0.18);
  --dist-church-s:   rgba(120,80,160,0.35);
  --dist-market:     rgba(200,120,60,0.18);
  --dist-market-s:   rgba(200,120,60,0.35);
  --dist-south:      rgba(80,140,100,0.15);
  --dist-south-s:    rgba(80,140,100,0.30);
  --dist-alley:      rgba(100,100,140,0.16);
  --dist-alley-s:    rgba(100,100,140,0.32);
  --dist-fo:         rgba(60,120,200,0.16);
  --dist-fo-s:       rgba(60,120,200,0.32);
  --dist-civic:      rgba(180,140,80,0.14);
  --dist-civic-s:    rgba(180,140,80,0.30);

  /* Route colors — Tube-line inspired */
```

## ./viewer/アーカイブ/minecraft-project/map-prototypes/map/map.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>中央市場テロ事件 地図 | Meritocracia Terror Map</title>
<meta name="description" content="ZERO編 中央市場炎槍事件の地図ビューア。ロンドン地下鉄路線図の読みやすさ + Googleマップの事件ピンUI + ダークファンタジー世界観を融合。">
<link rel="stylesheet" href="./map.css">
</head>
<body>

<!-- Mobile sidebar toggle -->
<button class="sidebar-toggle" id="sidebar-toggle" aria-label="メニュー">☰</button>

<!-- Mobile backdrop -->
<div class="sidebar-backdrop" id="sidebar-backdrop"></div>

<div class="map-app">

  <!-- ============================================================
       SIDEBAR (LEFT PANE)
       ============================================================ -->
  <aside class="sidebar" id="sidebar">

    <div class="sidebar-header">
      <a class="sidebar-back" href="./index.html">← INCIDENT RECORD</a>
      <div class="sidebar-tag">ZERO編 ／ TACTICAL MAP</div>
      <h1 class="sidebar-title">中央市場炎槍事件</h1>
      <div class="sidebar-subtitle">CENTRAL MARKET INCIDENT MAP</div>
    </div>

    <!-- Route toggles -->
    <div class="sidebar-section">
      <div class="sidebar-section-label">ROUTE LAYERS</div>
      <div id="route-toggles">
        <!-- JS generates -->
      </div>
    </div>

    <!-- Detail panel -->
```

## ./viewer/アーカイブ/minecraft-project/map-prototypes/map/map.js

```
'use strict';

/* ============================================================
   CONSTANTS & CONFIG
   ============================================================ */

/** District visual config — shape polygons & colors */
const DISTRICT_CONFIG = {
  church_quarter: {
    color: 'rgba(120,80,160,0.18)',
    stroke: 'rgba(120,80,160,0.35)',
    poly: [
      [100, 100], [320, 100], [330, 140], [320, 300],
      [280, 310], [100, 290], [90, 200]
    ],
    labelOffset: { dx: 0, dy: -15 }
  },
  market_core: {
    color: 'rgba(200,120,60,0.18)',
    stroke: 'rgba(200,120,60,0.35)',
    poly: [
      [370, 380], [620, 370], [640, 420], [630, 580],
      [580, 600], [370, 590], [350, 520]
    ],
    labelOffset: { dx: 0, dy: -15 }
  },
  south_market_edge: {
    color: 'rgba(80,140,100,0.15)',
    stroke: 'rgba(80,140,100,0.30)',
    poly: [
      [370, 620], [620, 620], [640, 670], [630, 830],
      [560, 850], [370, 840], [350, 750]
    ],
    labelOffset: { dx: 0, dy: -10 }
  },
  alley_belt: {
    color: 'rgba(100,100,140,0.16)',
    stroke: 'rgba(100,100,140,0.32)',
    poly: [
      [660, 380], [870, 400], [880, 450], [870, 600],
```

## ./viewer/アーカイブ/minecraft-project/map-prototypes/map_v1_archive_2026-04-16/city.css

```
@import url('https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,400&family=Noto+Serif+JP:wght@300;400;500&display=swap');

/* ============================================================
   CSS VARIABLES
   ============================================================ */
:root {
  --bg:           #060a11;
  --bg2:          #0a1020;
  --bg3:          #0e1628;
  --panel:        #0d1525;
  --panel2:       #111d35;

  --gold:         #c9a961;
  --gold2:        #e8c97a;
  --gold-dim:     #7a6035;
  --gold-glow:    rgba(201,169,97,0.15);

  --text:         #d8ccb4;
  --text2:        #7a6e58;
  --text3:        #4a4030;

  --border:       rgba(201,169,97,0.14);
  --border2:      rgba(201,169,97,0.3);

  /* ステータスカラー */
  --c-dead:       #8b1a1a;
  --c-dead-glow:  rgba(139,26,26,0.2);
  --c-dead-text:  #e05050;

  --c-captured:   #b8901a;
  --c-captured-glow: rgba(184,144,26,0.2);
  --c-captured-text: #e8c050;

  --c-escape:     #5a2d8a;
  --c-escape-glow: rgba(90,45,138,0.2);
  --c-escape-text: #b080f0;

  --c-civilian:   #1a4a7a;
  --c-civilian-glow: rgba(26,74,122,0.2);
  --c-civilian-text: #60a8e0;
```

## ./viewer/アーカイブ/minecraft-project/map-prototypes/map_v1_archive_2026-04-16/city.js

```
'use strict';

/* ============================================================
   CONSTANTS
   ============================================================ */
const STATUS_CONFIG = {
  dead:     { label: '死亡',           dot: '#e05050' },
  captured: { label: '逮捕（影武者）', dot: '#e8c050' },
  escape:   { label: '逃亡・生存',     dot: '#b080f0' },
  civilian: { label: '生存（民間）',   dot: '#60a8e0' },
  unknown:  { label: '生死不明',       dot: '#9090b0' },
  shadow:   { label: '要監視・黒幕候補', dot: '#c9a961' },
};

const PHASE_ORDER = [
  '静寂と予兆',
  '英雄的選択と悲劇',
  '決別と覚醒の兆し',
  'FOによる制圧',
  '残酷な現実の確定',
  '政治的幕引き',
  '誓いへ',
];

const HL_BADGE_LABEL = {
  death:     '★ カーネル死亡',
  pivot:     '◆ 転換点',
  deception: '▲ 国家の欺瞞',
  awakening: '◉ 心音覚醒',
  oath:      '✦ 誓い',
};

const FORESHADOW_DATA = [
  {
    icon: '🔮',
    label: 'ABILITY',
    title: '心音システム初覚醒',
    desc: 'Scene14の異常な心音、Scene25の公開尋問での無自覚発火。「こいつじゃない」という確信がジェイドに生まれる起点。グローリアテストおよび夜化因子判定への直接の伏線。',
    connect: '→ グローリアテスト / 夜化因子 / 能力判定試験',
  },
```

## ./viewer/アーカイブ/minecraft-project/map-prototypes/map_v1_archive_2026-04-16/city_map.json

```
{
  "map_id": "grand_central_city_v1",

  "districts": [
    {
      "district_id": "market_core",
      "name": "中央市場区",
      "x": 520,
      "y": 220
    },
    {
      "district_id": "admin_core",
      "name": "行政中枢区",
      "x": 250,
      "y": 300
    },
    {
      "district_id": "east_residential",
      "name": "東住宅区",
      "x": 820,
      "y": 300
    },
    {
      "district_id": "port_logistics",
      "name": "港湾物流区",
      "x": 130,
      "y": 540
    },
    {
      "district_id": "church_oldtown",
      "name": "教会旧市街",
      "x": 760,
      "y": 650
    },
    {
      "district_id": "academy_outer",
      "name": "士官予備区",
      "x": 520,
      "y": 560
    }
```

## ./viewer/アーカイブ/minecraft-project/map-prototypes/map_v1_archive_2026-04-16/city_status.json

```
{
  "incident": "中央市場炎槍事件",
  "cell": "炎翼セル",
  "members": [
    {
      "id": "C-01",
      "name": "アーク",
      "role": "セルリーダー",
      "role_en": "Cell Leader",
      "status": "escape",
      "status_label": "逃亡・生存",
      "public_info": "国家未把握",
      "future_hook": "上位セル接続担当。ZERO終盤黒幕導線。",
      "threat": "high"
    },
    {
      "id": "R-02",
      "name": "ノクス",
      "role": "儀式中枢",
      "role_en": "Ritual Core",
      "status": "unknown",
      "status_label": "生死不明（生存寄り）",
      "public_info": "死亡扱い",
      "future_hook": "影武者作戦の主導者候補。自害は偽装の可能性。",
      "threat": "high"
    },
    {
      "id": "R-03",
      "name": "セラ",
      "role": "儀式補助",
      "role_en": "Ritual Support",
      "status": "escape",
      "status_label": "逃亡・生存",
      "public_info": "行方不明",
      "future_hook": "ルカとの接点あり。後の証言者候補。迷いを持つ唯一の存在。",
      "threat": "medium"
    },
    {
      "id": "D-04",
      "name": "グラム",
```

## ./viewer/アーカイブ/minecraft-project/map-prototypes/map_v1_archive_2026-04-16/city_story.json

```
{
  "incident": "中央市場炎槍事件",
  "subtitle": "ZERO編プロローグ事件",
  "arc": "中編・後編",
  "scenes": [
    {
      "id": 8,
      "title": "上空の異変",
      "phase": "静寂と予兆",
      "phase_en": "SILENCE",
      "tags": ["異変", "天使の示唆", "伏線"],
      "highlight": false,
      "summary": "炎の粉が逆流し、煙が上へ吸い込まれる。ジェイドだけが違和感を覚える。空の裂け目に、翼に見える巨大な炎影——正体は明示しない。"
    },
    {
      "id": 9,
      "title": "第二波",
      "phase": "静寂と予兆",
      "phase_en": "SILENCE",
      "tags": ["召喚獣", "戦場化", "ZG限界"],
      "highlight": false,
      "summary": "炎翼セル第二手。召喚獣が屋台を薙ぎ倒し市場が完全に戦場化。中央警備隊だけでは抑えきれない。カーネルが子供の泣き声で足を止める。"
    },
    {
      "id": 10,
      "title": "カーネルの選択",
      "phase": "英雄的選択と悲劇",
      "phase_en": "SACRIFICE",
      "tags": ["人格的必然", "姉の決断", "利他"],
      "highlight": false,
      "summary": "「……先にクララを頼む」——倒壊しかけた屋台の陰に迷子の子供を見つけ、迷わず単身向かうカーネル。これが死亡の人格的必然性となる。"
    },
    {
      "id": 11,
      "title": "炎槍の予兆",
      "phase": "英雄的選択と悲劇",
      "phase_en": "SACRIFICE",
      "tags": ["音の消滅", "赤染め", "スローモーション"],
      "highlight": false,
      "summary": "空の裂け目が脈打ち、音が消える。市場全体の色が一瞬だけ赤に染まる。カーネルが子供を抱き上げた瞬間、空から一本の細く鋭い光——。"
```

## ./viewer/アーカイブ/minecraft-project/map-prototypes/map_v1_archive_2026-04-16/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>中央市場炎槍事件 | Meritocracia Terror DB</title>
<link rel="stylesheet" href="./city.css">
</head>
<body>

<div class="terror-shell">

  <!-- ナビ -->
  <a class="back-link" href="../../index.html">← NATION ARCHIVE</a>
  <a class="back-link" href="./map.html" style="margin-left:24px; color:var(--gold-dim);">🗺 TACTICAL MAP →</a>

  <!-- ======================================================
       ① INCIDENT HEADER
       ====================================================== -->
  <section class="incident-header">
    <div class="incident-tag">ZERO編 ／ MERITOCRACIA INCIDENT RECORD</div>
    <h1 class="incident-title" id="incident-title">読み込み中...</h1>
    <p class="incident-sub" id="incident-sub"></p>

    <div class="incident-stats">
      <div class="stat-chip red">
        <span class="stat-label">死者</span>
        <span class="stat-val" id="stat-dead">—</span>
      </div>
      <div class="stat-chip purple">
        <span class="stat-label">逃亡・行方不明</span>
        <span class="stat-val" id="stat-escape">—</span>
      </div>
      <div class="stat-chip amber">
        <span class="stat-label">公式犯人（影武者）</span>
        <span class="stat-val" id="stat-captured">—</span>
      </div>
      <div class="stat-chip">
        <span class="stat-label">Scene</span>
        <span class="stat-val">08 – 30</span>
```

## ./viewer/アーカイブ/minecraft-project/map-prototypes/map_v1_archive_2026-04-16/map.css

```
@import url('https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,400&family=Noto+Serif+JP:wght@300;400;500&family=JetBrains+Mono:wght@300;400&display=swap');

/* ============================================================
   CSS VARIABLES — dark fantasy + London tube aesthetic
   ============================================================ */
:root {
  --bg:           #060a11;
  --bg2:          #0a1020;
  --bg3:          #0e1628;
  --panel:        #0d1525;
  --panel2:       #111d35;
  --panel-glass:  rgba(13,21,37,0.92);

  --gold:         #c9a961;
  --gold2:        #e8c97a;
  --gold-dim:     #7a6035;
  --gold-glow:    rgba(201,169,97,0.15);

  --text:         #d8ccb4;
  --text2:        #7a6e58;
  --text3:        #4a4030;

  --border:       rgba(201,169,97,0.14);
  --border2:      rgba(201,169,97,0.3);

  /* District palette — muted London-map tones */
  --dist-church:     rgba(120,80,160,0.18);
  --dist-church-s:   rgba(120,80,160,0.35);
  --dist-market:     rgba(200,120,60,0.18);
  --dist-market-s:   rgba(200,120,60,0.35);
  --dist-south:      rgba(80,140,100,0.15);
  --dist-south-s:    rgba(80,140,100,0.30);
  --dist-alley:      rgba(100,100,140,0.16);
  --dist-alley-s:    rgba(100,100,140,0.32);
  --dist-fo:         rgba(60,120,200,0.16);
  --dist-fo-s:       rgba(60,120,200,0.32);
  --dist-civic:      rgba(180,140,80,0.14);
  --dist-civic-s:    rgba(180,140,80,0.30);

  /* Route colors — Tube-line inspired */
```

## ./viewer/アーカイブ/minecraft-project/map-prototypes/map_v1_archive_2026-04-16/map.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>中央市場テロ事件 地図 | Meritocracia Terror Map</title>
<meta name="description" content="ZERO編 中央市場炎槍事件の地図ビューア。ロンドン地下鉄路線図の読みやすさ + Googleマップの事件ピンUI + ダークファンタジー世界観を融合。">
<link rel="stylesheet" href="./map.css">
</head>
<body>

<!-- Mobile sidebar toggle -->
<button class="sidebar-toggle" id="sidebar-toggle" aria-label="メニュー">☰</button>

<!-- Mobile backdrop -->
<div class="sidebar-backdrop" id="sidebar-backdrop"></div>

<div class="map-app">

  <!-- ============================================================
       SIDEBAR (LEFT PANE)
       ============================================================ -->
  <aside class="sidebar" id="sidebar">

    <div class="sidebar-header">
      <a class="sidebar-back" href="./index.html">← INCIDENT RECORD</a>
      <div class="sidebar-tag">ZERO編 ／ TACTICAL MAP</div>
      <h1 class="sidebar-title">中央市場炎槍事件</h1>
      <div class="sidebar-subtitle">CENTRAL MARKET INCIDENT MAP</div>
    </div>

    <!-- Route toggles -->
    <div class="sidebar-section">
      <div class="sidebar-section-label">ROUTE LAYERS</div>
      <div id="route-toggles">
        <!-- JS generates -->
      </div>
    </div>

    <!-- Detail panel -->
```

## ./viewer/アーカイブ/minecraft-project/map-prototypes/map_v1_archive_2026-04-16/map.js

```
'use strict';

/* ============================================================
   CONSTANTS & CONFIG
   ============================================================ */

/** District visual config — shape polygons & colors */
const DISTRICT_CONFIG = {
  church_quarter: {
    color: 'rgba(120,80,160,0.18)',
    stroke: 'rgba(120,80,160,0.35)',
    poly: [
      [100, 100], [320, 100], [330, 140], [320, 300],
      [280, 310], [100, 290], [90, 200]
    ],
    labelOffset: { dx: 0, dy: -15 }
  },
  market_core: {
    color: 'rgba(200,120,60,0.18)',
    stroke: 'rgba(200,120,60,0.35)',
    poly: [
      [370, 380], [620, 370], [640, 420], [630, 580],
      [580, 600], [370, 590], [350, 520]
    ],
    labelOffset: { dx: 0, dy: -15 }
  },
  south_market_edge: {
    color: 'rgba(80,140,100,0.15)',
    stroke: 'rgba(80,140,100,0.30)',
    poly: [
      [370, 620], [620, 620], [640, 670], [630, 830],
      [560, 850], [370, 840], [350, 750]
    ],
    labelOffset: { dx: 0, dy: -10 }
  },
  alley_belt: {
    color: 'rgba(100,100,140,0.16)',
    stroke: 'rgba(100,100,140,0.32)',
    poly: [
      [660, 380], [870, 400], [880, 450], [870, 600],
```

## ./viewer/アーカイブ/minecraft-project/map-prototypes/map_v1_archive_2026-04-16/ジェミニの回答.md

```
高度な戦術レベルでの互換性と、演出のブラッシュアップを反映しました。grand-central-map.png の実寸（2560x1440）に基づき、既存の map.js が持つ描画エンジンを最大限活かせる構造です。

特に Academy Seamless Zoom は、クリックしたポリゴンの中心座標を計算して transform-origin を動的に書き換えることで、視点が吸い込まれるような Google Maps 風の挙動を再現しています。
1. map/map-data.json

実寸 2560x1440 用に座標系を再定義し、全6区画と5つの主要街道を網羅しました。

{
  "map_id": "grand_central_city_v2_final",
  "config": {
    "image_width": 2560,
    "image_height": 1440,
    "base_image": "../grand-central-map.png"
  },
  "districts": [
    { "district_id": "admin_core", "name": "行政中枢区", "color": "rgba(41,78,122,0.2)", "stroke": "rgba(74,127,193,0.5)", "polygon": [[100,480], [600,150], [820,250], [700,950], [180,880]], "link": null },
    { "district_id": "market_core", "name": "中央市場区", "color": "rgba(202,162,74,0.2)", "stroke": "rgba(202,162,74,0.5)", "polygon": [[820,250], [1250,210], [1300,720], [1050,820], [700,950]], "link": null },
    { "district_id": "east_residential", "name": "東住宅区", "color": "rgba(74,150,120,0.2)", "stroke": "rgba(74,150,120,0.5)", "polygon": [[1250,210], [1800,210], [1950,700], [1300,720]], "link": null },
    { "district_id": "church_oldtown", "name": "教会旧市街", "color": "rgba(140,100,180,0.2)", "stroke": "rgba(140,100,180,0.5)", "polygon": [[1300,720], [1950,700], [2100,1100], [1500,1200]], "link": null },
    { "district_id": "academy_outer", "name": "士官予備区", "color": "rgba(139,26,26,0.2)", "stroke": "rgba(139,26,26,0.5)", "polygon": [[700,950], [1050,820], [1300,720], [1500,1200], [900,1350]], "link": "../academy/index.html" },
    { "district_id": "port_logistics", "name": "港湾物流区", "color": "rgba(60,160,180,0.2)", "stroke": "rgba(60,160,180,0.5)", "polygon": [[180,880], [700,950], [900,1350], [200,1400]], "link": null }
  ],
  "routes": [
    { "route_id": "rt_east_gate", "name": "東門街道", "points": [[1800,450], [1250,450]] },
    { "route_id": "rt_north_path", "name": "北礼拝路", "points": [[820,100], [820,250]] },
    { "route_id": "rt_port_road", "name": "港街路", "points": [[200,1200], [600,1000]] },
    { "route_id": "rt_south_main", "name": "南側幹線", "points": [[200,900], [2300,900]] },
    { "route_id": "rt_pilgrim", "name": "巡礼路", "points": [[1050,820], [1600,1000]] }
  ],
  "pins": [
    { "pin_id": "pin_church", "name": "星導教会", "type": "monument", "x": 1700, "y": 950 },
    { "pin_id": "pin_underground", "name": "地下礼拝路入口", "type": "entry", "x": 1600, "y": 1050 },
    { "pin_id": "pin_kernel_death", "name": "カーネル死亡地点", "type": "incident", "x": 1580, "y": 1020 },
    { "pin_id": "pin_fo_entry", "name": "FO初動突入点", "type": "tactical", "x": 300, "y": 1100 }
    /* [SYSTEM NOTE] ZERO事件レイヤー統合用: 
       各要素に time_order (int) を追加することで、
       既存 map.js の setupTimeline() による逐次表示制御が可能です。
    */
  ]
}
```

## ./viewer/アーカイブ/minecraft-project/meeting/📘 統合設計議事録｜Grand Central City OS v2 完全再現.md

```
📘 統合設計議事録｜Grand Central City OS v2 完全再現フェーズ設計ロック

作成日: 2026-04-16
対象: Grand Central Tactical Map / Academy Seamless Zoom / ZERO事件 Overlay基盤
決裁: Lancer独断決裁（正式ロック）

0. 本議事録の目的

Grand Central Tactical Map v1 を基盤として進めていた都市OS試作を、
世界観DB・戦術記録・士官学校サブマップ・ZERO事件タイムライン再生まで接続可能な正式City OS v2仕様として固定する。

今回のロック対象は以下。

6行政区 polygon 正式名称
tactical engine schema 正式固定
academy seamless zoom 正式演出
route network 正式街道
ZERO事件 layer 接続予約
archive保護運用ルール

以後、この議事録を Grand Central 都市OSの親仕様書 とする。

1. Tactical Engine Schema 正式固定

Grand Central City OS v2 の正式JSON schemaを以下で固定する。

{
  "map_id": "grand_central_city_v2_final",
  "config": {},
  "districts": [],
  "locations": [],
  "routes": [],
  "pins": [],
  "events": [],
  "meta": {}
}
正式ルール
必須配列

以下は 空でも必須。
```

## ./viewer/アーカイブ/private-schedule_old_20260411/app.js

```
/* ============================================================
   MERITOCRACIA OS — 作業卓 / app.js  v3
   責務: 時計 / 週間スケジュール / ポモドーロ / 年間カレンダー / 初期化
   ============================================================ */
'use strict';

/* ══════════════════════════════════════
   定数・ユーティリティ
══════════════════════════════════════ */
const DAY_KEYS = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
const DAYS_JP = ['日', '月', '火', '水', '木', '金', '土'];
const BLOCKS = [
  { key: 'morning', label: 'MORNING   06:00–12:00', min: [6 * 60, 12 * 60] },
  { key: 'afternoon', label: 'AFTERNOON 12:00–18:00', min: [12 * 60, 18 * 60] },
  { key: 'night', label: 'NIGHT     18:00–06:00', min: [18 * 60, 30 * 60] },
];

const pad = n => String(n).padStart(2, '0');

/** "HH:MM" → 分数（深夜0〜5時は+24h） */
function t2m(t) {
  const [h, m] = t.split(':').map(Number);
  return (h < 6 ? h + 24 : h) * 60 + m;
}

/** 現在分数（深夜補正） */
function nowMin() {
  const d = new Date();
  const h = d.getHours();
  return (h < 6 ? h + 24 : h) * 60 + d.getMinutes();
}

/** 今日の DAY_KEY ("MON"〜"SUN") */
function todayKey() {
  return DAY_KEYS[new Date().getDay()];
}

/* ══════════════════════════════════════
   時計
══════════════════════════════════════ */
```

## ./viewer/アーカイブ/private-schedule_old_20260411/index.html

```
<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MERITOCRACIA OS — 作業卓</title>
  <link rel="stylesheet" href="./style.css">
</head>

<body>
  <div class="ps-wrap">

    <!-- ヘッダー -->
    <div class="ps-top-bar">
      <div class="ps-site-label">MERITOCRACIA — 作業卓</div>
      <div class="ps-clock-block">
        <div id="ps-clock-time">00:00:00</div>
        <div id="ps-clock-date">----/--/--</div>
      </div>
    </div>

    <!-- 週間プログレス -->
    <div class="ps-weekly-progress">
      <div class="ps-wp-header">
        <span class="ps-wp-label">WEEKLY PROGRESS</span>
        <span id="ps-wp-pct">0%</span>
      </div>
      <div class="ps-wp-bar">
        <div class="ps-wp-fill" id="ps-wp-fill"></div>
      </div>
    </div>

    <!-- 2カラム -->
    <div class="ps-main-grid">

      <!-- ポモドーロ -->
      <div class="ps-card">
        <span class="ps-card-label">POMODORO TIMER</span>
        <div id="ps-pomo-mode">WORK</div>
```

## ./viewer/アーカイブ/private-schedule_old_20260411/schedule.json

```
{
  "week": "2025-W15",
  "weekly_progress": 42,
  "days": {
    "MON": {
      "label": "月",
      "tasks": [
        {
          "time": "18:00",
          "label": "執筆",
          "cat": "writing",
          "block": "night"
        },
        {
          "time": "22:00",
          "label": "シーン確認",
          "cat": "writing",
          "block": "night"
        },
        {
          "time": "02:00",
          "label": "就寝",
          "cat": "rest",
          "block": "night"
        }
      ]
    },
    "TUE": {
      "label": "火",
      "tasks": [
        {
          "time": "18:00",
          "label": "執筆",
          "cat": "writing",
          "block": "night"
        },
        {
          "time": "19:30",
          "label": "仮眠",
          "cat": "rest",
```

## ./viewer/アーカイブ/private-schedule_old_20260411/style.css

```
/* ============================================================
   MERITOCRACIA OS — 作業卓 / private-schedule
   prefix: ps-  (production-schedule)
   v2: 週間時間割UI対応
   ============================================================ */

:root {
  --ps-bg: #07090f;
  --ps-bg2: #0e1320;
  --ps-bg3: #141c2e;
  --ps-amber: #c8841a;
  --ps-amber2: #e8a030;
  --ps-amber3: #f5c060;
  --ps-dim: #4a3c28;
  --ps-text: #d4c5a9;
  --ps-text2: #7a6e5e;
  --ps-text3: #4a4030;
  --ps-green: #2a8a4a;
  --ps-green2: #3dbb66;
  --ps-blue: #1e3a5f;
  --ps-blue2: #2980b9;
  --ps-purple: #3e1e5f;
  --ps-purple2: #9b59b6;
  --ps-red: #8a2020;
  --ps-border: rgba(200, 132, 26, 0.18);
  --ps-shadow: rgba(0, 0, 0, 0.6);
  --ps-r: 16px;
}

/* ────── リセット ────── */
.ps-wrap * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

/* ────── ベース ────── */
body {
  background: var(--ps-bg);
  color: var(--ps-text);
```

## ./viewer/アーカイブ/クロード先生/merit_tracker_v2_claude/MIGRATION.md

```
# Meritocracia Tracker v2 — 移行手順

## ① ファイル構成

```
docs/viewer/track/
├── index.html   ← 今回の新版に差し替え
├── style.css    ← 今回の新版に差し替え
├── app.js       ← 新規追加（旧版には存在しない）
├── data.json    ← そのまま流用 OK（互換処理済み）
└── task.py      ← 今回の改修版に差し替え
```

## ② 移行手順（5ステップ）

### Step 1: 旧ファイルをバックアップ
```bash
cd /home/lancer/DOCS/meritocracia-team-share/docs/viewer/track
cp index.html index.html.bak
cp style.css  style.css.bak
cp task.py    task.py.bak
# ※ data.json はそのまま使う。バックアップは任意。
```

### Step 2: 新ファイルを配置
```bash
cp /path/to/new/index.html .
cp /path/to/new/style.css  .
cp /path/to/new/app.js     .   # 新規
cp /path/to/new/task.py    .
```

### Step 3: ブラウザで初回起動
- `index.html` をブラウザで開く
- data.json を自動読み込みして LocalStorage に保存する
- 初回のみ data.json を読む（以降は LocalStorage が優先）

### Step 4: 壊れたタスクデータの確認
既存の data.json には `!task add` が混入したタスク名が1件含まれています。
```
```

## ./viewer/アーカイブ/クロード先生/merit_tracker_v2_claude/app.js

```
/* ================================================
   Meritocracia Tracker — app.js
   外部ライブラリなし / LocalStorageで永続化
   data.json との互換維持
================================================ */

'use strict';

// ─── 定数 ─────────────────────────────────────
const STORAGE_KEY = 'merito_tracker_v2';
const STATUSES    = ['todo', 'doing', 'done', 'hold', 'archive'];
const PRIORITIES  = ['', 'S', 'A', 'B'];

// ─── State ────────────────────────────────────
let state = {
  week: '',
  tasks: [],
  nextId: 1,
  filter: 'all',
  categoryFilter: '',
};

// ─── Persistence ──────────────────────────────
function loadFromStorage() {
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    if (raw) return JSON.parse(raw);
  } catch (e) {}
  return null;
}

function saveToStorage() {
  localStorage.setItem(STORAGE_KEY, JSON.stringify({
    week:   state.week,
    tasks:  state.tasks,
    nextId: state.nextId,
  }));
}

// data.json から初期データを読み込む（初回起動時のみ）
```

## ./viewer/アーカイブ/クロード先生/merit_tracker_v2_claude/data.json

```
{
  "week": "2026-W13",
  "tasks": [
    {
      "name": "ヴィオラ設計資料確定",
      "status": "done",
      "priority": "A",
      "category": "キャラ設計",
      "day": 1
    },
    {
      "name": "キール・フィーネ・フラン一文定義",
      "status": "done",
      "priority": "A",
      "category": "キャラ設計",
      "day": 2
    },
    {
      "name": "心音システム演出設計",
      "status": "doing",
      "priority": "S",
      "category": "システム設計",
      "day": 3
    },
    {
      "name": "国家機関一覧作成",
      "status": "done",
      "priority": "A",
      "category": "世界観",
      "day": 4
    },
    {
      "name": "テロ拠点構造設計",
      "status": "todo",
      "priority": "A",
      "category": "敵組織",
      "day": 5
    },
    {
      "name": "国際情勢整理",
```

## ./viewer/アーカイブ/クロード先生/merit_tracker_v2_claude/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Meritocracia Tracker</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@300;400;500;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="app-shell">

  <!-- ヘッダー -->
  <header class="app-header">
    <div class="header-left">
      <div class="logo-mark">M</div>
      <div class="header-titles">
        <h1>Meritocracia Tracker</h1>
        <span class="week-label" id="weekLabel">—</span>
      </div>
    </div>
    <div class="header-right">
      <div class="stats" id="stats"></div>
      <button class="btn-add" id="btnAdd">＋ タスク追加</button>
    </div>
  </header>

  <!-- フィルターバー -->
  <div class="filter-bar">
    <div class="filter-tabs" id="filterTabs">
      <button class="filter-tab active" data-filter="all">すべて</button>
      <button class="filter-tab" data-filter="doing">進行中</button>
      <button class="filter-tab" data-filter="todo">未着手</button>
      <button class="filter-tab" data-filter="done">完了</button>
      <button class="filter-tab" data-filter="hold">保留</button>
      <button class="filter-tab" data-filter="archive">アーカイブ</button>
    </div>
    <div class="filter-category">
```

## ./viewer/アーカイブ/クロード先生/merit_tracker_v2_claude/style.css

```
/* ================================================
   Meritocracia Tracker — style.css
   ダーク・オペレーショナル / 現行トーン維持
================================================ */

:root {
  --bg:          #0f0f0f;
  --surface:     #191919;
  --surface-2:   #222222;
  --border:      #2e2e2e;
  --border-dim:  #1e1e1e;

  --text:        #e8e8e0;
  --text-muted:  #7a7a72;
  --text-dim:    #444440;

  --gold:        #c8a84b;
  --gold-dim:    #7a6424;

  --doing:       #3b82f6;
  --doing-bg:    rgba(59,130,246,.12);
  --todo:        #6b7280;
  --todo-bg:     rgba(107,114,128,.10);
  --done:        #22c55e;
  --done-bg:     rgba(34,197,94,.10);
  --hold:        #f59e0b;
  --hold-bg:     rgba(245,158,11,.10);
  --archive:     #3f3f3f;
  --archive-bg:  rgba(63,63,63,.15);

  --prio-s:      #ef4444;
  --prio-a:      #f97316;
  --prio-b:      #a3a3a3;

  --radius:      6px;
  --row-h:       42px;
  --font-main:   'Noto Sans JP', sans-serif;
  --font-mono:   'JetBrains Mono', monospace;
}

```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/00_spec/ワークフローv2.md

```
# 📘 議事録｜レビュー投稿ワークフロー v2 正式化

## 作成日
2026-04-19

## 議題
小説レビューレポート運用における、
レビュー公開ページ作成・台帳登録・GitHub反映までのワークフローを再整理し、
テーマ差分・JSON差分・台帳列ズレ事故に耐える形へ更新する。

---

## 1｜背景

従来のレビュー投稿ワークフロー v1 は、以下の前提で運用されていた。

- Night テーマ前提
- `night.html` + `letter.js` + `iris-nightlounge.css` 前提
- `review.json` のキー構造が最小限
- 台帳 `review-ledger.html` の列構造が簡略化されていた

しかし実運用において、Spring テーマ利用時に以下の問題が発生した。

### 発生した問題
- テーマごとに CSS 名が異なる
- HTML 側の ID と JS 側の参照先が一致しない場合がある
- `work_title` / `work_url` が手順書に定義されていなかった
- `review-ledger.html` の列不足により、行ズレが発生した
- テーマ専用JSを丸ごと差し替えると本文描画ごと壊れる可能性がある

---

## 2｜今回の結論

レビュー投稿ワークフローは、**v2 を正式採用**する。

### 採用理由
1. テーマ差分を前提とした運用に変更できる
2. `work_title` / `work_url` を標準項目として扱える
3. 台帳列数を固定し、行ズレ事故を防げる
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/index.html

```
./night-review-vol1/
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/letter-archive.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>IRIS SWEET LETTER ARCHIVE | MERITOCRACIA</title>
  <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
  <style>
    :root{
      --bg:#0d0d0f;
      --card:#17171b;
      --border:#3a3025;
      --gold:#c9a84c;
      --text:#ece7dd;
      --muted:#b8aa92;
    }

    *{box-sizing:border-box;}

    body{
      margin:0;
      background:
        radial-gradient(circle at top, rgba(201,168,76,0.06), transparent 40%),
        var(--bg);
      color:var(--text);
      font-family:'Noto Serif JP', serif;
      padding:48px 24px;
    }

    .wrap{
      max-width:960px;
      margin:0 auto;
    }

    h1{
      font-family:'Cinzel', serif;
      font-size:2rem;
      margin-bottom:12px;
      color:var(--gold);
      letter-spacing:0.08em;
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/luxury.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Luxury | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-luxury.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/night.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Night Lounge | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-nightlounge.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/review-ledger.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>小説レビューレポート台帳</title>
<style>
body{
  margin:0;
  background:#0f1115;
  color:#eee;
  font-family:system-ui, sans-serif;
  padding:32px;
}
h1{
  margin-bottom:20px;
}
table{
  width:100%;
  border-collapse:collapse;
  background:#171a21;
}
th,td{
  border:1px solid #333;
  padding:12px;
  text-align:left;
  font-size:14px;
}
th{
  background:#1f2430;
}
tr:hover{
  background:#202633;
}
.status-done{color:#8fd18f;}
.status-wait{color:#d6b86b;}
.status-hold{color:#c77;}
</style>
</head>
<body>
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/spring.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Spring Tea | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-springtea.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/00_normal_multitheme_example/iris-classic.css

```
/* ============================================================
   iris-classic.css — Gemini版 完全移植
   ☕ 春の夜 × アールグレイ × 素朴な高級感
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap');

:root {
    --ink:       #3a2d28;
    --paper:     #fffcf5;
    --gold:      #b39764;
    --accent:    #8ba58d;   /* 春の芽吹き */
    --night-bg:  #1a1614;
    --shadow:    rgba(0,0,0,0.2);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.8;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：春の夜 */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background: radial-gradient(circle at top right, #2c2520 0%, #1a1614 100%);
    z-index: -1;
}

.letter-container {
    max-width: 700px;
    width: 100%;
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/00_normal_multitheme_example/iris-luxury.css

```
/* ============================================================
   iris-luxury.css — 公爵家メイド / 高級便箋
   💚 深緑 × 金箔 × 封蝋 × 最上級のご褒美感
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=IM+Fell+English:ital@0;1&display=swap');

:root {
    --ink:       #1a2a1a;
    --paper:     #f4f0e6;
    --gold:      #c9a84c;
    --gold2:     #e8c97a;
    --accent:    #2d5a2d;   /* 深緑 */
    --accent2:   #4a8a4a;
    --wax:       #8b1a1a;   /* 封蝋 */
    --night-bg:  #0a120a;
    --shadow:    rgba(0,0,0,0.5);
    --border-op: 0.6;
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：深緑の夜 × 金粒子 */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 20% 10%, rgba(45,90,45,0.18) 0%, transparent 50%),
        radial-gradient(ellipse at 80% 90%, rgba(201,168,76,0.08) 0%, transparent 50%),
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/00_normal_multitheme_example/iris-nightlounge.css

```
/* ============================================================
   iris-nightlounge.css — 深夜読書ラウンジ
   🌙 黒 × 琥珀 × ランプ光 × Reading Blend 接続版
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=IM+Fell+English:ital@0;1&display=swap');

:root {
    --ink:       #e8d8b8;   /* 羊皮紙文字色 */
    --ink-dark:  #c8a878;
    --paper:     #12100c;   /* 黒便箋 */
    --paper2:    #1a160e;
    --amber:     #c8841a;
    --amber2:    #e8a030;
    --amber3:    #f5c060;
    --amber-dim: rgba(200,132,26,0.18);
    --night-bg:  #07090f;
    --shadow:    rgba(0,0,0,0.8);
    --border:    rgba(200,132,26,0.3);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：ランプ光 × 深夜ラウンジ */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 50% 0%,    rgba(200,132,26,0.12) 0%, transparent 50%),
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/00_normal_multitheme_example/iris-springtea.css

```
/* ============================================================
   iris-springtea.css — 春摘みダージリン
   🌸 桜色 × 新芽グリーン × 薄金 × 柔らかい余韻
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=Zen+Old+Mincho:wght@400;700&display=swap');

:root {
    --ink:      #3a2830;
    --paper:    #fff8f5;
    --gold:     #c8a86a;
    --sakura:   #e8a0b0;    /* 桜 */
    --sakura2:  #f5c8d0;
    --sprout:   #7aaa7a;    /* 新芽 */
    --sprout2:  #a0c890;
    --night-bg: #180f14;
    --shadow:   rgba(60,20,40,0.25);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：春の朝霧 */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 15% 0%,   rgba(232,160,176,0.15) 0%, transparent 45%),
        radial-gradient(ellipse at 85% 100%,  rgba(122,170,122,0.12) 0%, transparent 45%),
        radial-gradient(ellipse at 50% 50%,   rgba(200,168,106,0.05) 0%, transparent 60%),
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/00_normal_multitheme_example/letter-archive.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter Archive | Iris Sweet Review</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=IM+Fell+English:ital@0;1&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg:      #07090f;
            --amber:   #c8841a;
            --amber2:  #e8a030;
            --amber3:  #f5c060;
            --text:    #d4c5a9;
            --text2:   #7a6e5e;
            --border:  rgba(200,132,26,0.2);
        }

        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            background: var(--bg);
            color: var(--text);
            font-family: 'Noto Serif JP', serif;
            min-height: 100vh;
            padding: 48px 20px 80px;
        }

        /* グリッド背景 */
        body::before {
            content: '';
            position: fixed;
            inset: 0;
            background-image:
                linear-gradient(rgba(200,132,26,0.025) 1px, transparent 1px),
                linear-gradient(90deg, rgba(200,132,26,0.025) 1px, transparent 1px);
            background-size: 40px 40px;
            pointer-events: none;
            z-index: 0;
        }
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/00_normal_multitheme_example/letter.js

```
/* ============================================================
   Letter from Iris — letter.js
   review.json を fetch して DOM に流し込む
   ============================================================ */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
    fetch('./review.json')
        .then(res => {
            if (!res.ok) throw new Error(`HTTP ${res.status}`);
            return res.json();
        })
        .then(data => {
            /* 基本情報 */
            document.getElementById('recipient').textContent  = data.recipient;
            document.getElementById('intro-text').innerText   = data.intro;
            document.getElementById('tea-name').textContent   = data.tea_service;
            document.getElementById('read-count').textContent = data.read_count;
            document.getElementById('review-summary').textContent = data.summary;
            document.getElementById('sign-name').textContent  = data.sign;

            const workTitle = document.getElementById('work-title');
            const workUrl = document.getElementById('work-url');
            if (workTitle && data.work_title) workTitle.textContent = data.work_title;
            if (workUrl && data.work_url) workUrl.href = data.work_url;

            /* 本文段落生成 */
            const body = document.getElementById('letter-body');
            data.body.forEach(paragraph => {
                const p = document.createElement('p');
                p.textContent = paragraph;
                body.appendChild(p);
            });

            /* フェードイン（Gemini版と同じ挙動） */
            setTimeout(() => {
                document.getElementById('container').style.opacity = '1';
            }, 100);
        })
        .catch(err => {
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/00_normal_multitheme_example/luxury.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Luxury | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-luxury.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="work-meta">
                <p class="work-label">REVIEWED WORK</p>
                <h2 class="work-title" id="work-title"></h2>
                <p class="work-link"><a id="work-url" href="#" target="_blank" rel="noopener noreferrer">作品ページを見る</a></p>
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/00_normal_multitheme_example/night.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Night Lounge | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-nightlounge.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/00_normal_multitheme_example/review.json

```
{
  "recipient": "作者　緑茶",
  "intro": "こんにちは、緑茶様。\n今回は商業目線も含め、率直かつ本音ベースでレビューをまとめました。\n作品の強みがさらに伸びることを願ってお届けします。",
  "tea_service": "アールグレイ",
  "read_count": "8話",
  "summary": "王道の熱量と読みやすさを感じつつ、設定ロジックを磨けばさらに大きく伸びる作品だと感じました・・・。",
  "body": [
    "レビュー：『剣と魔法の世界で、英雄譚ができるまで』を読んで",
    "【ネーミングと世界観の演出について】\n「国立剣魔学園」という名称は、王道で分かりやすい反面、ファンタジー作品が溢れる昨今では少し既視感があるかもしれません。\n例えば、国立剣魔学園（ステイツ・アークマギア）や（ナショナル・グラディウス）のように、中二病心をくすぐる独自の「ルビ」を振るだけで、作品のファンタジー濃度が一気に濃くなり、読者の目を引くフックになります。タイトルの『英雄譚』という言葉に負けない、特別感のある固有名詞を意識するとさらに良くなると思います。",
    "【リヒトの「強さ」に対するロジックの補強】\n8話まで読み進めて気になったのが、平民であるリヒトが「なぜこれほど強いのか」「なぜ貴族限定の学園に入れたのか」という説明が不足している点です。\nもしこれが意図的な伏線であれば良いのですが、理由もなく「ただ強い平民」として描かれ続けると、読者は物語のリアリティ（説得力）に疑問を抱いてしまいます。リヒトがその力を手に入れた背景や、新制度に選ばれた具体的な経緯を、早めに小出しにするか回想で補完することで、彼というキャラクターの魅力と説得力が一段と増すはずです。",
    "【ライバル・ジオラスの立ち位置と構成】\n本作におけるジオラスは、主人公ライにとっての巨大な壁であり、重要なライバルです。\nそれだけに、リヒトに敗北する前の「ジオラスが最強として君臨していた学園の空気」を、冒頭や回想でもう少し厚く描写しても良いかもしれません。彼がどれほど「孤高の天才」であったかを読者に刻み込むことで、それを崩したリヒトの異質さと、そこから再起するライのドラマがより熱く響くようになります。",
    "【総評】\n文章自体は非常にスムーズで読みやすく、ジャンプ漫画のような「男臭い青春と熱い鼓動」を感じる作品です。\nライト層には入りやすい一方で、ファンタジーを読み慣れた層は「設定の粗さ」を敏感に察知し、2話前後で離脱してしまうリスクもあります。競合が多いジャンルだからこそ、独自の設定やキャラの深掘り、そして読者を納得させる「ロジック」を磨くことで、他にはない個性が光る作品に化けるポテンシャルを感じました。",
    "※あくまで一読者としての主観ですので、制作のヒントになれば幸いです。応援しています。"
  ],
  "sign": "Lancer",
  "work_title": "剣と魔法の世界で、英雄譚ができるまで",
  "work_url": "https://kakuyomu.jp/works/822139843899183154"
}```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/00_normal_multitheme_example/spring.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Spring Tea | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-springtea.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/01_spring_case_example/iris-nightlounge.css

```
/* ============================================================
   iris-nightlounge.css — 深夜読書ラウンジ
   🌙 黒 × 琥珀 × ランプ光 × Reading Blend 接続版
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=IM+Fell+English:ital@0;1&display=swap');

:root {
    --ink:       #e8d8b8;   /* 羊皮紙文字色 */
    --ink-dark:  #c8a878;
    --paper:     #12100c;   /* 黒便箋 */
    --paper2:    #1a160e;
    --amber:     #c8841a;
    --amber2:    #e8a030;
    --amber3:    #f5c060;
    --amber-dim: rgba(200,132,26,0.18);
    --night-bg:  #07090f;
    --shadow:    rgba(0,0,0,0.8);
    --border:    rgba(200,132,26,0.3);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：ランプ光 × 深夜ラウンジ */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 50% 0%,    rgba(200,132,26,0.12) 0%, transparent 50%),
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/01_spring_case_example/iris-springtea.css

```
/* ============================================================
   iris-springtea.css — 春摘みダージリン
   🌸 桜色 × 新芽グリーン × 薄金 × 柔らかい余韻
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=Zen+Old+Mincho:wght@400;700&display=swap');

:root {
    --ink:      #3a2830;
    --paper:    #fff8f5;
    --gold:     #c8a86a;
    --sakura:   #e8a0b0;    /* 桜 */
    --sakura2:  #f5c8d0;
    --sprout:   #7aaa7a;    /* 新芽 */
    --sprout2:  #a0c890;
    --night-bg: #180f14;
    --shadow:   rgba(60,20,40,0.25);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：春の朝霧 */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 15% 0%,   rgba(232,160,176,0.15) 0%, transparent 45%),
        radial-gradient(ellipse at 85% 100%,  rgba(122,170,122,0.12) 0%, transparent 45%),
        radial-gradient(ellipse at 50% 50%,   rgba(200,168,106,0.05) 0%, transparent 60%),
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/01_spring_case_example/letter.js

```
/* ============================================================
   Letter from Iris — letter.js
   review.json を fetch して DOM に流し込む
   ============================================================ */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
    fetch('./review.json')
        .then(res => {
            if (!res.ok) throw new Error(`HTTP ${res.status}`);
            return res.json();
        })
        .then(data => {
            /* 基本情報 */
            document.getElementById('recipient').textContent  = data.recipient;
            document.getElementById('intro-text').innerText   = data.intro;
            document.getElementById('tea-name').textContent   = data.tea_service;
            document.getElementById('read-count').textContent = data.read_count;
            document.getElementById('review-summary').textContent = data.summary;
            document.getElementById('sign-name').textContent  = data.sign;

            const workInfo = document.getElementById('work-info');
            const workTitle = document.getElementById('work-title-text');
            const workUrl = document.getElementById('work-link');
            if (workTitle && data.work_title) workTitle.textContent = data.work_title;
            if (workUrl && data.work_url) {
                workUrl.href = data.work_url;
                workUrl.textContent = '作品ページを見る';
            }
            if (workInfo && (data.work_title || data.work_url)) {
                workInfo.hidden = false;
            }

            /* 本文段落生成 */
            const body = document.getElementById('letter-body');
            data.body.forEach(paragraph => {
                const p = document.createElement('p');
                p.textContent = paragraph;
                body.appendChild(p);
            });
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/01_spring_case_example/night.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Spring Tea | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-springtea.css">
</head>
<body>
    <div class="letter-overlay"></div>
    <main class="letter-container" id="container">
        <article class="letter-paper">
            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>
            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>
            <hr class="letter-divider">
            <section class="review-meta">
                <div id="work-info" class="work-info" hidden>
  <div class="work-info-label">作品情報</div>
  <div class="work-info-title" id="work-title-text"></div>
  <a id="work-link" class="work-info-link" href="#" target="_blank" rel="noopener noreferrer">作品ページを見る</a>
</div>

<div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>
            <section class="letter-body" id="letter-body"></section>
            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
                <div class="signature">
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/01_spring_case_example/review.json

```
{
  "recipient": "炎山ヒロト",
  "intro": "こ、こんにちは、炎山ヒロト様！私、メイド of アイリス・アールグレイが、LANCERに代わりまして『魔法少女戦士マジカルファイターズ』の感想をお伝えいたしますね。",
  "tea_service": "レモンを添えたニルギリ・クオリティーシーズン",
  "read_count": "5話",
  "summary": "男の子が女の子に変身して戦うという、ドキドキするような世界観に圧倒されました！",
  "body": [
    "拝読していてまず感じましたのが、『性転換ヒーロー』という設定の持つ、抗いがたいワクワク感です！特に2話や5話で、潜入捜査やミサキ様との交流のために『あえて女子の姿や水着』を選び、赤面しながらも任務を全うするレン様の描写には、思わずアイリスも胸が熱くなってしまいました。中身が元気な小学4年生の男の子だからこその葛藤が、この物語の何よりの魅力ですね。",
    "また、校長先生が用意した『フェニックスマシン』のスペックには驚かされました！時速8720キロ、さらに大気圏突破まで……！このスケールの大きさは、まるで往年の特撮ヒーローや勇者シリーズを見ているようで、ページをめくる手が止まりませんでした。",
    "ただ、Lancerが少し心配しておりましたのが、序盤から設定が非常にダイナミックに動くため、読み手によっては情報量に圧倒されてしまうかもしれない……という点です。もし、レン様たちの心の動きや、技を放った際の周囲の破壊描写などをより詳しく、じっくりと『魅せる』ように描かれましたら、炎山様の創り出した素晴らしい世界観が、さらに深く読者の心に突き刺さるのではないかと感じました。",
    "5人目の戦士、ホワイト様も合流し、ここから物語がどう加速していくのか……。その圧倒的な熱量に、アイリスも期待に胸を膨らませております！"
  ],
  "work_title": "魔法少女戦士マジカルファイターズ",
  "work_url": "https://ncode.syosetu.com/n0390gp/5/",
  "sign": "アイリス・アールグレイ"
}
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/ryokutya-review/iris-classic.css

```
/* ============================================================
   iris-classic.css — Gemini版 完全移植
   ☕ 春の夜 × アールグレイ × 素朴な高級感
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap');

:root {
    --ink:       #3a2d28;
    --paper:     #fffcf5;
    --gold:      #b39764;
    --accent:    #8ba58d;   /* 春の芽吹き */
    --night-bg:  #1a1614;
    --shadow:    rgba(0,0,0,0.2);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.8;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：春の夜 */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background: radial-gradient(circle at top right, #2c2520 0%, #1a1614 100%);
    z-index: -1;
}

.letter-container {
    max-width: 700px;
    width: 100%;
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/ryokutya-review/iris-luxury.css

```
/* ============================================================
   iris-luxury.css — 公爵家メイド / 高級便箋
   💚 深緑 × 金箔 × 封蝋 × 最上級のご褒美感
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=IM+Fell+English:ital@0;1&display=swap');

:root {
    --ink:       #1a2a1a;
    --paper:     #f4f0e6;
    --gold:      #c9a84c;
    --gold2:     #e8c97a;
    --accent:    #2d5a2d;   /* 深緑 */
    --accent2:   #4a8a4a;
    --wax:       #8b1a1a;   /* 封蝋 */
    --night-bg:  #0a120a;
    --shadow:    rgba(0,0,0,0.5);
    --border-op: 0.6;
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：深緑の夜 × 金粒子 */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 20% 10%, rgba(45,90,45,0.18) 0%, transparent 50%),
        radial-gradient(ellipse at 80% 90%, rgba(201,168,76,0.08) 0%, transparent 50%),
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/ryokutya-review/iris-nightlounge.css

```
/* ============================================================
   iris-nightlounge.css — 深夜読書ラウンジ
   🌙 黒 × 琥珀 × ランプ光 × Reading Blend 接続版
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=IM+Fell+English:ital@0;1&display=swap');

:root {
    --ink:       #e8d8b8;   /* 羊皮紙文字色 */
    --ink-dark:  #c8a878;
    --paper:     #12100c;   /* 黒便箋 */
    --paper2:    #1a160e;
    --amber:     #c8841a;
    --amber2:    #e8a030;
    --amber3:    #f5c060;
    --amber-dim: rgba(200,132,26,0.18);
    --night-bg:  #07090f;
    --shadow:    rgba(0,0,0,0.8);
    --border:    rgba(200,132,26,0.3);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：ランプ光 × 深夜ラウンジ */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 50% 0%,    rgba(200,132,26,0.12) 0%, transparent 50%),
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/ryokutya-review/iris-springtea.css

```
/* ============================================================
   iris-springtea.css — 春摘みダージリン
   🌸 桜色 × 新芽グリーン × 薄金 × 柔らかい余韻
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=Zen+Old+Mincho:wght@400;700&display=swap');

:root {
    --ink:      #3a2830;
    --paper:    #fff8f5;
    --gold:     #c8a86a;
    --sakura:   #e8a0b0;    /* 桜 */
    --sakura2:  #f5c8d0;
    --sprout:   #7aaa7a;    /* 新芽 */
    --sprout2:  #a0c890;
    --night-bg: #180f14;
    --shadow:   rgba(60,20,40,0.25);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：春の朝霧 */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 15% 0%,   rgba(232,160,176,0.15) 0%, transparent 45%),
        radial-gradient(ellipse at 85% 100%,  rgba(122,170,122,0.12) 0%, transparent 45%),
        radial-gradient(ellipse at 50% 50%,   rgba(200,168,106,0.05) 0%, transparent 60%),
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/ryokutya-review/letter-archive.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter Archive | Iris Sweet Review</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=IM+Fell+English:ital@0;1&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg:      #07090f;
            --amber:   #c8841a;
            --amber2:  #e8a030;
            --amber3:  #f5c060;
            --text:    #d4c5a9;
            --text2:   #7a6e5e;
            --border:  rgba(200,132,26,0.2);
        }

        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            background: var(--bg);
            color: var(--text);
            font-family: 'Noto Serif JP', serif;
            min-height: 100vh;
            padding: 48px 20px 80px;
        }

        /* グリッド背景 */
        body::before {
            content: '';
            position: fixed;
            inset: 0;
            background-image:
                linear-gradient(rgba(200,132,26,0.025) 1px, transparent 1px),
                linear-gradient(90deg, rgba(200,132,26,0.025) 1px, transparent 1px);
            background-size: 40px 40px;
            pointer-events: none;
            z-index: 0;
        }
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/ryokutya-review/letter.js

```
/* ============================================================
   Letter from Iris — letter.js
   review.json を fetch して DOM に流し込む
   ============================================================ */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
    fetch('./review.json')
        .then(res => {
            if (!res.ok) throw new Error(`HTTP ${res.status}`);
            return res.json();
        })
        .then(data => {
            /* 基本情報 */
            document.getElementById('recipient').textContent  = data.recipient;
            document.getElementById('intro-text').innerText   = data.intro;
            document.getElementById('tea-name').textContent   = data.tea_service;
            document.getElementById('read-count').textContent = data.read_count;
            document.getElementById('review-summary').textContent = data.summary;
            document.getElementById('sign-name').textContent  = data.sign;

            const workTitle = document.getElementById('work-title');
            const workUrl = document.getElementById('work-url');
            if (workTitle && data.work_title) workTitle.textContent = data.work_title;
            if (workUrl && data.work_url) workUrl.href = data.work_url;

            /* 本文段落生成 */
            const body = document.getElementById('letter-body');
            data.body.forEach(paragraph => {
                const p = document.createElement('p');
                p.textContent = paragraph;
                body.appendChild(p);
            });

            /* フェードイン（Gemini版と同じ挙動） */
            setTimeout(() => {
                document.getElementById('container').style.opacity = '1';
            }, 100);
        })
        .catch(err => {
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/ryokutya-review/luxury.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Luxury | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-luxury.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="work-meta">
                <p class="work-label">REVIEWED WORK</p>
                <h2 class="work-title" id="work-title"></h2>
                <p class="work-link"><a id="work-url" href="#" target="_blank" rel="noopener noreferrer">作品ページを見る</a></p>
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/ryokutya-review/night.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Night Lounge | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-nightlounge.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/ryokutya-review/review.json

```
{
  "recipient": "作者　緑茶",
  "intro": "こんにちは、緑茶様。\n今回は商業目線も含め、率直かつ本音ベースでレビューをまとめました。\n作品の強みがさらに伸びることを願ってお届けします。",
  "tea_service": "アールグレイ",
  "read_count": "8話",
  "summary": "王道の熱量と読みやすさを感じつつ、設定ロジックを磨けばさらに大きく伸びる作品だと感じました・・・。",
  "body": [
    "レビュー：『剣と魔法の世界で、英雄譚ができるまで』を読んで",
    "【ネーミングと世界観の演出について】\n「国立剣魔学園」という名称は、王道で分かりやすい反面、ファンタジー作品が溢れる昨今では少し既視感があるかもしれません。\n例えば、国立剣魔学園（ステイツ・アークマギア）や（ナショナル・グラディウス）のように、中二病心をくすぐる独自の「ルビ」を振るだけで、作品のファンタジー濃度が一気に濃くなり、読者の目を引くフックになります。タイトルの『英雄譚』という言葉に負けない、特別感のある固有名詞を意識するとさらに良くなると思います。",
    "【リヒトの「強さ」に対するロジックの補強】\n8話まで読み進めて気になったのが、平民であるリヒトが「なぜこれほど強いのか」「なぜ貴族限定の学園に入れたのか」という説明が不足している点です。\nもしこれが意図的な伏線であれば良いのですが、理由もなく「ただ強い平民」として描かれ続けると、読者は物語のリアリティ（説得力）に疑問を抱いてしまいます。リヒトがその力を手に入れた背景や、新制度に選ばれた具体的な経緯を、早めに小出しにするか回想で補完することで、彼というキャラクターの魅力と説得力が一段と増すはずです。",
    "【ライバル・ジオラスの立ち位置と構成】\n本作におけるジオラスは、主人公ライにとっての巨大な壁であり、重要なライバルです。\nそれだけに、リヒトに敗北する前の「ジオラスが最強として君臨していた学園の空気」を、冒頭や回想でもう少し厚く描写しても良いかもしれません。彼がどれほど「孤高の天才」であったかを読者に刻み込むことで、それを崩したリヒトの異質さと、そこから再起するライのドラマがより熱く響くようになります。",
    "【総評】\n文章自体は非常にスムーズで読みやすく、ジャンプ漫画のような「男臭い青春と熱い鼓動」を感じる作品です。\nライト層には入りやすい一方で、ファンタジーを読み慣れた層は「設定の粗さ」を敏感に察知し、2話前後で離脱してしまうリスクもあります。競合が多いジャンルだからこそ、独自の設定やキャラの深掘り、そして読者を納得させる「ロジック」を磨くことで、他にはない個性が光る作品に化けるポテンシャルを感じました。",
    "※あくまで一読者としての主観ですので、制作のヒントになれば幸いです。応援しています。"
  ],
  "sign": "Lancer",
  "work_title": "剣と魔法の世界で、英雄譚ができるまで",
  "work_url": "https://kakuyomu.jp/works/822139843899183154"
}```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/ryokutya-review/spring.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Spring Tea | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-springtea.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/炎山ヒロト/iris-nightlounge.css

```
/* ============================================================
   iris-nightlounge.css — 深夜読書ラウンジ
   🌙 黒 × 琥珀 × ランプ光 × Reading Blend 接続版
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=IM+Fell+English:ital@0;1&display=swap');

:root {
    --ink:       #e8d8b8;   /* 羊皮紙文字色 */
    --ink-dark:  #c8a878;
    --paper:     #12100c;   /* 黒便箋 */
    --paper2:    #1a160e;
    --amber:     #c8841a;
    --amber2:    #e8a030;
    --amber3:    #f5c060;
    --amber-dim: rgba(200,132,26,0.18);
    --night-bg:  #07090f;
    --shadow:    rgba(0,0,0,0.8);
    --border:    rgba(200,132,26,0.3);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：ランプ光 × 深夜ラウンジ */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 50% 0%,    rgba(200,132,26,0.12) 0%, transparent 50%),
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/炎山ヒロト/iris-springtea.css

```
/* ============================================================
   iris-springtea.css — 春摘みダージリン
   🌸 桜色 × 新芽グリーン × 薄金 × 柔らかい余韻
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=Zen+Old+Mincho:wght@400;700&display=swap');

:root {
    --ink:      #3a2830;
    --paper:    #fff8f5;
    --gold:     #c8a86a;
    --sakura:   #e8a0b0;    /* 桜 */
    --sakura2:  #f5c8d0;
    --sprout:   #7aaa7a;    /* 新芽 */
    --sprout2:  #a0c890;
    --night-bg: #180f14;
    --shadow:   rgba(60,20,40,0.25);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：春の朝霧 */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 15% 0%,   rgba(232,160,176,0.15) 0%, transparent 45%),
        radial-gradient(ellipse at 85% 100%,  rgba(122,170,122,0.12) 0%, transparent 45%),
        radial-gradient(ellipse at 50% 50%,   rgba(200,168,106,0.05) 0%, transparent 60%),
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/炎山ヒロト/letter.js

```
/* ============================================================
   Letter from Iris — letter.js
   review.json を fetch して DOM に流し込む
   ============================================================ */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
    fetch('./review.json')
        .then(res => {
            if (!res.ok) throw new Error(`HTTP ${res.status}`);
            return res.json();
        })
        .then(data => {
            /* 基本情報 */
            document.getElementById('recipient').textContent  = data.recipient;
            document.getElementById('intro-text').innerText   = data.intro;
            document.getElementById('tea-name').textContent   = data.tea_service;
            document.getElementById('read-count').textContent = data.read_count;
            document.getElementById('review-summary').textContent = data.summary;
            document.getElementById('sign-name').textContent  = data.sign;

            const workInfo = document.getElementById('work-info');
            const workTitle = document.getElementById('work-title-text');
            const workUrl = document.getElementById('work-link');
            if (workTitle && data.work_title) workTitle.textContent = data.work_title;
            if (workUrl && data.work_url) {
                workUrl.href = data.work_url;
                workUrl.textContent = '作品ページを見る';
            }
            if (workInfo && (data.work_title || data.work_url)) {
                workInfo.hidden = false;
            }

            /* 本文段落生成 */
            const body = document.getElementById('letter-body');
            data.body.forEach(paragraph => {
                const p = document.createElement('p');
                p.textContent = paragraph;
                body.appendChild(p);
            });
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/炎山ヒロト/night.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Spring Tea | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-springtea.css">
</head>
<body>
    <div class="letter-overlay"></div>
    <main class="letter-container" id="container">
        <article class="letter-paper">
            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>
            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>
            <hr class="letter-divider">
            <section class="review-meta">
                <div id="work-info" class="work-info" hidden>
  <div class="work-info-label">作品情報</div>
  <div class="work-info-title" id="work-title-text"></div>
  <a id="work-link" class="work-info-link" href="#" target="_blank" rel="noopener noreferrer">作品ページを見る</a>
</div>

<div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>
            <section class="letter-body" id="letter-body"></section>
            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
                <div class="signature">
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/01_target/作者別フォルダ/炎山ヒロト/review.json

```
{
  "recipient": "炎山ヒロト",
  "intro": "こ、こんにちは、炎山ヒロト様！私、メイド of アイリス・アールグレイが、LANCERに代わりまして『魔法少女戦士マジカルファイターズ』の感想をお伝えいたしますね。",
  "tea_service": "レモンを添えたニルギリ・クオリティーシーズン",
  "read_count": "5話",
  "summary": "男の子が女の子に変身して戦うという、ドキドキするような世界観に圧倒されました！",
  "body": [
    "拝読していてまず感じましたのが、『性転換ヒーロー』という設定の持つ、抗いがたいワクワク感です！特に2話や5話で、潜入捜査やミサキ様との交流のために『あえて女子の姿や水着』を選び、赤面しながらも任務を全うするレン様の描写には、思わずアイリスも胸が熱くなってしまいました。中身が元気な小学4年生の男の子だからこその葛藤が、この物語の何よりの魅力ですね。",
    "また、校長先生が用意した『フェニックスマシン』のスペックには驚かされました！時速8720キロ、さらに大気圏突破まで……！このスケールの大きさは、まるで往年の特撮ヒーローや勇者シリーズを見ているようで、ページをめくる手が止まりませんでした。",
    "ただ、Lancerが少し心配しておりましたのが、序盤から設定が非常にダイナミックに動くため、読み手によっては情報量に圧倒されてしまうかもしれない……という点です。もし、レン様たちの心の動きや、技を放った際の周囲の破壊描写などをより詳しく、じっくりと『魅せる』ように描かれましたら、炎山様の創り出した素晴らしい世界観が、さらに深く読者の心に突き刺さるのではないかと感じました。",
    "5人目の戦士、ホワイト様も合流し、ここから物語がどう加速していくのか……。その圧倒的な熱量に、アイリスも期待に胸を膨らませております！"
  ],
  "work_title": "魔法少女戦士マジカルファイターズ",
  "work_url": "https://ncode.syosetu.com/n0390gp/5/",
  "sign": "アイリス・アールグレイ"
}
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/10_batch1_spec_templates/claude_request.md

```
# Claude依頼書｜読者レビュー半自動化 v0.1

## 目的
小説レビューレポート運用を半自動化する。

## 参照資料
- 00_spec/ワークフローv2.md
- 01_target/review-ledger.html
- 01_target/作者別フォルダ/
- 01_target/ 配下の html / css / js / json
- 02_reference/ 配下の過去試作群

## やってほしいこと
以下を行う v0.1 ツールを作成すること。

### 入力
- 作者名
- 作品タイトル
- 作品分類
- テーマ
- 感想種別
- 読了話数
- 作品URL
- X返信状況
- 許諾状況
- md本文

### 出力
- 作者別フォルダの生成
- テーマ別テンプレ複製
- review.json 生成
- review-ledger.html に追加する <tr> の生成
- ローカル確認URLの出力

## 制約
- 本番ディレクトリを直接上書きしないこと
- 既存のテーマ専用 letter.js を丸ごと差し替えないこと
- HTML内部DOMの自動修正までは行わないこと
- Git add / commit / push は自動実行しないこと
- まずは半自動化に限定すること
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/10_batch1_spec_templates/letter-archive.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>IRIS SWEET LETTER ARCHIVE | MERITOCRACIA</title>
  <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
  <style>
    :root{
      --bg:#0d0d0f;
      --card:#17171b;
      --border:#3a3025;
      --gold:#c9a84c;
      --text:#ece7dd;
      --muted:#b8aa92;
    }

    *{box-sizing:border-box;}

    body{
      margin:0;
      background:
        radial-gradient(circle at top, rgba(201,168,76,0.06), transparent 40%),
        var(--bg);
      color:var(--text);
      font-family:'Noto Serif JP', serif;
      padding:48px 24px;
    }

    .wrap{
      max-width:960px;
      margin:0 auto;
    }

    h1{
      font-family:'Cinzel', serif;
      font-size:2rem;
      margin-bottom:12px;
      color:var(--gold);
      letter-spacing:0.08em;
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/10_batch1_spec_templates/luxury.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Luxury | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-luxury.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/10_batch1_spec_templates/night.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Night Lounge | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-nightlounge.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/10_batch1_spec_templates/review-ledger.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>小説レビューレポート台帳</title>
<style>
body{
  margin:0;
  background:#0f1115;
  color:#eee;
  font-family:system-ui, sans-serif;
  padding:32px;
}
h1{
  margin-bottom:20px;
}
table{
  width:100%;
  border-collapse:collapse;
  background:#171a21;
}
th,td{
  border:1px solid #333;
  padding:12px;
  text-align:left;
  font-size:14px;
}
th{
  background:#1f2430;
}
tr:hover{
  background:#202633;
}
.status-done{color:#8fd18f;}
.status-wait{color:#d6b86b;}
.status-hold{color:#c77;}
</style>
</head>
<body>
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/10_batch1_spec_templates/spring.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Spring Tea | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-springtea.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/10_batch1_spec_templates/ワークフローv2.md

```
# 📘 議事録｜レビュー投稿ワークフロー v2 正式化

## 作成日
2026-04-19

## 議題
小説レビューレポート運用における、
レビュー公開ページ作成・台帳登録・GitHub反映までのワークフローを再整理し、
テーマ差分・JSON差分・台帳列ズレ事故に耐える形へ更新する。

---

## 1｜背景

従来のレビュー投稿ワークフロー v1 は、以下の前提で運用されていた。

- Night テーマ前提
- `night.html` + `letter.js` + `iris-nightlounge.css` 前提
- `review.json` のキー構造が最小限
- 台帳 `review-ledger.html` の列構造が簡略化されていた

しかし実運用において、Spring テーマ利用時に以下の問題が発生した。

### 発生した問題
- テーマごとに CSS 名が異なる
- HTML 側の ID と JS 側の参照先が一致しない場合がある
- `work_title` / `work_url` が手順書に定義されていなかった
- `review-ledger.html` の列不足により、行ズレが発生した
- テーマ専用JSを丸ごと差し替えると本文描画ごと壊れる可能性がある

---

## 2｜今回の結論

レビュー投稿ワークフローは、**v2 を正式採用**する。

### 採用理由
1. テーマ差分を前提とした運用に変更できる
2. `work_title` / `work_url` を標準項目として扱える
3. 台帳列数を固定し、行ズレ事故を防げる
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/11_batch2_examples/作者別フォルダ/ryokutya-review/iris-classic.css

```
/* ============================================================
   iris-classic.css — Gemini版 完全移植
   ☕ 春の夜 × アールグレイ × 素朴な高級感
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap');

:root {
    --ink:       #3a2d28;
    --paper:     #fffcf5;
    --gold:      #b39764;
    --accent:    #8ba58d;   /* 春の芽吹き */
    --night-bg:  #1a1614;
    --shadow:    rgba(0,0,0,0.2);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.8;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：春の夜 */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background: radial-gradient(circle at top right, #2c2520 0%, #1a1614 100%);
    z-index: -1;
}

.letter-container {
    max-width: 700px;
    width: 100%;
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/11_batch2_examples/作者別フォルダ/ryokutya-review/iris-luxury.css

```
/* ============================================================
   iris-luxury.css — 公爵家メイド / 高級便箋
   💚 深緑 × 金箔 × 封蝋 × 最上級のご褒美感
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=IM+Fell+English:ital@0;1&display=swap');

:root {
    --ink:       #1a2a1a;
    --paper:     #f4f0e6;
    --gold:      #c9a84c;
    --gold2:     #e8c97a;
    --accent:    #2d5a2d;   /* 深緑 */
    --accent2:   #4a8a4a;
    --wax:       #8b1a1a;   /* 封蝋 */
    --night-bg:  #0a120a;
    --shadow:    rgba(0,0,0,0.5);
    --border-op: 0.6;
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：深緑の夜 × 金粒子 */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 20% 10%, rgba(45,90,45,0.18) 0%, transparent 50%),
        radial-gradient(ellipse at 80% 90%, rgba(201,168,76,0.08) 0%, transparent 50%),
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/11_batch2_examples/作者別フォルダ/ryokutya-review/iris-nightlounge.css

```
/* ============================================================
   iris-nightlounge.css — 深夜読書ラウンジ
   🌙 黒 × 琥珀 × ランプ光 × Reading Blend 接続版
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=IM+Fell+English:ital@0;1&display=swap');

:root {
    --ink:       #e8d8b8;   /* 羊皮紙文字色 */
    --ink-dark:  #c8a878;
    --paper:     #12100c;   /* 黒便箋 */
    --paper2:    #1a160e;
    --amber:     #c8841a;
    --amber2:    #e8a030;
    --amber3:    #f5c060;
    --amber-dim: rgba(200,132,26,0.18);
    --night-bg:  #07090f;
    --shadow:    rgba(0,0,0,0.8);
    --border:    rgba(200,132,26,0.3);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：ランプ光 × 深夜ラウンジ */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 50% 0%,    rgba(200,132,26,0.12) 0%, transparent 50%),
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/11_batch2_examples/作者別フォルダ/ryokutya-review/iris-springtea.css

```
/* ============================================================
   iris-springtea.css — 春摘みダージリン
   🌸 桜色 × 新芽グリーン × 薄金 × 柔らかい余韻
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=Zen+Old+Mincho:wght@400;700&display=swap');

:root {
    --ink:      #3a2830;
    --paper:    #fff8f5;
    --gold:     #c8a86a;
    --sakura:   #e8a0b0;    /* 桜 */
    --sakura2:  #f5c8d0;
    --sprout:   #7aaa7a;    /* 新芽 */
    --sprout2:  #a0c890;
    --night-bg: #180f14;
    --shadow:   rgba(60,20,40,0.25);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：春の朝霧 */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 15% 0%,   rgba(232,160,176,0.15) 0%, transparent 45%),
        radial-gradient(ellipse at 85% 100%,  rgba(122,170,122,0.12) 0%, transparent 45%),
        radial-gradient(ellipse at 50% 50%,   rgba(200,168,106,0.05) 0%, transparent 60%),
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/11_batch2_examples/作者別フォルダ/ryokutya-review/letter-archive.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter Archive | Iris Sweet Review</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=IM+Fell+English:ital@0;1&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg:      #07090f;
            --amber:   #c8841a;
            --amber2:  #e8a030;
            --amber3:  #f5c060;
            --text:    #d4c5a9;
            --text2:   #7a6e5e;
            --border:  rgba(200,132,26,0.2);
        }

        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            background: var(--bg);
            color: var(--text);
            font-family: 'Noto Serif JP', serif;
            min-height: 100vh;
            padding: 48px 20px 80px;
        }

        /* グリッド背景 */
        body::before {
            content: '';
            position: fixed;
            inset: 0;
            background-image:
                linear-gradient(rgba(200,132,26,0.025) 1px, transparent 1px),
                linear-gradient(90deg, rgba(200,132,26,0.025) 1px, transparent 1px);
            background-size: 40px 40px;
            pointer-events: none;
            z-index: 0;
        }
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/11_batch2_examples/作者別フォルダ/ryokutya-review/letter.js

```
/* ============================================================
   Letter from Iris — letter.js
   review.json を fetch して DOM に流し込む
   ============================================================ */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
    fetch('./review.json')
        .then(res => {
            if (!res.ok) throw new Error(`HTTP ${res.status}`);
            return res.json();
        })
        .then(data => {
            /* 基本情報 */
            document.getElementById('recipient').textContent  = data.recipient;
            document.getElementById('intro-text').innerText   = data.intro;
            document.getElementById('tea-name').textContent   = data.tea_service;
            document.getElementById('read-count').textContent = data.read_count;
            document.getElementById('review-summary').textContent = data.summary;
            document.getElementById('sign-name').textContent  = data.sign;

            const workTitle = document.getElementById('work-title');
            const workUrl = document.getElementById('work-url');
            if (workTitle && data.work_title) workTitle.textContent = data.work_title;
            if (workUrl && data.work_url) workUrl.href = data.work_url;

            /* 本文段落生成 */
            const body = document.getElementById('letter-body');
            data.body.forEach(paragraph => {
                const p = document.createElement('p');
                p.textContent = paragraph;
                body.appendChild(p);
            });

            /* フェードイン（Gemini版と同じ挙動） */
            setTimeout(() => {
                document.getElementById('container').style.opacity = '1';
            }, 100);
        })
        .catch(err => {
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/11_batch2_examples/作者別フォルダ/ryokutya-review/luxury.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Luxury | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-luxury.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="work-meta">
                <p class="work-label">REVIEWED WORK</p>
                <h2 class="work-title" id="work-title"></h2>
                <p class="work-link"><a id="work-url" href="#" target="_blank" rel="noopener noreferrer">作品ページを見る</a></p>
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/11_batch2_examples/作者別フォルダ/ryokutya-review/night.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Night Lounge | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-nightlounge.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/11_batch2_examples/作者別フォルダ/ryokutya-review/review.json

```
{
  "recipient": "作者　緑茶",
  "intro": "こんにちは、緑茶様。\n今回は商業目線も含め、率直かつ本音ベースでレビューをまとめました。\n作品の強みがさらに伸びることを願ってお届けします。",
  "tea_service": "アールグレイ",
  "read_count": "8話",
  "summary": "王道の熱量と読みやすさを感じつつ、設定ロジックを磨けばさらに大きく伸びる作品だと感じました・・・。",
  "body": [
    "レビュー：『剣と魔法の世界で、英雄譚ができるまで』を読んで",
    "【ネーミングと世界観の演出について】\n「国立剣魔学園」という名称は、王道で分かりやすい反面、ファンタジー作品が溢れる昨今では少し既視感があるかもしれません。\n例えば、国立剣魔学園（ステイツ・アークマギア）や（ナショナル・グラディウス）のように、中二病心をくすぐる独自の「ルビ」を振るだけで、作品のファンタジー濃度が一気に濃くなり、読者の目を引くフックになります。タイトルの『英雄譚』という言葉に負けない、特別感のある固有名詞を意識するとさらに良くなると思います。",
    "【リヒトの「強さ」に対するロジックの補強】\n8話まで読み進めて気になったのが、平民であるリヒトが「なぜこれほど強いのか」「なぜ貴族限定の学園に入れたのか」という説明が不足している点です。\nもしこれが意図的な伏線であれば良いのですが、理由もなく「ただ強い平民」として描かれ続けると、読者は物語のリアリティ（説得力）に疑問を抱いてしまいます。リヒトがその力を手に入れた背景や、新制度に選ばれた具体的な経緯を、早めに小出しにするか回想で補完することで、彼というキャラクターの魅力と説得力が一段と増すはずです。",
    "【ライバル・ジオラスの立ち位置と構成】\n本作におけるジオラスは、主人公ライにとっての巨大な壁であり、重要なライバルです。\nそれだけに、リヒトに敗北する前の「ジオラスが最強として君臨していた学園の空気」を、冒頭や回想でもう少し厚く描写しても良いかもしれません。彼がどれほど「孤高の天才」であったかを読者に刻み込むことで、それを崩したリヒトの異質さと、そこから再起するライのドラマがより熱く響くようになります。",
    "【総評】\n文章自体は非常にスムーズで読みやすく、ジャンプ漫画のような「男臭い青春と熱い鼓動」を感じる作品です。\nライト層には入りやすい一方で、ファンタジーを読み慣れた層は「設定の粗さ」を敏感に察知し、2話前後で離脱してしまうリスクもあります。競合が多いジャンルだからこそ、独自の設定やキャラの深掘り、そして読者を納得させる「ロジック」を磨くことで、他にはない個性が光る作品に化けるポテンシャルを感じました。",
    "※あくまで一読者としての主観ですので、制作のヒントになれば幸いです。応援しています。"
  ],
  "sign": "Lancer",
  "work_title": "剣と魔法の世界で、英雄譚ができるまで",
  "work_url": "https://kakuyomu.jp/works/822139843899183154"
}```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/11_batch2_examples/作者別フォルダ/ryokutya-review/spring.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Spring Tea | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-springtea.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/11_batch2_examples/作者別フォルダ/炎山ヒロト/iris-nightlounge.css

```
/* ============================================================
   iris-nightlounge.css — 深夜読書ラウンジ
   🌙 黒 × 琥珀 × ランプ光 × Reading Blend 接続版
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=IM+Fell+English:ital@0;1&display=swap');

:root {
    --ink:       #e8d8b8;   /* 羊皮紙文字色 */
    --ink-dark:  #c8a878;
    --paper:     #12100c;   /* 黒便箋 */
    --paper2:    #1a160e;
    --amber:     #c8841a;
    --amber2:    #e8a030;
    --amber3:    #f5c060;
    --amber-dim: rgba(200,132,26,0.18);
    --night-bg:  #07090f;
    --shadow:    rgba(0,0,0,0.8);
    --border:    rgba(200,132,26,0.3);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：ランプ光 × 深夜ラウンジ */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 50% 0%,    rgba(200,132,26,0.12) 0%, transparent 50%),
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/11_batch2_examples/作者別フォルダ/炎山ヒロト/iris-springtea.css

```
/* ============================================================
   iris-springtea.css — 春摘みダージリン
   🌸 桜色 × 新芽グリーン × 薄金 × 柔らかい余韻
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=Zen+Old+Mincho:wght@400;700&display=swap');

:root {
    --ink:      #3a2830;
    --paper:    #fff8f5;
    --gold:     #c8a86a;
    --sakura:   #e8a0b0;    /* 桜 */
    --sakura2:  #f5c8d0;
    --sprout:   #7aaa7a;    /* 新芽 */
    --sprout2:  #a0c890;
    --night-bg: #180f14;
    --shadow:   rgba(60,20,40,0.25);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：春の朝霧 */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 15% 0%,   rgba(232,160,176,0.15) 0%, transparent 45%),
        radial-gradient(ellipse at 85% 100%,  rgba(122,170,122,0.12) 0%, transparent 45%),
        radial-gradient(ellipse at 50% 50%,   rgba(200,168,106,0.05) 0%, transparent 60%),
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/11_batch2_examples/作者別フォルダ/炎山ヒロト/letter.js

```
/* ============================================================
   Letter from Iris — letter.js
   review.json を fetch して DOM に流し込む
   ============================================================ */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
    fetch('./review.json')
        .then(res => {
            if (!res.ok) throw new Error(`HTTP ${res.status}`);
            return res.json();
        })
        .then(data => {
            /* 基本情報 */
            document.getElementById('recipient').textContent  = data.recipient;
            document.getElementById('intro-text').innerText   = data.intro;
            document.getElementById('tea-name').textContent   = data.tea_service;
            document.getElementById('read-count').textContent = data.read_count;
            document.getElementById('review-summary').textContent = data.summary;
            document.getElementById('sign-name').textContent  = data.sign;

            const workInfo = document.getElementById('work-info');
            const workTitle = document.getElementById('work-title-text');
            const workUrl = document.getElementById('work-link');
            if (workTitle && data.work_title) workTitle.textContent = data.work_title;
            if (workUrl && data.work_url) {
                workUrl.href = data.work_url;
                workUrl.textContent = '作品ページを見る';
            }
            if (workInfo && (data.work_title || data.work_url)) {
                workInfo.hidden = false;
            }

            /* 本文段落生成 */
            const body = document.getElementById('letter-body');
            data.body.forEach(paragraph => {
                const p = document.createElement('p');
                p.textContent = paragraph;
                body.appendChild(p);
            });
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/11_batch2_examples/作者別フォルダ/炎山ヒロト/night.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Spring Tea | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-springtea.css">
</head>
<body>
    <div class="letter-overlay"></div>
    <main class="letter-container" id="container">
        <article class="letter-paper">
            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>
            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>
            <hr class="letter-divider">
            <section class="review-meta">
                <div id="work-info" class="work-info" hidden>
  <div class="work-info-label">作品情報</div>
  <div class="work-info-title" id="work-title-text"></div>
  <a id="work-link" class="work-info-link" href="#" target="_blank" rel="noopener noreferrer">作品ページを見る</a>
</div>

<div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>
            <section class="letter-body" id="letter-body"></section>
            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
                <div class="signature">
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/11_batch2_examples/作者別フォルダ/炎山ヒロト/review.json

```
{
  "recipient": "炎山ヒロト",
  "intro": "こ、こんにちは、炎山ヒロト様！私、メイド of アイリス・アールグレイが、LANCERに代わりまして『魔法少女戦士マジカルファイターズ』の感想をお伝えいたしますね。",
  "tea_service": "レモンを添えたニルギリ・クオリティーシーズン",
  "read_count": "5話",
  "summary": "男の子が女の子に変身して戦うという、ドキドキするような世界観に圧倒されました！",
  "body": [
    "拝読していてまず感じましたのが、『性転換ヒーロー』という設定の持つ、抗いがたいワクワク感です！特に2話や5話で、潜入捜査やミサキ様との交流のために『あえて女子の姿や水着』を選び、赤面しながらも任務を全うするレン様の描写には、思わずアイリスも胸が熱くなってしまいました。中身が元気な小学4年生の男の子だからこその葛藤が、この物語の何よりの魅力ですね。",
    "また、校長先生が用意した『フェニックスマシン』のスペックには驚かされました！時速8720キロ、さらに大気圏突破まで……！このスケールの大きさは、まるで往年の特撮ヒーローや勇者シリーズを見ているようで、ページをめくる手が止まりませんでした。",
    "ただ、Lancerが少し心配しておりましたのが、序盤から設定が非常にダイナミックに動くため、読み手によっては情報量に圧倒されてしまうかもしれない……という点です。もし、レン様たちの心の動きや、技を放った際の周囲の破壊描写などをより詳しく、じっくりと『魅せる』ように描かれましたら、炎山様の創り出した素晴らしい世界観が、さらに深く読者の心に突き刺さるのではないかと感じました。",
    "5人目の戦士、ホワイト様も合流し、ここから物語がどう加速していくのか……。その圧倒的な熱量に、アイリスも期待に胸を膨らませております！"
  ],
  "work_title": "魔法少女戦士マジカルファイターズ",
  "work_url": "https://ncode.syosetu.com/n0390gp/5/",
  "sign": "アイリス・アールグレイ"
}
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/12_batch2_lite_examples/ryokutya-review/letter.js

```
/* ============================================================
   Letter from Iris — letter.js
   review.json を fetch して DOM に流し込む
   ============================================================ */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
    fetch('./review.json')
        .then(res => {
            if (!res.ok) throw new Error(`HTTP ${res.status}`);
            return res.json();
        })
        .then(data => {
            /* 基本情報 */
            document.getElementById('recipient').textContent  = data.recipient;
            document.getElementById('intro-text').innerText   = data.intro;
            document.getElementById('tea-name').textContent   = data.tea_service;
            document.getElementById('read-count').textContent = data.read_count;
            document.getElementById('review-summary').textContent = data.summary;
            document.getElementById('sign-name').textContent  = data.sign;

            const workTitle = document.getElementById('work-title');
            const workUrl = document.getElementById('work-url');
            if (workTitle && data.work_title) workTitle.textContent = data.work_title;
            if (workUrl && data.work_url) workUrl.href = data.work_url;

            /* 本文段落生成 */
            const body = document.getElementById('letter-body');
            data.body.forEach(paragraph => {
                const p = document.createElement('p');
                p.textContent = paragraph;
                body.appendChild(p);
            });

            /* フェードイン（Gemini版と同じ挙動） */
            setTimeout(() => {
                document.getElementById('container').style.opacity = '1';
            }, 100);
        })
        .catch(err => {
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/12_batch2_lite_examples/ryokutya-review/night.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Night Lounge | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-nightlounge.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/12_batch2_lite_examples/ryokutya-review/review.json

```
{
  "recipient": "作者　緑茶",
  "intro": "こんにちは、緑茶様。\n今回は商業目線も含め、率直かつ本音ベースでレビューをまとめました。\n作品の強みがさらに伸びることを願ってお届けします。",
  "tea_service": "アールグレイ",
  "read_count": "8話",
  "summary": "王道の熱量と読みやすさを感じつつ、設定ロジックを磨けばさらに大きく伸びる作品だと感じました・・・。",
  "body": [
    "レビュー：『剣と魔法の世界で、英雄譚ができるまで』を読んで",
    "【ネーミングと世界観の演出について】\n「国立剣魔学園」という名称は、王道で分かりやすい反面、ファンタジー作品が溢れる昨今では少し既視感があるかもしれません。\n例えば、国立剣魔学園（ステイツ・アークマギア）や（ナショナル・グラディウス）のように、中二病心をくすぐる独自の「ルビ」を振るだけで、作品のファンタジー濃度が一気に濃くなり、読者の目を引くフックになります。タイトルの『英雄譚』という言葉に負けない、特別感のある固有名詞を意識するとさらに良くなると思います。",
    "【リヒトの「強さ」に対するロジックの補強】\n8話まで読み進めて気になったのが、平民であるリヒトが「なぜこれほど強いのか」「なぜ貴族限定の学園に入れたのか」という説明が不足している点です。\nもしこれが意図的な伏線であれば良いのですが、理由もなく「ただ強い平民」として描かれ続けると、読者は物語のリアリティ（説得力）に疑問を抱いてしまいます。リヒトがその力を手に入れた背景や、新制度に選ばれた具体的な経緯を、早めに小出しにするか回想で補完することで、彼というキャラクターの魅力と説得力が一段と増すはずです。",
    "【ライバル・ジオラスの立ち位置と構成】\n本作におけるジオラスは、主人公ライにとっての巨大な壁であり、重要なライバルです。\nそれだけに、リヒトに敗北する前の「ジオラスが最強として君臨していた学園の空気」を、冒頭や回想でもう少し厚く描写しても良いかもしれません。彼がどれほど「孤高の天才」であったかを読者に刻み込むことで、それを崩したリヒトの異質さと、そこから再起するライのドラマがより熱く響くようになります。",
    "【総評】\n文章自体は非常にスムーズで読みやすく、ジャンプ漫画のような「男臭い青春と熱い鼓動」を感じる作品です。\nライト層には入りやすい一方で、ファンタジーを読み慣れた層は「設定の粗さ」を敏感に察知し、2話前後で離脱してしまうリスクもあります。競合が多いジャンルだからこそ、独自の設定やキャラの深掘り、そして読者を納得させる「ロジック」を磨くことで、他にはない個性が光る作品に化けるポテンシャルを感じました。",
    "※あくまで一読者としての主観ですので、制作のヒントになれば幸いです。応援しています。"
  ],
  "sign": "Lancer",
  "work_title": "剣と魔法の世界で、英雄譚ができるまで",
  "work_url": "https://kakuyomu.jp/works/822139843899183154"
}```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/12_batch2_lite_examples/クロード修正案.md

```
1. 修正対象一覧
ファイル修正意図優先度generate_review.pySCRIPT_DIR 基準の templates/ 解決が壊れるケースへの対処高generate_review.pywork-info ブロック欠落の警告追加高generate_review.pyローカル確認URLのパス計算が壊れるケースへの対処中README.mdtemplates/ 配置手順とテンプレ差分事故の警告強化高KNOWN_LIMITS.mdSpring/Night差分事故の具体的な症状と確認コマンド追加高

2. コード修正案
修正1：templates/ パス解決の明示化
現行コードは SCRIPT_DIR / "templates" を使っているが、スクリプトをコピーして別の場所から実行した場合にテンプレートが見つからなくなる。起動時に一度チェックして早期に止める。
python# 変更前（定数定義のみで、存在チェックなし）
TEMPLATE_DIR = SCRIPT_DIR / "templates"

# 変更後（main() の冒頭に追加）
def main() -> None:
    # テンプレートディレクトリの存在確認（早期エラー）
    if not TEMPLATE_DIR.exists():
        print(f"\n  ❌ templates/ が見つかりません: {TEMPLATE_DIR}")
        print("     generate_review.py と同じディレクトリに")
        print("     templates/ フォルダを作成してください。")
        print("     詳細は README.md を参照してください。")
        sys.exit(1)

    inputs = collect_inputs()
    ...
変更理由：対話を始める前に止まるほうが親切。templates/を別の場所に置いて実行したときの事故を防ぐ。

修正2：work-info ブロック欠落の警告（copy_templates の直後）
炎山ヒロト事案の再発防止。コピー後にHTMLを読んで id="work-info" の存在を確認する。
python# copy_templates() 関数の末尾に追加（return copied の直前）

    # work-info ブロックの有無チェック
    html_file = THEME_MAP[theme]["html"]
    html_dest = dest_dir / html_file
    if html_dest.exists():
        content = html_dest.read_text(encoding="utf-8")
        if 'id="work-info"' not in content:
            print()
            print("  ⚠️  警告: このテンプレートに id=\"work-info\" ブロックが見つかりません。")
            print("     work_title / work_url が表示されない可能性があります。")
            print("     確認: templates/ の HTML に以下のブロックが存在するか見てください。")
            print('     <div id="work-info" class="work-info" hidden>')
            print("     存在しない場合はテンプレートを手動で更新してから再実行を推奨します。")
            print()
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/12_batch2_lite_examples/炎山ヒロト/letter.js

```
/* ============================================================
   Letter from Iris — letter.js
   review.json を fetch して DOM に流し込む
   ============================================================ */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
    fetch('./review.json')
        .then(res => {
            if (!res.ok) throw new Error(`HTTP ${res.status}`);
            return res.json();
        })
        .then(data => {
            /* 基本情報 */
            document.getElementById('recipient').textContent  = data.recipient;
            document.getElementById('intro-text').innerText   = data.intro;
            document.getElementById('tea-name').textContent   = data.tea_service;
            document.getElementById('read-count').textContent = data.read_count;
            document.getElementById('review-summary').textContent = data.summary;
            document.getElementById('sign-name').textContent  = data.sign;

            const workInfo = document.getElementById('work-info');
            const workTitle = document.getElementById('work-title-text');
            const workUrl = document.getElementById('work-link');
            if (workTitle && data.work_title) workTitle.textContent = data.work_title;
            if (workUrl && data.work_url) {
                workUrl.href = data.work_url;
                workUrl.textContent = '作品ページを見る';
            }
            if (workInfo && (data.work_title || data.work_url)) {
                workInfo.hidden = false;
            }

            /* 本文段落生成 */
            const body = document.getElementById('letter-body');
            data.body.forEach(paragraph => {
                const p = document.createElement('p');
                p.textContent = paragraph;
                body.appendChild(p);
            });
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/12_batch2_lite_examples/炎山ヒロト/night.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Spring Tea | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-springtea.css">
</head>
<body>
    <div class="letter-overlay"></div>
    <main class="letter-container" id="container">
        <article class="letter-paper">
            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>
            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>
            <hr class="letter-divider">
            <section class="review-meta">
                <div id="work-info" class="work-info" hidden>
  <div class="work-info-label">作品情報</div>
  <div class="work-info-title" id="work-title-text"></div>
  <a id="work-link" class="work-info-link" href="#" target="_blank" rel="noopener noreferrer">作品ページを見る</a>
</div>

<div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>
            <section class="letter-body" id="letter-body"></section>
            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
                <div class="signature">
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/12_batch2_lite_examples/炎山ヒロト/review.json

```
{
  "recipient": "炎山ヒロト",
  "intro": "こ、こんにちは、炎山ヒロト様！私、メイド of アイリス・アールグレイが、LANCERに代わりまして『魔法少女戦士マジカルファイターズ』の感想をお伝えいたしますね。",
  "tea_service": "レモンを添えたニルギリ・クオリティーシーズン",
  "read_count": "5話",
  "summary": "男の子が女の子に変身して戦うという、ドキドキするような世界観に圧倒されました！",
  "body": [
    "拝読していてまず感じましたのが、『性転換ヒーロー』という設定の持つ、抗いがたいワクワク感です！特に2話や5話で、潜入捜査やミサキ様との交流のために『あえて女子の姿や水着』を選び、赤面しながらも任務を全うするレン様の描写には、思わずアイリスも胸が熱くなってしまいました。中身が元気な小学4年生の男の子だからこその葛藤が、この物語の何よりの魅力ですね。",
    "また、校長先生が用意した『フェニックスマシン』のスペックには驚かされました！時速8720キロ、さらに大気圏突破まで……！このスケールの大きさは、まるで往年の特撮ヒーローや勇者シリーズを見ているようで、ページをめくる手が止まりませんでした。",
    "ただ、Lancerが少し心配しておりましたのが、序盤から設定が非常にダイナミックに動くため、読み手によっては情報量に圧倒されてしまうかもしれない……という点です。もし、レン様たちの心の動きや、技を放った際の周囲の破壊描写などをより詳しく、じっくりと『魅せる』ように描かれましたら、炎山様の創り出した素晴らしい世界観が、さらに深く読者の心に突き刺さるのではないかと感じました。",
    "5人目の戦士、ホワイト様も合流し、ここから物語がどう加速していくのか……。その圧倒的な熱量に、アイリスも期待に胸を膨らませております！"
  ],
  "work_title": "魔法少女戦士マジカルファイターズ",
  "work_url": "https://ncode.syosetu.com/n0390gp/5/",
  "sign": "アイリス・アールグレイ"
}
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/99_request/claude_request.md

```
# Claude依頼書｜読者レビュー半自動化 v0.1

## 目的
小説レビューレポート運用を半自動化する。

## 参照資料
- 00_spec/ワークフローv2.md
- 01_target/review-ledger.html
- 01_target/作者別フォルダ/
- 01_target/ 配下の html / css / js / json
- 02_reference/ 配下の過去試作群

## やってほしいこと
以下を行う v0.1 ツールを作成すること。

### 入力
- 作者名
- 作品タイトル
- 作品分類
- テーマ
- 感想種別
- 読了話数
- 作品URL
- X返信状況
- 許諾状況
- md本文

### 出力
- 作者別フォルダの生成
- テーマ別テンプレ複製
- review.json 生成
- review-ledger.html に追加する <tr> の生成
- ローカル確認URLの出力

## 制約
- 本番ディレクトリを直接上書きしないこと
- 既存のテーマ専用 letter.js を丸ごと差し替えないこと
- HTML内部DOMの自動修正までは行わないこと
- Git add / commit / push は自動実行しないこと
- まずは半自動化に限定すること
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/_extras/review-ledger_before_full_table_upgrade_2026-04-18.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>小説レビューレポート台帳</title>
<style>
body{
  margin:0;
  background:#0f1115;
  color:#eee;
  font-family:system-ui, sans-serif;
  padding:32px;
}
h1{
  margin-bottom:20px;
}
table{
  width:100%;
  border-collapse:collapse;
  background:#171a21;
}
th,td{
  border:1px solid #333;
  padding:12px;
  text-align:left;
  font-size:14px;
}
th{
  background:#1f2430;
}
tr:hover{
  background:#202633;
}
.status-done{color:#8fd18f;}
.status-wait{color:#d6b86b;}
.status-hold{color:#c77;}
</style>
</head>
<body>
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/_extras/review-ledger_before_title_fix_2026-04-18.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>小説レビューレポート台帳</title>
<style>
body{
  margin:0;
  background:#0f1115;
  color:#eee;
  font-family:system-ui, sans-serif;
  padding:32px;
}
h1{
  margin-bottom:20px;
}
table{
  width:100%;
  border-collapse:collapse;
  background:#171a21;
}
th,td{
  border:1px solid #333;
  padding:12px;
  text-align:left;
  font-size:14px;
}
th{
  background:#1f2430;
}
tr:hover{
  background:#202633;
}
.status-done{color:#8fd18f;}
.status-wait{color:#d6b86b;}
.status-hold{color:#c77;}
</style>
</head>
<body>
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/_extras/ryokutya.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review Letter | 緑茶『剣と魔法の世界で、英雄譚ができるまで』</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-luxury.css">
    <style>
        .letter-body h2{
            font-size:1.08rem;
            margin:2rem 0 0.8rem;
            color:#c9a84c;
            line-height:1.8;
        }
        .letter-body p{
            line-height:2;
            margin:0 0 1rem;
            white-space:normal;
            word-break:break-word;
        }
    </style>
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent">☕✨</div>
                <p class="recipient-line">作者　緑茶 様</p>
            </header>

            <hr class="letter-divider">

            <section class="letter-body">
                <p>レビュー：『剣と魔法の世界で、英雄譚ができるまで』を読んで</p>

                <h2>【ネーミングと世界観の演出について】</h2>
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/_extras/こ、こんにちは Resetter様！.md

```
こ、こんにちは　Resetter様！
私メイドのアイリス・アールグレイが
LANCERに代わって感想をお伝えしようと思います。
よろしければ、このあとは今の季節にぴったりな
春摘みのダージリン（ファーストフラッシュ） でも召し上がって、
ゆっくりお休みくださいませ☕✨
以下感想レポート

9話まで拝見させて頂きました。
暖かな春が訪れているにも関わらず、
背筋が凍るようなお話でした・・・。

あらすじ
お、お家賃安すぎます・・・！
日本の地方都市と言えどもこれは破格です。
ただ入居条件がこの作品の肝だと感じました。
ツッコミどころを用意してインパクト与える
面白い仕掛けだと読んでて思いました。

文章自体は全体的に読みやすくて、苦に感じませんでした！

流石作者様の力量を感じました！

読んでて混乱したのは、おっさんなのに
語尾というか言葉遣いや地の文が女性っぽいという点。
でも設定として面白いです・・・！

会話がメインで構成されていて、地の文は少なめ。
意図的なのかテンポ感意識して敢えて削ってるのか
読んでて気になりました。
僭越ながら苦言を呈するなら、地の文を増やした方が分かりやすいかな？イメージしやすい回もあるかな？
と思う部分はありました。

でも読んでて非常にワクワクしました！
引き続き応援しております・・・！
ーーーアイリス・アールグレイーーーー```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/_extras/ワークフローv2.md

```
# 📘 議事録｜レビュー投稿ワークフロー v2 正式化

## 作成日
2026-04-19

## 議題
小説レビューレポート運用における、
レビュー公開ページ作成・台帳登録・GitHub反映までのワークフローを再整理し、
テーマ差分・JSON差分・台帳列ズレ事故に耐える形へ更新する。

---

## 1｜背景

従来のレビュー投稿ワークフロー v1 は、以下の前提で運用されていた。

- Night テーマ前提
- `night.html` + `letter.js` + `iris-nightlounge.css` 前提
- `review.json` のキー構造が最小限
- 台帳 `review-ledger.html` の列構造が簡略化されていた

しかし実運用において、Spring テーマ利用時に以下の問題が発生した。

### 発生した問題
- テーマごとに CSS 名が異なる
- HTML 側の ID と JS 側の参照先が一致しない場合がある
- `work_title` / `work_url` が手順書に定義されていなかった
- `review-ledger.html` の列不足により、行ズレが発生した
- テーマ専用JSを丸ごと差し替えると本文描画ごと壊れる可能性がある

---

## 2｜今回の結論

レビュー投稿ワークフローは、**v2 を正式採用**する。

### 採用理由
1. テーマ差分を前提とした運用に変更できる
2. `work_title` / `work_url` を標準項目として扱える
3. 台帳列数を固定し、行ズレ事故を防げる
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/_extras/作者 緑茶 剣と魔法の世界で、英雄譚ができるまで.md

```


作者　緑茶
レビュー：『剣と魔法の世界で、英雄譚ができるまで』を読んで

【ネーミングと世界観の演出について】
「国立剣魔学園」という名称は、王道で分かりやすい反面、ファンタジー作品が溢れる昨今では少し既視感があるかもしれません。
例えば、国立剣魔学園（ステイツ・アークマギア）や（ナショナル・グラディウス）のように、中二病心をくすぐる独自の「ルビ」を振るだけで、作品のファンタジー濃度が一気に濃くなり、読者の目を引くフックになります。タイトルの『英雄譚』という言葉に負けない、特別感のある固有名詞を意識するとさらに良くなると思います。

【リヒトの「強さ」に対するロジックの補強】
8話まで読み進めて気になったのが、平民であるリヒトが「なぜこれほど強いのか」「なぜ貴族限定の学園に入れたのか」という説明が不足している点です。
もしこれが意図的な伏線であれば良いのですが、理由もなく「ただ強い平民」として描かれ続けると、読者は物語のリアリティ（説得力）に疑問を抱いてしまいます。リヒトがその力を手に入れた背景や、新制度に選ばれた具体的な経緯を、早めに小出しにするか回想で補完することで、彼というキャラクターの魅力と説得力が一段と増すはずです。

【ライバル・ジオラスの立ち位置と構成】
本作におけるジオラスは、主人公ライにとっての巨大な壁であり、重要なライバルです。
それだけに、リヒトに敗北する前の「ジオラスが最強として君臨していた学園の空気」を、冒頭や回想でもう少し厚く描写しても良いかもしれません。彼がどれほど「孤高の天才」であったかを読者に刻み込むことで、それを崩したリヒトの異質さと、そこから再起するライのドラマがより熱く響くようになります。

【総評】
文章自体は非常にスムーズで読みやすく、ジャンプ漫画のような「男臭い青春と熱い鼓動」を感じる作品です。
ライト層には入りやすい一方で、ファンタジーを読み慣れた層は「設定の粗さ」を敏感に察知し、2話前後で離脱してしまうリスクもあります。競合が多いジャンルだからこそ、独自の設定やキャラの深掘り、そして読者を納得させる「ロジック」を磨くことで、他にはない個性が光る作品に化けるポテンシャルを感じました。

※あくまで一読者としての主観ですので、制作のヒントになれば幸いです。応援しています。```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/_extras/神崎ライ/iris-nightlounge.css

```
/* ============================================================
   iris-nightlounge.css — 深夜読書ラウンジ
   🌙 黒 × 琥珀 × ランプ光 × Reading Blend 接続版
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=IM+Fell+English:ital@0;1&display=swap');

:root {
    --ink:       #e8d8b8;   /* 羊皮紙文字色 */
    --ink-dark:  #c8a878;
    --paper:     #12100c;   /* 黒便箋 */
    --paper2:    #1a160e;
    --amber:     #c8841a;
    --amber2:    #e8a030;
    --amber3:    #f5c060;
    --amber-dim: rgba(200,132,26,0.18);
    --night-bg:  #07090f;
    --shadow:    rgba(0,0,0,0.8);
    --border:    rgba(200,132,26,0.3);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：ランプ光 × 深夜ラウンジ */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 50% 0%,    rgba(200,132,26,0.12) 0%, transparent 50%),
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/_extras/神崎ライ/letter.js

```
/* ============================================================
   Letter from Iris — letter.js
   review.json を fetch して DOM に流し込む
   ============================================================ */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
    fetch('./review.json')
        .then(res => {
            if (!res.ok) throw new Error(`HTTP ${res.status}`);
            return res.json();
        })
        .then(data => {
            /* 基本情報 */
            document.getElementById('recipient').textContent  = data.recipient;
            document.getElementById('intro-text').innerText   = data.intro;
            document.getElementById('tea-name').textContent   = data.tea_service;
            document.getElementById('read-count').textContent = data.read_count;
            document.getElementById('review-summary').textContent = data.summary;
            document.getElementById('sign-name').textContent  = data.sign;

            const workTitle = document.getElementById('work-title');
            const workUrl = document.getElementById('work-url');
            if (workTitle && data.work_title) workTitle.textContent = data.work_title;
            if (workUrl && data.work_url) workUrl.href = data.work_url;

            /* 本文段落生成 */
            const body = document.getElementById('letter-body');
            data.body.forEach(paragraph => {
                const p = document.createElement('p');
                p.textContent = paragraph;
                body.appendChild(p);
            });

            /* フェードイン（Gemini版と同じ挙動） */
            setTimeout(() => {
                document.getElementById('container').style.opacity = '1';
            }, 100);
        })
        .catch(err => {
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/_extras/神崎ライ/night.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Night Lounge | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-nightlounge.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="work-meta">
                <p class="work-label">REVIEWED WORK</p>
                <h2 class="work-title" id="work-title"></h2>
                <p class="work-link"><a id="work-url" href="#" target="_blank" rel="noopener noreferrer">作品ページを見る</a></p>
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/_extras/神崎ライ/review.json

```
{
  "recipient": "神崎 ライ",
  "intro": "こ、こんにちは　神崎 ライ様！\n私メイドのアイリス・アールグレイが\nLANCERに代わって感想をお伝えしようと思います。",
  "tea_service": "鏡の国をイメージした銀針茶（シルバーニードル）",
  "read_count": "9話",
  "summary": "世界観がよくできていて、思わず夢中になって没頭しました！",
  "body": [
    "読んでいて感じたのが、ルイス・キャロル原作の『不思議の国のアリス』や『鏡の国のアリス』と重なる部分が多く、非常にワクワクしたことです。主人公の冬夜くんをアリスに置き換えると、色々と腑に落ちるところが多くて。",
    "特に5話で森の中を彷徨い、連れて行かれる構図など、ディズニー作品やジブリと重なるところもあり、導入が上手いなと思いました。",
    "序盤は視点移動が多いことと、設定が多いことが難点で、ここが離脱ポイントになり得るかもしれません。",
    "ただ、続きが気になるフックを文章の最後に用意しているのが匠のなせる技だと思います。これは意識して読者を離脱させないように工夫しているポイントだと感じました。",
    "9話、10話あたりで一気に面白くなったので、そこまで読者を導けるかどうかが肝になりそうです。",
    "素敵なお話でした。引き続き応援しております！"
  ],
  "sign": "アイリス・アールグレイ",
  "work_title": "絶望の箱庭～鳥籠の姫君～",
  "work_url": "https://ncode.syosetu.com/n3370hf/"
}```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/_extras/神崎ライ/こ、こんにちは 神崎 ライ様.md

```
こ、こんにちは　神崎　ライ様！

私メイドのアイリス・アールグレイが
LANCERに代わって感想をお伝えしようと思います。

本日は、鏡の国をイメージした銀針茶（シルバーニードル）
を。霧の向こう側を覗き込むような、不思議な余韻をお楽しみください。

９話まで読みました。
世界観が良く出来ていて思わず夢中になって没頭しました！
読んでて感じたのが、ルイスキャロル原作の不思議の国のアリスとか
鏡の国のアリスと重なる部分が多くて非常にワクワクしました！
主人公の冬夜くんをアリスさんに置き換えると色々腑に落ちるところ多くて。
特に５話で森の中を彷徨い連れて行かれる構図とか、
ディズニー作品とかジブリとかと重なるところがあって、
導入が上手いなと思いました。
序盤視点移動が多いことと、設定が多いことが難点で
ここが離脱ポイントになり得るかもしれません。
ただ続きが気になるフックを文章の最後に用意してるのが
匠のなせる技だと思います！これは意識して読者を離脱させないように
工夫しているポイントだと思います。
９話、１０話辺りで一気に面白くなったので、
そこまで読者を導けるかどうかが肝になりそうです。
素敵なお話しでした。引き続き応援しております！```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/files(32)/EXAMPLE_INPUT.md

```
# 入力例

## 炎山ヒロト（Spring実例）

```
作者名: 炎山ヒロト
作品タイトル: 魔法少女戦士マジカルファイターズ
作品分類: ヒーローモノ
テーマ: spring
感想種別: アイリス書簡
読了話数: 5話
作品URL: https://ncode.syosetu.com/n0390gp/5/
X返信状況: 未記録
許諾状況: 未記録
md本文ファイルのパス: /home/lancer/DOCS/reviews/entoyama_review.md
```

## md本文ファイルの書き方

`review.md` は段落を **空行** で区切って書いてください。  
空行が `body` 配列の区切りになります。Markdown記法は解析されません。

```markdown
拝読していてまず感じましたのが、性転換ヒーローという設定の魅力です。

2話や5話でのレン様の描写には、思わず胸が熱くなりました。

※あくまで一読者としての主観です。応援しています。
```

↑ この場合 `body` は3要素の配列になります。
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/files(32)/EXAMPLE_OUTPUT.md

```
# 出力例（ターミナルイメージ）

## 実行例：炎山ヒロト / Spring

```
========================================================
  読者レビュー半自動化ツール v0.1
========================================================
  作者名: 炎山ヒロト
  作品タイトル: 魔法少女戦士マジカルファイターズ
  作品分類: ヒーローモノ
  テーマ (night / luxury / spring): spring
  感想種別: アイリス書簡
  読了話数: 5話
  作品URL: https://ncode.syosetu.com/n0390gp/5/
  X返信状況 [未記録]: 
  許諾状況 [未記録]: 
  md本文ファイルのパス: /home/lancer/DOCS/reviews/entoyama_review.md

  ✅ md本文読込完了: 4 段落

--------------------------------------------------------
  入力確認
--------------------------------------------------------
  author        : 炎山ヒロト
  work_title    : 魔法少女戦士マジカルファイターズ
  work_category : ヒーローモノ
  theme         : spring
  review_type   : アイリス書簡
  read_count    : 5話
  work_url      : https://ncode.syosetu.com/n0390gp/5/
  x_status      : 未記録
  permit_status : 未記録
  md本文        : 4 段落
--------------------------------------------------------
  この内容で生成しますか？ (y/N): y

  📁 出力先: /home/lancer/.../reader_review_script_audit_box/炎山ヒロト
  📄 コピー: spring.html
  📄 コピー: iris-springtea.css
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/files(32)/KNOWN_LIMITS.md

```
# 既知の制限事項 — v0.1

## v0.1 でやらないこと（仕様外）

### 1. letter.js の内容変更
テーマ専用JSは内容を一切変更しません。  
`work-info hidden` の解除漏れや ID 不一致は自動修正しません。  
**手動確認が必要なケース**：
- `work_title` / `work_url` が表示されない場合
  → letter.js が `work-info` の `hidden` を解除しているか確認
  → HTML側に `id="work-info"` ブロックが存在するか確認

### 2. HTML内部DOMの自動修正
コピー元テンプレートに `id="work-info"` が存在しない（古いNight形式）場合、
`work_title` / `work_url` は表示されません。  
→ テンプレートを手動で更新してから再実行してください。

### 3. review-ledger.html への直接書き込み
`<tr>` をターミナルに出力するだけです。  
台帳への追記は手動で行ってください。

### 4. Git操作
`git add / commit / push` は一切行いません。

### 5. 本番ディレクトリへの書き込み
本番の `作者別フォルダ/` には一切書き込みません。  
必ず `audit_box/` の内容を確認してから手動コピーしてください。

---

## 既知の不完全な点

### CSS未提供時の挙動
`templates/` に CSS が存在しない場合、スキップして続行します。  
HTMLは生成されますが、スタイルが当たらない状態になります。  
→ 手動で CSS を `templates/` に配置してから再実行してください。

### 同名フォルダ保護
出力先に同じ作者名のフォルダが既に存在する場合、エラーで止まります。  
再生成したい場合はフォルダを手動で削除してから実行してください。
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/files(32)/README.md

```
# 読者レビュー半自動化ツール v0.1

## 概要

作者名・テーマ・md本文などを対話形式で受け取り、
レビュー公開用ファイル一式を **出力ディレクトリ（audit_box）** に生成します。

本番ディレクトリへの書き込み・JSの自動修正・Git操作は一切行いません。

---

## ファイル構成

```
reader_review_script_audit_box/
├── generate_review.py     ← スクリプト本体
├── README.md              ← 本ファイル
├── EXAMPLE_INPUT.md       ← 入力例
├── EXAMPLE_OUTPUT.md      ← 出力例（ターミナル出力イメージ）
├── KNOWN_LIMITS.md        ← 既知の制限事項
└── templates/             ← テーマテンプレ置き場
    ├── night.html
    ├── luxury.html
    ├── spring.html
    ├── iris-nightlounge.css   ← ※要配置
    ├── iris-luxury.css        ← ※要配置
    ├── iris-springtea.css     ← ※要配置
    └── letter.js
```

### templates/ の準備

HTMLと `letter.js` はこのリポジトリに同梱されています。  
CSSファイルは本番ディレクトリからコピーしてここに置いてください。

```bash
cp 本番パス/iris-nightlounge.css templates/
cp 本番パス/iris-luxury.css      templates/
cp 本番パス/iris-springtea.css   templates/
```
```

## ./viewer/アーカイブ/クロード先生/reader_review_script_audit_box/ワークフローv2.md

```
# 📘 議事録｜レビュー投稿ワークフロー v2 正式化

## 作成日
2026-04-19

## 議題
小説レビューレポート運用における、
レビュー公開ページ作成・台帳登録・GitHub反映までのワークフローを再整理し、
テーマ差分・JSON差分・台帳列ズレ事故に耐える形へ更新する。

---

## 1｜背景

従来のレビュー投稿ワークフロー v1 は、以下の前提で運用されていた。

- Night テーマ前提
- `night.html` + `letter.js` + `iris-nightlounge.css` 前提
- `review.json` のキー構造が最小限
- 台帳 `review-ledger.html` の列構造が簡略化されていた

しかし実運用において、Spring テーマ利用時に以下の問題が発生した。

### 発生した問題
- テーマごとに CSS 名が異なる
- HTML 側の ID と JS 側の参照先が一致しない場合がある
- `work_title` / `work_url` が手順書に定義されていなかった
- `review-ledger.html` の列不足により、行ズレが発生した
- テーマ専用JSを丸ごと差し替えると本文描画ごと壊れる可能性がある

---

## 2｜今回の結論

レビュー投稿ワークフローは、**v2 を正式採用**する。

### 採用理由
1. テーマ差分を前提とした運用に変更できる
2. `work_title` / `work_url` を標準項目として扱える
3. 台帳列数を固定し、行ズレ事故を防げる
```

## ./viewer/アーカイブ/クロード先生/world_terrain_prototype_v1_2_zoomtest_for_claude/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Meritocracia World Terrain Prototype</title>
  <link rel="stylesheet" href="./world.css" />
</head>
<body>
  <main class="world-shell">
    <section class="map-panel">
      <div class="map-stage" id="map-stage">
        <div class="zoom-controls">
          <button id="zoom-in" type="button">＋</button>
          <button id="zoom-out" type="button">－</button>
          <button id="zoom-reset" type="button">Reset</button>
          <input id="zoom-input" type="number" min="1" max="100" step="0.1" value="1" />
          <button id="zoom-apply" type="button">Apply</button>
        </div>

        <div class="map-viewport" id="map-viewport">
          <img
            src="./assets/world-terrain-map.png"
            alt="Meritocracia World Terrain Prototype Map"
            class="terrain-map"
            id="terrain-map"
          />
          <div class="poi-layer" id="poi-layer"></div>
        </div>
      </div>
    </section>

    <aside class="side-panel">
      <div class="side-inner">
        <p class="panel-kicker">WORLD MAP</p>
        <h1 class="panel-title">Terrain Prototype v1</h1>
        <p class="panel-desc" id="panel-desc">
          地形ベース画像に HTML overlay で POI を後載せする試作ワールドハブ。
        </p>

```

## ./viewer/アーカイブ/クロード先生/world_terrain_prototype_v1_2_zoomtest_for_claude/world-data.json

```
{
  "map_id": "meritocracia_world_terrain_v1",
  "title": "Meritocracia World Terrain Prototype",
  "description": "Gemini地形画像を Terrain Base として採用し、POI を後載せする world hub 試作版。",
  "pois": [
    {
      "id": "brighton",
      "label": "首都ブライトン",
      "x": 53,
      "y": 58,
      "text": "南部平野と中央交通結節の中核。国家運営・政治・制度の中心拠点。",
      "link": "../nation/"
    },
    {
      "id": "grand_central",
      "label": "Grand Central",
      "x": 60,
      "y": 51,
      "text": "本編導線の中核都市。市場・行政・都市事件・各種DB接続の主要ハブ。",
      "link": "../city/grand-central/map/"
    },
    {
      "id": "academy",
      "label": "士官学校",
      "x": 63,
      "y": 56,
      "text": "ジェイドたちの成長舞台。学園編・制度教育・人物相関の主要接続点。",
      "link": "../../story/academy/"
    },
    {
      "id": "inquisition",
      "label": "審問庁",
      "x": 56,
      "y": 48,
      "text": "監視・調査・異常観測を担う国家機関。ZERO事件以降の違和感と深く関わる。",
      "link": "../nation/"
    }
  ],
  "quick_links": [
    {
```

## ./viewer/アーカイブ/クロード先生/world_terrain_prototype_v1_2_zoomtest_for_claude/world.css

```
:root {
  --bg: #07111f;
  --panel: rgba(8, 16, 28, 0.88);
  --panel-strong: rgba(10, 20, 34, 0.94);
  --line: rgba(198, 166, 106, 0.45);
  --gold: #c6a66a;
  --gold-strong: #e2c68d;
  --text: #f3ead8;
  --muted: #cfc2ab;
  --shadow: rgba(0, 0, 0, 0.35);
}

* {
  box-sizing: border-box;
}

html,
body {
  margin: 0;
  min-height: 100%;
  background:
    radial-gradient(circle at top, #0d2340 0%, #07111f 55%, #040a13 100%);
  color: var(--text);
  font-family:
    "Noto Serif JP",
    "Hiragino Mincho ProN",
    "Yu Mincho",
    serif;
}

body {
  padding: 20px;
}

.world-shell {
  display: grid;
  grid-template-columns: minmax(0, 1fr) 320px;
  gap: 18px;
  align-items: stretch;
  min-height: calc(100vh - 40px);
```

## ./viewer/アーカイブ/クロード先生/world_terrain_prototype_v1_2_zoomtest_for_claude/world.js

```
document.addEventListener("DOMContentLoaded", async () => {
  const poiLayer = document.getElementById("poi-layer");
  const mapStage = document.getElementById("map-stage");
  const mapViewport = document.getElementById("map-viewport");
  const selectedName = document.getElementById("selected-name");
  const selectedText = document.getElementById("selected-text");
  const selectedLink = document.getElementById("selected-link");
  const quickLinkList = document.getElementById("quick-link-list");
  const editTools = document.getElementById("edit-tools");
  const exportBtn = document.getElementById("export-btn");
  const resetBtn = document.getElementById("reset-btn");
  const exportOutput = document.getElementById("export-output");
  const poiScaleInput = document.getElementById("poi-scale-input");
  const poiScaleApplyBtn = document.getElementById("poi-scale-apply");
  const poiScaleResetBtn = document.getElementById("poi-scale-reset");

  const zoomInBtn = document.getElementById("zoom-in");
  const zoomOutBtn = document.getElementById("zoom-out");
  const zoomResetBtn = document.getElementById("zoom-reset");
  const zoomInput = document.getElementById("zoom-input");
  const zoomApplyBtn = document.getElementById("zoom-apply");

  const urlParams = new URLSearchParams(window.location.search);
  const isEditMode = urlParams.get("edit") === "1";

  let originalPois = [];
  let currentPois = [];
  let activePoiId = null;

  let zoomLevel = 1;
  let panX = 0;
  let panY = 0;

  const MIN_ZOOM = 1;
  const MAX_ZOOM = 100;
  const ZOOM_STEP = 1;

  if (isEditMode && editTools) {
    editTools.hidden = false;
  }
```

## ./viewer/アーカイブ/クロード先生/途中式/claude_audit_box/kernel.json

```
{
  "meta": {
    "id": "view化前",
    "slug": "view化前",
    "source_format": "markdown",
    "source_path": "/home/lancer/DOCS/meritocracia-team-share/docs/settings/Meritocracia_Data_Hub/01_世界観・設定_Wiki/キャラクター/主人公一家/カーネル　レオンハルト/view化前.md",
    "access_level": "internal",
    "theme": "afterglow-memory"
  },
  "header": {
    "title": "📘 カーネル・レオンハルト view化前提資料（内部設定版 / ネタバレあり）"
  },
  "sections": [
    {
      "id": "1-キャラクター定義",
      "title": "1. キャラクター定義",
      "type": "text",
      "content": "カーネル・レオンハルトは、ジェイド・レオンハルトの姉であり、\nZERO編における「家族の日常」「庶民生活」「守られたかった平穏」の象徴である。\n\nしかし内部設定上の本質はそれだけではない。\n\n彼女は同時に、\n\n- 日常の象徴\n- 神性適合個体\n- 魂回収対象\n- ジェイドの倫理観の原点\n- 喪失そのもの\n- 後に再会する悲劇装置\n\nを一身に担う、多層的な中核キャラクターである。\n\n---"
    },
    {
      "id": "2-基本情報",
      "title": "2. 基本情報",
      "type": "text",
      "content": "- 名前：カーネル・レオンハルト\n- 年齢：16歳\n- 立場：メリトクラシア一般教育校の学生\n- 出身：メリトクラシア都市圏の平民家庭\n- 家族：ジェイド・レオンハルトの姉\n- 物語上の初期役割：ジェイドの日常・安心・家族的ぬくもりの象徴\n- 物語上の深層役割：選別死・魂回収・聖骸騎士化に接続する悲劇の核\n\n---"
    },
    {
      "id": "3-外見",
      "title": "3. 外見",
      "type": "text",
      "content": "カーネルは、ハニーゴールド〜赤橙寄りの髪を高い位置で結んだポニーテールと、\nアンバーの瞳を持つ活発な少女である。\n\n健康的で引き締まった体格をしており、\n生命感の強い表情と、前へ出る意志のある視線を持つ。\n\n第一印象は明るく快活だが、軽さではなく、\n「自分が前に立つことで誰かを守ろうとする強さ」が滲む外見である。\n\n---"
    },
    {
      "id": "4-性格",
      "title": "4. 性格",
      "type": "text",
      "content": "カーネルは元気で現実的な性格をしている。\n少し勝ち気で、思い立ったらすぐに行動するタイプであり、\n状況判断より先に身体が動くことも多い。\n\nただし、その行動力は自己中心性ではなく、\n**他人を助ける方向へ自然に向く** ことに最大の特徴がある。\n\n### 性格の中核\n- 面倒見が良い\n- 他者保護傾向が強い\n- 自分が損してでも人を助ける\n- 子供や弱者に自然と手を差し伸べる\n- 市場でも教会でも頼られやすい\n- 誰かを守ることに理由を必要としない\n\nこの性質により、彼女は単なる「優しい姉」ではなく、\n**守護性を本質に持った人物** として成立する。\n\n---"
    },
    {
      "id": "5-ジェイドとの関係",
      "title": "5. ジェイドとの関係",
```

## ./viewer/アーカイブ/クロード先生/途中式/claude_audit_box/view化前.md

```
# 📘 カーネル・レオンハルト view化前提資料（内部設定版 / ネタバレあり）

作成目的：
カーネル・レオンハルトを、サンギナリア黒幕構造・中央市場テロ事件・魂回収・聖骸騎士化まで接続した
**内部用キャラクターview** として整理するための統合資料。
本資料は公開用ではなく、内部DB・深層設定Viewer・制作資料ページへの転用を前提とする。

---

## 1. キャラクター定義

カーネル・レオンハルトは、ジェイド・レオンハルトの姉であり、
ZERO編における「家族の日常」「庶民生活」「守られたかった平穏」の象徴である。

しかし内部設定上の本質はそれだけではない。

彼女は同時に、

- 日常の象徴
- 神性適合個体
- 魂回収対象
- ジェイドの倫理観の原点
- 喪失そのもの
- 後に再会する悲劇装置

を一身に担う、多層的な中核キャラクターである。

---

## 2. 基本情報

- 名前：カーネル・レオンハルト
- 年齢：16歳
- 立場：メリトクラシア一般教育校の学生
- 出身：メリトクラシア都市圏の平民家庭
- 家族：ジェイド・レオンハルトの姉
- 物語上の初期役割：ジェイドの日常・安心・家族的ぬくもりの象徴
- 物語上の深層役割：選別死・魂回収・聖骸騎士化に接続する悲劇の核

---
```

## ./viewer/アーカイブ/クロード先生/途中式/files/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Meritocracia World Terrain Prototype</title>
  <link rel="stylesheet" href="./world.css" />
</head>
<body>
  <main class="world-shell">
    <section class="map-panel">
      <div class="map-stage" id="map-stage">
        <div class="zoom-controls">
          <button id="zoom-in"    type="button">＋</button>
          <button id="zoom-out"   type="button">－</button>
          <button id="zoom-reset" type="button">Reset</button>
          <input  id="zoom-input" type="number" min="1" max="100" step="0.1" value="1" />
          <button id="zoom-apply" type="button">Apply</button>
        </div>

        <div class="map-viewport" id="map-viewport">
          <img
            src="./assets/world-terrain-map.png"
            alt="Meritocracia World Terrain Prototype Map"
            class="terrain-map"
            id="terrain-map"
          />
          <!-- POI ピンはすべて JS が生成。
               各ピンは .poi-wrap > .poi の 2層構造になる。 -->
          <div class="overlay-layer" id="overlay-layer"></div>
          <div class="poi-layer" id="poi-layer"></div>
        </div>
      </div>
    </section>

    <aside class="side-panel">
      <div class="side-inner">
        <p class="panel-kicker">WORLD MAP</p>
        <h1 class="panel-title">Terrain Prototype v1</h1>
        <p class="panel-desc" id="panel-desc">
```

## ./viewer/アーカイブ/クロード先生/途中式/files/world-data.debug-before-visibility-check.json

```
{
  "map_id": "meritocracia_world_terrain_v1",
  "title": "Meritocracia World Terrain Prototype",
  "description": "Gemini地形画像を Terrain Base として採用し、POI を後載せする world hub 試作版。",
  "pois": [
    {
      "id": "brighton",
      "label": "首都ブライトン",
      "x": 53,
      "y": 58,
      "text": "南部平野と中央交通結節の中核。国家運営・政治・制度の中心拠点。",
      "link": "../nation/"
    },
    {
      "id": "grand_central",
      "label": "Grand Central",
      "x": 60,
      "y": 51,
      "text": "本編導線の中核都市。市場・行政・都市事件・各種DB接続の主要ハブ。",
      "link": "../city/grand-central/map/"
    },
    {
      "id": "academy",
      "label": "士官学校",
      "x": 63,
      "y": 56,
      "text": "ジェイドたちの成長舞台。学園編・制度教育・人物相関の主要接続点。",
      "link": "../../story/academy/"
    },
    {
      "id": "inquisition",
      "label": "審問庁",
      "x": 56,
      "y": 48,
      "text": "監視・調査・異常観測を担う国家機関。ZERO事件以降の違和感と深く関わる。",
      "link": "../nation/"
    }
  ],
  "quick_links": [
    {
```

## ./viewer/アーカイブ/クロード先生/途中式/files/world-data.js

```
/**
 * world-data.js
 * 責務: world-data.json の fetch・正規化・ディープコピー生成のみ。
 * DOM・状態・描画には一切触れない。
 *
 * ── ファイル構成 ─────────────────────────────────────────────
 * このモジュールは同一ディレクトリの "world-data.json" を読む前提。
 * フォルダ構成例:
 *
 *   world_terrain_prototype/
 *     index.html
 *     world.js                 ← エントリポイント
 *     world-data.js            ← このファイル
 *     world-data.json          ← POI・メタ情報の実体（必須）
 *     world-state.js
 *     world-utils.js
 *     world-viewport.js
 *     world-poi-renderer.js
 *     world-panel.js
 *     world-io.js
 *     world.css
 *     assets/
 *       world-terrain-map.png
 *
 * world-data.json が存在しない・パスが違う場合は
 * loadWorldData() が throw するので、呼び出し元の try/catch で
 * showLoadError() を呼んでください（world.js 側で処理済み）。
 * ─────────────────────────────────────────────────────────────
 */

import { normalizeScale, normalizeType } from "./world-utils.js";

/**
 * POI の生オブジェクトを正規化して複製する。
 * - scale が未指定 → 1
 * - type  が未指定 → "chip"
 * - その他フィールドはそのまま保持（後方互換）
 * @param {object} raw
 * @returns {object}
 */
```

## ./viewer/アーカイブ/クロード先生/途中式/files/world-data.json

```
{
  "map_id": "meritocracia_world_terrain_v1",
  "title": "Meritocracia World Terrain Prototype",
  "description": "Gemini地形画像を Terrain Base として採用し、POI を後載せする world hub 試作版。",
  "pois": [
    {
      "id": "brighton",
      "label": "首都ブライトン",
      "x": 53,
      "y": 58,
      "text": "南部平野と中央交通結節の中核。国家運営・政治・制度の中心拠点。",
      "link": "../nation/"
    },
    {
      "id": "grand_central",
      "label": "Grand Central",
      "x": 60,
      "y": 51,
      "text": "本編導線の中核都市。市場・行政・都市事件・各種DB接続の主要ハブ。",
      "link": "../city/grand-central/map/"
    },
    {
      "id": "academy",
      "label": "士官学校",
      "x": 63,
      "y": 56,
      "text": "ジェイドたちの成長舞台。学園編・制度教育・人物相関の主要接続点。",
      "link": "../../story/academy/"
    },
    {
      "id": "inquisition",
      "label": "審問庁",
      "x": 56,
      "y": 48,
      "text": "監視・調査・異常観測を担う国家機関。ZERO事件以降の違和感と深く関わる。",
      "link": "../nation/"
    }
  ],
  "quick_links": [
    {
```

## ./viewer/アーカイブ/クロード先生/途中式/files/world-io.js

```
/**
 * world-io.js
 * 責務: export（JSON生成・出力）と reset（データ巻き戻し）の処理のみ。
 *
 * - state の読み書きは world-state.js 経由
 * - 再描画は world-poi-renderer.js を呼び出す
 * - パネル更新は world-panel.js を呼び出す
 */

import {
  getCurrentPois,
  resetAllPois,
  getActivePoiId,
} from "./world-state.js";
import { round2 } from "./world-utils.js";
import { renderPois } from "./world-poi-renderer.js";
import { updatePanelForPoi } from "./world-panel.js";

// ─── DOM refs ────────────────────────────────────────────────
let _exportBtn    = null;
let _resetBtn     = null;
let _exportOutput = null;

// ─── 初期化 ─────────────────────────────────────────────────

/**
 * @param {object} params
 * @param {HTMLButtonElement}  params.exportBtn
 * @param {HTMLButtonElement}  params.resetBtn
 * @param {HTMLTextAreaElement} params.exportOutput
 */
export function initIO({ exportBtn, resetBtn, exportOutput }) {
  _exportBtn    = exportBtn;
  _resetBtn     = resetBtn;
  _exportOutput = exportOutput;

  exportBtn?.addEventListener("click", _handleExport);
  resetBtn?.addEventListener("click",  _handleReset);
}

```

## ./viewer/アーカイブ/クロード先生/途中式/files/world-overlay-renderer.js

```
/**
 * world-overlay-renderer.js
 * 責務: 画像オーバーレイの DOM 生成・配置のみ。
 * - 状態管理は持たない
 * - zoom / pan は map-viewport 側の transform に追従する
 * - クリック処理や編集処理は現段階では持たない
 */

let _overlayLayer = null;

/**
 * @param {object} params
 * @param {HTMLElement} params.overlayLayer
 */
export function initOverlayRenderer({ overlayLayer }) {
  _overlayLayer = overlayLayer;
}

/**
 * オーバーレイ画像群を描画する。
 * @param {Array<{
 *   id: string,
 *   src: string,
 *   x: number,
 *   y: number,
 *   width: number,
 *   z?: number,
 *   opacity?: number
 * }>} overlays
 */
export function renderOverlays(overlays = []) {
  if (!_overlayLayer) return;

  _overlayLayer.innerHTML = "";

  overlays.forEach((ov) => {
    const img = document.createElement("img");
    img.className = "map-overlay-img";
    img.dataset.id = ov.id;
    img.src = ov.src;
```

## ./viewer/アーカイブ/クロード先生/途中式/files/world-panel.js

```
/**
 * world-panel.js
 * 責務: サイドパネル（右パネル）の DOM 更新・UI 結線のみ。
 *
 * - 状態の変更は world-state.js の setter 経由
 * - 描画は world-poi-renderer.js の関数を呼び出す
 * - export / reset のロジックは world-io.js に委譲
 */

import {
  getActivePoi,
  isEditMode,
  updatePoiScale,
  resetPoiScale,
  getActivePoiId,
} from "./world-state.js";
import { round2 } from "./world-utils.js";
import { updatePoiScaleVisual } from "./world-poi-renderer.js";

// ─── DOM refs ────────────────────────────────────────────────
let _els = {};

// ─── 初期化 ─────────────────────────────────────────────────

/**
 * @param {object} params  必要な DOM 要素をまとめて受け取る
 */
export function initPanel(params) {
  _els = { ...params };

  // POI scale ボタン
  params.poiScaleApplyBtn?.addEventListener("click", _applyScale);
  params.poiScaleInput?.addEventListener("keydown", (e) => {
    if (e.key === "Enter") _applyScale();
  });
  params.poiScaleResetBtn?.addEventListener("click", _resetScale);
}

// ─── 公開 API ────────────────────────────────────────────────

```

## ./viewer/アーカイブ/クロード先生/途中式/files/world-poi-renderer.js

```
/**
 * world-poi-renderer.js
 * 責務: POI の DOM 生成・更新・視覚状態の反映のみ。
 *
 * - 状態の読み取りは world-state.js 経由（書き込みはしない）
 * - クリック / ドラッグのイベント登録は行うが、
 *   状態の変更は呼び出し元から受け取ったコールバックに委譲する
 *
 * ## transform の分離設計
 * POI の transform を 2層に分けることで競合を回避する。
 *
 *   .poi-wrap   ← position (left/top) + translate(-50%,-50%) の wrapper
 *     .poi      ← scale / hover / active / dragging の視覚状態のみ
 *
 * hover や active の scale は CSS 変数 --poi-scale を経由して
 * CSS 側が制御するため、JS は --poi-scale を setProperty するだけ。
 * これにより「JS の scale 変更」と「CSS hover 演出」が競合しない。
 *
 * ## type 別 renderer
 * renderPoiElement(poi) が poi.type を見て描画内容を切り替える。
 * 現在は "chip"（デフォルト）のみ実装。
 * 将来: "dot" / "icon" / "submap" を追加する場合はここだけ変更。
 */

import {
  getCurrentPois,
  getActivePoiId,
  isEditMode,
  getZoomLevel, getPanX, getPanY,
  updatePoiPosition,
  setActivePoiId,
  findPoi,
} from "./world-state.js";
import { clamp } from "./world-utils.js";

// ─── DOM refs ────────────────────────────────────────────────
let _poiLayer  = null;
let _mapStage  = null;

// ─── コールバック ─────────────────────────────────────────────
```

## ./viewer/アーカイブ/クロード先生/途中式/files/world-state.js

```
/**
 * world-state.js
 * 責務: アプリケーション全体の可変状態を一箇所に集約する。
 *
 * ルール:
 * - state オブジェクトの直接書き換えは禁止。
 *   必ず下記の setter 関数を経由する。
 * - DOM 操作・fetch・副作用は一切ここに書かない。
 * - 他モジュールは state を読み取り専用で参照し、
 *   変更したい場合は setter を呼ぶ。
 */

import { clamp } from "./world-utils.js";

// ─── ズーム定数 ─────────────────────────────────────────────
export const ZOOM = {
  MIN:  1,
  MAX:  100,
  STEP: 1,
};

// ─── POI scale 定数 ─────────────────────────────────────────
export const SCALE = {
  MIN:     0.2,
  MAX:     3,
  DEFAULT: 1,
};

// ─── 状態オブジェクト（モジュール内のみ直接参照） ────────────
const _state = {
  // POI データ
  originalPois: [],  // reset 用スナップショット（変更不可）
  currentPois:  [],  // 現在値（編集・drag 反映済み）
  activePoiId:  null,

  // ビューポート
  zoomLevel: 1,
  panX: 0,
  panY: 0,

```

## ./viewer/アーカイブ/クロード先生/途中式/files/world-utils.js

```
/**
 * world-utils.js
 * 共有ユーティリティ関数。副作用なし・純関数のみ。
 * 他モジュールはすべてここの関数を import して使う。
 */

/**
 * 数値を min〜max の範囲に収める。
 * @param {number} value
 * @param {number} min
 * @param {number} max
 * @returns {number}
 */
export function clamp(value, min, max) {
  return Math.min(Math.max(value, min), max);
}

/**
 * 小数点2桁に丸める。
 * @param {number} value
 * @returns {number}
 */
export function round2(value) {
  return Math.round(value * 100) / 100;
}

/**
 * POI データの scale を正規化する。
 * JSON に scale が無い場合や数値でない場合は 1 を返す。
 * @param {*} raw  POI オブジェクト（生データ）
 * @returns {number}
 */
export function normalizeScale(raw) {
  return typeof raw.scale === "number" ? raw.scale : 1;
}

/**
 * POI の type を正規化する。
 * JSON に type が無い場合は "chip" を返す。
 * 現状: "dot" | "chip" | "icon" | "submap"
```

## ./viewer/アーカイブ/クロード先生/途中式/files/world-viewport.js

```
/**
 * world-viewport.js
 * 責務: ズーム / パン の入力処理と DOM transform 適用。
 *
 * - 状態の読み書きは world-state.js 経由
 * - DOM は mapViewport / mapStage / zoomInput のみ触る
 * - POI 描画には関与しない
 */

import {
  getZoomLevel, getPanX, getPanY,
  setZoomLevel, setPan, resetPan,
  isEditMode,
  ZOOM,
} from "./world-state.js";
import { round2 } from "./world-utils.js";

// ─── DOM refs（init で受け取る） ─────────────────────────────
let _mapViewport = null;
let _mapStage    = null;
let _zoomInput   = null;

/** onTransformChange コールバック（ポイント: 他モジュールへの通知用） */
let _onTransformChange = null;

// ─── 初期化 ─────────────────────────────────────────────────

/**
 * @param {object} params
 * @param {HTMLElement} params.mapViewport
 * @param {HTMLElement} params.mapStage
 * @param {HTMLInputElement} params.zoomInput
 * @param {HTMLButtonElement} params.zoomInBtn
 * @param {HTMLButtonElement} params.zoomOutBtn
 * @param {HTMLButtonElement} params.zoomResetBtn
 * @param {HTMLButtonElement} params.zoomApplyBtn
 * @param {Function} [params.onTransformChange]  transform 変更後に呼ばれるコールバック
 */
export function initViewport({
  mapViewport,
```

## ./viewer/アーカイブ/クロード先生/途中式/files/world.css

```
:root {
  --bg: #07111f;
  --panel: rgba(8, 16, 28, 0.88);
  --panel-strong: rgba(10, 20, 34, 0.94);
  --line: rgba(198, 166, 106, 0.45);
  --gold: #c6a66a;
  --gold-strong: #e2c68d;
  --text: #f3ead8;
  --muted: #cfc2ab;
  --shadow: rgba(0, 0, 0, 0.35);
}

* {
  box-sizing: border-box;
}

html,
body {
  margin: 0;
  min-height: 100%;
  background:
    radial-gradient(circle at top, #0d2340 0%, #07111f 55%, #040a13 100%);
  color: var(--text);
  font-family:
    "Noto Serif JP",
    "Hiragino Mincho ProN",
    "Yu Mincho",
    serif;
}

body {
  padding: 20px;
}

.world-shell {
  display: grid;
  grid-template-columns: minmax(0, 1fr) 320px;
  gap: 18px;
  align-items: stretch;
  min-height: calc(100vh - 40px);
```

## ./viewer/アーカイブ/クロード先生/途中式/files/world.js

```
/**
 * world.js  ← エントリポイント（オーケストレーター）
 *
 * 責務: 各モジュールの初期化と結線のみ。
 * ロジックは一切ここに書かない。
 *
 * 依存グラフ（矢印は「依存する」方向）:
 *
 *   world.js
 *     ├─ world-data.js       fetch / normalize
 *     ├─ world-state.js      可変状態の管理
 *     ├─ world-utils.js      pure utils
 *     ├─ world-viewport.js   zoom / pan → DOM transform
 *     ├─ world-poi-renderer.js  POI DOM 生成・更新
 *     ├─ world-panel.js      右パネル UI 結線
 *     └─ world-io.js         export / reset
 */

import { loadWorldData }        from "./world-data.js";
import { initPois, setEditMode, getActivePoiId } from "./world-state.js";
import { initViewport, applyTransform } from "./world-viewport.js";
import { initPoiRenderer, renderPois }  from "./world-poi-renderer.js";
import { initOverlayRenderer, renderOverlays } from "./world-overlay-renderer.js";
import { initPanel, renderQuickLinks, updatePanelForPoi, showLoadError } from "./world-panel.js";
import { initIO }               from "./world-io.js";

// ─── DOM 参照 ─────────────────────────────────────────────────

const $ = (id) => document.getElementById(id);

const el = {
  poiLayer:          $("poi-layer"),
  overlayLayer:      $("overlay-layer"),
  mapStage:          $("map-stage"),
  mapViewport:       $("map-viewport"),
  editTools:         $("edit-tools"),
  exportBtn:         $("export-btn"),
  resetBtn:          $("reset-btn"),
  exportOutput:      $("export-output"),
  poiScaleInput:     $("poi-scale-input"),
```

## ./viewer/アーカイブ/クロード先生/途中式/files/修正依頼/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Meritocracia World Terrain Prototype</title>
  <link rel="stylesheet" href="./world.css" />
</head>
<body>
  <main class="world-shell">
    <section class="map-panel">
      <div class="map-stage" id="map-stage">
        <div class="zoom-controls">
          <button id="zoom-in"    type="button">＋</button>
          <button id="zoom-out"   type="button">－</button>
          <button id="zoom-reset" type="button">Reset</button>
          <input  id="zoom-input" type="number" min="1" max="100" step="0.1" value="1" />
          <button id="zoom-apply" type="button">Apply</button>
        </div>

        <div class="map-viewport" id="map-viewport">
          <img
            src="./assets/world-terrain-map.png"
            alt="Meritocracia World Terrain Prototype Map"
            class="terrain-map"
            id="terrain-map"
          />
          <!-- POI ピンはすべて JS が生成。
               各ピンは .poi-wrap > .poi の 2層構造になる。 -->
          <div class="poi-layer" id="poi-layer"></div>
        </div>
      </div>
    </section>

    <aside class="side-panel">
      <div class="side-inner">
        <p class="panel-kicker">WORLD MAP</p>
        <h1 class="panel-title">Terrain Prototype v1</h1>
        <p class="panel-desc" id="panel-desc">
          地形ベース画像に HTML overlay で POI を後載せする試作ワールドハブ。
```

## ./viewer/アーカイブ/クロード先生/途中式/files/修正依頼/world-data.js

```
/**
 * world-data.js
 * 責務: world-data.json の fetch・正規化・ディープコピー生成のみ。
 * DOM・状態・描画には一切触れない。
 *
 * ── ファイル構成 ─────────────────────────────────────────────
 * このモジュールは同一ディレクトリの "world-data.json" を読む前提。
 * フォルダ構成例:
 *
 *   world_terrain_prototype/
 *     index.html
 *     world.js                 ← エントリポイント
 *     world-data.js            ← このファイル
 *     world-data.json          ← POI・メタ情報の実体（必須）
 *     world-state.js
 *     world-utils.js
 *     world-viewport.js
 *     world-poi-renderer.js
 *     world-panel.js
 *     world-io.js
 *     world.css
 *     assets/
 *       world-terrain-map.png
 *
 * world-data.json が存在しない・パスが違う場合は
 * loadWorldData() が throw するので、呼び出し元の try/catch で
 * showLoadError() を呼んでください（world.js 側で処理済み）。
 * ─────────────────────────────────────────────────────────────
 */

import { normalizeScale, normalizeType } from "./world-utils.js";

/**
 * POI の生オブジェクトを正規化して複製する。
 * - scale が未指定 → 1
 * - type  が未指定 → "chip"
 * - その他フィールドはそのまま保持（後方互換）
 * @param {object} raw
 * @returns {object}
 */
```

## ./viewer/アーカイブ/クロード先生/途中式/files/修正依頼/world-data.json

```
{
  "map_id": "meritocracia_world_terrain_v1",
  "title": "Meritocracia World Terrain Prototype",
  "description": "Gemini地形画像を Terrain Base として採用し、POI を後載せする world hub 試作版。",
  "pois": [
    {
      "id": "brighton",
      "label": "首都ブライトン",
      "x": 53,
      "y": 58,
      "text": "南部平野と中央交通結節の中核。国家運営・政治・制度の中心拠点。",
      "link": "../nation/"
    },
    {
      "id": "grand_central",
      "label": "Grand Central",
      "x": 60,
      "y": 51,
      "text": "本編導線の中核都市。市場・行政・都市事件・各種DB接続の主要ハブ。",
      "link": "../city/grand-central/map/"
    },
    {
      "id": "academy",
      "label": "士官学校",
      "x": 63,
      "y": 56,
      "text": "ジェイドたちの成長舞台。学園編・制度教育・人物相関の主要接続点。",
      "link": "../../story/academy/"
    },
    {
      "id": "inquisition",
      "label": "審問庁",
      "x": 56,
      "y": 48,
      "text": "監視・調査・異常観測を担う国家機関。ZERO事件以降の違和感と深く関わる。",
      "link": "../nation/"
    }
  ],
  "quick_links": [
    {
```

## ./viewer/アーカイブ/クロード先生/途中式/files/修正依頼/world.css

```
:root {
  --bg: #07111f;
  --panel: rgba(8, 16, 28, 0.88);
  --panel-strong: rgba(10, 20, 34, 0.94);
  --line: rgba(198, 166, 106, 0.45);
  --gold: #c6a66a;
  --gold-strong: #e2c68d;
  --text: #f3ead8;
  --muted: #cfc2ab;
  --shadow: rgba(0, 0, 0, 0.35);
}

* {
  box-sizing: border-box;
}

html,
body {
  margin: 0;
  min-height: 100%;
  background:
    radial-gradient(circle at top, #0d2340 0%, #07111f 55%, #040a13 100%);
  color: var(--text);
  font-family:
    "Noto Serif JP",
    "Hiragino Mincho ProN",
    "Yu Mincho",
    serif;
}

body {
  padding: 20px;
}

.world-shell {
  display: grid;
  grid-template-columns: minmax(0, 1fr) 320px;
  gap: 18px;
  align-items: stretch;
  min-height: calc(100vh - 40px);
```

## ./viewer/アーカイブ/クロード先生/途中式/files/修正依頼/world.js

```
/**
 * world.js  ← エントリポイント（オーケストレーター）
 *
 * 責務: 各モジュールの初期化と結線のみ。
 * ロジックは一切ここに書かない。
 *
 * 依存グラフ（矢印は「依存する」方向）:
 *
 *   world.js
 *     ├─ world-data.js       fetch / normalize
 *     ├─ world-state.js      可変状態の管理
 *     ├─ world-utils.js      pure utils
 *     ├─ world-viewport.js   zoom / pan → DOM transform
 *     ├─ world-poi-renderer.js  POI DOM 生成・更新
 *     ├─ world-panel.js      右パネル UI 結線
 *     └─ world-io.js         export / reset
 */

import { loadWorldData }        from "./world-data.js";
import { initPois, setEditMode, getActivePoiId } from "./world-state.js";
import { initViewport, applyTransform } from "./world-viewport.js";
import { initPoiRenderer, renderPois }  from "./world-poi-renderer.js";
import { initPanel, renderQuickLinks, updatePanelForPoi, showLoadError } from "./world-panel.js";
import { initIO }               from "./world-io.js";

// ─── DOM 参照 ─────────────────────────────────────────────────

const $ = (id) => document.getElementById(id);

const el = {
  poiLayer:          $("poi-layer"),
  mapStage:          $("map-stage"),
  mapViewport:       $("map-viewport"),
  editTools:         $("edit-tools"),
  exportBtn:         $("export-btn"),
  resetBtn:          $("reset-btn"),
  exportOutput:      $("export-output"),
  poiScaleInput:     $("poi-scale-input"),
  poiScaleApplyBtn:  $("poi-scale-apply"),
  poiScaleResetBtn:  $("poi-scale-reset"),
```

## ./viewer/アーカイブ/クロード先生/途中式/files/修正依頼/ジェミニの回答.md

```
ジェミニの回答
ご提示いただいた前提条件と設計方針に基づき、既存の責務分離構造（Orchestratorパターン）を維持したまま、画像オーバーレイ機能を追加する修正案を作成しました。

新規に world-overlay-renderer.js を導入し、描画責務を完全に独立させています。
1. 変更点の要約と責務配置

    world-overlay-renderer.js (新規): 画像オーバーレイのDOM生成、配置（%指定）、z-index管理、不透明度設定を担当。

    index.html: map-viewport 内に、POIレイヤーより背面、地形画像より前面となる overlay-layer コンテナを追加。

    world-data.json: image_overlays 配列を定義。

    world-data.js: オーバーレイデータの読み込みと正規化（デフォルト値の設定）を追加。

    world.js: 新モジュールの初期化と結線のみを追加。

    world.css: オーバーレイ画像用の最小限のスタイル定義を追加。

2. 成果物
① index.html

terrain-map と poi-layer の間に overlay-layer を追加しました。

<div class="map-viewport" id="map-viewport">
          <img
            src="./assets/world-terrain-map.png"
            alt="Meritocracia World Terrain Prototype Map"
            class="terrain-map"
            id="terrain-map"
          />
          <div class="overlay-layer" id="overlay-layer"></div>
          
          <div class="poi-layer" id="poi-layer"></div>
        </div>


② world.css

絶対配置のためのクラスを追加。

```

## ./viewer/アーカイブ/クロード先生/途中式/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Meritocracia World Terrain Prototype</title>
  <link rel="stylesheet" href="./world.css" />
</head>
<body>
  <main class="world-shell">
    <section class="map-panel">
      <div class="map-stage" id="map-stage">
        <div class="zoom-controls">
          <button id="zoom-in"    type="button">＋</button>
          <button id="zoom-out"   type="button">－</button>
          <button id="zoom-reset" type="button">Reset</button>
          <input  id="zoom-input" type="number" min="1" max="100" step="0.1" value="1" />
          <button id="zoom-apply" type="button">Apply</button>
        </div>

        <div class="map-viewport" id="map-viewport">
          <img
            src="./assets/world-terrain-map.png"
            alt="Meritocracia World Terrain Prototype Map"
            class="terrain-map"
            id="terrain-map"
          />
          <!-- POI ピンはすべて JS が生成。
               各ピンは .poi-wrap > .poi の 2層構造になる。 -->
          <div class="poi-layer" id="poi-layer"></div>
        </div>
      </div>
    </section>

    <aside class="side-panel">
      <div class="side-inner">
        <p class="panel-kicker">WORLD MAP</p>
        <h1 class="panel-title">Terrain Prototype v1</h1>
        <p class="panel-desc" id="panel-desc">
          地形ベース画像に HTML overlay で POI を後載せする試作ワールドハブ。
```

## ./viewer/アーカイブ/クロード先生/途中式/world.css

```
:root {
  --bg: #07111f;
  --panel: rgba(8, 16, 28, 0.88);
  --panel-strong: rgba(10, 20, 34, 0.94);
  --line: rgba(198, 166, 106, 0.45);
  --gold: #c6a66a;
  --gold-strong: #e2c68d;
  --text: #f3ead8;
  --muted: #cfc2ab;
  --shadow: rgba(0, 0, 0, 0.35);
}

* {
  box-sizing: border-box;
}

html,
body {
  margin: 0;
  min-height: 100%;
  background:
    radial-gradient(circle at top, #0d2340 0%, #07111f 55%, #040a13 100%);
  color: var(--text);
  font-family:
    "Noto Serif JP",
    "Hiragino Mincho ProN",
    "Yu Mincho",
    serif;
}

body {
  padding: 20px;
}

.world-shell {
  display: grid;
  grid-template-columns: minmax(0, 1fr) 320px;
  gap: 18px;
  align-items: stretch;
  min-height: calc(100vh - 40px);
```

## ./viewer/アーカイブ/ジェミニ (コピー).html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AUTHORS PORTAL | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500&display=swap" rel="stylesheet">
    <style>
        :root {
            /* 温かみのあるダークトーン */
            --bg-color: #1a1614; 
            --card-bg: #241f1c;
            --gold: #b39764; /* アンティークゴールド */
            --sage: #7a8a71; /* 親しみやすさのセージグリーン */
            --text-main: #dcd6d0;
            --text-sub: #968d86;
            --border: #3d352f;
        }

        body {
            background-color: var(--bg-color);
            color: var(--text-main);
            font-family: 'Noto Serif JP', serif;
            margin: 0;
            line-height: 1.8;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 80px 20px;
        }

        header {
            text-align: center;
            margin-bottom: 80px;
        }

        .portal-label {
            font-family: 'Cinzel', serif;
```

## ./viewer/アーカイブ/ジェミニ.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AUTHORS PORTAL | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #0f0f0f;
            --card-bg: #1a1a1a;
            --gold: #c5a059;
            --text-main: #e0e0e0;
            --text-sub: #a0a0a0;
            --border: #333;
        }

        body {
            background-color: var(--bg-color);
            color: var(--text-main);
            font-family: 'Noto Serif JP', serif;
            margin: 0;
            line-height: 1.6;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 60px 20px;
        }

        header {
            text-align: center;
            margin-bottom: 80px;
        }

        .portal-label {
            font-family: 'Cinzel', serif;
            color: var(--gold);
            letter-spacing: 0.3em;
```

## ./viewer/アーカイブ/ジェミニテスト/2年生編.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="メリトクラシア -Reboot- 士官学校編 Wiki Phase2。2年生編〜3年生編：制度の矛盾、退学裁決、外部成長、そして特例復籍に至る長期運用設定資料。">
<title>Phase2：2年生〜3年生編 Wiki｜メリトクラシア -Reboot-</title>
<link rel="stylesheet" href="academy.css">
</head>
<body>

<header class="site-header">
  <nav class="header-breadcrumb" aria-label="パンくず">
    <a href="../../index.html">Meritocracia -Reboot-</a>
    <span class="breadcrumb-sep">›</span>
    <a href="../index.html">Story Wiki</a>
    <span class="breadcrumb-sep">›</span>
    <a href="../index.html">士官学校編</a>
    <span class="breadcrumb-sep">›</span>
    <span>Phase2（2年〜3年生編）</span>
  </nav>
  <span class="header-label">Meritocracia -Reboot- 中長期設定資料</span>
  <h1 class="header-title">Phase2：制度の裁定と変革</h1>
  <p class="header-subtitle">2年生「制度が才能を裁く」 ／ 外部成長 ／ 3年生「制度を壊し、制度を継ぐ」</p>
  <div class="header-meta">
    <span class="meta-tag"><span class="dot dot-confirmed"></span>Phase2 骨格確定</span>
    <span class="meta-tag">分類：世界観Wiki</span>
  </div>
</header>

<div class="toc-wrapper">
  <div class="toc-inner">
    <ul class="toc-list" id="toc-list"></ul>
  </div>
</div>

<main class="page-wrapper">

  <section class="section" id="system-taboo" data-toc-label="国家禁制領域">
    <div class="section-header">
```

## ./viewer/アーカイブ/ジェミニテスト/academy.css

```
/* ============================================================
   MERITOCRACIA -REBOOT-  /  ACADEMY WIKI CSS
   責任: スタイル定義のみ。構造・ロジックは各ファイルへ分離。
   増築: セクション固有スタイルはこのファイルの末尾に追加。
   ============================================================ */

/* ===== RESET & BASE ===== */
*, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }

:root {
  /* --- Background --- */
  --bg-primary:    #090b0f;
  --bg-secondary:  #0e1118;
  --bg-card:       #131720;
  --bg-card-hover: #181d29;
  --bg-inset:      #0c0e14;

  /* --- Border --- */
  --border-primary: #1c2030;
  --border-accent:  #252d3f;

  /* --- Text --- */
  --text-primary:   #d4d9e8;
  --text-secondary: #858da0;
  --text-muted:     #525a70;
  --text-heading:   #e8ecf6;

  /* --- Faction: ZG (Zeigert) --- */
  --zg-primary:  #4a80d4;
  --zg-secondary:#2e5aaa;
  --zg-dim:      #192a48;
  --zg-glow:     rgba(74,128,212,0.14);

  /* --- Faction: FO (Fortress Order) --- */
  --fo-primary:  #c84840;
  --fo-secondary:#8e322a;
  --fo-dim:      #3a1a18;
  --fo-glow:     rgba(200,72,64,0.14);

  /* --- Faction: VA --- */
```

## ./viewer/アーカイブ/ジェミニテスト/academy.js

```
/**
 * MERITOCRACIA -REBOOT-  /  ACADEMY WIKI JS
 * 責任: インタラクション・TOC自動追従のみ。
 * 増築: 新セクションは .section[id] を追加するだけで自動対応。
 */
(function () {
  'use strict';

  /* ============================================================
     1. AUTO TOC — セクションを動的に検出し TOC を自動構築・追従
     ============================================================ */
  var tocList = document.getElementById('toc-list');
  var sections = [];

  /**
   * DOM 内の全 .section[id] を走査して TOC を自動生成。
   * data-toc-label 属性があればその文字列を使用、なければ .section-title テキスト。
   * data-toc-stub="true" であればスタブ扱い（薄表示）。
   */
  function buildToc() {
    if (!tocList) return;

    var allSections = document.querySelectorAll('.section[id]');
    sections = [];

    // 既存の手動 li を削除（再構築）
    tocList.innerHTML = '';

    allSections.forEach(function (sec) {
      sections.push(sec);

      var id    = sec.getAttribute('id');
      var label = sec.getAttribute('data-toc-label');
      var isStub = sec.getAttribute('data-toc-stub') === 'true';

      if (!label) {
        var titleEl = sec.querySelector('.section-title');
        label = titleEl ? titleEl.textContent.trim() : id;
      }

```

## ./viewer/アーカイブ/ジェミニテスト/academy/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1.0">
  <title>Grand Central Map v2</title>
  <link rel="stylesheet" href="./v2.css">
</head>
<body>
  <header class="header">
    <h1>グランセントラル都市マップ v2</h1>
    <p>ドラッグで都市全体 → 士官学校詳細へ移動</p>
  </header>

  <main class="map-scroll">
    <section class="map-panel">
      <h2>都市全体</h2>
      <img src="../grand-central-map.png" alt="都市全体図">
    </section>

    <section class="map-panel">
      <h2>士官学校詳細</h2>
      <img src="../academy/academy-map.png" alt="士官学校詳細">
    </section>
  </main>
</body>
</html>```

## ./viewer/アーカイブ/ジェミニテスト/others_test_before_split.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>その他キャラ一覧 | MERITOCRACIA</title>
  <style>
    :root {
      --bg: #060b14;
      --bg2: #0b1320;
      --line: rgba(212, 175, 55, 0.18);
      --line-strong: rgba(212, 175, 55, 0.38);
      --text: #e8dcc0;
      --muted: #8f8368;
      --accent: #d4af37;
      --card: rgba(12, 18, 30, 0.86);
      --hover: rgba(212, 175, 55, 0.08);
    }

    * { box-sizing: border-box; }
    body {
      margin: 0;
      background:
        radial-gradient(circle at top, rgba(212,175,55,0.06), transparent 30%),
        linear-gradient(180deg, var(--bg), #050910 70%);
      color: var(--text);
      font-family: "Noto Serif JP", serif;
    }

    .wrap {
      max-width: 1080px;
      margin: 0 auto;
      padding: 40px 20px 80px;
    }

    .back-link {
      display: inline-block;
      margin-bottom: 24px;
      color: var(--muted);
      text-decoration: none;
```

## ./viewer/アーカイブ/ジェミニテスト/sanguinaria_test.json

```
{
  "meta": {
    "id": "統合議事録サンギナリア王国-強化アイデア整理仮採用前メモ",
    "slug": "統合議事録サンギナリア王国-強化アイデア整理仮採用前メモ",
    "source_format": "markdown",
    "source_path": "/home/lancer/DOCS/meritocracia-team-share/docs/settings/Meritocracia_Data_Hub/01_世界観・設定_Wiki/周辺国家/# 📘 統合議事録｜サンギナリア王国 強化アイデア整理（仮採用前メモ）.md",
    "access_level": "internal",
    "theme": "afterglow-memory"
  },
  "header": {
    "title": "📘 統合議事録｜サンギナリア王国 強化アイデア整理（仮採用前メモ）"
  },
  "sections": [
    {
      "id": "0-本議事録の目的",
      "title": "0. 本議事録の目的",
      "type": "text",
      "content": "本議事録は、すでに採用済みであるサンギナリア王国の国家概要を土台に、\nその上へ追加する形で「黒幕国家としての深層構造」「魂加工国家としての性質」\n「中央市場テロ事件・カーネル魂回収との接続」を検討するためのアイデア整理メモである。\n\n現時点では、国家概要そのものは採用済み。\nただし、中枢組織名・制度名・兵器化工程などの深層設定は正式固定ではなく、\nあくまで比較・検討用の仮案として扱う。\n\n---"
    },
    {
      "id": "1-採用済み国家概要前提",
      "title": "1. 採用済み国家概要（前提）",
      "type": "text",
      "content": "サンギナリア王国は、旧サンギス＝レグナ連合王国時代から続く最古参の王権国家であり、\n独立後も旧連合正統の継承者を自任している。\n\n国家思想の中核は以下の通り。\n\n- 血統正統主義\n- 神授秩序思想\n- 継承国家意識\n\nまた、メリトクラシアを\n「本来あるべき秩序を否定した危険国家」\nとして認識しており、\n対外的には穏健な伝統国家を装いながら、\n内部には選別・階級固定・異端排除の思想を抱えている。\n\n※この国家概要部分は採用済みとする。\n\n---"
    },
    {
      "id": "2-今回の整理で見えた大枠の方向性",
      "title": "2. 今回の整理で見えた大枠の方向性",
      "type": "text",
      "content": "深層設定案を比較した結果、\nサンギナリア王国は単なる宗教国家ではなく、\n**「魂加工国家」** として再設計する方向が最も強いと判断された。\n\nすなわち、サンギナリアは\n\n- 神を信仰する国家\nではなく、\n- 神の力や神性技術を、国家秩序維持のために転用・制度化する国家\n\nとして扱う方が、\nメリトクラシアとの思想対立が明確になり、\nカーネルの魂回収・兵器化にも強い必然性を与えられる。\n\n---"
    },
    {
      "id": "3-現時点で最も有力な方向性",
      "title": "3. 現時点で最も有力な方向性",
      "type": "text",
      "content": "### ベース案\n**魂加工国家型**\n\nこれを主軸とする。\n\n理由：\n- カーネル兵器化に最も納得感がある\n- 中央市場テロを「単なる宗教テロ」ではなく「魂資源の収穫作戦」として再解釈できる\n- サンギナリア独自の国家異様性が出る\n- メリトクラシアの「人間の努力と功績」への価値観と正面衝突する\n\n### フレーバーとして付与する案\n**半天使政体型**\n\nただしこれは主軸ではなく、\n国家中枢の上層だけに漂う異様さ・不気味さとして利用する。\n\n理由：\n- 雰囲気は非常に強いが、主軸にすると神の地上干渉制限と衝突しやすい\n- 国家全体を半天使化すると、世界観のパワーバランスが崩れやすい\n- よって、上層部の人格改造・神性上書きという形で限定運用するのが妥当\n\n---"
    },
    {
      "id": "4-サンギナリア深層構造の仮整理",
      "title": "4. サンギナリア深層構造の仮整理",
```

## ./viewer/アーカイブ/ジェミニテスト/サンギナリアテロ拠点.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>灰冠修道院 施設詳細MAP - メリトクラシア -Reboot- 設定資料</title>
    <style>
        :root {
            --bg-color: #101520; /* 参考画像のダークネイビー */
            --parchment-color: #d8c8a8; /* 参考画像の羊皮紙色 */
            --text-color: #d8c8a8;
            --accent-color: #c0b090; /* 古金・ブロンズ調 */
            
            /* 区画色（地上）- 表向きの善良さ */
            --color-front-gate: #8090b0; /* 青灰 */
            --color-chapel: #c0b080; /* 金茶 */
            --color-infirmary: #709070; /* 緑灰 */
            --color-cloister: #a0a090; /* 薄灰 */
            --color-garden: #608060; /* 深緑 */
            --color-graveyard: #707070; /* 灰 */
            
            /* 区画色（地下）- 裏の禁忌・炎翼セル */
            --color-crypt: #404050; /* 暗灰紫 */
            --color-ritual: #a04040; /* 暗赤 */
            --color-storage: #605040; /* 茶灰 */
            --color-command: #504050; /* 紫灰 */
            
            --border-style: 2px solid var(--accent-color);
        }

        body {
            background-color: var(--bg-color);
            color: var(--text-color);
            font-family: 'Times New Roman', serif; /* ファンタジー古文書風 */
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }
```

## ./viewer/アーカイブ/個別紹介 (コピー).html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AUTHOR PROFILE | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #1a1614; 
            --card-bg: #241f1c;
            --gold: #b39764;
            --sage: #7a8a71;
            --text-main: #dcd6d0;
            --text-sub: #968d86;
            --border: #3d352f;
        }

        body {
            background-color: var(--bg-color);
            color: var(--text-main);
            font-family: 'Noto Serif JP', serif;
            margin: 0;
            display: flex;
            justify-content: center;
            line-height: 1.8;
        }

        .profile-wrapper {
            width: 100%;
            max-width: 700px;
            padding: 80px 24px;
        }

        .hero-section {
            text-align: center;
            margin-bottom: 60px;
        }

        .section-label {
```

## ./viewer/アーカイブ/個別紹介.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AUTHOR PROFILE | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500&display=swap" rel="stylesheet">
    <style>
        /* CSS変数は一覧ページと共通 */
        :root {
            --bg-color: #0f0f0f;
            --card-bg: #1a1a1a;
            --gold: #c5a059;
            --text-main: #e0e0e0;
            --text-sub: #a0a0a0;
            --border: #333;
        }

        body {
            background-color: var(--bg-color);
            color: var(--text-main);
            font-family: 'Noto Serif JP', serif;
            margin: 0;
            display: flex;
            justify-content: center;
        }

        .profile-wrapper {
            width: 100%;
            max-width: 800px;
            padding: 40px 20px;
        }

        .hero-section {
            text-align: center;
            border-bottom: 1px solid var(--gold);
            padding-bottom: 40px;
            margin-bottom: 40px;
        }

```

## ./viewer/アーカイブ/個別紹介試作２.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AUTHOR PROFILE | Lancer’s Reading Blend</title>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,600;1,300&family=Noto+Serif+JP:wght@300;500&family=IM+Fell+English:ital@0;1&display=swap" rel="stylesheet">
    <style>
        :root {
            /* iris.html 継承：琥珀と羊皮紙のパレット */
            --amber-dark:   #2a1a0e;
            --amber-mid:    #3d2410;
            --amber-light:  #a0521a;
            --parchment:    #FFF8E7;
            --parchment-d:  #f5e8c8;
            --blend-gold:   #c4803a;
            --text-main:    #3d2410;
            --text-sub:     #6d4c31;
        }

        body {
            background-color: var(--parchment);
            color: var(--text-main);
            font-family: 'Noto Serif JP', serif;
            margin: 0;
            line-height: 1.8;
            display: flex;
            justify-content: center;
            transition: 0.6s ease;
        }

        /* Night Mode */
        body.night-mode {
            background-color: var(--amber-dark);
            --text-main: var(--parchment);
            --text-sub: var(--parchment-d);
        }

        .profile-wrapper {
            width: 100%;
```

## ./viewer/アーカイブ/短編小説/『デバッグ・ログ：20時06分の送信ボタン』.md

```
『デバッグ・ログ：20時06分の送信ボタン』

「お前さ、ハコ（段ボール）作るだけでいいと思ってるんじゃないだろうな？」

三原の怒声が、機械音に混じって鼓膜を叩く。五十代半ばか、あるいはもっと上か。脂ぎった顔を歪め、教わってもいない機械操作を「見て覚えろ」と迫るその姿は、前時代的な負の遺産そのものだった。

「……すみません」

私は喉の奥まで出かかった反論を、無理やり飲み込んだ。ここで言い返せば、この無意味な時間はさらに引き延ばされる。
私は渋々自分を宥め、重い足取りで作業台に戻った。
その後も、三原から投げられる「お願い」という名の雑務を、淡々と、従順なふりをしてこなしていく。

（……なんで、オレはこんなことをしているんだ？）

愛想笑いを浮かべ、指示に従う。そのたびに、自分という存在が少しずつ削られていくような感覚があった。
機械のラインは動き続ける。私の手も動く。
けれど、胸の奥に居座った黒いモヤモヤは、時間が経つほどに密度を増し、重く、苦しくなっていった。

工場を出て、送迎バスに乗り込む。
窓の外を流れる夜の景色は、今の自分の心境を映したように暗く、冷たい。
座席に深く身を沈め、スマホを取り出す。
画面に映る『メリトクラシア』の数字は、相変わらず伸び続けていた。

ネットの向こう側では、私の言葉を、私の世界を待っている人がいる。
なのに、現実の私は「お前」と呼ばれ、曖昧な指示に振り回され、一人の人間としての敬意すら払われていない。

「……もう、限界だ」

指が勝手に動いていた。
一人では整理しきれない感情を、AIの対話画面に叩きつける。
支離滅裂な怒り。悲しみ。そして、譲れない尊厳。
AIはそれらを冷静に受け止め、一つの「論理」へと形を変えて提示した。

私はその文面をコピーし、ショートメールの作成画面に貼り付ける。

件名：至急相談のご連絡

「お疲れ様です、宮下です。派遣先の就業環境のことで至急相談したいことがあり、連絡しました。……」

文字を目で追う。
```

## ./viewer/アーカイブ/試作品作者紹介.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lancer’s Reading Blend | MERITOCRACIA</title>
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,600;1,300&family=Noto+Serif+JP:wght@300;500&family=IM+Fell+English:ital@0;1&display=swap" rel="stylesheet">
<style>
/* ============================================================
   LANCER'S READING BLEND — PORTAL DESIGN
   コンセプト: 琥珀色の読書ラウンジ × ティーラベル
   ============================================================ */

:root {
  /* 琥珀・羊皮紙系（iris.htmlより継承） */
  --amber-dark:   #2a1a0e;
  --amber-mid:    #3d2410;
  --amber-light:  #a0521a;
  --parchment:    #FFF8E7;
  --parchment-d:  #f5e8c8;
  
  /* アクセント：ライティング・ゴールド */
  --blend-gold:   #c4803a;
  --text-main:    #3d2410;
  --text-sub:     #6d4c31;
}

body {
  background-color: var(--parchment);
  color: var(--text-main);
  font-family: 'Noto Serif JP', serif;
  margin: 0;
  transition: background-color 0.6s ease, color 0.6s ease;
}

/* Night Mode (iris.html 継承) */
body.night-mode {
  background-color: var(--amber-dark);
  color: var(--parchment);
  --text-main: var(--parchment);
```

## ./viewer/共有用/public-character/data_public.json

```
[
  {
    "id": "world-001",
    "category": "世界観",
    "tag": "WORLD",
    "title": "メリトクラシアとは",
    "desc": "能力主義を国家理念に掲げる都市国家。グローリアテストによる選抜制度を核とし、出自より実力が優先される社会を標榜する。しかしその制度の内側には、誰も語らない歪みが宿っている。",
    "link": null,
    "link_label": null,
    "public": true
  },
  {
    "id": "world-002",
    "category": "世界観",
    "tag": "SYSTEM",
    "title": "グローリアテスト",
    "desc": "国家が管理する選抜試験。合格者のみが審問庁・士官学校への門を開かれる。複数科目制で部分合格が認められており、平民にとって唯一の階層突破ルートとなっている。",
    "link": null,
    "link_label": null,
    "public": true
  },
  {
    "id": "world-003",
    "category": "世界観",
    "tag": "NATION",
    "title": "国家機関の構造",
    "desc": "三兵団（ZG・FO・VA）と審問庁・士官学校統括院を中心に構成される中央政府。Duke ロータスを頂点とした統治体制が、秩序・武力・真実の三軸で国家を維持している。",
    "link": "../db/nation/index.html",
    "link_label": "国家アーカイブへ →",
    "public": true
  },
  {
    "id": "world-004",
    "category": "世界観",
    "tag": "RANK",
    "title": "階級と出自",
    "desc": "貴族・上位市民・平民の三層構造が存在する。建前上は能力主義だが、士官学校への推薦枠・試験情報の非対称性など、構造的な不公平は随所に残っている。",
    "link": null,
    "link_label": null,
    "public": true
```

## ./viewer/共有用/public-character/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="MERITOCRACIA | 公式キャラクターアーカイブ">
  <title>CHARACTERS | MERITOCRACIA</title>

  <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700&family=Noto+Serif+JP:wght@300;400;500&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="../../official-site/assets/public.css">
</head>
<body>

<header class="site-header">
  <div class="header-inner">
    <div class="header-left">
      <span class="header-label">CHARACTER ARCHIVE</span>
      <h1 class="site-title">MERITOCRACIA</h1>
      <p class="site-tagline">登場人物データベース</p>
    </div>
  </div>
</header>

<section class="hero">
  <div class="hero-inner">
    <p class="hero-catch">人物から世界へ入る——</p>
    <p class="hero-sub">
      メリトクラシアを形作る主要人物たち。<br>
      物語の入口となる4名を公開中。
    </p>
  </div>
</section>

<section class="archive-section">
  <div class="section-inner">
    <div class="section-header">
      <span class="section-num">CHARACTERS</span>
      <h2 class="section-title">主要人物</h2>
    </div>

```

## ./viewer/共有用/public-character/public.css

```
/* ============================================================
   MERITOCRACIA — 公開用スタイルシート
   ファイル: assets/public.css
   用途: index.html（一般公開）専用
   index_internal.html とは共有しない（独立CSS）
   ============================================================ */

/* ============================================================
   カスタムプロパティ
   ============================================================ */
:root {
  --bg:      #070910;
  --bg2:     #0b0e18;
  --bg3:     #101420;
  --bg4:     #161b28;
  --gold:    #c8a45a;
  --gold2:   #e5c97e;
  --gold3:   #f5dfa0;
  --text:    #cfc4ae;
  --text2:   #7a6e5a;
  --text3:   #3a4858;
  --border:  rgba(200,164,90,0.12);
  --border2: rgba(200,164,90,0.25);
  --red:     #8b2020;
}

/* ============================================================
   リセット & ベース
   ============================================================ */
*, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }
html { scroll-behavior: smooth; }

body {
  background: var(--bg);
  color: var(--text);
  font-family: 'Noto Serif JP', serif;
  line-height: 1.9;
  overflow-x: hidden;
}

```

## ./viewer/共有用/reading-blend/author.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Author Profile | Lancer's Reading Blend</title>
<link rel="stylesheet" href="./blend.css">
</head>
<body>

<header class="blend-header" style="padding:50px 20px 40px;">
  <span class="header-brand">Lancer's Reading Blend</span>
  <p class="header-subtitle" style="margin-top:8px;">AUTHOR PROFILE</p>
</header>

<nav class="blend-nav">
  <a href="./index.html">← Lounge</a>
  <a href="../index.html">Hub</a>
</nav>

<div class="profile-wrapper">

  <!-- Hero -->
  <div class="profile-hero" id="profile-hero">
    <div id="avatar-wrap"></div>
    <span class="section-eyebrow" id="disp-blend-type">Selected Blender</span>
    <h1 class="profile-name" id="disp-name">—</h1>
    <span class="profile-name-en" id="disp-name-en"></span>
    <p class="profile-catchphrase" id="disp-catchphrase"></p>
    <div class="tag-row" id="disp-tags" style="justify-content:center; margin-top:16px;"></div>
  </div>

  <!-- Bio -->
  <div class="profile-card">
    <span class="section-eyebrow">Description</span>
    <p id="disp-bio" style="margin-top:14px; font-size:0.97rem; color:var(--text-sub); line-height:1.95;"></p>
  </div>

  <!-- Lancer's Note -->
  <div class="profile-card" id="note-card">
```

## ./viewer/共有用/reading-blend/authors.json

```
{
  "portal": {
    "title": "Lancer's Reading Blend",
    "subtitle": "今夜、おすすめしたい物語",
    "tagline": "SELECTORS LOUNGE",
    "curator": "Lancer"
  },
  "authors": [
    {
      "id": "sample_author_01",
      "name": "架空の作者 １",
      "name_en": "Sample Author 01",
      "catchphrase": "静かな夜に沁みる一杯",
      "genre": "異世界戦記 / 心理描写",
      "blend_type": "Master Blender",
      "permission_date": "2025-04-01",
      "avatar": "",
      "avatar_fallback": "架空の作者 １",
      "bio": "緻密な設定と心理描写で描かれる異世界戦記。国家の在り方を問うその姿勢は、メリトクラシアの世界観とも深く共鳴します。琥珀色の空気が漂う、静謐な筆致が魅力です。",
      "lancer_note": "この物語は、まるで冷え切った夜に差し出される熱いアールグレイのようです。一口ごとに、閉ざされていた心がほどけていく感覚を味わってください。静かに燃え続ける問いが、読後もずっと胸に残ります。",
      "works": [
        { "title": "サンプル作品 A", "platform": "narou" },
        { "title": "サンプル作品 A", "platform": "kakuyomu" }
      ],
      "links": {
        "narou": "https://ncode.syosetu.com/",
        "kakuyomu": "https://kakuyomu.jp/",
        "x": "https://x.com/",
        "official": ""
      },
      "tags": ["戦記", "能力主義", "心理描写", "哲学的"],
      "featured": true
    },
    {
      "id": "sample_author_02",
      "name": "架空の作者 ２",
      "name_en": "Sample Author 02",
      "catchphrase": "夜と記憶をたゆたう",
      "genre": "都市ファンタジー / ミステリ",
      "blend_type": "Selected Blender",
```

## ./viewer/共有用/reading-blend/blend.css

```
/* ============================================================
   LANCER'S READING BLEND — Shared Stylesheet
   琥珀 × 羊皮紙 × 夜読書ラウンジ
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,500;0,600;1,300;1,400&family=Noto+Serif+JP:wght@300;400;500&family=IM+Fell+English:ital@0;1&display=swap');

/* ────── カラー変数 ────── */
:root {
  --amber-darkest: #1c1008;
  --amber-dark:    #2a1a0e;
  --amber-mid:     #3d2410;
  --amber-warm:    #6b3a1a;
  --amber-light:   #a0521a;
  --blend-gold:    #c4803a;
  --blend-gold2:   #d9954d;
  --parchment:     #FFF8E7;
  --parchment-d:   #f5e8c8;
  --parchment-dd:  #e8d5a8;
  --text-main:     #3d2410;
  --text-sub:      #6d4c31;
  --text-muted:    #9a7a5a;
  --border-light:  rgba(160,82,26,0.12);
  --border-gold:   rgba(196,128,58,0.35);
  --shadow-warm:   rgba(61,36,16,0.08);
}

/* ────── Night Mode ────── */
body.night-mode {
  --parchment:    #1c1008;
  --parchment-d:  #251508;
  --parchment-dd: #2a1a0e;
  --text-main:    #f0e0c0;
  --text-sub:     #c8a878;
  --text-muted:   #907060;
  --border-light: rgba(196,128,58,0.15);
  --border-gold:  rgba(196,128,58,0.4);
  --shadow-warm:  rgba(0,0,0,0.4);
}

```

## ./viewer/共有用/reading-blend/blend.js

```
/* ============================================================
   LANCER'S READING BLEND — Shared JS
   責務: Night Mode / ストレージ永続化 / fetch utility
   ============================================================ */
'use strict';

/* ── Night Mode ── */
const STORAGE_KEY = 'blend_night';

function applyNightMode(on) {
  document.body.classList.toggle('night-mode', on);
  const btn = document.getElementById('mode-toggle-btn');
  if (btn) btn.textContent = on ? 'Day' : 'Night';
  localStorage.setItem(STORAGE_KEY, on ? '1' : '0');
}

function initNightMode() {
  const saved = localStorage.getItem(STORAGE_KEY);
  // デフォルト: 22時〜6時は自動Night
  const hour = new Date().getHours();
  const autoNight = hour >= 22 || hour < 6;
  const on = saved !== null ? saved === '1' : autoNight;
  applyNightMode(on);

  const btn = document.getElementById('mode-toggle-btn');
  if (btn) {
    btn.addEventListener('click', () => {
      applyNightMode(!document.body.classList.contains('night-mode'));
    });
  }
}

/* ── fetch authors.json ── */
async function fetchAuthors(path = './authors.json') {
  try {
    const res = await fetch(path);
    if (!res.ok) throw new Error(`HTTP ${res.status}`);
    return await res.json();
  } catch (err) {
    console.error('[Reading Blend] authors.json 読み込み失敗:', err);
```

## ./viewer/共有用/reading-blend/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Lancer's Reading Blend | MERITOCRACIA</title>
  <meta name="description" content="Lancerによる読書企画・作者紹介ラウンジ">
  <link rel="stylesheet" href="./blend.css">
</head>
<body>

<header class="blend-header">
  <span class="header-brand">Lancer's Reading Blend</span>
  <h1 class="header-title">今夜、おすすめしたい物語</h1>
  <p class="header-subtitle">SELECTORS LOUNGE</p>
</header>

<nav class="blend-nav">
  <a href="./index.html">Lounge</a>
  <a href="../index.html">← Hub</a>
</nav>

<main class="blend-container">

  <!-- 企画説明 -->
  <section class="blend-card">
    <span class="featured-banner">— Review Event —</span>
    <h2 style="margin-bottom:16px;">#RTした人の小説を読みに行く</h2>
    <p class="author-bio">
      Xで開催中の読書感想企画です。<br>
      先着順で順番に読み、あなたの希望スタイルに合わせて感想をお届けします。
    </p>
  </section>

  <!-- 感想ルール -->
  <section class="blend-card">
    <h2 style="margin-bottom:16px;">📘 企画ルール</h2>
    <p class="author-bio">
      ・<strong>一日一作品（1名）</strong> ずつ読みます。<br>
      ・ご希望の感想オプションに合わせて返信します。<br>
```

## ./viewer/共有用/work-os-demo/app.js

```
/* ============================================================
   MERITOCRACIA OS — 作業卓 / app.js  v2
   責務: 時計 / 週間スケジュール / ポモドーロ / 初期化
   ============================================================ */
'use strict';

/* ══════════════════════════════════════
   定数・ユーティリティ
══════════════════════════════════════ */
const DAY_KEYS = ['SUN','MON','TUE','WED','THU','FRI','SAT'];
const DAYS_JP  = ['日','月','火','水','木','金','土'];
const BLOCKS   = [
  { key: 'morning',   label: 'MORNING   06:00–12:00', min: [6*60, 12*60] },
  { key: 'afternoon', label: 'AFTERNOON 12:00–18:00', min: [12*60, 18*60] },
  { key: 'night',     label: 'NIGHT     18:00–06:00', min: [18*60, 30*60] },
];

const pad = n => String(n).padStart(2, '0');

/** "HH:MM" → 分数（深夜0〜5時は+24h） */
function t2m(t) {
  const [h, m] = t.split(':').map(Number);
  return (h < 6 ? h + 24 : h) * 60 + m;
}

/** 現在分数（深夜補正） */
function nowMin() {
  const d = new Date();
  const h = d.getHours();
  return (h < 6 ? h + 24 : h) * 60 + d.getMinutes();
}

/** 今日の DAY_KEY ("MON"〜"SUN") */
function todayKey() {
  return DAY_KEYS[new Date().getDay()];
}

/* ══════════════════════════════════════
   時計
══════════════════════════════════════ */
```

## ./viewer/共有用/work-os-demo/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MERITOCRACIA OS — 作業卓</title>
<link rel="stylesheet" href="./style.css">
</head>
<body>
<div class="ps-wrap">

  <!-- ヘッダー -->
  <div class="ps-top-bar">
    <div class="ps-site-label">MERITOCRACIA — 作業卓</div>
    <div class="ps-clock-block">
      <div id="ps-clock-time">00:00:00</div>
      <div id="ps-clock-date">----/--/--</div>
    </div>
  </div>

  <!-- 週間プログレス -->
  <div class="ps-weekly-progress">
    <div class="ps-wp-header">
      <span class="ps-wp-label">WEEKLY PROGRESS</span>
      <span id="ps-wp-pct">0%</span>
    </div>
    <div class="ps-wp-bar">
      <div class="ps-wp-fill" id="ps-wp-fill"></div>
    </div>
  </div>

  <!-- 2カラム -->
  <div class="ps-main-grid">

    <!-- ポモドーロ -->
    <div class="ps-card">
      <span class="ps-card-label">POMODORO TIMER</span>
      <div id="ps-pomo-mode">WORK</div>

      <div class="ps-ring-wrap">
```

## ./viewer/共有用/work-os-demo/schedule.json

```
{
  "week": "2025-W15",
  "weekly_progress": 42,
  "days": {
    "MON": {
      "label": "月",
      "tasks": [
        { "time": "18:00", "label": "執筆", "cat": "writing", "block": "night" },
        { "time": "22:00", "label": "シーン確認", "cat": "writing", "block": "night" },
        { "time": "02:00", "label": "就寝", "cat": "rest", "block": "night" }
      ]
    },
    "TUE": {
      "label": "火",
      "tasks": [
        { "time": "18:00", "label": "執筆", "cat": "writing", "block": "night" },
        { "time": "19:30", "label": "仮眠", "cat": "rest", "block": "night" },
        { "time": "22:00", "label": "会議", "cat": "meeting", "block": "night" },
        { "time": "23:00", "label": "シーン27以降", "cat": "writing", "block": "night" },
        { "time": "02:00", "label": "就寝", "cat": "rest", "block": "night" }
      ]
    },
    "WED": {
      "label": "水",
      "tasks": [
        { "time": "14:00", "label": "シナリオ会議", "cat": "meeting", "block": "afternoon" },
        { "time": "18:00", "label": "ep06 本編執筆", "cat": "writing", "block": "night" },
        { "time": "23:00", "label": "Viewer UI調整", "cat": "dev", "block": "night" },
        { "time": "02:00", "label": "就寝", "cat": "rest", "block": "night" }
      ]
    },
    "THU": {
      "label": "木",
      "tasks": [
        { "time": "18:00", "label": "執筆", "cat": "writing", "block": "night" },
        { "time": "22:00", "label": "RAG確認", "cat": "dev", "block": "night" },
        { "time": "02:00", "label": "就寝", "cat": "rest", "block": "night" }
      ]
    },
    "FRI": {
```

## ./viewer/共有用/work-os-demo/style.css

```
/* ============================================================
   MERITOCRACIA OS — 作業卓 / private-schedule
   prefix: ps-  (production-schedule)
   v2: 週間時間割UI対応
   ============================================================ */

:root {
  --ps-bg:       #07090f;
  --ps-bg2:      #0e1320;
  --ps-bg3:      #141c2e;
  --ps-amber:    #c8841a;
  --ps-amber2:   #e8a030;
  --ps-amber3:   #f5c060;
  --ps-dim:      #4a3c28;
  --ps-text:     #d4c5a9;
  --ps-text2:    #7a6e5e;
  --ps-text3:    #4a4030;
  --ps-green:    #2a8a4a;
  --ps-green2:   #3dbb66;
  --ps-blue:     #1e3a5f;
  --ps-blue2:    #2980b9;
  --ps-purple:   #3e1e5f;
  --ps-purple2:  #9b59b6;
  --ps-red:      #8a2020;
  --ps-border:   rgba(200,132,26,0.18);
  --ps-shadow:   rgba(0,0,0,0.6);
  --ps-r:        16px;
}

/* ────── リセット ────── */
.ps-wrap * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

/* ────── ベース ────── */
body {
  background: var(--ps-bg);
  color: var(--ps-text);
```

## ./viewer/共有用/小説レビューレポート/index.html

```
./night-review-vol1/
```

## ./viewer/共有用/小説レビューレポート/iris-sweet-letter-v1/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">

    <!-- ▼ テーマ切替はここ1行だけ変える -->
    <link rel="stylesheet" href="./themes/iris-classic.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

```

## ./viewer/共有用/小説レビューレポート/iris-sweet-letter-v1/iris-classic.css

```
/* ============================================================
   iris-classic.css — Gemini版 完全移植
   ☕ 春の夜 × アールグレイ × 素朴な高級感
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap');

:root {
    --ink:       #3a2d28;
    --paper:     #fffcf5;
    --gold:      #b39764;
    --accent:    #8ba58d;   /* 春の芽吹き */
    --night-bg:  #1a1614;
    --shadow:    rgba(0,0,0,0.2);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.8;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：春の夜 */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background: radial-gradient(circle at top right, #2c2520 0%, #1a1614 100%);
    z-index: -1;
}

.letter-container {
    max-width: 700px;
    width: 100%;
```

## ./viewer/共有用/小説レビューレポート/iris-sweet-letter-v1/iris-luxury.css

```
/* ============================================================
   iris-luxury.css — 公爵家メイド / 高級便箋
   💚 深緑 × 金箔 × 封蝋 × 最上級のご褒美感
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=IM+Fell+English:ital@0;1&display=swap');

:root {
    --ink:       #1a2a1a;
    --paper:     #f4f0e6;
    --gold:      #c9a84c;
    --gold2:     #e8c97a;
    --accent:    #2d5a2d;   /* 深緑 */
    --accent2:   #4a8a4a;
    --wax:       #8b1a1a;   /* 封蝋 */
    --night-bg:  #0a120a;
    --shadow:    rgba(0,0,0,0.5);
    --border-op: 0.6;
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：深緑の夜 × 金粒子 */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 20% 10%, rgba(45,90,45,0.18) 0%, transparent 50%),
        radial-gradient(ellipse at 80% 90%, rgba(201,168,76,0.08) 0%, transparent 50%),
```

## ./viewer/共有用/小説レビューレポート/iris-sweet-letter-v1/iris-nightlounge.css

```
/* ============================================================
   iris-nightlounge.css — 深夜読書ラウンジ
   🌙 黒 × 琥珀 × ランプ光 × Reading Blend 接続版
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=IM+Fell+English:ital@0;1&display=swap');

:root {
    --ink:       #e8d8b8;   /* 羊皮紙文字色 */
    --ink-dark:  #c8a878;
    --paper:     #12100c;   /* 黒便箋 */
    --paper2:    #1a160e;
    --amber:     #c8841a;
    --amber2:    #e8a030;
    --amber3:    #f5c060;
    --amber-dim: rgba(200,132,26,0.18);
    --night-bg:  #07090f;
    --shadow:    rgba(0,0,0,0.8);
    --border:    rgba(200,132,26,0.3);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：ランプ光 × 深夜ラウンジ */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 50% 0%,    rgba(200,132,26,0.12) 0%, transparent 50%),
```

## ./viewer/共有用/小説レビューレポート/iris-sweet-letter-v1/iris-springtea.css

```
/* ============================================================
   iris-springtea.css — 春摘みダージリン
   🌸 桜色 × 新芽グリーン × 薄金 × 柔らかい余韻
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=Zen+Old+Mincho:wght@400;700&display=swap');

:root {
    --ink:      #3a2830;
    --paper:    #fff8f5;
    --gold:     #c8a86a;
    --sakura:   #e8a0b0;    /* 桜 */
    --sakura2:  #f5c8d0;
    --sprout:   #7aaa7a;    /* 新芽 */
    --sprout2:  #a0c890;
    --night-bg: #180f14;
    --shadow:   rgba(60,20,40,0.25);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：春の朝霧 */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 15% 0%,   rgba(232,160,176,0.15) 0%, transparent 45%),
        radial-gradient(ellipse at 85% 100%,  rgba(122,170,122,0.12) 0%, transparent 45%),
        radial-gradient(ellipse at 50% 50%,   rgba(200,168,106,0.05) 0%, transparent 60%),
```

## ./viewer/共有用/小説レビューレポート/iris-sweet-letter-v1/letter.js

```
/* ============================================================
   Letter from Iris — letter.js
   review.json を fetch して DOM に流し込む
   ============================================================ */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
    fetch('./review.json')
        .then(res => {
            if (!res.ok) throw new Error(`HTTP ${res.status}`);
            return res.json();
        })
        .then(data => {
            /* 基本情報 */
            document.getElementById('recipient').textContent  = data.recipient;
            document.getElementById('intro-text').innerText   = data.intro;
            document.getElementById('tea-name').textContent   = data.tea_service;
            document.getElementById('read-count').textContent = data.read_count;
            document.getElementById('review-summary').textContent = data.summary;
            document.getElementById('sign-name').textContent  = data.sign;

            /* 本文段落生成 */
            const body = document.getElementById('letter-body');
            data.body.forEach(paragraph => {
                const p = document.createElement('p');
                p.textContent = paragraph;
                body.appendChild(p);
            });

            /* フェードイン（Gemini版と同じ挙動） */
            setTimeout(() => {
                document.getElementById('container').style.opacity = '1';
            }, 100);
        })
        .catch(err => {
            console.error('[Letter from Iris] 読み込みエラー:', err);
            document.body.innerHTML =
                `<p style="color:#c8a050;text-align:center;padding:60px 20px;font-family:serif;">
                    お手紙を読み込めませんでした<br><small>${err.message}</small>
                </p>`;
```

## ./viewer/共有用/小説レビューレポート/iris-sweet-letter-v1/luxury.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">

    <!-- ▼ テーマ切替はここ1行だけ変える -->
    <link rel="stylesheet" href="./themes/iris-classic.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

```

## ./viewer/共有用/小説レビューレポート/iris-sweet-letter-v1/night.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">

    <!-- ▼ テーマ切替はここ1行だけ変える -->
   <link rel="stylesheet" href="./iris-nightlounge.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

```

## ./viewer/共有用/小説レビューレポート/iris-sweet-letter-v1/review.json

```
{
  "recipient": "Resetter",
  "intro": "こ、こんにちは　Resetter様！\n私メイドのアイリス・アールグレイが\nLANCERに代わって感想をお伝えしようと思います。",
  "tea_service": "春摘みのダージリン（ファーストフラッシュ）",
  "read_count": "9話",
  "summary": "暖かな春が訪れているにも関わらず、背筋が凍るようなお話でした・・・。",
  "body": [
    "お、お家賃安すぎます・・・！日本の地方都市と言えどもこれは破格です。ただ入居条件がこの作品の肝だと感じました。ツッコミどころを用意してインパクト与える面白い仕掛けだと読んでて思いました。",
    "文章自体は全体的に読みやすくて、苦に感じませんでした！流動的な物語の運び、流石作者様の力量を感じました！",
    "読んでて混乱したのは、おっさんなのに語尾というか言葉遣いや地の文が女性っぽいという点。でも設定として面白いです・・・！",
    "会話がメインで構成されていて、地の文は少なめ。意図的なのかテンポ感意識して敢えて削ってるのか読んでて気になりました。僭越ながら苦言を呈するなら、地の文を増やした方がより情景をイメージしやすい回もあるかな？と思う部分はありました。",
    "でも読んでて非常にワクワクしました！引き続き応援しております・・・！"
  ],
  "sign": "アイリス・アールグレイ"
}
```

## ./viewer/共有用/小説レビューレポート/iris-sweet-letter-v1/spring.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">

    <!-- ▼ テーマ切替はここ1行だけ変える -->
   <link rel="stylesheet" href="./iris-springtea.css">
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

            <footer class="letter-footer">
```

## ./viewer/共有用/小説レビューレポート/iris-theme-gallery-v1/iris-classic.css

```
/* ============================================================
   iris-classic.css — Gemini版 完全移植
   ☕ 春の夜 × アールグレイ × 素朴な高級感
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap');

:root {
    --ink:       #3a2d28;
    --paper:     #fffcf5;
    --gold:      #b39764;
    --accent:    #8ba58d;   /* 春の芽吹き */
    --night-bg:  #1a1614;
    --shadow:    rgba(0,0,0,0.2);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.8;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：春の夜 */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background: radial-gradient(circle at top right, #2c2520 0%, #1a1614 100%);
    z-index: -1;
}

.letter-container {
    max-width: 700px;
    width: 100%;
```

## ./viewer/共有用/小説レビューレポート/iris-theme-gallery-v1/iris-luxury.css

```
/* ============================================================
   iris-luxury.css — 公爵家メイド / 高級便箋
   💚 深緑 × 金箔 × 封蝋 × 最上級のご褒美感
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=IM+Fell+English:ital@0;1&display=swap');

:root {
    --ink:       #1a2a1a;
    --paper:     #f4f0e6;
    --gold:      #c9a84c;
    --gold2:     #e8c97a;
    --accent:    #2d5a2d;   /* 深緑 */
    --accent2:   #4a8a4a;
    --wax:       #8b1a1a;   /* 封蝋 */
    --night-bg:  #0a120a;
    --shadow:    rgba(0,0,0,0.5);
    --border-op: 0.6;
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：深緑の夜 × 金粒子 */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 20% 10%, rgba(45,90,45,0.18) 0%, transparent 50%),
        radial-gradient(ellipse at 80% 90%, rgba(201,168,76,0.08) 0%, transparent 50%),
```

## ./viewer/共有用/小説レビューレポート/iris-theme-gallery-v1/iris-nightlounge.css

```
/* ============================================================
   iris-nightlounge.css — 深夜読書ラウンジ
   🌙 黒 × 琥珀 × ランプ光 × Reading Blend 接続版
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=IM+Fell+English:ital@0;1&display=swap');

:root {
    --ink:       #e8d8b8;   /* 羊皮紙文字色 */
    --ink-dark:  #c8a878;
    --paper:     #12100c;   /* 黒便箋 */
    --paper2:    #1a160e;
    --amber:     #c8841a;
    --amber2:    #e8a030;
    --amber3:    #f5c060;
    --amber-dim: rgba(200,132,26,0.18);
    --night-bg:  #07090f;
    --shadow:    rgba(0,0,0,0.8);
    --border:    rgba(200,132,26,0.3);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：ランプ光 × 深夜ラウンジ */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 50% 0%,    rgba(200,132,26,0.12) 0%, transparent 50%),
```

## ./viewer/共有用/小説レビューレポート/iris-theme-gallery-v1/iris-springtea.css

```
/* ============================================================
   iris-springtea.css — 春摘みダージリン
   🌸 桜色 × 新芽グリーン × 薄金 × 柔らかい余韻
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=Zen+Old+Mincho:wght@400;700&display=swap');

:root {
    --ink:      #3a2830;
    --paper:    #fff8f5;
    --gold:     #c8a86a;
    --sakura:   #e8a0b0;    /* 桜 */
    --sakura2:  #f5c8d0;
    --sprout:   #7aaa7a;    /* 新芽 */
    --sprout2:  #a0c890;
    --night-bg: #180f14;
    --shadow:   rgba(60,20,40,0.25);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：春の朝霧 */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 15% 0%,   rgba(232,160,176,0.15) 0%, transparent 45%),
        radial-gradient(ellipse at 85% 100%,  rgba(122,170,122,0.12) 0%, transparent 45%),
        radial-gradient(ellipse at 50% 50%,   rgba(200,168,106,0.05) 0%, transparent 60%),
```

## ./viewer/共有用/小説レビューレポート/iris-theme-gallery-v1/letter-archive.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter Archive | Iris Sweet Review</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=IM+Fell+English:ital@0;1&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg:      #07090f;
            --amber:   #c8841a;
            --amber2:  #e8a030;
            --amber3:  #f5c060;
            --text:    #d4c5a9;
            --text2:   #7a6e5e;
            --border:  rgba(200,132,26,0.2);
        }

        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            background: var(--bg);
            color: var(--text);
            font-family: 'Noto Serif JP', serif;
            min-height: 100vh;
            padding: 48px 20px 80px;
        }

        /* グリッド背景 */
        body::before {
            content: '';
            position: fixed;
            inset: 0;
            background-image:
                linear-gradient(rgba(200,132,26,0.025) 1px, transparent 1px),
                linear-gradient(90deg, rgba(200,132,26,0.025) 1px, transparent 1px);
            background-size: 40px 40px;
            pointer-events: none;
            z-index: 0;
        }
```

## ./viewer/共有用/小説レビューレポート/iris-theme-gallery-v1/letter.js

```
/* ============================================================
   Letter from Iris — letter.js
   review.json を fetch して DOM に流し込む
   ============================================================ */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
    fetch('./review.json')
        .then(res => {
            if (!res.ok) throw new Error(`HTTP ${res.status}`);
            return res.json();
        })
        .then(data => {
            /* 基本情報 */
            document.getElementById('recipient').textContent  = data.recipient;
            document.getElementById('intro-text').innerText   = data.intro;
            document.getElementById('tea-name').textContent   = data.tea_service;
            document.getElementById('read-count').textContent = data.read_count;
            document.getElementById('review-summary').textContent = data.summary;
            document.getElementById('sign-name').textContent  = data.sign;

            /* 本文段落生成 */
            const body = document.getElementById('letter-body');
            data.body.forEach(paragraph => {
                const p = document.createElement('p');
                p.textContent = paragraph;
                body.appendChild(p);
            });

            /* フェードイン（Gemini版と同じ挙動） */
            setTimeout(() => {
                document.getElementById('container').style.opacity = '1';
            }, 100);
        })
        .catch(err => {
            console.error('[Letter from Iris] 読み込みエラー:', err);
            document.body.innerHTML =
                `<p style="color:#c8a050;text-align:center;padding:60px 20px;font-family:serif;">
                    お手紙を読み込めませんでした<br><small>${err.message}</small>
                </p>`;
```

## ./viewer/共有用/小説レビューレポート/iris-theme-gallery-v1/luxury.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Luxury | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-luxury.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
```

## ./viewer/共有用/小説レビューレポート/iris-theme-gallery-v1/night.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Night Lounge | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-nightlounge.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
```

## ./viewer/共有用/小説レビューレポート/iris-theme-gallery-v1/review.json

```
{
  "recipient": "Resetter",
  "intro": "こ、こんにちは　Resetter様！\n私メイドのアイリス・アールグレイが\nLANCERに代わって感想をお伝えしようと思います。",
  "tea_service": "春摘みのダージリン（ファーストフラッシュ）",
  "read_count": "9話",
  "summary": "暖かな春が訪れているにも関わらず、背筋が凍るようなお話でした・・・。",
  "body": [
    "お、お家賃安すぎます・・・！日本の地方都市と言えどもこれは破格です。ただ入居条件がこの作品の肝だと感じました。ツッコミどころを用意してインパクト与える面白い仕掛けだと読んでて思いました。",
    "文章自体は全体的に読みやすくて、苦に感じませんでした！流動的な物語の運び、流石作者様の力量を感じました！",
    "読んでて混乱したのは、おっさんなのに語尾というか言葉遣いや地の文が女性っぽいという点。でも設定として面白いです・・・！",
    "会話がメインで構成されていて、地の文は少なめ。意図的なのかテンポ感意識して敢えて削ってるのか読んでて気になりました。僭越ながら苦言を呈するなら、地の文を増やした方がより情景をイメージしやすい回もあるかな？と思う部分はありました。",
    "でも読んでて非常にワクワクしました！引き続き応援しております・・・！"
  ],
  "sign": "アイリス・アールグレイ"
}
```

## ./viewer/共有用/小説レビューレポート/iris-theme-gallery-v1/spring.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Spring Tea | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-springtea.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
```

## ./viewer/共有用/小説レビューレポート/letter-archive.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>IRIS SWEET LETTER ARCHIVE | MERITOCRACIA</title>
  <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
  <style>
    :root{
      --bg:#0d0d0f;
      --card:#17171b;
      --border:#3a3025;
      --gold:#c9a84c;
      --text:#ece7dd;
      --muted:#b8aa92;
    }

    *{box-sizing:border-box;}

    body{
      margin:0;
      background:
        radial-gradient(circle at top, rgba(201,168,76,0.06), transparent 40%),
        var(--bg);
      color:var(--text);
      font-family:'Noto Serif JP', serif;
      padding:48px 24px;
    }

    .wrap{
      max-width:960px;
      margin:0 auto;
    }

    h1{
      font-family:'Cinzel', serif;
      font-size:2rem;
      margin-bottom:12px;
      color:var(--gold);
      letter-spacing:0.08em;
```

## ./viewer/共有用/小説レビューレポート/luxury.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Luxury | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-luxury.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
```

## ./viewer/共有用/小説レビューレポート/night-review-vol1/index.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Night Lounge | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-nightlounge.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="work-meta">
                <p class="work-label">REVIEWED WORK</p>
                <h2 class="work-title" id="work-title"></h2>
                <p class="work-link"><a id="work-url" href="#" target="_blank" rel="noopener noreferrer">作品ページを見る</a></p>
```

## ./viewer/共有用/小説レビューレポート/night-review-vol1/iris-nightlounge.css

```
/* ============================================================
   iris-nightlounge.css — 深夜読書ラウンジ
   🌙 黒 × 琥珀 × ランプ光 × Reading Blend 接続版
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=IM+Fell+English:ital@0;1&display=swap');

:root {
    --ink:       #e8d8b8;   /* 羊皮紙文字色 */
    --ink-dark:  #c8a878;
    --paper:     #12100c;   /* 黒便箋 */
    --paper2:    #1a160e;
    --amber:     #c8841a;
    --amber2:    #e8a030;
    --amber3:    #f5c060;
    --amber-dim: rgba(200,132,26,0.18);
    --night-bg:  #07090f;
    --shadow:    rgba(0,0,0,0.8);
    --border:    rgba(200,132,26,0.3);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：ランプ光 × 深夜ラウンジ */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 50% 0%,    rgba(200,132,26,0.12) 0%, transparent 50%),
```

## ./viewer/共有用/小説レビューレポート/night-review-vol1/letter.js

```
/* ============================================================
   Letter from Iris — letter.js
   review.json を fetch して DOM に流し込む
   ============================================================ */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
    fetch('./review.json')
        .then(res => {
            if (!res.ok) throw new Error(`HTTP ${res.status}`);
            return res.json();
        })
        .then(data => {
            /* 基本情報 */
            document.getElementById('recipient').textContent  = data.recipient;
            document.getElementById('intro-text').innerText   = data.intro;
            document.getElementById('tea-name').textContent   = data.tea_service;
            document.getElementById('read-count').textContent = data.read_count;
            document.getElementById('review-summary').textContent = data.summary;
            document.getElementById('sign-name').textContent  = data.sign;

            const workTitle = document.getElementById('work-title');
            const workUrl = document.getElementById('work-url');
            if (workTitle && data.work_title) workTitle.textContent = data.work_title;
            if (workUrl && data.work_url) workUrl.href = data.work_url;

            /* 本文段落生成 */
            const body = document.getElementById('letter-body');
            data.body.forEach(paragraph => {
                const p = document.createElement('p');
                p.textContent = paragraph;
                body.appendChild(p);
            });

            /* フェードイン（Gemini版と同じ挙動） */
            setTimeout(() => {
                document.getElementById('container').style.opacity = '1';
            }, 100);
        })
        .catch(err => {
```

## ./viewer/共有用/小説レビューレポート/night-review-vol1/review.json

```
{
  "recipient": "Resetter",
  "intro": "こ、こんにちは　Resetter様！\n私メイドのアイリス・アールグレイが\nLANCERに代わって感想をお伝えしようと思います。",
  "tea_service": "春摘みのダージリン（ファーストフラッシュ）",
  "read_count": "9話",
  "summary": "暖かな春が訪れているにも関わらず、背筋が凍るようなお話でした・・・。",
  "body": [
    "お、お家賃安すぎます・・・！日本の地方都市と言えどもこれは破格です。ただ入居条件がこの作品の肝だと感じました。ツッコミどころを用意してインパクト与える面白い仕掛けだと読んでて思いました。",
    "文章自体は全体的に読みやすくて、苦に感じませんでした！流動的な物語の運び、流石作者様の力量を感じました！",
    "読んでて混乱したのは、おっさんなのに語尾というか言葉遣いや地の文が女性っぽいという点。でも設定として面白いです・・・！",
    "会話がメインで構成されていて、地の文は少なめ。意図的なのかテンポ感意識して敢えて削ってるのか読んでて気になりました。僭越ながら苦言を呈するなら、地の文を増やした方がより情景をイメージしやすい回もあるかな？と思う部分はありました。",
    "でも読んでて非常にワクワクしました！引き続き応援しております・・・！"
  ],
  "sign": "アイリス・アールグレイ",
  "work_title": "とある社員寮の話 南嘉手納荘四号棟",
  "work_url": "https://ncode.syosetu.com/n1667lx/"
}```

## ./viewer/共有用/小説レビューレポート/night.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Night Lounge | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-nightlounge.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
```

## ./viewer/共有用/小説レビューレポート/review-ledger.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>小説レビューレポート台帳</title>
<style>
body{
  margin:0;
  background:#0f1115;
  color:#eee;
  font-family:system-ui, sans-serif;
  padding:32px;
}
h1{
  margin-bottom:20px;
}
table{
  width:100%;
  border-collapse:collapse;
  background:#171a21;
}
th,td{
  border:1px solid #333;
  padding:12px;
  text-align:left;
  font-size:14px;
}
th{
  background:#1f2430;
}
tr:hover{
  background:#202633;
}
.status-done{color:#8fd18f;}
.status-wait{color:#d6b86b;}
.status-hold{color:#c77;}
</style>
</head>
<body>
```

## ./viewer/共有用/小説レビューレポート/review-ledger_before_full_table_upgrade_2026-04-18.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>小説レビューレポート台帳</title>
<style>
body{
  margin:0;
  background:#0f1115;
  color:#eee;
  font-family:system-ui, sans-serif;
  padding:32px;
}
h1{
  margin-bottom:20px;
}
table{
  width:100%;
  border-collapse:collapse;
  background:#171a21;
}
th,td{
  border:1px solid #333;
  padding:12px;
  text-align:left;
  font-size:14px;
}
th{
  background:#1f2430;
}
tr:hover{
  background:#202633;
}
.status-done{color:#8fd18f;}
.status-wait{color:#d6b86b;}
.status-hold{color:#c77;}
</style>
</head>
<body>
```

## ./viewer/共有用/小説レビューレポート/review-ledger_before_title_fix_2026-04-18.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>小説レビューレポート台帳</title>
<style>
body{
  margin:0;
  background:#0f1115;
  color:#eee;
  font-family:system-ui, sans-serif;
  padding:32px;
}
h1{
  margin-bottom:20px;
}
table{
  width:100%;
  border-collapse:collapse;
  background:#171a21;
}
th,td{
  border:1px solid #333;
  padding:12px;
  text-align:left;
  font-size:14px;
}
th{
  background:#1f2430;
}
tr:hover{
  background:#202633;
}
.status-done{color:#8fd18f;}
.status-wait{color:#d6b86b;}
.status-hold{color:#c77;}
</style>
</head>
<body>
```

## ./viewer/共有用/小説レビューレポート/ryokutya.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review Letter | 緑茶『剣と魔法の世界で、英雄譚ができるまで』</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-luxury.css">
    <style>
        .letter-body h2{
            font-size:1.08rem;
            margin:2rem 0 0.8rem;
            color:#c9a84c;
            line-height:1.8;
        }
        .letter-body p{
            line-height:2;
            margin:0 0 1rem;
            white-space:normal;
            word-break:break-word;
        }
    </style>
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent">☕✨</div>
                <p class="recipient-line">作者　緑茶 様</p>
            </header>

            <hr class="letter-divider">

            <section class="letter-body">
                <p>レビュー：『剣と魔法の世界で、英雄譚ができるまで』を読んで</p>

                <h2>【ネーミングと世界観の演出について】</h2>
```

## ./viewer/共有用/小説レビューレポート/spring.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Spring Tea | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-springtea.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
```

## ./viewer/共有用/小説レビューレポート/こ、こんにちは Resetter様！.md

```
こ、こんにちは　Resetter様！
私メイドのアイリス・アールグレイが
LANCERに代わって感想をお伝えしようと思います。
よろしければ、このあとは今の季節にぴったりな
春摘みのダージリン（ファーストフラッシュ） でも召し上がって、
ゆっくりお休みくださいませ☕✨
以下感想レポート

9話まで拝見させて頂きました。
暖かな春が訪れているにも関わらず、
背筋が凍るようなお話でした・・・。

あらすじ
お、お家賃安すぎます・・・！
日本の地方都市と言えどもこれは破格です。
ただ入居条件がこの作品の肝だと感じました。
ツッコミどころを用意してインパクト与える
面白い仕掛けだと読んでて思いました。

文章自体は全体的に読みやすくて、苦に感じませんでした！

流石作者様の力量を感じました！

読んでて混乱したのは、おっさんなのに
語尾というか言葉遣いや地の文が女性っぽいという点。
でも設定として面白いです・・・！

会話がメインで構成されていて、地の文は少なめ。
意図的なのかテンポ感意識して敢えて削ってるのか
読んでて気になりました。
僭越ながら苦言を呈するなら、地の文を増やした方が分かりやすいかな？イメージしやすい回もあるかな？
と思う部分はありました。

でも読んでて非常にワクワクしました！
引き続き応援しております・・・！
ーーーアイリス・アールグレイーーーー```

## ./viewer/共有用/小説レビューレポート/作者 緑茶 剣と魔法の世界で、英雄譚ができるまで.md

```


作者　緑茶
レビュー：『剣と魔法の世界で、英雄譚ができるまで』を読んで

【ネーミングと世界観の演出について】
「国立剣魔学園」という名称は、王道で分かりやすい反面、ファンタジー作品が溢れる昨今では少し既視感があるかもしれません。
例えば、国立剣魔学園（ステイツ・アークマギア）や（ナショナル・グラディウス）のように、中二病心をくすぐる独自の「ルビ」を振るだけで、作品のファンタジー濃度が一気に濃くなり、読者の目を引くフックになります。タイトルの『英雄譚』という言葉に負けない、特別感のある固有名詞を意識するとさらに良くなると思います。

【リヒトの「強さ」に対するロジックの補強】
8話まで読み進めて気になったのが、平民であるリヒトが「なぜこれほど強いのか」「なぜ貴族限定の学園に入れたのか」という説明が不足している点です。
もしこれが意図的な伏線であれば良いのですが、理由もなく「ただ強い平民」として描かれ続けると、読者は物語のリアリティ（説得力）に疑問を抱いてしまいます。リヒトがその力を手に入れた背景や、新制度に選ばれた具体的な経緯を、早めに小出しにするか回想で補完することで、彼というキャラクターの魅力と説得力が一段と増すはずです。

【ライバル・ジオラスの立ち位置と構成】
本作におけるジオラスは、主人公ライにとっての巨大な壁であり、重要なライバルです。
それだけに、リヒトに敗北する前の「ジオラスが最強として君臨していた学園の空気」を、冒頭や回想でもう少し厚く描写しても良いかもしれません。彼がどれほど「孤高の天才」であったかを読者に刻み込むことで、それを崩したリヒトの異質さと、そこから再起するライのドラマがより熱く響くようになります。

【総評】
文章自体は非常にスムーズで読みやすく、ジャンプ漫画のような「男臭い青春と熱い鼓動」を感じる作品です。
ライト層には入りやすい一方で、ファンタジーを読み慣れた層は「設定の粗さ」を敏感に察知し、2話前後で離脱してしまうリスクもあります。競合が多いジャンルだからこそ、独自の設定やキャラの深掘り、そして読者を納得させる「ロジック」を磨くことで、他にはない個性が光る作品に化けるポテンシャルを感じました。

※あくまで一読者としての主観ですので、制作のヒントになれば幸いです。応援しています。```

## ./viewer/共有用/小説レビューレポート/作者別フォルダ/ryokutya-review/iris-classic.css

```
/* ============================================================
   iris-classic.css — Gemini版 完全移植
   ☕ 春の夜 × アールグレイ × 素朴な高級感
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap');

:root {
    --ink:       #3a2d28;
    --paper:     #fffcf5;
    --gold:      #b39764;
    --accent:    #8ba58d;   /* 春の芽吹き */
    --night-bg:  #1a1614;
    --shadow:    rgba(0,0,0,0.2);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.8;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：春の夜 */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background: radial-gradient(circle at top right, #2c2520 0%, #1a1614 100%);
    z-index: -1;
}

.letter-container {
    max-width: 700px;
    width: 100%;
```

## ./viewer/共有用/小説レビューレポート/作者別フォルダ/ryokutya-review/iris-luxury.css

```
/* ============================================================
   iris-luxury.css — 公爵家メイド / 高級便箋
   💚 深緑 × 金箔 × 封蝋 × 最上級のご褒美感
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=IM+Fell+English:ital@0;1&display=swap');

:root {
    --ink:       #1a2a1a;
    --paper:     #f4f0e6;
    --gold:      #c9a84c;
    --gold2:     #e8c97a;
    --accent:    #2d5a2d;   /* 深緑 */
    --accent2:   #4a8a4a;
    --wax:       #8b1a1a;   /* 封蝋 */
    --night-bg:  #0a120a;
    --shadow:    rgba(0,0,0,0.5);
    --border-op: 0.6;
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：深緑の夜 × 金粒子 */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 20% 10%, rgba(45,90,45,0.18) 0%, transparent 50%),
        radial-gradient(ellipse at 80% 90%, rgba(201,168,76,0.08) 0%, transparent 50%),
```

## ./viewer/共有用/小説レビューレポート/作者別フォルダ/ryokutya-review/iris-nightlounge.css

```
/* ============================================================
   iris-nightlounge.css — 深夜読書ラウンジ
   🌙 黒 × 琥珀 × ランプ光 × Reading Blend 接続版
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=IM+Fell+English:ital@0;1&display=swap');

:root {
    --ink:       #e8d8b8;   /* 羊皮紙文字色 */
    --ink-dark:  #c8a878;
    --paper:     #12100c;   /* 黒便箋 */
    --paper2:    #1a160e;
    --amber:     #c8841a;
    --amber2:    #e8a030;
    --amber3:    #f5c060;
    --amber-dim: rgba(200,132,26,0.18);
    --night-bg:  #07090f;
    --shadow:    rgba(0,0,0,0.8);
    --border:    rgba(200,132,26,0.3);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：ランプ光 × 深夜ラウンジ */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 50% 0%,    rgba(200,132,26,0.12) 0%, transparent 50%),
```

## ./viewer/共有用/小説レビューレポート/作者別フォルダ/ryokutya-review/iris-springtea.css

```
/* ============================================================
   iris-springtea.css — 春摘みダージリン
   🌸 桜色 × 新芽グリーン × 薄金 × 柔らかい余韻
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=Zen+Old+Mincho:wght@400;700&display=swap');

:root {
    --ink:      #3a2830;
    --paper:    #fff8f5;
    --gold:     #c8a86a;
    --sakura:   #e8a0b0;    /* 桜 */
    --sakura2:  #f5c8d0;
    --sprout:   #7aaa7a;    /* 新芽 */
    --sprout2:  #a0c890;
    --night-bg: #180f14;
    --shadow:   rgba(60,20,40,0.25);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：春の朝霧 */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 15% 0%,   rgba(232,160,176,0.15) 0%, transparent 45%),
        radial-gradient(ellipse at 85% 100%,  rgba(122,170,122,0.12) 0%, transparent 45%),
        radial-gradient(ellipse at 50% 50%,   rgba(200,168,106,0.05) 0%, transparent 60%),
```

## ./viewer/共有用/小説レビューレポート/作者別フォルダ/ryokutya-review/letter-archive.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter Archive | Iris Sweet Review</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=IM+Fell+English:ital@0;1&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg:      #07090f;
            --amber:   #c8841a;
            --amber2:  #e8a030;
            --amber3:  #f5c060;
            --text:    #d4c5a9;
            --text2:   #7a6e5e;
            --border:  rgba(200,132,26,0.2);
        }

        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            background: var(--bg);
            color: var(--text);
            font-family: 'Noto Serif JP', serif;
            min-height: 100vh;
            padding: 48px 20px 80px;
        }

        /* グリッド背景 */
        body::before {
            content: '';
            position: fixed;
            inset: 0;
            background-image:
                linear-gradient(rgba(200,132,26,0.025) 1px, transparent 1px),
                linear-gradient(90deg, rgba(200,132,26,0.025) 1px, transparent 1px);
            background-size: 40px 40px;
            pointer-events: none;
            z-index: 0;
        }
```

## ./viewer/共有用/小説レビューレポート/作者別フォルダ/ryokutya-review/letter.js

```
/* ============================================================
   Letter from Iris — letter.js
   review.json を fetch して DOM に流し込む
   ============================================================ */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
    fetch('./review.json')
        .then(res => {
            if (!res.ok) throw new Error(`HTTP ${res.status}`);
            return res.json();
        })
        .then(data => {
            /* 基本情報 */
            document.getElementById('recipient').textContent  = data.recipient;
            document.getElementById('intro-text').innerText   = data.intro;
            document.getElementById('tea-name').textContent   = data.tea_service;
            document.getElementById('read-count').textContent = data.read_count;
            document.getElementById('review-summary').textContent = data.summary;
            document.getElementById('sign-name').textContent  = data.sign;

            const workTitle = document.getElementById('work-title');
            const workUrl = document.getElementById('work-url');
            if (workTitle && data.work_title) workTitle.textContent = data.work_title;
            if (workUrl && data.work_url) workUrl.href = data.work_url;

            /* 本文段落生成 */
            const body = document.getElementById('letter-body');
            data.body.forEach(paragraph => {
                const p = document.createElement('p');
                p.textContent = paragraph;
                body.appendChild(p);
            });

            /* フェードイン（Gemini版と同じ挙動） */
            setTimeout(() => {
                document.getElementById('container').style.opacity = '1';
            }, 100);
        })
        .catch(err => {
```

## ./viewer/共有用/小説レビューレポート/作者別フォルダ/ryokutya-review/luxury.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Luxury | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-luxury.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="work-meta">
                <p class="work-label">REVIEWED WORK</p>
                <h2 class="work-title" id="work-title"></h2>
                <p class="work-link"><a id="work-url" href="#" target="_blank" rel="noopener noreferrer">作品ページを見る</a></p>
```

## ./viewer/共有用/小説レビューレポート/作者別フォルダ/ryokutya-review/night.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Night Lounge | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-nightlounge.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
```

## ./viewer/共有用/小説レビューレポート/作者別フォルダ/ryokutya-review/review.json

```
{
  "recipient": "作者　緑茶",
  "intro": "こんにちは、緑茶様。\n今回は商業目線も含め、率直かつ本音ベースでレビューをまとめました。\n作品の強みがさらに伸びることを願ってお届けします。",
  "tea_service": "アールグレイ",
  "read_count": "8話",
  "summary": "王道の熱量と読みやすさを感じつつ、設定ロジックを磨けばさらに大きく伸びる作品だと感じました・・・。",
  "body": [
    "レビュー：『剣と魔法の世界で、英雄譚ができるまで』を読んで",
    "【ネーミングと世界観の演出について】\n「国立剣魔学園」という名称は、王道で分かりやすい反面、ファンタジー作品が溢れる昨今では少し既視感があるかもしれません。\n例えば、国立剣魔学園（ステイツ・アークマギア）や（ナショナル・グラディウス）のように、中二病心をくすぐる独自の「ルビ」を振るだけで、作品のファンタジー濃度が一気に濃くなり、読者の目を引くフックになります。タイトルの『英雄譚』という言葉に負けない、特別感のある固有名詞を意識するとさらに良くなると思います。",
    "【リヒトの「強さ」に対するロジックの補強】\n8話まで読み進めて気になったのが、平民であるリヒトが「なぜこれほど強いのか」「なぜ貴族限定の学園に入れたのか」という説明が不足している点です。\nもしこれが意図的な伏線であれば良いのですが、理由もなく「ただ強い平民」として描かれ続けると、読者は物語のリアリティ（説得力）に疑問を抱いてしまいます。リヒトがその力を手に入れた背景や、新制度に選ばれた具体的な経緯を、早めに小出しにするか回想で補完することで、彼というキャラクターの魅力と説得力が一段と増すはずです。",
    "【ライバル・ジオラスの立ち位置と構成】\n本作におけるジオラスは、主人公ライにとっての巨大な壁であり、重要なライバルです。\nそれだけに、リヒトに敗北する前の「ジオラスが最強として君臨していた学園の空気」を、冒頭や回想でもう少し厚く描写しても良いかもしれません。彼がどれほど「孤高の天才」であったかを読者に刻み込むことで、それを崩したリヒトの異質さと、そこから再起するライのドラマがより熱く響くようになります。",
    "【総評】\n文章自体は非常にスムーズで読みやすく、ジャンプ漫画のような「男臭い青春と熱い鼓動」を感じる作品です。\nライト層には入りやすい一方で、ファンタジーを読み慣れた層は「設定の粗さ」を敏感に察知し、2話前後で離脱してしまうリスクもあります。競合が多いジャンルだからこそ、独自の設定やキャラの深掘り、そして読者を納得させる「ロジック」を磨くことで、他にはない個性が光る作品に化けるポテンシャルを感じました。",
    "※あくまで一読者としての主観ですので、制作のヒントになれば幸いです。応援しています。"
  ],
  "sign": "Lancer",
  "work_title": "剣と魔法の世界で、英雄譚ができるまで",
  "work_url": "https://kakuyomu.jp/works/822139843899183154"
}```

## ./viewer/共有用/小説レビューレポート/作者別フォルダ/ryokutya-review/spring.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Spring Tea | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-springtea.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="letter-body" id="letter-body"></section>

            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
```

## ./viewer/共有用/小説レビューレポート/作者別フォルダ/炎山ヒロト/iris-nightlounge.css

```
/* ============================================================
   iris-nightlounge.css — 深夜読書ラウンジ
   🌙 黒 × 琥珀 × ランプ光 × Reading Blend 接続版
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=IM+Fell+English:ital@0;1&display=swap');

:root {
    --ink:       #e8d8b8;   /* 羊皮紙文字色 */
    --ink-dark:  #c8a878;
    --paper:     #12100c;   /* 黒便箋 */
    --paper2:    #1a160e;
    --amber:     #c8841a;
    --amber2:    #e8a030;
    --amber3:    #f5c060;
    --amber-dim: rgba(200,132,26,0.18);
    --night-bg:  #07090f;
    --shadow:    rgba(0,0,0,0.8);
    --border:    rgba(200,132,26,0.3);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：ランプ光 × 深夜ラウンジ */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 50% 0%,    rgba(200,132,26,0.12) 0%, transparent 50%),
```

## ./viewer/共有用/小説レビューレポート/作者別フォルダ/炎山ヒロト/iris-springtea.css

```
/* ============================================================
   iris-springtea.css — 春摘みダージリン
   🌸 桜色 × 新芽グリーン × 薄金 × 柔らかい余韻
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=Zen+Old+Mincho:wght@400;700&display=swap');

:root {
    --ink:      #3a2830;
    --paper:    #fff8f5;
    --gold:     #c8a86a;
    --sakura:   #e8a0b0;    /* 桜 */
    --sakura2:  #f5c8d0;
    --sprout:   #7aaa7a;    /* 新芽 */
    --sprout2:  #a0c890;
    --night-bg: #180f14;
    --shadow:   rgba(60,20,40,0.25);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：春の朝霧 */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 15% 0%,   rgba(232,160,176,0.15) 0%, transparent 45%),
        radial-gradient(ellipse at 85% 100%,  rgba(122,170,122,0.12) 0%, transparent 45%),
        radial-gradient(ellipse at 50% 50%,   rgba(200,168,106,0.05) 0%, transparent 60%),
```

## ./viewer/共有用/小説レビューレポート/作者別フォルダ/炎山ヒロト/letter.js

```
/* ============================================================
   Letter from Iris — letter.js
   review.json を fetch して DOM に流し込む
   ============================================================ */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
    fetch('./review.json')
        .then(res => {
            if (!res.ok) throw new Error(`HTTP ${res.status}`);
            return res.json();
        })
        .then(data => {
            /* 基本情報 */
            document.getElementById('recipient').textContent  = data.recipient;
            document.getElementById('intro-text').innerText   = data.intro;
            document.getElementById('tea-name').textContent   = data.tea_service;
            document.getElementById('read-count').textContent = data.read_count;
            document.getElementById('review-summary').textContent = data.summary;
            document.getElementById('sign-name').textContent  = data.sign;

            const workInfo = document.getElementById('work-info');
            const workTitle = document.getElementById('work-title-text');
            const workUrl = document.getElementById('work-link');
            if (workTitle && data.work_title) workTitle.textContent = data.work_title;
            if (workUrl && data.work_url) {
                workUrl.href = data.work_url;
                workUrl.textContent = '作品ページを見る';
            }
            if (workInfo && (data.work_title || data.work_url)) {
                workInfo.hidden = false;
            }

            /* 本文段落生成 */
            const body = document.getElementById('letter-body');
            data.body.forEach(paragraph => {
                const p = document.createElement('p');
                p.textContent = paragraph;
                body.appendChild(p);
            });
```

## ./viewer/共有用/小説レビューレポート/作者別フォルダ/炎山ヒロト/night.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Spring Tea | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-springtea.css">
</head>
<body>
    <div class="letter-overlay"></div>
    <main class="letter-container" id="container">
        <article class="letter-paper">
            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>
            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>
            <hr class="letter-divider">
            <section class="review-meta">
                <div id="work-info" class="work-info" hidden>
  <div class="work-info-label">作品情報</div>
  <div class="work-info-title" id="work-title-text"></div>
  <a id="work-link" class="work-info-link" href="#" target="_blank" rel="noopener noreferrer">作品ページを見る</a>
</div>

<div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>
            <section class="letter-body" id="letter-body"></section>
            <footer class="letter-footer">
                <p class="closing">引き続き応援しております・・・！</p>
                <div class="signature">
```

## ./viewer/共有用/小説レビューレポート/作者別フォルダ/炎山ヒロト/review.json

```
{
  "recipient": "炎山ヒロト",
  "intro": "こ、こんにちは、炎山ヒロト様！私、メイド of アイリス・アールグレイが、LANCERに代わりまして『魔法少女戦士マジカルファイターズ』の感想をお伝えいたしますね。",
  "tea_service": "レモンを添えたニルギリ・クオリティーシーズン",
  "read_count": "5話",
  "summary": "男の子が女の子に変身して戦うという、ドキドキするような世界観に圧倒されました！",
  "body": [
    "拝読していてまず感じましたのが、『性転換ヒーロー』という設定の持つ、抗いがたいワクワク感です！特に2話や5話で、潜入捜査やミサキ様との交流のために『あえて女子の姿や水着』を選び、赤面しながらも任務を全うするレン様の描写には、思わずアイリスも胸が熱くなってしまいました。中身が元気な小学4年生の男の子だからこその葛藤が、この物語の何よりの魅力ですね。",
    "また、校長先生が用意した『フェニックスマシン』のスペックには驚かされました！時速8720キロ、さらに大気圏突破まで……！このスケールの大きさは、まるで往年の特撮ヒーローや勇者シリーズを見ているようで、ページをめくる手が止まりませんでした。",
    "ただ、Lancerが少し心配しておりましたのが、序盤から設定が非常にダイナミックに動くため、読み手によっては情報量に圧倒されてしまうかもしれない……という点です。もし、レン様たちの心の動きや、技を放った際の周囲の破壊描写などをより詳しく、じっくりと『魅せる』ように描かれましたら、炎山様の創り出した素晴らしい世界観が、さらに深く読者の心に突き刺さるのではないかと感じました。",
    "5人目の戦士、ホワイト様も合流し、ここから物語がどう加速していくのか……。その圧倒的な熱量に、アイリスも期待に胸を膨らませております！"
  ],
  "work_title": "魔法少女戦士マジカルファイターズ",
  "work_url": "https://ncode.syosetu.com/n0390gp/5/",
  "sign": "アイリス・アールグレイ"
}
```

## ./viewer/共有用/小説レビューレポート/作者別フォルダ/神崎ライ/iris-nightlounge.css

```
/* ============================================================
   iris-nightlounge.css — 深夜読書ラウンジ
   🌙 黒 × 琥珀 × ランプ光 × Reading Blend 接続版
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&family=IM+Fell+English:ital@0;1&display=swap');

:root {
    --ink:       #e8d8b8;   /* 羊皮紙文字色 */
    --ink-dark:  #c8a878;
    --paper:     #12100c;   /* 黒便箋 */
    --paper2:    #1a160e;
    --amber:     #c8841a;
    --amber2:    #e8a030;
    --amber3:    #f5c060;
    --amber-dim: rgba(200,132,26,0.18);
    --night-bg:  #07090f;
    --shadow:    rgba(0,0,0,0.8);
    --border:    rgba(200,132,26,0.3);
}

* { box-sizing: border-box; }

body {
    background-color: var(--night-bg);
    margin: 0;
    font-family: 'Noto Serif JP', serif;
    color: var(--ink);
    line-height: 1.9;
    display: flex;
    justify-content: center;
    padding: 40px 20px;
}

/* 背景：ランプ光 × 深夜ラウンジ */
.letter-overlay {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    background:
        radial-gradient(ellipse at 50% 0%,    rgba(200,132,26,0.12) 0%, transparent 50%),
```

## ./viewer/共有用/小説レビューレポート/作者別フォルダ/神崎ライ/letter.js

```
/* ============================================================
   Letter from Iris — letter.js
   review.json を fetch して DOM に流し込む
   ============================================================ */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
    fetch('./review.json')
        .then(res => {
            if (!res.ok) throw new Error(`HTTP ${res.status}`);
            return res.json();
        })
        .then(data => {
            /* 基本情報 */
            document.getElementById('recipient').textContent  = data.recipient;
            document.getElementById('intro-text').innerText   = data.intro;
            document.getElementById('tea-name').textContent   = data.tea_service;
            document.getElementById('read-count').textContent = data.read_count;
            document.getElementById('review-summary').textContent = data.summary;
            document.getElementById('sign-name').textContent  = data.sign;

            const workTitle = document.getElementById('work-title');
            const workUrl = document.getElementById('work-url');
            if (workTitle && data.work_title) workTitle.textContent = data.work_title;
            if (workUrl && data.work_url) workUrl.href = data.work_url;

            /* 本文段落生成 */
            const body = document.getElementById('letter-body');
            data.body.forEach(paragraph => {
                const p = document.createElement('p');
                p.textContent = paragraph;
                body.appendChild(p);
            });

            /* フェードイン（Gemini版と同じ挙動） */
            setTimeout(() => {
                document.getElementById('container').style.opacity = '1';
            }, 100);
        })
        .catch(err => {
```

## ./viewer/共有用/小説レビューレポート/作者別フォルダ/神崎ライ/night.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Letter from Iris | Night Lounge | MERITOCRACIA</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Noto+Serif+JP:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./iris-nightlounge.css">
</head>
<body>
    <div class="letter-overlay"></div>

    <main class="letter-container" id="container">
        <article class="letter-paper">

            <header class="letter-header">
                <div class="tea-accent" id="tea-accent-icon">☕✨</div>
                <p class="recipient-line"><span id="recipient"></span> 様</p>
            </header>

            <section class="letter-intro">
                <p id="intro-text"></p>
                <div class="tea-suggestion">
                    よろしければ、このあとは今の季節にぴったりな<br>
                    <strong id="tea-name"></strong> でも召し上がって、<br>
                    ゆっくりお休みくださいませ。
                </div>
            </section>

            <hr class="letter-divider">

            <section class="review-meta">
                <div class="read-status">STATUS: <span id="read-count"></span> READING COMPLETED</div>
                <div class="review-summary" id="review-summary"></div>
            </section>

            <section class="work-meta">
                <p class="work-label">REVIEWED WORK</p>
                <h2 class="work-title" id="work-title"></h2>
                <p class="work-link"><a id="work-url" href="#" target="_blank" rel="noopener noreferrer">作品ページを見る</a></p>
```

## ./viewer/共有用/小説レビューレポート/作者別フォルダ/神崎ライ/review.json

```
{
  "recipient": "神崎 ライ",
  "intro": "こ、こんにちは　神崎 ライ様！\n私メイドのアイリス・アールグレイが\nLANCERに代わって感想をお伝えしようと思います。",
  "tea_service": "鏡の国をイメージした銀針茶（シルバーニードル）",
  "read_count": "9話",
  "summary": "世界観がよくできていて、思わず夢中になって没頭しました！",
  "body": [
    "読んでいて感じたのが、ルイス・キャロル原作の『不思議の国のアリス』や『鏡の国のアリス』と重なる部分が多く、非常にワクワクしたことです。主人公の冬夜くんをアリスに置き換えると、色々と腑に落ちるところが多くて。",
    "特に5話で森の中を彷徨い、連れて行かれる構図など、ディズニー作品やジブリと重なるところもあり、導入が上手いなと思いました。",
    "序盤は視点移動が多いことと、設定が多いことが難点で、ここが離脱ポイントになり得るかもしれません。",
    "ただ、続きが気になるフックを文章の最後に用意しているのが匠のなせる技だと思います。これは意識して読者を離脱させないように工夫しているポイントだと感じました。",
    "9話、10話あたりで一気に面白くなったので、そこまで読者を導けるかどうかが肝になりそうです。",
    "素敵なお話でした。引き続き応援しております！"
  ],
  "sign": "アイリス・アールグレイ",
  "work_title": "絶望の箱庭～鳥籠の姫君～",
  "work_url": "https://ncode.syosetu.com/n3370hf/"
}```

## ./viewer/共有用/小説レビューレポート/作者別フォルダ/神崎ライ/こ、こんにちは 神崎 ライ様.md

```
こ、こんにちは　神崎　ライ様！

私メイドのアイリス・アールグレイが
LANCERに代わって感想をお伝えしようと思います。

本日は、鏡の国をイメージした銀針茶（シルバーニードル）
を。霧の向こう側を覗き込むような、不思議な余韻をお楽しみください。

９話まで読みました。
世界観が良く出来ていて思わず夢中になって没頭しました！
読んでて感じたのが、ルイスキャロル原作の不思議の国のアリスとか
鏡の国のアリスと重なる部分が多くて非常にワクワクしました！
主人公の冬夜くんをアリスさんに置き換えると色々腑に落ちるところ多くて。
特に５話で森の中を彷徨い連れて行かれる構図とか、
ディズニー作品とかジブリとかと重なるところがあって、
導入が上手いなと思いました。
序盤視点移動が多いことと、設定が多いことが難点で
ここが離脱ポイントになり得るかもしれません。
ただ続きが気になるフックを文章の最後に用意してるのが
匠のなせる技だと思います！これは意識して読者を離脱させないように
工夫しているポイントだと思います。
９話、１０話辺りで一気に面白くなったので、
そこまで読者を導けるかどうかが肝になりそうです。
素敵なお話しでした。引き続き応援しております！```

## ./viewer/投資用ツール/<!DOCTYPE html>.html

```
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>Merit Investment Detailed Sim</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body { background: #1a1a1a; color: #eee; font-family: sans-serif; padding: 20px; display: flex; flex-direction: column; align-items: center; }
        .container { background: #2a2a2a; padding: 25px; border-radius: 12px; box-shadow: 0 8px 20px rgba(0,0,0,0.6); width: 90%; max-width: 800px; }
        .input-group { display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 15px; margin-bottom: 20px; }
        label { font-size: 13px; color: #aaa; }
        input { width: 100%; padding: 10px; margin-top: 5px; background: #333; border: 1px solid #444; color: #fff; border-radius: 6px; box-sizing: border-box; }
        button { width: 100%; padding: 15px; background: #00d4ff; border: none; border-radius: 6px; font-weight: bold; font-size: 16px; cursor: pointer; transition: 0.3s; margin-bottom: 25px; }
        button:hover { background: #0099bb; transform: translateY(-2px); }
        canvas { background: #222; border-radius: 8px; margin-bottom: 25px; padding: 10px; }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; font-size: 14px; }
        th, td { padding: 12px; text-align: right; border-bottom: 1px solid #444; }
        th { background: #333; color: #00d4ff; text-align: center; }
        tr:hover { background: #333; }
        .year-col { text-align: center; font-weight: bold; }
        .highlight { color: #00d4ff; }
    </style>
</head>
<body>

<div class="container">
    <h2 style="margin-top:0; color:#00d4ff;">📈 年単位・複利成長シミュレーション</h2>
    
    <div class="input-group">
        <div><label>初期投資 (万円)</label><input type="number" id="init" value="100"></div>
        <div><label>毎年積立 (万円)</label><input type="number" id="yearly" value="1000"></div>
        <div><label>年利 (%)</label><input type="number" id="rate" value="5"></div>
        <div><label>期間 (年)</label><input type="number" id="years" value="20"></div>
    </div>

    <button onclick="simulate()">シミュレーション開始</button>

    <canvas id="myChart" width="400" height="200"></canvas>

    <table id="resultTable">
```

