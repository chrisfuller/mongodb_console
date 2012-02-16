namespace :db do
  namespace :mongo do
    desc 'Open a MongoDB console for the current Rails.env'
    task :console => :environment do
      if Object.const_defined? 'Mongoid'
        db = Mongoid.master
      elsif Object.const_defined? 'MongoMapper'
        db = MongoMapper.database
      end
      args = []
      unless db.nil?
        c = db.connection
        args << "--host=#{c.host}"
        args << "--port=#{c.port.to_s}"
        args << "--username=#{c.username}" if c.username rescue nil
        args << "--password=#{c.password}" if c.password rescue nil
        args << db.name
      end
      exec 'mongo', *args
    end
  end
end
