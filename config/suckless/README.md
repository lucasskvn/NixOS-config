# 🎨 Configuration DWM Esthétique

Cette configuration transforme votre environnement DWM en une interface moderne et élégante.

## ✨ Améliorations Esthétiques

### 🎨 Palette de Couleurs Nord
- **Nord Theme** : Palette de couleurs moderne et douce pour les yeux
- **Contraste optimal** : Couleurs soigneusement choisies pour la lisibilité

### 🔠 Polices Modernes
- **JetBrains Mono Nerd Font** : Police principale avec support des icônes
- **Font Awesome 6** : Icônes vectorielles pour les éléments UI
- **Noto Color Emoji** : Support complet des émojis

### 🏷️ Workspace Tags avec Icônes
- `󰈹` Bureau / Home
- `󰖟` Web / Firefox  
- `󰅴` Documents
- `󰎆` Musique
- `󰏃` Gaming
- `󰓇` Tools
- `󰊻` Chat
- `󰍡` Média
- `󰑴` Misc

### 📊 Barre d'État (Slstatus)
- `󰤨` Nom du réseau WiFi
- `󰁹` Pourcentage de batterie avec icône
- `󰻠` Usage CPU avec icône
- `󰍛` Usage RAM avec icône  
- `󰒃` Status VPN Mullvad (󰦝/󰦞)
- `󰕾` Volume audio
- `󰔏` Température système
- `󰃰` Date et heure

### 🖼️ Layout Indicators
- `󰙀` Tiled (par défaut)
- `󰖲` Floating
- `󱖇` Monocle

## 🔧 Installation & Usage

1. **Rebuild la configuration** :
   ```bash
   ./config/suckless/rebuild-dwm.sh
   ```

2. **Redémarrer la session X** ou rebooter

3. **Raccourcis DWM** :
   - `Mod+Shift+Q` : Redémarrer DWM
   - `Mod+d` : Dmenu (avec thème Nord)
   - `Mod+Return` : Ouvrir terminal

## 🎭 Aperçu Visuel

```
┌─────────────────────────────────────────────────────────────────┐
│ 󰈹 󰖟 󰅴 󰎆 󰏃 󰓇 󰊻 󰍡 󰑴 │ 󰙀 │ 󰤨 MyWiFi 󰁹 85% 󰻠 15% 󰍛 42% 󰒃 󰦝 󰕾 75% 󰔏 45°C 󰃰 lun 23/09 15:04 │
└─────────────────────────────────────────────────────────────────┘
│                                                                 │
│  ┌─────────────┐  ┌─────────────┐                              │
│  │             │  │             │                              │
│  │   Master    │  │   Stack     │                              │
│  │   Window    │  │   Window    │                              │
│  │             │  │             │                              │
│  └─────────────┘  └─────────────┘                              │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

## 🔮 Personnalisation

Pour modifier les couleurs, éditez les constantes dans `config/suckless/dwm/config.h` :

```c
/* Nord color scheme */
static const char nord0[] = "#2e3440"; /* polar night */
static const char nord8[] = "#88c0d0"; /* frost */
// ... autres couleurs
```

Pour changer les icônes des workspaces, modifiez le tableau `tags[]` dans le même fichier.

---

*Créé avec ❤️ pour une expérience DWM moderne et esthétique*
