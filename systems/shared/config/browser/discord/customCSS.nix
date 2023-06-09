{ colors, fonts }:

''
  :root {
      --font-headline: '${fonts.sans}';
      --font-code: '${fonts.mono}';
      --scrollbar-auto-thumb: #${colors.wht};
      --brand-experiment: #${colors.gry};
      --brand-experiment-560: #${colors.gry};
      --brand-experiment-500: #${colors.blk};
      --selection-col: #${colors.cya}28;
      --background-accent: #${colors.blk};
      --local-bot-side: #${colors.blu_d}CC;
  }
  .theme-dark, .theme-light {
      --text-normal: #${colors.nfg};
      --text-muted: #${colors.dfg};
      --text-link: #${colors.cya_d};

      --background-primary: #${colors.nbg};
      --background-secondary: #${colors.lbg};
      --background-secondary-alt: #${colors.lbg};
      --background-tertiary: #${colors.blk};
      --background-floating: #${colors.lbg};
      --background-mentioned: #${colors.blu_d}21;
      --background-mentioned-hover: #${colors.blu}28;

      --channeltextarea-background: #${colors.lbg};
      --scrollbar-auto-track: #${colors.blk};
      --modal-footer-background: #${colors.blk};
      --home-background: var(--background-primary);
  }

  ::selection {background: var(--selection-col) !important;}
  .theme-dark .container-1um7CU,.theme-dark .container-2IKOsH, .theme-dark .header-3xB4vB, .theme-dark [class^="directoryModal-"] {
      background-color: var(--background-secondary-alt);
  }
  .theme-light .wrapper-1_HaEi,.theme-light .scroller-3X7KbA {
      background: var(--background-accent);
  }
  .theme-dark .wrapper-1_HaEi,.theme-dark .scroller-3X7KbA {
      background: var(--background-accent);
  }
  div[class*="checked-"] {
      background-color: var(--brand-experiment-500) !important;
  }
  svg[class^="slider-"] path {
      fill: var(--brand-experiment-560);
  }
  path[d^="M12.1151 2.00065C12.0768 2.00022 12.0384 2 12 2C6.477 2 2 6.477 2 12C2 17.522 6.477 22 12 22C17.523 22 22 17.522 22 12C22 11.9616 21.9998 11.9232 21.9993 11.8849C21.1882 12.1737 20.3146 12.3309 19.4043 12.3309C15.1323 12.3309 11.6691 8.86771 11.6691 4.59565C11.6691 3.68536 11.8263 2.8118 12.1151 2.00065ZM7.92105 11.8023C7.92105 12.7107 7.18468 13.4471 6.27631 13.4471C5.36795 13.4471 4.63158 12.7107 4.63158 11.8023C4.63158 10.894 5.36795 10.1576 6.27631 10.1576C7.18467 10.1576 7.92105 10.894 7.92105 11.8023ZM10.5217 14.5171C10.3859 13.9893 9.84786 13.6716 9.32005 13.8074C8.79223 13.9433 8.47448 14.4813 8.61033 15.0091C9.01196 16.5695 10.4273 17.7236 12.1147 17.7236C13.8021 17.7236 15.2174 16.5695 15.6191 15.0091C15.7549 14.4813 15.4372 13.9433 14.9093 13.8074C14.3815 13.6716 13.8435 13.9893 13.7077 14.5171C13.525 15.2267 12.8797 15.7499 12.1147 15.7499C11.3497 15.7499 10.7044 15.2267 10.5217 14.5171Z"] {
  d: path('m12 2c-5.523 0-10 4.477-10 10 0 5.522 4.477 10 10 10 5.523 0 10-4.478 10-10 0-0.0384 5e-4 -0.076283 0-0.11458-0.8111 0.2888-1.6861 0.44531-2.5964 0.44531-4.272 0-7.7344-3.4623-7.7344-7.7344 0-0.91029 0.15651-1.7852 0.44531-2.5964-0.0383-4.3e-4 -0.076183 0-0.11458 0zm-5.724 8.1589c0.90836 0 1.6458 0.73493 1.6458 1.6432 0 0.9084-0.73747 1.6458-1.6458 1.6458-0.90836 0-1.6432-0.73744-1.6432-1.6458 0-0.9083 0.73487-1.6432 1.6432-1.6432zm1.8438 5.5729c0.25251-0.015862 0.50575 0.10482 0.65625 0.30729 0.16198 0.27381 0.19805 0.62398 0.45833 0.84115 0.46684 0.49753 1.3278 0.49756 1.7969 0.002604 0.32446-0.24897 0.26914-0.72458 0.58333-0.97396 0.37809-0.34531 1.0417-0.15559 1.2031 0.32292 0.044428 0.30618 0.19507 0.59846 0.4349 0.79948 0.5078 0.4671 1.3751 0.3905 1.8047-0.14583 0.28002-0.28144 0.22165-0.77826 0.61458-0.96615 0.48615-0.31512 1.1969 0.12779 1.1406 0.70052-0.15245 0.89083-0.79763 1.6681-1.625 2.0208-1.039 0.47433-2.3482 0.20498-3.1224-0.63281-0.50839 0.48608-1.2025 0.77285-1.9062 0.78125-1.2196 0.029143-2.3898-0.83972-2.7135-2.0156-0.19722-0.46057 0.17468-1.0315 0.67448-1.0417z');
  }
  [class*="connectedAccountOpenIcon-"] {
      -webkit-mask-image: url("data:image/svg+xml,%3C%3Fxml version='1.0' %3F%3E%3Csvg height='22' viewBox='100 200 960 960' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M180 936q-24 0-42-18t-18-42V276q0-24 18-42t42-18h279v60H180v600h600V597h60v279q0 24-18 42t-42 18H180Zm202-219-42-43 398-398H519v-60h321v321h-60V319L382 717Z' fill='currentColor' /%3E%3C/svg%3E");
      -webkit-mask-repeat: no-repeat;
      background-color: currentColor;
      transform: scale(1);
  }
  [id="oneko"] {
      z-index: 69420;
  }
  [href="/store"],
  [aria-label="Send a gift"],
  .container-2giAcK,
  .buttonContainer-1sjtPU,
  [aria-label="Nitro"],
  [class^="upsellVisible-"], 
  [class^="premiumIconWrapper"], 
  [class^="characterCount-"] [class*="upsell-"], 
  [class^="emojiSection-"] [class*="shinyButton-"],
  [class*="tryItOutSection-"],
  [aria-label="Help"],
  [aria-label="Show User Profile (Unavailable)"],
  [aria-label="Hide User Profile"],
  [aria-label="Show User Profile"],
  [class^="nowPlayingColumn-"],
  aside {
      display: none
  }
  .container-32HW5s {
      border-radius: 0.5em;
      padding: 0;
  }
  .link-39sEB3 {
      padding: 0.1em;
  }
  .info-3pQQBb > span:last-child::after {
      content: "\aNominal <=> CSS Tweaks";
      white-space: pre;
      font-family: var(--font-headline);
      color: var(--brand-experiment);
  }
  [class*="welcomeCTA"] { display:none; }
  [class*="clickableSticker"] > div[aria-label] > [class*="assetWrapper"] {
      display: none;
  }
  [class*="clickableSticker"] > div[aria-label]::after {
      content: "A sticker was hidden.";
      color: #${colors.blk};
      font-weight: 500;
  }
  svg[class^="homeIcon"] path {
      d: path('M 2 0 a 2 2 90 0 0 -2 2 v 12 a 2 2 90 0 0 2 2 h 2 l 0 4 l 4 -4 H 18 a 2 2 90 0 0 2 -2 V 2 a 2 2 90 0 0 -2 -2 z');
  }
  svg[class^="homeIcon"] {
      margin-left: 8px;
  }
  .theme-dark [class^="perksModal"] {
      background-color: inherit;
  }
  ul[aria-label="Direct Messages"] li[aria-posinset="1"]>div {
      height: 2em;
      padding: 0;
      background-color: #${colors.gry}04;
  }
  ul[aria-label="Direct Messages"] li[aria-posinset="1"]>div:hover {
      background-color: #${colors.gry}0F;
  }
  ul[aria-label="Direct Messages"] li[aria-posinset="1"]>div[class*="selected"] {
      background-color: #${colors.gry}03;
  }
  ul[aria-label="Direct Messages"] li[aria-posinset="1"] div[class^="content"] {
      margin-right: auto;
      max-width: fit-content;
  }
  ul[aria-label="Direct Messages"] li[aria-posinset="1"] div[class^="avatar"] {
      margin-left: auto;
      margin-right: 0.25em;
      left: -0.25em;
      position: relative;
  }
  div[class^="searchBar-"] {
      border: 1px solid var(--scrollbar-auto-track);
  }
  nav div[class^="searchBar-"] {
      border: none;
  }
  div[class^="searchBar-"] button[class^="searchBarComponent-"] {
      height: 2em;
      padding-left: 0.75em;
  }
  div[class^="searchBar-"] button[class^="searchBarComponent-"]:hover {
      color: var(--interactive-hover);
  }
  div[class^="searchBar-"] button[class^="searchBarComponent-"]:hover::after {
      border: solid 1px var(--interactive-hover);
  }
  div[class^="searchBar-"] button[class^="searchBarComponent-"]:hover::before {
      background: var(--interactive-hover);
  }
  div[class^="searchBar-"] button[class^="searchBarComponent-"]::after {
      content: "";
      position: absolute;
      inset: 0;
      z-index: 420;
      height: 10px;
      width: 10px;
      border-radius: 20em;
      border: solid 1px var(--channels-default);
      transform: translateX(206px) translateY(17px);
  }
  div[class^="searchBar-"] button[class^="searchBarComponent-"]::before {
      content: "";
      position: absolute;
      inset: 0;
      z-index: 420;
      background: var(--channels-default);
      transform: rotate(45deg) translateX(172px) translateY(-132px);
      height: 1px;
      width: 6px;
      border-radius: 1em;
  }
  .pageWrapper-2PwDoS {
      background-color: var(--background-primary) !important;
  }
  .base-3bcbY3 {
      opacity: 0.7;
      font-size: 9pt;
      top: -20px;
      left: 2px;
      text-shadow: 0 0 3px 3px black;
  }
  .sidebar-1tnWFu {
      background: var(--bg-overlay-3,var(--background-secondary));
  }
  .scroller-1ox3I2, .scroller-WSmht3 {
      padding-bottom: 1.5em;
  }
  .panels-3wFtMD {
      border-radius: 1em;
  }
  .panels-3wFtMD {
      margin: -1em 0.5em 0.5em 0.5em;
      border: 1px solid var(--scrollbar-auto-track);
      box-shadow: 0 0 3px 1px #${colors.nbg}28;
      padding: 0.2em;
      background: var(--bg-overlay-2,var(--background-secondary-alt));
      max-width: 217px;
  }
  [class^="channelTextArea-"] {
      box-shadow: 0 0 3px 1px #${colors.nbg}28;
  }
  .panels-3wFtMD div[class^="container-"] {
      background: none;
  }
  .withTagAsButton-OsgQ9L, .withTagless-10ooWt {
      min-width: 105px;
  }
  .avatarWrapper-1B9FTW {
      margin-right: 2px;
  }
  [class^="channelTextArea-"] {
      margin-bottom: 0.6em !important;
      border: 1px solid var(--scrollbar-auto-track);
  }
  [class^="nameTag-"] {
      user-select: none !important;
  }
  [class^=menu-],[class^=submenu-] {
      border-radius: 0.5em;
      border: 1px solid var(--scrollbar-auto-track);
      box-shadow: 0 0 3px 1px #${colors.nbg}28;
  }
  .theme-dark [class^=menu-], .theme-dark [class^=submenu-] {
      background: #${colors.nbg};
  }
  .theme-light [class^=menu-], .theme-light [class^=submenu-] {
      background: #${colors.nfg};
  }
  [class^=submenu-] {
      margin: 0 -8px;
  }
  .theme-dark [class^=menu-]::after,.theme-dark [class^=submenu-]::after {
      content: "";
      position: absolute;
      inset: 0;
      z-index: -1;
      border-radius: 0.5em;
      backdrop-filter: blur(0.5em);
  }
  .theme-light [class^=menu-]::after,.theme-light [class^=submenu-]::after {
      content: "";
      position: absolute;
      inset: 0;
      z-index: -1;
      border-radius: 0.5em;
      backdrop-filter: blur(0.5em);
  }
  [class^=backdrop-] ~ [class*=layer-]>[class^=menu-]::before {
      content: "";
      position: absolute;
      inset: 0;
      z-index: 0;
      backdrop-filter: blur(0.5em);
      border-radius: 0.5em;
      box-shadow: 0 0 3px 1px #${colors.nbg}28;
      border: 1px solid var(--scrollbar-auto-track);
  }
  .section-3FmfOT, .divider-1tWBgZ, .scroller-1jBQYo {
      z-index: 2;
  }
  [id^="popout_"] ~ [class*=layer-]>[class^=menu-]::before {
      content: "";
      position: absolute;
      inset: 0;
      z-index: 0;
      backdrop-filter: blur(0.5em);
      border-radius: 8px;
      box-shadow: 0 0 3px 1px #${colors.nbg}28;
      border: 1px solid var(--scrollbar-auto-track);
  }
  .theme-light [class^=autocomplete-] {
      background: #${colors.dfg};
      border-radius: 0.5em;
  }
  .theme-dark [class^=autocomplete-] {
      background: #${colors.nbg};
      border-radius: 0.5em;
  }
  [class^=autocomplete-]::before {
      content: "";
      position: absolute;
      inset: 0;
      z-index: 0;
      backdrop-filter: blur(0.75em);
      border-radius: 0.5em;
      box-shadow: 0 0 3px 1px #${colors.lbg};
      border: 1px solid var(--scrollbar-auto-track);
  }
  [class^="positionLayer-"] ~ .theme-light[class*=layer-]>[class^=menu-] {
      background: #${colors.dfg};
  }
  [class^="positionLayer-"] ~ .theme-dark[class*=layer-]>[class^=menu-] {
      background: #${colors.nbg};
  }
  [class^="positionLayer-"] ~ [class*=layer-]>[class^=menu-]::before {
      content: "";
      position: absolute;
      inset: 0;
      z-index: 0;
      backdrop-filter: blur(0.5em);
      border-radius: 0.5em;
      box-shadow: 0 0 3px 1px #${colors.lbg};
      border: 1px solid var(--scrollbar-auto-track);
  }
  .theme-light .container-_dQaft, .theme-light .messagesPopoutWrap-3zryHW, .theme-light .recentMentionsPopout-2bI1ZN, .theme-light .container-18GwIk {
      border-radius: 0.5em;
      background: #${colors.dfg};
      backdrop-filter: blur(1em);
      box-shadow: 0 0 3px 1px #${colors.lbg};
      border: 1px solid var(--scrollbar-auto-track);
  }
  .theme-dark .container-_dQaft, .theme-dark .messagesPopoutWrap-3zryHW, .theme-dark .recentMentionsPopout-2bI1ZN, .theme-dark .container-18GwIk {
      border-radius: 0.5em;
      background: #${colors.nbg};
      backdrop-filter: blur(1em);
      box-shadow: 0 0 3px 1px #${colors.lbg};
      border: 1px solid var(--scrollbar-auto-track);
  }
  .container-1A0qQO, .container-nwU-8G, .messageContainer-3VTXBC {
      background: none;
  }
  .theme-light .userProfileInnerThemedNonPremium-1gT-zY, .theme-light .userProfileOuterUnthemed-2b2rsv {
      background: #${colors.dfg};
      box-shadow: 0 0 3px 1px #${colors.lbg};
  }
  .theme-dark .userProfileInnerThemedNonPremium-1gT-zY, .theme-dark .userProfileOuterUnthemed-2b2rsv {
      background: #${colors.lbg};
      box-shadow: 0 0 3px 1px #${colors.lbg};
  }
  .userProfileOuterUnthemed-2b2rsv::after {
      content: "";
      position: absolute;
      inset: 0;
      z-index: -1;
      border-radius: 0.5em;
      backdrop-filter: blur(1em);
      border: 1px solid var(--scrollbar-auto-track);
  }
  .theme-dark .root-g14mjS {
      background: #${colors.nbg};
      border-radius: 0.5em;
      backdrop-filter: blur(0.5em);
      box-shadow: 0 0 3px 1px #${colors.nbg}14 !important;
  }
  .theme-light .root-g14mjS {
      background: #${colors.dfg};
      border-radius: 0.5em;
      backdrop-filter: blur(0.5em);
      box-shadow: 0 0 3px 1px #${colors.nbg}14 !important;
  }
  [aria-label="User Profile Modal"]>.root-g14mjS {
      background: none !important;
  }
  .theme-light [class^=popout-], .theme-light [class^=popoutContainer-] {
      background: #${colors.dfg};
      backdrop-filter: blur(0.5em);
      border-radius: 0.5em;
      box-shadow: 0 0 3px 1px #${colors.lbg};
      border: 1px solid var(--scrollbar-auto-track);
  }
  .theme-dark [class^=popout-], .theme-dark [class^=popoutContainer-] {
      background: #${colors.nbg};
      backdrop-filter: blur(0.5em);
      border-radius: 0.5em;
      box-shadow: 0 0 3px 1px #${colors.lbg};
      border: 1px solid var(--scrollbar-auto-track);
  }
  [class^="profileCardUsernameRow-"] + [aria-label="User Badges"] {
      background: none !important;
  }
  .theme-dark [class^="accountProfileCard-"] {
      background: #${colors.nbg};
      box-shadow: 0 0 3px 1px #${colors.lbg};
      border: 1px solid var(--scrollbar-auto-track);
  }
  .theme-light [class^="accountProfileCard-"] {
      background: #${colors.wht};
      box-shadow: 0 0 3px 1px #${colors.lbg};
      border: 1px solid var(--scrollbar-auto-track);
  }
  .theme-light .container-2McqkF {
      background: #${colors.dfg};
      backdrop-filter: blur(0.5em);
      border-radius: 0.5em;
      box-shadow: 0 0 3px 1px #${colors.lbg};
      border: 1px solid var(--scrollbar-auto-track);
  }
  .theme-dark .container-2McqkF {
      background: #${colors.nbg};
      backdrop-filter: blur(0.5em);
      border-radius: 0.5em;
      box-shadow: 0 0 3px 1px #${colors.lbg};
      border: 1px solid var(--scrollbar-auto-track);
  }
  .theme-light [class^="quickswitcher-"] {
      background: #${colors.nfg};
      backdrop-filter: blur(0.5em);
      border-radius: 0.5em;
      box-shadow: 0 0 3px 1px #${colors.lbg};
      border: 1px solid var(--scrollbar-auto-track);
  }
  .theme-dark [class^="quickswitcher-"] {
      background: #${colors.lbg};
      backdrop-filter: blur(0.5em);
      border-radius: 0.5em;
      box-shadow: 0 0 3px 1px #${colors.lbg};
      border: 1px solid var(--scrollbar-auto-track);
  }
  [class^="quickswitcher-"]>[class^="scroller-"] {
      background: none;
  }
  [class^="backdrop-"] + [class^="layer-"] {
      backdrop-filter: blur(0.25em);
  }
  [class^="item-"],button,[aria-label="Set Status"] {
      border-radius: 0.75em !important;
  }
  [class^="searchBar-"]>button {
      opacity: 0.5;
  }
  [class*="repliedMessage"] {
      border-left: 4px solid;
      border-color: var(--interactive-muted);
      padding-left: 0.75em;
      display: grid;
      position: absolute;
      transform: translateY(1.5em);
      z-index: 1;
  }
  [class*="repliedMessage"]:before {
      display: none;
  }
  [class*="repliedMessage"] + [class*="contents"] [class*="header"]  {
      padding-bottom: 2.2em;
  }
  [class*="repliedMessage"] [class*="replyAvatar"] {
      display: none;
  }
  [class*="repliedMessage"] [class*="botTag"] {
      display: none;
  }
  [class*="replyBadge"], [class*="executedCommandAvatar"] {
      display: none !important;
  }
  [class*="repliedTextContent"], [class*="repliedTextPreview"] {
      grid-row: 2;
  }
  [class*="executedCommand"] {
      display: flex;
  }
  [class*="executedCommand"] + [class*="contents"] [class*="header"]  {
      padding-bottom: 1.3em;
  }
  [class*="mentioned"]:before {
      background-color: var(--background-mentioned);
  }
  [class*="avatarDecoration-"] { display: none; }
  .theme-dark [aria-label="Message Actions"] > [class^="wrapper-"] {
      background: #${colors.nbg};
      border-radius: 0.5em;
      backdrop-filter: blur(0.5em);
      box-shadow: 0 0 3px 1px #${colors.nbg}14 !important;
      border: 1px solid var(--scrollbar-auto-track);
  }
  .theme-light [aria-label="Message Actions"] > [class^="wrapper-"] {
      background: #${colors.dfg};
      border-radius: 0.5em;
      backdrop-filter: blur(0.5em);
      box-shadow: 0 0 3px 1px #${colors.nbg}14 !important;
      border: 1px solid var(--scrollbar-auto-track);
  }



  // Display code languages.
  code.hljs:not(.inline)::before {
      content:     attr(class);
      float:       right;
      max-width:   5.3rem;
      margin-top:  -8.6rem;
      line-height: 1.6rem;
      text-align:  right;
      font-size:   0.8rem;
      opacity:     0.6;
  }

  // Compact Sidebar.
  .sidebar-2K8pFh {
      width: 180px !important;
  }

  // Hide Stuff 
  // ----------
  // Scrollbars.
  ::-webkit-scrollbar {
      display: none;
  }
  // Date.
  [class*="divider-IqmEqJ"],
  [class*="timestampVisibleOnHover"],
  // Ugly leaf thing.
  [class*="newMemberBadge-3PdStX"],
  // Useless options for the bourgeois.
  [aria-label="Send a gift"],
  [aria-label="Open sticker picker"],
  // Stalker mode.
  [class*="typing-2J1mQU"]
  {
      display: none !important;
  }
''
