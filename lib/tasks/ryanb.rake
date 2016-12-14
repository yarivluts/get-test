namespace :init do
  desc "Init Drivers Data"
  task :drivers => :environment do
    file = File.read('init_assets/drivers.json')
    a_hash = JSON.parse(file)
    a_hash.each do |key, value|
      if(!key.nil?)
        data = key
         if(!data.nil?)
           puts "new Driver "+data["name"]+" created"
           new_record = Driver.new()
           new_record.name = data["name"]
           new_record.license_number = data["license_number"]
           new_record.driver_id = data["id"]
           new_record.save()
         end
       end
    end
  end

  task :metrics => :environment do
    file = File.read('init_assets/metrics.json')
    a_hash = JSON.parse(file)
    a_hash.each do |key, value|
      if(!key.nil?)
        data = key
         if(!data.nil?)
          # puts "new Metric "+data["name"]+" created"
          if(!Driver.where(:driver_id => data["driver_id"]).blank?)
             new_record = Metric.new()
             new_record.metric_name = data["metric_name"]
             new_record.lat = data["lat"]
             new_record.lon = data["lon"]
             new_record.value = data["value"]
             new_record.timestamp = data["timestamp"]
             new_record.driver_id = data["driver_id"]
             new_record.save()
          end
         end
       end
    end
  end

end
