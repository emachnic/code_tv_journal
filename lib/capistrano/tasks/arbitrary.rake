namespace :arbitrary do

  desc 'Checks for the arbitrary.txt file and uploads if missing'
  task :setup do
    on roles(:app) do
      as :deploy do
        file = "#{shared_path}/arbitrary.txt"
        if test("[ -e #{file} ]")
          puts 'arbitrary.txt already in place'
        else
          upload! "#{ENV['HOME']}/arbitrary.txt", "#{shared_path}/arbitrary.txt"
        end
        execute :ln, '-s', "#{shared_path}/arbitrary.txt", "#{current_path}/arbitrary.txt"
      end
    end
  end

  desc 'Runs the "arbitrary" rake task on the remote servers'
  task :print do
    on roles(:app), in: :parallel do
      within current_path do
        as :deploy do
          rake 'arbitrary'
        end
      end
    end
  end

end

desc 'Run the "arbitrary:setup" and "arbitrary:print" tasks'
task :arbitrary do
  invoke 'arbitrary:setup'
  invoke 'arbitrary:print'
end
