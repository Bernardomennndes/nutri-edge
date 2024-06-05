import * as React from 'react';
import {
  ImageErrorEventData,
  ImageLoadEventData,
  NativeSyntheticEvent,
  Image as RNImage,
  View,
} from 'react-native';

import { cn } from '~/lib/cn';

interface AvatarRootProps {
  alt: string;
}

interface AvatarImageProps {
  children?: React.ReactNode;
  onLoadingStatusChange?: (status: 'error' | 'loaded') => void;
}

type AvatarState = 'error' | 'loaded' | 'loading';

interface IRootContext extends AvatarRootProps {
  setStatus: (status: AvatarState) => void;
  status: AvatarState;
}

const RootContext = React.createContext<IRootContext | null>(null);

const Avatar = React.forwardRef<
  React.ElementRef<typeof View>,
  AvatarRootProps & React.ComponentPropsWithoutRef<typeof View>
>(({ alt, className, ...viewProps }, ref) => {
  const [status, setStatus] = React.useState<AvatarState>('loading');
  return (
    <RootContext.Provider value={{ alt, setStatus, status }}>
      <View
        className={cn(
          'relative flex h-10 w-10 shrink-0 overflow-hidden rounded-full',
          className,
        )}
        ref={ref}
        {...viewProps}
      />
    </RootContext.Provider>
  );
});

Avatar.displayName = 'Avatar';

function useRootContext() {
  const context = React.useContext(RootContext);
  if (!context) {
    throw new Error(
      'Avatar compound components cannot be rendered outside the Avatar component',
    );
  }
  return context;
}

const AvatarImage = React.forwardRef<
  React.ElementRef<typeof RNImage>,
  AvatarImageProps & Omit<React.ComponentPropsWithoutRef<typeof RNImage>, 'alt'>
>(
  (
    {
      className,
      onError: onErrorProps,
      onLoad: onLoadProps,
      onLoadingStatusChange,
      ...props
    },
    ref,
  ) => {
    const { alt, setStatus, status } = useRootContext();

    const onLoad = React.useCallback(
      (e: NativeSyntheticEvent<ImageLoadEventData>) => {
        setStatus('loaded');
        onLoadingStatusChange?.('loaded');
        onLoadProps?.(e);
      },
      [onLoadProps],
    );

    const onError = React.useCallback(
      (e: NativeSyntheticEvent<ImageErrorEventData>) => {
        setStatus('error');
        onLoadingStatusChange?.('error');
        onErrorProps?.(e);
      },
      [onErrorProps],
    );

    if (status === 'error') {
      return null;
    }

    return (
      <RNImage
        alt={alt}
        className={cn('aspect-square h-full w-full', className)}
        onError={onError}
        onLoad={onLoad}
        ref={ref}
        {...props}
      />
    );
  },
);

AvatarImage.displayName = 'AvatarImage';

const AvatarFallback = React.forwardRef<
  React.ElementRef<typeof View>,
  React.ComponentPropsWithoutRef<typeof View>
>(({ className, ...props }, ref) => {
  const { alt, status } = useRootContext();

  if (status !== 'error') {
    return null;
  }
  return (
    <View
      aria-label={alt}
      className={cn(
        'flex h-full w-full items-center justify-center rounded-full bg-muted',
        className,
      )}
      ref={ref}
      role='img'
      {...props}
    />
  );
});

AvatarFallback.displayName = 'AvatarFallback';

export { Avatar, AvatarFallback, AvatarImage };
