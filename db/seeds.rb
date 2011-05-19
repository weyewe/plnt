
User.create :email => "w.yunnal@gmail.com" , :password => "willy1234", 
  :password_confirmation => "willy1234", :role => "admin"
  
User.create :email => "sudirmanutomo@yahoo.com", :password => "dirman1234",
  :password_confirmation => "dirman1234", :role => "director"

User.create :email => "trie.entry@gmail.com" , :password => "trie1234",
  :password_confirmation => "trie1234", :role => "entry"

BreakdownStatus.create(:name => "B1")
BreakdownStatus.create(:name => "B2")
BreakdownStatus.create(:name => "B3")
BreakdownStatus.create(:name => "B4")
BreakdownStatus.create(:name => "B5")