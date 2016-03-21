module RlmLogistics
  class Client <  ActiveRecord::Remote::Client

    content_type "text/xml; charset=utf-8"
    host "www.ronlynn.com"
    # RLM's API is particularly slow due to a large amount of data that is
    # returned, so we bump the default Net::HTTP read_timeout to 120 seconds
    # opposed to the default of 60 seconds
    read_timeout 120

    def endpoint_path
      "#{RlmLogistics.endpoint_path}/services"
    end

  end
end
