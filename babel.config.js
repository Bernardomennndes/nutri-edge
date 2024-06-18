module.exports = function (api) {
  api.cache(true);
  const plugins = [
    [
      '@tamagui/babel-plugin',
      {
        components: ['tamagui'],
        config: './tamagui.config.ts',
        disableExtraction: process.env.NODE_ENV === 'development',
        logTimings: true,
      },
      'nativewind/babel',
    ],
  ];

  plugins.push('react-native-reanimated/plugin');

  return {
    plugins,
    presets: [
      ['babel-preset-expo', { jsxImportSource: 'nativewind' }],
      'nativewind/babel',
    ],
  };
};
