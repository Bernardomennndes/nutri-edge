import * as React from 'react';

import {
  BottomSheetBackdrop,
  BottomSheetBackdropProps,
  BottomSheetModal,
} from '@gorhom/bottom-sheet';
import { useColorScheme } from '~/lib/useColorScheme';

const Sheet = React.forwardRef<
  BottomSheetModal,
  React.ComponentPropsWithoutRef<typeof BottomSheetModal>
>(
  (
    { backgroundStyle, handleIndicatorStyle, index = 0, style, ...props },
    ref,
  ) => {
    const { colors } = useColorScheme();

    const renderBackdrop = React.useCallback(
      (props: BottomSheetBackdropProps) => (
        <BottomSheetBackdrop
          {...props}
          disappearsOnIndex={-1}
        />
      ),
      [],
    );
    return (
      <BottomSheetModal
        backdropComponent={renderBackdrop}
        backgroundStyle={
          backgroundStyle ?? {
            backgroundColor: colors.card,
          }
        }
        handleIndicatorStyle={
          handleIndicatorStyle ?? {
            backgroundColor: colors.grey4,
          }
        }
        index={0}
        ref={ref}
        style={
          style ?? {
            borderColor: colors.grey5,
            borderTopEndRadius: 16,
            borderTopStartRadius: 16,
            borderWidth: 1,
          }
        }
        {...props}
      />
    );
  },
);

function useSheetRef() {
  return React.useRef<BottomSheetModal>(null);
}

export { Sheet, useSheetRef };
