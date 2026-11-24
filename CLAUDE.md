# tr-AI-de Solutions website

Marketing landing page for tr-AI-de Solutions (traidesolutionsai.com), Josh Prindiville's AI automation consultancy in Perth. Builds **tendering/quoting and invoicing systems** for Australian trades businesses, plus **bespoke implementation** (process: map the workflow → find the waste → size the opportunity → build). Voice agents and chat are minor add-ons under bespoke work, not the headline.

## How this site works

- **One file.** Everything lives in `index.html`: the CSS sits in a `<style>` block in `<head>`, the markup follows, and a small `<script>` sits at the bottom. There is no build step, framework or package manager. Keep it that way unless Josh asks for something else.
- **Hosting.** The repo is `tradesolutionsai-dot/traidesolutionswebsite` on GitHub and it's connected to Vercel (traidesolutionswebsite.vercel.app). **Every push to `main` deploys to production straight away**, so you can't push without it going live.
- **Local preview.** Run the Zed task "Preview site" (it serves the folder at http://localhost:8080). You can also open `index.html` in a browser directly.

## Page structure (top to bottom)

| Section | Selector | What it holds |
|---|---|---|
| Nav | `nav#nav` + `#mobileMenu` | Logo text, anchor links, Book a Call. Desktop and mobile menus are **separate lists**: when you change a link, change both. |
| Hero | `section.hero` | H1, sub-headline, Calendly button |
| Clients | `section.clients` | "Trusted by businesses across WA" infinite logo scroll (`.marquee`). Logos in `assets/clients/`, 120px tall PNGs. To add a client: add the file, then add its `<li>` to **every** repeat in the track (first copy has alt text, the rest are `aria-hidden="true"` with empty alt). |
| Problem | `section.problem` | Pain-point copy, two columns |
| Activity | `section.activity` | Two scrolling rows of "job activity" pills (illustrative, not real customer data) + "Your back office, handled" heading and button |
| Services | `#services` | Tendering and Quoting, Invoicing and Payments, Bespoke Implementation cards |
| Process | `#process` | 4 steps (Map, Find the waste, Size the opportunity, Build) + stats row (`.stats`) |
| Why us | `#why-us` | 6 differentiator cards |
| FAQ | `#faq` | Accordion items (`.faq-item`, toggled by `toggleFaq()`) |
| CTA | `#book` | Navy rounded panel: final Calendly CTA + phone |
| Footer | `footer` | Phone + email |

## Design references

Josh's inspiration sites for layout and the clean white look: https://dashboardsbyapi.com/, https://www.sophiie.ai/ (also a competitor in AI for trades) and https://www.the-entourage.com/. Check them when making layout decisions.

## Brand

- Logo files: originals are `traide_logo_white.png` (for dark backgrounds), `traide_logo_dark.png` (for light) and `traide_logo_neon.png` (on navy). Web versions live in `assets/`: `logo-white.png` (nav and footer), `favicon.png`, `apple-touch-icon.png`, `og-image.png` (1200x630 social preview).
- Name is written `trAIde Solutions` (matches the logo). Use the logo image in the nav and footer, not styled text.
- Look: a navy banner (nav and footer, `--navy #17272f`, the logo's own background) holding the white logo, then a clean white, minimal page in the style of sophiie.ai / the-entourage.com. Centred hero and section headings, soft grey rounded cards (no shadows), hairline dividers, alternating white and `--bg-soft` sections, plenty of whitespace. The final CTA is a navy rounded panel.
- Buttons end with a small arrow chip (`.btn-chip`). Marquees (`.marquee` + `.marquee-track`) loop by duplicating content and sliding -50%; they pause on hover and go static for reduced-motion users.
- Avoid "AI template" styling: no glows, gradients, grain overlays, pulsing dots, monospace uppercase labels, icon-in-a-glowing-box, hover lifts or giant faded numbers.
- Colours are CSS variables in `:root`. Use the variables, never hard-coded hex.
  - Navy: `--navy`, `--navy-deep #0e1f27`. Page: `--bg #fff`, `--bg-soft #f4f6f7` for alternate sections.
  - Text: `--text-primary` (navy), `--text-secondary #5f7482` (logo slate), `--text-muted`. On navy: `--text-on-navy`, `--text-on-navy-muted`.
  - Lines: `--line`, `--line-strong`.
  - Cyan `--cyan #00e5ff` is for the navy banner only (nav button, small accents). It's unreadable as text on white: use `--cyan-ink #007c91` there.
  - Buttons on white: navy with white text (`--cta`). On the navy banner: cyan with navy text.
- Font: Outfit (`--font-display`), headings weight 600. No second font.
- Scroll-in animation: add class `reveal` (plus optional `reveal-delay-1..3`) to new elements. It's a subtle fade, only applies when JS runs (`html.js`), and is off for reduced-motion users.

## Contact details used on the page

- Phone: 0473 941 120 (`tel:0473941120`)
- Email: tradesolutionsai@gmail.com
- Booking: Calendly `https://calendly.com/tradesolutionsai/ai-integration-consult`, opened by `openCalendly()`. Every "Book" button should call that function.

## Copy style

- Australian English (organise, colour, analyse).
- Plain, direct, trades-friendly. Short sentences. No hype words ("revolutionary", "cutting-edge", "seamless", "unlock").
- **No em dashes** in new copy. Use full stops, commas or colons.
- Lead with outcomes around tendering, quoting and invoicing: time spent on tenders, winning more work, invoicing the day the job is done, getting paid faster. Don't drift back to voice AI as the headline.
- Never invent stats, results or testimonials. Stats on the page must be facts Josh has confirmed.

## Rules for editing

1. Make the smallest change that does the job. Don't reformat or reorder the whole file.
2. After a change, check the page in the preview at desktop width and at ~390px mobile width.
3. Keep `<title>`, `meta description` and `og:` tags in sync with any headline or positioning change.
4. Never commit or push unless Josh asks. When he does, use the "Ship to live site" task or:
   `git add -A && git commit -m "<clear message>" && git push origin main`
5. Images go in `assets/` with lowercase-hyphenated names. Compress before adding (under ~200 KB).

## Known loose ends

- `CCW-Logo-WHITE-328x126-V1.png` (Custom WA) was deleted from the working copy. If they're a client, restore it with `git checkout -- CCW-Logo-WHITE-328x126-V1.png`. It's a white logo, so it needs a dark version for the white page.
- Original client logo files (`ENY-…`, `MPWA-…`, `RFF-logo.webp`) still sit in the repo root. Only the `assets/clients/` copies are used.
- `assets/clients/oasis-electrical.png` was rebuilt from the inline SVG mark and PT Sans wordmark on oasiselectrical.com.au, because they have no logo image file. Swap it out if Oasis sends an official file.
- `og:url`, `og:image` and the JSON-LD use the Vercel URL. Switch them to traidesolutionsai.com once the custom domain is live.
- No written testimonials, results or demo number on the page yet. Client logos are up; quotes need real words from those clients (the `.hero-proof` and `.social-proof` CSS is ready for them).
