module RlmLogistics
  class Client <  ActiveRecord::Remote::Client

    content_type "text/xml; charset=utf-8"
    host "www.ronlynn.com"

    def endpoint_path
      "#{RlmLogistics.endpoint_path}/services"
    end

  end
end
