var webpack = require('webpack');
var CommonsChunkPlugin = webpack.optimize.CommonsChunkPlugin;

module.exports = {
  entry: {
    'post': './coffee/post.coffee',
    'posts': './coffee/posts.coffee',
    'page': './coffee/page.coffee',
    'pages': './coffee/pages.coffee',
    'front': './coffee/front.coffee'
  },
  output: {
    path: './js',
    filename: '[name].js'
  },
  resolve: {
    extensions: ['', '.coffee']
  },
  module: {
    loaders: [
      {
        test: /\.coffee$/,
        loader: 'coffee' },
      {
        test: /masonry-layout/,
        loader: 'imports?define=>false&this=>window'
      }
    ]
  },
  plugins: [
    new CommonsChunkPlugin('commons.js', ['post', 'posts', 'page', 'pages', 'front'], 3)
  ]
};
