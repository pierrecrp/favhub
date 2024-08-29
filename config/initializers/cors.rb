Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'chrome-extension://hmjanmnlcpeclbadpeaijlpgmdgddccb'
    resource '*',
      headers: :any,
      methods: [:get, :post, :patch, :put],
      expose: ['Authorization'],
      credentials: true
  end
end
