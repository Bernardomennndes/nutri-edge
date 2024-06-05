import * as React from 'react';
import { UITextView } from 'react-native-uitextview';

import { cn } from '~/lib/cn';
import { VariantProps, cva } from 'class-variance-authority';
import { cssInterop } from 'nativewind';

cssInterop(UITextView, { className: 'style' });

const textVariants = cva('text-foreground', {
  defaultVariants: {
    color: 'primary',
    variant: 'body',
  },
  variants: {
    color: {
      primary: '',
      quarternary: 'text-muted-foreground/50',
      secondary: 'text-secondary-foreground/90',
      tertiary: 'text-muted-foreground/90',
    },
    variant: {
      body: 'text-[17px] leading-6',
      callout: 'text-base',
      caption1: 'text-xs',
      caption2: 'text-[11px] leading-4',
      footnote: 'text-[13px] leading-5',
      heading: 'text-[17px] leading-6 font-semibold',
      largeTitle: 'text-4xl',
      subhead: 'text-[15px] leading-6',
      title1: 'text-2xl',
      title2: 'text-[22px] leading-7',
      title3: 'text-xl',
    },
  },
});

const TextClassContext = React.createContext<string | undefined>(undefined);

function Text({
  className,
  color,
  variant,
  ...props
}: React.ComponentPropsWithoutRef<typeof UITextView> &
  VariantProps<typeof textVariants>) {
  const textClassName = React.useContext(TextClassContext);
  return (
    <UITextView
      className={cn(textVariants({ color, variant }), textClassName, className)}
      {...props}
    />
  );
}

export { Text, TextClassContext, textVariants };
