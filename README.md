# Yahoo Mail Right Ad Remover

> A tiny Chrome extension that removes Yahoo Mail's right-side ad rail and gives your inbox the space back.

[![Manifest V3](https://img.shields.io/badge/Chrome-Manifest%20V3-4285F4?logo=googlechrome&logoColor=white)](https://developer.chrome.com/docs/extensions/develop/migrate/what-is-mv3)
[![No tracking](https://img.shields.io/badge/Tracking-None-2ea44f)](#privacy)
[![No dependencies](https://img.shields.io/badge/Dependencies-None-2ea44f)](#why-this-extension)
[![GitHub stars](https://img.shields.io/github/stars/trezero/YahooAdBlocker?style=social)](https://github.com/trezero/YahooAdBlocker)

Yahoo Mail reserves a large part of the screen for ads. This extension removes that right-side panel and expands the message list and reading pane into the newly available space.

No settings. No accounts. No tracking. Install it once and enjoy a cleaner inbox.

## What it does

- Removes the Yahoo Mail right-side ad panel
- Expands the inbox and reading pane to use the freed space
- Continues removing ads that Yahoo adds after the page loads
- Runs only on `mail.yahoo.com`
- Collects no data and makes no network requests
- Uses only a few lines of plain CSS and JavaScript

## Install in 60 seconds

Until the extension is published in the Chrome Web Store, install it directly from this repository:

1. Select **Code → Download ZIP** at the top of this GitHub page.
2. Extract the downloaded ZIP file.
3. Open `chrome://extensions` in Google Chrome.
4. Turn on **Developer mode** in the upper-right corner.
5. Select **Load unpacked**.
6. Choose the extracted `YahooAdBlocker` directory.
7. Open or refresh [Yahoo Mail](https://mail.yahoo.com/).

That's it. The right-side ad rail should disappear immediately.

> Chrome must load the extracted directory, not the ZIP file itself.

## Why this extension?

Many ad blockers are powerful but complex. This project does one job and stays out of your way.

| | Yahoo Mail Right Ad Remover |
|---|---|
| Purpose | Remove Yahoo Mail's right ad rail |
| Browser standard | Chrome Manifest V3 |
| Dependencies | None |
| Background service | None |
| Tracking or analytics | None |
| Account required | No |
| Source files | Four |

Because the complete extension is small and readable, anyone can inspect exactly what it does.

## Privacy

Your email is private. This extension:

- Does not read, store, or transmit your messages
- Does not collect analytics or personal information
- Does not contact external servers
- Does not require an account
- Is restricted to pages under `mail.yahoo.com`

The source code in this repository is the complete extension—there is no hidden build step or bundled code.

## How it works

`styles.css` immediately hides known Yahoo Mail right-rail containers and expands the message area.

`content.js` removes those containers from the page. A lightweight `MutationObserver` watches for dynamically inserted ads and removes them as Yahoo adds them.

`manifest.json` limits the extension to Yahoo Mail and loads the CSS and JavaScript using Chrome's Manifest V3 format.

## Updating

For unpacked installations, Chrome does not update the extension automatically:

1. Download or pull the latest version of this repository.
2. Replace your existing extension files.
3. Open `chrome://extensions`.
4. Select the **Reload** button on the extension card.
5. Refresh Yahoo Mail.

## Troubleshooting

### The ad panel is still visible

1. Refresh the Yahoo Mail tab.
2. Open `chrome://extensions` and confirm the extension is enabled.
3. Select **Reload** on the extension card.
4. Make sure Chrome loaded the directory containing `manifest.json`.

Yahoo occasionally changes its page structure. If the panel remains visible, [open an issue](https://github.com/trezero/YahooAdBlocker/issues) and include:

- A screenshot with private email details hidden
- Your Chrome version
- The visible panel's location
- Any errors shown for the extension at `chrome://extensions`

Please never post screenshots containing private messages, email addresses, or account information.

### Chrome says the manifest is missing

You selected the wrong directory. Choose the folder that directly contains:

```text
manifest.json
styles.css
content.js
manage.sh
```

### Yahoo Mail looks unusual

Disable the extension and refresh the page. If that fixes the problem, [report it](https://github.com/trezero/YahooAdBlocker/issues) so the selectors can be updated.

## Developer menu

Run the included menu-driven helper:

```bash
./manage.sh
```

It can validate the source files, build a distributable ZIP, or show the Chrome installation steps.

The build option requires `node` and `zip`. The extension itself has no runtime dependencies.

## Contributing

Small, focused contributions are welcome.

Good first contributions include:

- Updating selectors when Yahoo changes its layout
- Testing different inbox layouts and screen sizes
- Improving installation or troubleshooting instructions
- Confirming compatibility with Chromium-based browsers

To contribute:

1. Fork the repository.
2. Create a branch for your change.
3. Keep the extension lightweight and free of tracking.
4. Validate it with `./manage.sh`.
5. Open a pull request explaining what changed and how you tested it.

## Project principles

- Do one thing well
- Collect no user data
- Request the smallest possible access
- Keep the source easy to inspect
- Avoid unnecessary dependencies
- Make installation simple

## Help it grow

If this extension gives you back useful inbox space:

- ⭐ Star the repository so more Yahoo Mail users can find it
- Share it with someone who uses Yahoo Mail
- Report layout changes so fixes can ship quickly
- Contribute improvements through a pull request

Built for everyone who wants more inbox and less ad.
