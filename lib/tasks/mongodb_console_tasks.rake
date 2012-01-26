namespace :db do
  namespace :mongo do
    
    desc 'Open a MongoDB console for the current Rails.env'
    
    task :console => :environment do
      
      if Object.const_defined?('MongoMapper')
        conn = MongoMapper.connection
        name = MongoMapper.database.name
      elsif Object.const_defined?('Mongoid')
        conn = Mongoid.master.connection
        name = Mongoid.master.name
      end
      
      if conn
        args = []
        args << "--username=#{conn.username}" if conn.username
        args << "--password=#{conn.password}" if conn.password
        args << "--host=#{conn.host}"
        args << "--port=#{conn.port.to_s}"
        args << name
      end
      
      exec 'mongo', *args
      
    end
    
  end
end
