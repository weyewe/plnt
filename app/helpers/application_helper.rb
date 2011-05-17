module ApplicationHelper

  def options_combo_from_collection_for_select( collection, value_method, text_method, parent_id_method )
    options = collection.map do |element|
      [element.send(text_method), element.send(value_method), element.send(parent_id_method)]
    end

    puts options.class 
    options_string = options.map do |element|
      puts element.inspect
      puts "The element[0] is #{element[0] }"
      puts "The element[1] is #{element[1] }"
      puts "The element[2] is #{element[2] }"
      "<option value=\"#{element[1]}\" " +
       "parent_value=\"#{element[2]}\" >" + 
      "#{element[0]}"  + 
      "</option>"
    end

    options_string.join
  end

end
