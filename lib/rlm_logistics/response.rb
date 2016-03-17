module RlmLogistics
  class Response <  ActiveRecord::Remote::Response

    def handle_response(response)
      body_string      = remove_junk(response.body)
      hash             = Hash.from_xml(body_string)
      soap_body        = hash["Envelope"]["Body"]
      @parsed_response = soap_body["#{operation}Response"]["#{operation}Return"]
      if valid?
        record_instance.parse(self)
      else
        record_instance.errors.add(:base, response_message)
      end
      self
    end

    def response_message
      parsed_response["RESPONSE"]["DESCRIPTION"]
    end

    def data
      parsed_response["RESPONSE"]["DATA"]["RECSET"]["REC"]
    end

    def valid?
      case response_code
      when "0"
        false
      when "1"
        true
      end
    end

    private

    def remove_junk(string)
      # Here we cleanup the response from RLM since their responses can be
      # quite large for inventory requests. As well we convert their escaped
      # xml string into valid xml so it can be parsed once
      string.gsub!("\n", "")
      string.gsub!("&lt;?xml version=&quot;1.0&quot; ", "")
      string.gsub!("encoding=&quot;UTF-8&quot; ?&gt;", "")
      string.gsub!(/\&lt\;COMPANY(.*?)\/SIZES\&gt\;/i, '')
      string.gsub!("&lt;", "<")
      string.gsub!("&gt;", ">")
      string.gsub!("\\", "")
      string.gsub!("&quot;", '"')
      string
    end

    def response_code
      parsed_response["RESPONSE"]["CODE"]
    end

  end
end
