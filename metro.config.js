const { getDefaultConfig } = require('expo/metro-config');
const { withNativeWind } = require('nativewind/metro');

// eslint-disable-next-line no-undef
const config = getDefaultConfig(__dirname);

module.exports = withNativeWind(config, {
  inlineRem: 16,
  input: './global.css',
});
