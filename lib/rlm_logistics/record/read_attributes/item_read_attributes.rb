module ItemReadAttributes

  def self.extended(base)
    base.class.attribute :company_name
    base.class.attribute :division_name
    base.class.attribute :season_formatted
    base.class.attribute :season_formatted_noseparator
    base.class.attribute :season_name
    base.class.attribute :deliveries_by_color
    base.class.attribute :delivery_period
    base.class.attribute :delivery_period_description
    base.class.attribute :delivery_period_from_date
    base.class.attribute :delivery_period_to_date
    base.class.attribute :style_delivery_period
    base.class.attribute :internal_sku_number
    base.class.attribute :fabric
    base.class.attribute :fabric_description
    base.class.attribute :length
    base.class.attribute :length_description
    base.class.attribute :style_name
    base.class.attribute :style_name_additional
    base.class.attribute :ws_price_01
    base.class.attribute :ws_price_02
    base.class.attribute :ws_price_03
    base.class.attribute :ws_price_04
    base.class.attribute :ws_price_05
    base.class.attribute :ws_price_06
    base.class.attribute :ws_price_07
    base.class.attribute :ws_price_08
    base.class.attribute :retail_price
    base.class.attribute :retail_price_02
    base.class.attribute :retail_price_03
    base.class.attribute :retail_price_04
    base.class.attribute :retail_price_05
    base.class.attribute :retail_price_06
    base.class.attribute :retail_price_07
    base.class.attribute :retail_price_08
    base.class.attribute :cost
    base.class.attribute :default_fgpo_price
    base.class.attribute :group_code
    base.class.attribute :group_name
    base.class.attribute :group_material_content
    base.class.attribute :group_line_sheet_sequence
    base.class.attribute :category_code
    base.class.attribute :category_name
    base.class.attribute :category_sequence
    base.class.attribute :size_scale_01
    base.class.attribute :size_scale_02
    base.class.attribute :size_scale_03
    base.class.attribute :unit_of_measure
    base.class.attribute :quota_category
    base.class.attribute :hts_number_01
    base.class.attribute :country_of_origin
    base.class.attribute :userdef1_code
    base.class.attribute :userdef1_description
    base.class.attribute :userdef2_code
    base.class.attribute :userdef2_description
    base.class.attribute :userdef3_code
    base.class.attribute :userdef3_description
    base.class.attribute :userdef4_code
    base.class.attribute :userdef4_description
    base.class.attribute :userdef5_code
    base.class.attribute :userdef5_description
    base.class.attribute :userdef6_code
    base.class.attribute :userdef6_description
    base.class.attribute :discontinued_flag
    base.class.attribute :royalty_code
    base.class.attribute :edi_flag
    base.class.attribute :edi_selection_code
    base.class.attribute :lead_time_in_days
    base.class.attribute :factory_number
    base.class.attribute :weight
    base.class.attribute :measurement_length
    base.class.attribute :measurement_height
    base.class.attribute :measurement_width
    base.class.attribute :material_content_code
    base.class.attribute :material_content_description
    base.class.attribute :material_group_content
    base.class.attribute :gender
    base.class.attribute :gender_description
    base.class.attribute :sub_division_code
    base.class.attribute :sub_division_description
    base.class.attribute :sub_category_code
    base.class.attribute :sub_category_description
    base.class.attribute :sub_category_sequence
    base.class.attribute :long_description
    base.class.attribute :styling_description
    base.class.attribute :addl_trim_description
    base.class.attribute :item_cross_reference
    base.class.attribute :upclabel_desc1
    base.class.attribute :web_ready
    base.class.attribute :sent_ecommerce
    base.class.attribute :div_cat_subcat
    base.class.attribute :body_type_code
    base.class.attribute :body_type_description
    base.class.attribute :sty_category1_code
    base.class.attribute :sty_category1_description
    base.class.attribute :sty_category2_code
    base.class.attribute :sty_category2_description
    base.class.attribute :fabrication_code
    base.class.attribute :fabrication_description
    base.class.attribute :garment_type_code
    base.class.attribute :garment_type_description
    base.class.attribute :material_type_code
    base.class.attribute :material_type_description
    base.class.attribute :main_material_code
    base.class.attribute :main_material_description
    base.class.attribute :main_material_content
    base.class.attribute :nrf_code
    base.class.attribute :hang_tag1_code
    base.class.attribute :hang_tag1_description
    base.class.attribute :hang_tag2_code
    base.class.attribute :hang_tag2_description
    base.class.attribute :hang_tag3_code
    base.class.attribute :hang_tag3_description
    base.class.attribute :hang_tag4_code
    base.class.attribute :hang_tag4_description
    base.class.attribute :hang_tag5_code
    base.class.attribute :hang_tag5_description
    base.class.attribute :hang_tag6_code
    base.class.attribute :hang_tag6_description
    base.class.attribute :hang_tag7_code
    base.class.attribute :hang_tag7_description
    base.class.attribute :hang_tag8_code
    base.class.attribute :hang_tag8_description
    base.class.attribute :hang_tag9_code
    base.class.attribute :hang_tag9_description
    base.class.attribute :hang_tag10_code
    base.class.attribute :hang_tag10_description
    base.class.attribute :user_created
    base.class.attribute :date_created_yyyymmdd
    base.class.attribute :sku_color
    base.class.attribute :color
    base.class.attribute :color_description
    base.class.attribute :super_color
    base.class.attribute :line_list_page
    base.class.attribute :line_list_position
    base.class.attribute :image_url
    base.class.attribute :photo_url
    base.class.attribute :color_photo_url
    base.class.attribute :currency
    base.class.attribute :sizes
    base.class.attribute :upcs
  end
end