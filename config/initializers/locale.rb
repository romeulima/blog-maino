I18n.load_path += Dir[Rails.root.join("lib/locale/*.{rb,yml}")]

I18n.available_locales = %i[en pt-BR]

I18n.default_locale = :'pt-BR'
