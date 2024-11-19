const path = require('path');  // pathモジュールをインポート

module.exports = {
  mode: 'development',
  entry: [
    'webpack-dev-server/client?http://localhost:8080/', // webpack-dev-serverを指定
    './app/javascript/packs/application.js',
  ],
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'public/packs'),
  },
  target: 'web',
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/preset-env'],
          },
        },
      },
    ],
  },
  resolve: {
    extensions: ['.js', '.jsx', '.json'],
  },
  devtool: 'source-map',
  devServer: {
    contentBase: path.join(__dirname, 'public'),
    compress: true,
    port: 8080,
    hot: true,  // Hot module replacementを有効にする
    publicPath: '/packs/', // Webpackが出力するパスを指定
  },
};
