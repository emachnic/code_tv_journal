desc 'This is just an arbitrary rake task. Nothing to see here.'
task :arbitrary do
  sh "cat #{Rails.root.join('arbitrary.txt').to_s}"
end
