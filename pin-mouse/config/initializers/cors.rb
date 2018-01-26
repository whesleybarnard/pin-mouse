Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*'
      resource '/scheduled_pins/save_pin_id',
        headers: :any,
        # methods: %i(get post put patch delete options head)
        # TODO: ensure only post is need. might need options or header?
        methods: %i(post)
    end
  end