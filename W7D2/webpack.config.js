var path = require('path');

module.exports = {
  entry: './frontend/todo_redux.jsx',
  output: {
<<<<<<< HEAD
    filename: './bundle.js',
=======
    filename: './app/assets/javascripts/bundle.js',
>>>>>>> W7D2/master
    path: path.resolve(__dirname)
  },
  module: {
    rules: [
      {
        test: [/\.jsx?$/],
        exclude: /(node_modules)/,
        use: {
          loader: 'babel-loader',
          query: {
            presets: ['env', 'react']
          }
        },
      }
    ]
  },
  devtool: 'source-map',
  resolve: {
    extensions: ['.js', '.jsx', '*']
  }
};
