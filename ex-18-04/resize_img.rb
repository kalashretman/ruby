class resize_img 
  def initialize url, width, height
  	@url = url
  	@width = width
  	@height = height
  end	

  def resize_image 
  	# resize and save image..
  	return @url
  end	
end