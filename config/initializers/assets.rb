# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w(home/bootstrap.css home/owl.carousel.css home/owl.theme.css home/style.css home/responsive.css font-awesome/css/font-awesome.css)
Rails.application.config.assets.precompile += %w(home/modernizr.custom.js home/jquery.1.11.1.js home/bootstrap.js home/SmoothScroll.js home/jquery.isotope.js home/owl.carousel.js home/main.js)
