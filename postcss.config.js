let environment = {
  plugins: [
    require('tailwindcss'),
    require('autoprefixer'),
    require('postcss-import'),
    require('postcss-flexbugs-fixes'),
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      stage: 3
    })
  ]
}

// Run PurgeCSS in production or staging, not in development
if (!(process.env.RAILS_ENV === 'development')) {
  environment.plugins.push(
    require('@fullhuman/postcss-purgecss')({
      content: [
      './app/**/*.html.haml',
      './app/helpers/**/*.rb',
      './app/javascript/**/*.js',
    ],
      defaultExtractor: content => content.match(/[A-Za-z0-9-_:/]+/g) || []
    })
  )
}

module.exports = environment
