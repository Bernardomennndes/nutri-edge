const { hairlineWidth, platformSelect } = require('nativewind/theme');

/** @type {import('tailwindcss').Config} */
module.exports = {
  // NOTE: Update this to include the paths to all of your component files.
  content: ['./app/**/*.{js,jsx,ts,tsx}', './components/**/*.{js,jsx,ts,tsx}'],
  plugins: [],
  presets: [require('nativewind/preset')],
  theme: {
    extend: {
      borderWidth: {
        hairline: hairlineWidth(),
      },
      colors: {
        accent: {
          DEFAULT: withOpacity('accent'),
          foreground: withOpacity('accent-foreground'),
        },
        background: withOpacity('background'),
        border: withOpacity('border'),
        card: {
          DEFAULT: withOpacity('card'),
          foreground: withOpacity('card-foreground'),
        },
        destructive: {
          DEFAULT: withOpacity('destructive'),
          foreground: withOpacity('destructive-foreground'),
        },
        foreground: withOpacity('foreground'),
        input: withOpacity('input'),
        muted: {
          DEFAULT: withOpacity('muted'),
          foreground: withOpacity('muted-foreground'),
        },
        popover: {
          DEFAULT: withOpacity('popover'),
          foreground: withOpacity('popover-foreground'),
        },
        primary: {
          DEFAULT: withOpacity('primary'),
          foreground: withOpacity('primary-foreground'),
        },
        ring: withOpacity('ring'),
        secondary: {
          DEFAULT: withOpacity('secondary'),
          foreground: withOpacity('secondary-foreground'),
        },
      },
    },
  },
};

function withOpacity(variableName) {
  return ({ opacityValue }) => {
    if (opacityValue !== undefined) {
      return platformSelect({
        android: `rgb(var(--android-${variableName}) / ${opacityValue})`,
        ios: `rgb(var(--${variableName}) / ${opacityValue})`,
      });
    }
    return platformSelect({
      android: `rgb(var(--android-${variableName}))`,
      ios: `rgb(var(--${variableName}))`,
    });
  };
}
