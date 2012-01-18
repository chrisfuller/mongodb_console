module MongodbConsole
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/mongodb_console_tasks.rake'
    end
  end
end
