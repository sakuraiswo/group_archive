Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://group-archive.onrender.com'  # ここを適切なオリジンに変更してください
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      expose: ['Authorization', 'X-CSRF-Token', 'ETag']
  end
end