on_app_master do
  sudo "systemctl restart sidekiq_#{config.app}"
end