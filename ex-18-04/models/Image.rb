class Image
  include Mongoid::Document
  
  field :id, type: Float
  field :url, type: String
  field :oper, type: String  
  field :height, type: Float
  field :width, type: Float
end  