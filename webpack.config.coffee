webpack = require 'webpack'
production = process.env.NODE_ENV is 'production'

appRoot = "#{__dirname}/app"

module.exports =
  cache: true
  debug: !production
  devtool: production ? false : 'eval'

  # The entry point
  entry: [
    "#{appRoot}/app.coffee"
  ]

  output:
    path: './_build'
    filename: 'socrat.js'
    chunkFilename: "[id].socrat.js"

  devServer: {
    hot: true,
  }

  module:
    loaders: [
      test: /\.jsx?$/
      exclude: /(node_modules|bower_components)/
      loader: 'babel'
    ,
      test: /\.less$/
      loader: 'style!css!less'
    ,
      test: /\.css$/
      loader: 'style!css'
    ,
      test: /\.coffee$/
      loader: 'coffee'
    ,
      test: /\.jade$/
      loader: 'jade-loader'
    ,
      test: /\.html$/,
      loader: 'html'
    ,
      # required for bootstrap icons
      test: /\.eot(\?v=\d+\.\d+\.\d+)?$/
      loader: "file"
    ,
      test: /\.(woff|woff2)$/
      loader: 'url?prefix=font/&limit=5000&mimetype=application/font-woff'
    ,
      test: /\.ttf(\?v=\d+\.\d+\.\d+)?$/
      loader: "url?limit=10000&mimetype=application/octet-stream"
    ,
      test: /\.svg(\?v=\d+\.\d+\.\d+)?$/
      loader: "url?limit=10000&mimetype=image/svg+xml"
  ]

  resolve:

    extensions: [
      ''
      '.js'
      '.coffee'
      '.less'
      '.css'
    ]

    root: appRoot

  plugins: [

  # disable dynamic requires
    new webpack.ContextReplacementPlugin(/.*$/, /a^/)

#    new webpack.ProvidePlugin
#      'angular': 'exports?window.angular!bower/angular'
  ]