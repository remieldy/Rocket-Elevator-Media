require 'rest-client'

class Streamer

    def getContent(type='chuck_norris')
        getHtmlFromCloud(type)
    end

    def getContent(type='weather')
      getHtmlFromCloud(type)
  end

    # method that returns a specific html depending on the "type" asked in the getContent method, is 'chuck_norris' by default
    def getHtmlFromCloud(type)
      if type == 'chuck_norris'  
        return "<div class='elevator-media-streamer-content'>#{JSON.parse(self.getChuckNorrisQuote)['value']['joke']}</div>"  
      end 
      if type == 'weather'  
        return "<div class='elevator-media-streamer-content'>#{self.getWeather}</div>"  
      end 
    end

# method that returns specific html depending on the "type" asked in the getContent method, is weather 
def getWeather()
  @response= RestClient::Request.execute(
    method: :get,
    url: 'http://api.openweathermap.org/data/2.5/forecast?id=524901&APPID=4f0a133d0a455077b361a5e599d95204',
    header: {}
  )
  return @response
  end

  def getChuckNorrisQuote()
    @response= RestClient::Request.execute(
      method: :Get,
      url: '',
      header: {}
    )
    return @response
    end

end
