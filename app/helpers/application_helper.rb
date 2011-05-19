module ApplicationHelper

  def options_combo_from_collection_for_select( collection, value_method, text_method, parent_id_method )
    options = collection.map do |element|
      [element.send(text_method), element.send(value_method), element.send(parent_id_method)]
    end

    puts options.class 
    options_string = options.map do |element|
      "<option value=\"#{element[1]}\" " +
       "parent_value=\"#{element[2]}\" >" + 
      "#{element[0]}"  + 
      "</option>"
    end

    options_string.join
  end
  
  # def total_days_in_this_month
  #   Time.now.end_of_month.day - Time.now.beginning_of_month.day  + 1 
  # end
  
  def total_days_in_this_month(year, month)
    Time.local( year, month ).end_of_month.day - Time.local( year, month ).beginning_of_month.day  + 1 
  end
  
  
  def random_value
    (100*rand).round
  end

end
