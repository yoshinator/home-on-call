const { environment } = require('@rails/webpacker')

const webpack = require('webpack')

// Add plugins to the application.
environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  Popper: ['popper.js', 'default']
}))

module.exports = environment
