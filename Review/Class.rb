class Staff
 class << self

  def public_class
   puts "public_class is public method!!!!"
   self.protected_class
   self.private_class
   Staff.protected_class
   Staff.private_class #Error private method `private_class' called for Staff:Class (NoMethodError)
  end
 
  protected
  def protected_class
   puts "protected_class is protected method!!!!"
  end

  private
  def private_class
   puts "private_class is private method!!!!"
  end

 end

end

Staff.public_class