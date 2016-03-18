module RlmLogistics
  module Record
    class Inventory < Base

      action    "Item"
      operation "getInventory"

      authenticate

      attribute :company_number
      attribute :division_number
      attribute :season_code
      attribute :season_year
      attribute :internal_sku_number
      attribute :style_number
      attribute :fabric
      attribute :length
      attribute :warehouse
      attribute :retrieve_upcs
      attribute :ats_positive
      attribute :ats_includes_wip
      attribute :ats_includes_openorders
      attribute :limit_rows
      attribute :upcs
      attribute :minimal_results
      attribute :required_data_only

      validates_presence_of :company_number

      def parse(response)
        @raw_data    = response.data
        @parsed_data = convert_raw_data
      end

      def convert_raw_data
        raw_data.flat_map do |item|
          upcs  = item["UPCS"].split(",")
          qtys  = item["ATS"].split(",").map(&:to_i) if item["ATS"]
          sizes = item["SIZES"].split(",")           if item["SIZES"]
          sku   = item["INTERNAL_SKU_NUMBER"].to_i   if item["INTERNAL_SKU_NUMBER"]
          color = item["COLOR"]
          style = item["STYLE_NUMBER"]
          upcs.map.with_index do |upc, idx|
            hash = { upc: upc }
            hash.merge!(quantity: qtys[idx]) if qtys
            hash.merge!(size: sizes[idx])    if sizes
            hash.merge!(color: color)        if color
            hash.merge!(style: style)        if style
            hash.merge!(sku: sku)            if sku
            hash
          end
        end
      end

    end
  end
end
