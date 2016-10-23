bind "tcp://#{ENV['BIND_ON']}"
threads_count = ENV.fetch('RAILS_MAX_THREADS') { 5 }.to_i
threads threads_count, threads_count
port ENV.fetch('PORT') { 3000 }
environment ENV.fetch('RAILS_ENV') { 'development' }
plugin :tmp_restart
pidfile "tmp/pids/puma.pid"
workers ENV.fetch('WEB_CONCURRENCY') { 0 }
