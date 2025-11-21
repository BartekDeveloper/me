# Portfolio Design System

## Core Philosophy
Modern, stylish, and dynamic. High contrast, fluid typography, and rich visual effects (glows, glassmorphism).

## Color Palette
### Backgrounds
- **Primary Dark**: Deep, rich dark tones (e.g., `#0a0a0a`, `#111111`).
- **Purple/Magenta**: Very dark purple-ish colors for backgrounds (e.g., `#1a051a`, `#0f020f`).
- **Card Backgrounds**: Extremely dark, almost black, with high transparency for glass effect.
- **Grayscale**: Subtle grayscale tones for contrast.

### Accents (Neon)
- **Primary Accent**: **Neon Green** (#39ff14) mixed with Purple/Magenta backgrounds.
- **Secondary Accents**: Neon Blue, Red, Yellow - used **sparingly** for specific highlights/alerts only. Do NOT mix Blue with Purple directly as a main theme.

### Gradients & Effects
- **Gradients**: Purple <-> Green mixes.
- **Blurs**: Heavy use of backdrop blurs and gaussian blurs.
- **Cursor**: Glass-like cursor follower animation.

## Typography
**Fluid Scale**: Based on [Utopia.fyi](https://utopia.fyi).
**Contrast**: Minimum AA, aiming for AAA on text.

### Font Families
- **Simple/Sans-serif**: Clean, modern (e.g., Inter, Geist).
- **Serif**: Elegant, for headings or quotes (e.g., Playfair Display).
- **Mono/Code**: For code blocks and technical details (e.g., JetBrains Mono, Fira Code).
- **Sophisticated**: For special headers (e.g., Cinzel, Bodoni).
- **Special**: Stylized fonts for artistic elements.

### Weights
- Extreme weight jumps for visual interest.
- **Light**: 100, 200, 300.
- **Bold**: 700, 800, 900.
- Avoid middle weights (400-600) for contrast.

## Visual Effects
- **Borders**:
    - **Outer**: **Ultra-thin** (1px or 0.5px) Neon Green. **Subtle opacity** to avoid distraction.
    - **Inner**: **Highly transparent** white/color (subtle double border).
- **Corners**: Fully rounded or significantly rounded.
- **Depth**:
    - **Glows**: Box-shadows with colors matching the element.
    - **Backdrop Blur**: Glassmorphism for cards and overlays.
    - **Shadows**: Deep, multi-layered shadows.
- **Animation**:
    - Scroll-triggered animations (fade-in, slide-up).
    - Hover effects: Glow intensification, border color shift.

## Section Layout
1. **Hero** (Main Page)
2. **About Me**
3. **Projects** (Showcase)
4. **Education & Career** (Tabbed Interface)
5. **Technologies**
6. **Contact Me**

## Components

### Buttons
**Common Traits**: Rounded, fluid padding, interactive hover states.

| Variant | Description | Visual Style |
| :--- | :--- | :--- |
| `primary` | Main call-to-action | Solid neon color, dark text, strong glow. |
| `secondary` | Alternative action | Semi-transparent background, visible border. |
| `accent` | Highlight action | Unique gradient or distinct neon color. |
| `primary-outline` | Ghost primary | Transparent bg, neon border, text matches border. |
| `secondary-outline` | Ghost secondary | Transparent bg, subtle border. |
| `link` | Inline links | Underline animation, color shift. |
| `nav-link` | Navigation items | Subtle glow on hover, active state indicator. |
| `regular` | Standard button | Neutral styling. |
| `custom` | Special cases | Fully custom props. |

### Layouts
- **Main**: Full-width, responsive grid.
- **Blog**: Readable width, focused typography.
- **Project**: Showcase layout with large media and sticky details.
