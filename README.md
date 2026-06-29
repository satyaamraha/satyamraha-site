# Satyam Raha — Personal Website

A fast, fully static personal website (HTML / CSS / vanilla JS — no build step).
Theme: *"Where Ancient Wisdom meets Modern Logic"* — midnight indigo + temple gold.

## Pages
| File | Purpose |
|------|---------|
| `index.html` | Home — hero, two-sciences, achievements, featured product, CTA |
| `about.html` | Story, journey timeline, qualifications, Vedic training |
| `vision.html` | Vision, mission, the school, the fusion approach |
| `projects.html` | Griha Vastu, Numerology app, AI/DS, IoT, game, comp-programming |
| `business.html` | Satyam Raha brand + Griha Vastu (users & consultants) + consulting |
| `media.html` | Video grid (placeholders — drop in real YouTube links) |
| `contact.html` | Contact form (opens email) + direct details |
| `404.html` | Not-found page |

## Run locally
Any static server works:
```bash
python3 -m http.server 8080      # then open http://localhost:8080
```

## Things to personalise
- **Photo:** `assets/img/satyam.jpeg` (swap for a higher-res portrait if you like).
- **Social links:** update the `socials` block in each page footer + the channel link in `media.html`.
- **Videos:** in `media.html`, replace each `href="#"` with your real YouTube URLs.
- **Email:** already wired to `raha786.satyam@gmail.com` (contact form + footer).

---

## Hosting — recommendation

Your domain `satyamraha.com` is registered at **Wix**, and your business app already runs on **Railway**.
This site is 100% static, so you have two clean paths:

### ⭐ Option A — Cloudflare Pages (recommended for this site)
Free, global CDN, automatic HTTPS, perfect for static sites. Keeps it separate from your Railway
business workload.
1. Push this folder to a GitHub repo.
2. Cloudflare dashboard → **Pages → Connect to Git** → pick the repo.
3. Build command: *(none)* · Output directory: `/` (root).
4. After deploy, **Pages → Custom domains → Set up a domain** → `satyamraha.com` and `www`.
5. Point DNS (see "DNS at Wix" below).

*(Vercel and Netlify work identically — import the repo, no build command, set the custom domain.)*

### Option B — Railway (since you already use it)
Keeps everything under one provider. This repo already includes a **Dockerfile + Caddyfile**, so:
1. Railway → **New Project → Deploy from GitHub repo** → pick this repo.
2. Railway auto-detects the Dockerfile and serves the static files via Caddy on `$PORT`.
3. **Settings → Networking → Custom Domain** → add `satyamraha.com` → Railway shows a CNAME target.
4. Point DNS (see below).

> Note: keep this as its **own Railway service/project** so it doesn't collide with your Vastu business app.

### DNS at Wix (works for either option)
Your domain is *registered* at Wix, but the **root domain** points at the site you build with Wix.
To point it at an external host you have two choices:

- **Easiest — move DNS to Cloudflare:** add the domain to a free Cloudflare account, then change the
  **nameservers at Wix** to the two Cloudflare nameservers Cloudflare gives you. After that, manage all
  records in Cloudflare (and Cloudflare Pages can auto-configure them). This is the smoothest setup.
- **Keep DNS at Wix:** in **Wix → Domains → Manage DNS / Advanced**, set:
  - `CNAME  www  → <target your host gives you>` (e.g. `your-project.pages.dev` or the Railway domain target)
  - Root `@` → use your host's apex/ALIAS instructions (Cloudflare Pages handles apex automatically;
    for Railway, use the A/ALIAS record they provide).
  - Wix sometimes restricts apex records — if so, the Cloudflare-nameserver route above avoids the problem.

After DNS propagates (minutes to a few hours), HTTPS is issued automatically by the host.

---

## Quick decision
- Want **simplest + fastest + free**, fully separate from your business app → **Cloudflare Pages + move nameservers to Cloudflare.**
- Want **everything in one place** with Railway → use the included Dockerfile and add the custom domain there.
