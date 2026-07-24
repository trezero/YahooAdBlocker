const AD_SELECTORS = [
  'div[data-test-id="right-rail-ad"]',
  'div[data-test-id="mail-right-rail"]',
  'div[data-test-id="adblock-delay-dismiss-cue"]',
  'div[data-test-id="right-rail-hidead-btn"]',
  '#right-rail-ad'
];

function removeRightRailAds() {
  document.querySelectorAll(AD_SELECTORS.join(',')).forEach((ad) => ad.remove());
}

function observeForRightRailAds() {
  if (!document.body) {
    return;
  }

  const observer = new MutationObserver(removeRightRailAds);
  observer.observe(document.body, {
    childList: true,
    subtree: true
  });
}

removeRightRailAds();

if (document.body) {
  observeForRightRailAds();
} else {
  document.addEventListener('DOMContentLoaded', observeForRightRailAds, { once: true });
}
