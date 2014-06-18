desc 'Runs the "arbitrary" rake task on the remote servers'
task :arbitrary do
  on roles(:app), in: :parallel do
    within current_path do
      as :deploy do
        SSHKit.config.command_map.prefix[:rake].push("bundle exec")
        rake 'arbitrary'
      end
    end
  end
end
