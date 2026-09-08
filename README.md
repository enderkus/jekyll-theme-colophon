# Colophon

[![Gem Version](https://img.shields.io/gem/v/jekyll-theme-colophon.svg)](https://rubygems.org/gems/jekyll-theme-colophon)

A minimal Jekyll theme for personal blogs: system-font serif typography, light/dark mode, an RSS feed, and a built-in ConvertKit signup form. No CSS framework, no JS framework, no web fonts — just a single small stylesheet.

Two layouts:
- **Home** — a single centered column with an avatar, a short bio, a flat list of posts, and a signup form.
- **Post** — a two-column layout (sticky sidebar + article) that collapses to a single column on narrower screens.

A working example lives in [`/demo`](./demo).

## Features

- Serif body text / sans-serif UI using each OS's system fonts — no font downloads, fast first paint
- Light/dark mode toggle, respects `prefers-color-scheme`, persisted via `localStorage`
- RSS feed (`jekyll-feed`) and sitemap (`jekyll-sitemap`) generated automatically
- ConvertKit email signup form, no extra JavaScript embed required
- Per-post share links (Hacker News, Reddit, Twitter, LinkedIn), generated at build time
- Responsive: the post layout's sidebar collapses under the article on mobile; the signup form and share links stack into full-width, single-column controls below 560px
- Zero JS dependencies beyond the theme toggle's few lines of vanilla JS

## Installation

Add it to your own Jekyll site's `Gemfile`:

```ruby
gem "jekyll-theme-colophon"
```

Or, to track the latest commit instead of a released version:

```ruby
gem "jekyll-theme-colophon", git: "https://github.com/enderkus/jekyll-theme-colophon"
```

Then in `_config.yml`:

```yaml
theme: jekyll-theme-colophon

plugins:
  - jekyll-feed
  - jekyll-sitemap
```

Run `bundle install`, then `bundle exec jekyll serve`.

> If you'd rather not depend on a gem at all, you can also just fork this repo and use `/demo` directly as your site — copy its contents to your repo root along with `_layouts/` and `_includes/` from the theme root. That avoids the Bundler git-dependency indirection at the cost of not getting theme updates automatically.

## Configuration

All of these go in your site's `_config.yml` (see [`demo/_config.yml`](./demo/_config.yml) for a complete example):

| Key | Description |
|---|---|
| `title` | Your name / site title |
| `tagline` | Short one-line description shown under your name |
| `description` | Used for `<meta name="description">` and Open Graph tags |
| `author`, `email` | Used in the RSS feed |
| `url`, `baseurl` | Your GitHub Pages or custom domain URL |
| `social.twitter`, `social.linkedin`, `social.github` | Username only, e.g. `twitter: "username"`. Leave blank (`""`) to hide a link |
| `social.website`, `social.website_label` | A free-form extra link with a custom label |
| `convertkit.form_id` | Your ConvertKit form ID — see below |

### Content

- `index.md` — your home page bio (Markdown, rendered into the `.bio` block)
- `_posts/*.md` — standard Jekyll posts, `YYYY-MM-DD-title.md`, only `title` front matter is required (the `post` layout is applied automatically via `defaults` in `_config.yml`)
- `assets/images/avatar.svg` (or `.jpg`/`.png`) — your profile photo; update the `<img>` src in `_layouts/home.html` and `_layouts/post.html` if you change the filename or format
- `favicon.svg` — your site icon

### ConvertKit signup form

1. In ConvertKit (Kit), go to **Grow → Landing Pages & Forms** and create a form.
2. Open the form's **Embed** settings and copy its **Form ID** (it appears in the embed code as `forms/12345678/subscriptions`).
3. Set `convertkit.form_id` in `_config.yml` to that ID.

The theme submits directly to ConvertKit's hosted form endpoint (`_includes/signup.html`), so no client-side JavaScript embed is needed. ConvertKit handles spam filtering server-side.

## Deploying to GitHub Pages

GitHub Pages' built-in Jekyll build only supports a fixed whitelist of themes/plugins and **cannot** build a site that depends on a custom theme gem. Use a GitHub Actions workflow instead — see [`.github/workflows/pages.yml`](./.github/workflows/pages.yml) for the one that builds and deploys [`/demo`](./demo) in this repo. Copy that workflow into your own site's repo (adjusting the `working-directory` if your site isn't in a `demo/` subfolder), then enable **Settings → Pages → Source: GitHub Actions**.

## Developing this theme

```bash
bundle install               # theme gem's own dependencies
cd demo
bundle install                # pulls in the theme via the local `path: "../"` dependency
bundle exec jekyll serve
```

Edits to `_layouts/`, `_includes/`, or any file at the theme root are picked up by the demo site immediately since it references the theme via a local path, not a fetched gem.

## Credits

Design and layout structure are inspired by [pauldix.com](https://pauldix.com/).

## License

[MIT](./LICENSE.txt)
