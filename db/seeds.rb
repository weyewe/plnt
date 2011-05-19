
User.create :email => "entry@gmail.com" , :password => "entry1234", 
  :password_confirmation => "entry1234", :role_id => 1
  
User.create :email => "director@gmail.com", :password => "direct1234",
  :password_confirmation => "direct1234", :role_id => 2 



BreakdownStatus.create(:name => "B1")
BreakdownStatus.create(:name => "B2")
BreakdownStatus.create(:name => "B3")
BreakdownStatus.create(:name => "B4")
BreakdownStatus.create(:name => "B5")