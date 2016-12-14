class TaskController < ApplicationController
  def index
    @title = "Get Task"
  end
  def ajax
    #If search metric value
    if(params["metric_name"] != "")
      @result = Metric.select("*").where("metric_name like ?", "%"+params["metric_name"]+"%")
    else
      #if search driver name
      if(params["driver_name"] != "")
        @selectedDrivers = Driver.select("driver_id").where("name like ?", "%"+params["driver_name"]+"%").to_a.map(&:serializable_hash)
        @driversArray = []
          @selectedDrivers.each do |key, value|
              @driversArray.push(key["driver_id"])
          end
        @result = Metric.select("*").where(driver_id: @driversArray)
      else
        #if search all metrics
        @result =  Metric.select("*")
      end
  end
   render :json => @result
  end

end
