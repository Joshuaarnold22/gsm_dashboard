namespace :task do
  desc "Delete items that are older than 24 hours"
  task :delete_tasks => :environment do
    Task.all.each{ |t|
      t.destroy if t.time_left < 0
    }
  end
end
