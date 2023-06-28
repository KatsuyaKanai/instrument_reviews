# config valid for current version and patch releases of Capistrano
lock "~> 3.17.1"

# アプリケーションの指定
set :application, "instrument_reviews"
set :repo_url, "git@github.com:KatsuyaKanai/instrument_reviews.git"

# sharedディレクトリに入れるファイルを指定
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"

# SSH接続設定
set :ssh_options, {
  auth_methods: ['publickey'],
  keys: ['~/.ssh/6port.pem'],
}

# 保存しておく世代の設定
set :keep_releases, 5

# rbenvの設定
set :rbenv_type, :user
set :rbenv_ruby, '2.7.6'

# ここからUnicornの設定
# Unicornのプロセスの指定
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

# Unicornの設定ファイルの指定
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }

# Unicornを再起動するための記述
# after 'deploy:publishing', 'deploy:restart'
# namespace :deploy do
#   desc 'db_seed'
#   task :db_seed do
#     on roles(:db) do |host|
#       with rails_env: fetch(:rails_env) do
#         within current_path do
#           execute :bundle, :exec, :rake, 'db:seed'
#         end
#       end
#     end
#   end
#   task :restart do
#     invoke 'unicorn:restart'
#   end
after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  # 以下を追加
  desc 'db_seed'
  task :db_seed do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end
  # ここまでが追加分
  task :restart do
    invoke 'unicorn:restart'
  end
end

append :linked_files, 'config/master.key'
