require 'active_support'
require 'active_record/remote'
require 'rlm_logistics/client'

module RlmLogistics

  module Record
    autoload :Base,        'rlm_logistics/record/base'
    autoload :Address,     'rlm_logistics/record/address'
    autoload :Credit,      'rlm_logistics/record/credit'
    autoload :Inventory,   'rlm_logistics/record/inventory'
    autoload :Item,        'rlm_logistics/record/item'
    autoload :Line,        'rlm_logistics/record/line'
    autoload :PackedOrder, 'rlm_logistics/record/packed_order'
    autoload :SalesOrder,  'rlm_logistics/record/sales_order'
  end

  mattr_accessor :username, :password, :endpoint_path

  extend self

  def config
    yield self
  end

end
