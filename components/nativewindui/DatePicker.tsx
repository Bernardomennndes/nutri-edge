import * as React from 'react';

import DateTimePicker from '@react-native-community/datetimepicker';

export function DatePicker(
  props: {
    mode: 'date' | 'datetime' | 'time';
  } & React.ComponentProps<typeof DateTimePicker>,
) {
  return <DateTimePicker {...props} />;
}
