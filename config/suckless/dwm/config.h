/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "JetBrains Mono Nerd Font:style=Medium:size=11", "Font Awesome 6 Free:style=Solid:size=10", "Noto Color Emoji:size=10" };
static const char dmenufont[]       = "JetBrains Mono Nerd Font:style=Medium:size=11";

/* Nord color scheme */
static const char nord0[]           = "#2e3440"; /* polar night */
static const char nord1[]           = "#3b4252"; /* polar night */
static const char nord2[]           = "#434c5e"; /* polar night */
static const char nord3[]           = "#4c566a"; /* polar night */
static const char nord4[]           = "#d8dee9"; /* snow storm */
static const char nord5[]           = "#e5e9f0"; /* snow storm */
static const char nord6[]           = "#eceff4"; /* snow storm */
static const char nord7[]           = "#8fbcbb"; /* frost */
static const char nord8[]           = "#88c0d0"; /* frost */
static const char nord9[]           = "#81a1c1"; /* frost */
static const char nord10[]          = "#5e81ac"; /* frost */
static const char nord11[]          = "#bf616a"; /* aurora */
static const char nord12[]          = "#d08770"; /* aurora */
static const char nord13[]          = "#ebcb8b"; /* aurora */
static const char nord14[]          = "#a3be8c"; /* aurora */
static const char nord15[]          = "#b48ead"; /* aurora */
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { nord4,     nord0,     nord2 },
	[SchemeSel]  = { nord6,     nord10,    nord8  },
};

/* tagging */
static const char *tags[] = { "󰅴 ", "󰖟", "󰈹", "󰎆", "󰏃", "󰓇", "󰊻", "󰍡", "󰑴" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "󰙀",      tile },    /* first entry is default */
	{ "󰖲",      NULL },    /* no layout function means floating behavior */
	{ "󱖇",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
// static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *dmenucmd[] = { "dmenu_run", "-l", "10", "-m", dmenumon, "-fn", dmenufont, "-nb", nord0, "-nf", nord4, "-sb", nord10, "-sf", nord6, NULL };
static const char *termcmd[]  = { "st", NULL };

static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_p,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_a,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY|ShiftMask,             XK_m,      spawn,          SHCMD("/etc/nixos/config/suckless/dmenu/scripts/dmenu_sys") },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          SHCMD("/etc/nixos/config/suckless/dmenu/scripts/dmenu_surf") },
	{ MODKEY|ShiftMask,             XK_s,      spawn,          SHCMD("flameshot gui") },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_agrave, view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_agrave, tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_ampersand,              0) // & = 1
    TAGKEYS(                        XK_eacute,                 1) // é = 2
    TAGKEYS(                        XK_quotedbl,               2) // " = 3
    TAGKEYS(                        XK_apostrophe,             3) // ' = 4
    TAGKEYS(                        XK_parenleft,              4) // ( = 5
    TAGKEYS(                        XK_minus,                  5) // - = 6
    TAGKEYS(                        XK_egrave,                 6) // è = 7
    TAGKEYS(                        XK_underscore,             7) // _ = 8
    TAGKEYS(                        XK_ccedilla,               8) // ç = 9
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

