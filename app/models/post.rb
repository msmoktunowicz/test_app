class Post < ActiveRecord::Base
  
  
 	after_save :set_visible_to_true
	validates :body, presence: true
 	validates :title, presence: true

  
protected
  def set_visible_to_false
    self.visible = false
    #self.save nie moze byc save 
  end
  
end
