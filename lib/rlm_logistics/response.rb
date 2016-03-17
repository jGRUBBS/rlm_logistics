module RlmLogistics
  class Response <  ActiveRecord::Remote::Response

    def handle_response(response)
      body_string      = remove_junk(response.body)
      hash             = Hash.from_xml(body_string)
      soap_body        = hash["Envelope"]["Body"]
      @parsed_response = soap_body["#{operation}Response"]["#{operation}Return"]
      if valid?
        # save response in meaningful way
      else
        record_instance.errors.add(:base, response_message)
      end
    end

    def response_message
      parsed_response["RESPONSE"]["DESCRIPTION"]
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
      string.gsub!("\n", "")
      string.gsub!("&lt;?xml version=&quot;1.0&quot; ", "")
      string.gsub!("encoding=&quot;UTF-8&quot; ?&gt;", "")
      string.gsub!(/\&lt\;COMPANY(.*?)\/SIZES\&gt\;/i, '')
      string.gsub!("&lt;", "<")
      string.gsub!("&gt;", ">")
      string.gsub!("\\", "")
      string.gsub!("&quot;", '"')
    end

    def response_code
      parsed_response["RESPONSE"]["CODE"]
    end

    def response_data
      parsed_response["RESPONSE"]["DATA"]["RECSET"]["REC"]
    end

  end
end
