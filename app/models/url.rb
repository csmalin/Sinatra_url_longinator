class Url < ActiveRecord::Base
  validates :url, :presence => true
  
  before_create :generate_url, :verify

  def generate_url
    self.short_url = SecureRandom.urlsafe_base64(19)
  end 

  def add_click
    self.click_count += 1
    self.save
    puts self.click_count
  end

  def verify
    unless !!(self.url[0..6] =~ /^http:\/\//)
       puts self.url = "http://" + self.url
    end
  end

end
