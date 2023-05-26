{ colors, fonts }:
''
:root {
   --font-monospace:  "${fonts.mono}", monospace !important;
   --font-size:       14px;

   --accent:                  #${colors.blu};
   --attention:               #${colors.ylw};

   --primary-background:      #${colors.nbg};
	--secondary-background:    #${colors.lbg};
	--tertiary-background:     #${colors.blk};
	--tertiary-background-alt: #${colors.gry};
	--lighter-background:      #${colors.lbg};
   --darker-background:       #${colors.dbg};

	--primary-foreground:      #${colors.nfg};
	--secondary-foreground:    #${colors.dfg};
	--tertiary-foreground:     #${colors.wht};
	--dimmed-foreground:       #${colors.gry};
	--lighter-foreground:      #${colors.dfg};
}

.theme_dark, .theme_light,
:root {
	--header-primary:     var(--primary-foreground);
	--header-secondary:   var(--secondary-foreground);
	--text-normal:        var(--primary-foreground);
	--text-muted:         var(--secondary-foreground);
	--interactive-normal: var(--tertiary-foreground);
	--interactive-hover:  var(--secondary-foreground);
	--interactive-active: var(--lighter-foreground);
	--interactive-muted:  var(--dimmed-foreground);

	--input-background:   var(--background-secondary);

	--toast-background:   var(--background-primary);
	--toast-header:       var(--background-tertiary);
	--toast-contents:     var(--background-secondary);
	--toast-box-shadow:   rgba(var(--darker-background), 0.2);
	--toast-border:       var(--background-tertiary);

	--background-primary:           var(--primary-background);
	--background-secondary:         var(--secondary-background);
	--background-secondary-alt:     var(--tertiary-background);
	--background-tertiary:          var(--tertiary-background);
	--background-accent:            var(--brand-experiment);
	--background-floating:          var(--tertiary-background);
	--background-modifier-hover:    rgba(var(--primary-foreground), 0.01);
	--background-modifier-active:   rgba(var(--primary-foreground), 0.03);
	--background-modifier-selected: rgba(var(--primary-foreground), 0.04);
	--background-modifier-accent:   rgba(var(--primary-foreground), 0.06);

	--channeltextarea-background:   var(--darker-background);

	--activity-card-background:              var(--background-primary);
	--deprecated-card-bg:                    rgba(var(--darker-background), 0.2);
	--deprecated-card-editable-bg:           rgba(var(--darker-background), 0.1);
	--deprecated-text-input-bg:              var(--deprecated-card-editable-bg);
	--deprecated-text-input-border:          var(--background-floating);
	--deprecated-text-input-border-disabled: var(--background-tertiary);
    
   --background-mentioned:                  var(--lighter-background);
   --background-mentioned-hover:            var(--tertiary-background);
}

::selection {
    color:      var(--primary-background);
    background: var(--primary-foreground);
}

[class*="notice-12Koq- notice-2HEN-u"]
{ background-color: transparent !important; }

.jumpToPresentBar-1cEnH0,
.newMessagesBar-1hF-9G {
    color:            var(--dimmed-foreground);
    background-color: var(--secondary-background);
    border-radius:    0;
}

/** Collapse **/
/* Server List */
nav[aria-label="Servers sidebar"] {
    width: 10px;
    transition: width 0.5s;
}
nav[aria-label="Servers sidebar"]:hover {
    width: 70px;
}

/** Hide **/
[aria-label="Channel header"],
/* Date */
[class*="divider-IqmEqJ"],
/* Inlined TimeStamp */
[class*="timestamp-p1Df1m timestampInline-_lS3aK"],
/* TimeStamp: hover */
[class*="timestampVisibleOnHover"],
/* TimeStamp */
[class*="latin24CompactTimeStamp-2pXUBq timestamp-p1Df1m"],
/* New Member badge */
[class*="newMemberBadge-3PdStX"],
/* Textbar buttons */
[aria-label="Send a gift"],
[aria-label="Open GIF picker"],
[aria-label="Open sticker picker"],
[aria-label="Select emoji"],
/* Ugly avatar frames */
[class*="avatarDecoration-"],
[class*="typing-2J1mQU"]
{
    display: none !important;
}
/* No scrollbars */
::-webkit-scrollbar {
    display: none;
}

/* Unshit sidebar */
[class*="sidebar-1tnWFu"] {
    padding: 1em;
    width: 240px;
}

/* Fancy replies */
[class*="repliedMessage"] {
   border-left:   4px solid;
   border-color:  var(--interactive-muted);
   padding-left:  0.75em;
   display:       grid;
   position:      absolute;
   transform:     translateY(1.5em);
   z-index:       1;
}
[class*="repliedMessage"]:before {
   display: none;
}
[class*="repliedMessage"] + [class*="contents"] [class*="header"]  {
   padding-bottom: 2.2em;
   margin-bottom:  0.4em;
}
[class*="repliedMessage"] [class*="replyAvatar"], 
[class*="repliedMessage"] [class*="botTag"],
[class*="replyBadge"], [class*="executedCommandAvatar"]
{
   display: none !important;
}
[class*="repliedTextContent"], [class*="repliedTextPreview"] {
   grid-row: 2;
}

/* Add padding around message area */
[class*="standardSidebarView"],
[class*="jumpToPresentBar-"],
[class*="typing-"],
[class*="channelTextArea"],
[class^="messagesWrapper-"] > * > [class*="scroller"],
[class*="autocomplete-"] {
    width:        90%;
    margin-left:  auto;
    margin-right: auto;
}

/* Bot Tags */
.botTagRegular-kpctgU {
    background: var(--tertiary-background);
    color:      var(--secondary-foreground);
}

/* Reactions */
.reaction-3vwAF2.reactionMe-1PwQAc
{
    background-color: var(--tertiary-background-alt) !important;
    border-color:     var(--tertiary-foreground) !important;
    border-radius:    0;
}
.reactionCount-26U4As
{
    color: var(--secondary-foreground) !important;
}

/* Links */
.anchor-1X4H4q, .anchorUnderlineOnHover-wiZFZ_ 
{
    color: var(--accent) !important;
}

/* Pings */
.mention, .wrapper-1ZcZW-
{
    background-color: var(--accent) !important;
    color:            var(--primary-background) !important;
}

/* Mentions */
.mentioned-Tre-dv {
    position:         relative;
    background-color: var(--background-mentioned) !important;
}
.mentioned-Tre-dv:before {
    content:          "";
    position:         absolute;
    display:          block;
    margin-left:      auto;
    margin-right:     auto;
    top:              0;
    bottom:           0;
    pointer-events:   none;
    width:            3px;
    color:            var(--attention) !important;
    background-color: var(--attention) !important;
}

/* Clean codeblocks up. */
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
code.hljs:not(.inline) {
    max-width:     720px;
    padding:       16px;
    border:        none;
    border-radius: 0;
}
pre > code,
pre > code * {
    font-family: var(--font-monospace) !important;
}
''
