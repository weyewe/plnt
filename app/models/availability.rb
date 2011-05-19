class Availability < ActiveRecord::Base
  belongs_to :category
  belongs_to :company
  
  def self.set_instance_variables( params )
    symbol_array = %w[value_container company_id_container category_id_container day_container
                    target_value_container target_company_id_container target_category_id_container ]
    @params_hash = {}
    symbol_array.each do |e|
      @params_hash[e.to_sym]  = params[e.to_sym].split(",")
    end

    @month = params[:month].to_i
    @year = params[:year].to_i
  end
  
  def self.create_availability_hash( category_id , index , is_target)
    values = @params_hash[:value_container]
    company_ids = @params_hash[:company_id_container]
    
    availability_hash = {:month => @month, :year => @year, 
      :company_id => company_ids[index].to_i, 
      :category_id => category_id.to_i, :target => is_target}
      
    if not is_target
      availability_hash[:day] = @params_hash[:day_container][index].to_i
    end

    availability_hash
  end
  
  def self.add_value( availability_params_hash, index, is_target )
    value_container = []
    value_string = ""
    if is_target
      value_string = "target_value_container"
    else
      value_string = "value_container"
    end
    
    availability_params_hash[:value] = @params_hash[value_string.to_sym][index].to_f
    
    availability_params_hash
  end
  
  def self.update_or_create_availability(  availability  ,availability_params_hash, index, is_target)
    availability_hash = self.add_value( availability_params_hash, index, is_target )
    puts availability.class 
    if availability.nil?
      self.create( availability_hash)
    else
      availability.update_attributes(availability_hash)
    end
    
  end
  
  def self.handle_availability( is_target )
    category_string = ""
    if is_target
      category_string = "target_category_id_container"
    else
      category_string = "category_id_container"
    end
    
    puts "The category string #{category_string} "
    
    category_ids = @params_hash[category_string.to_sym]
    puts "the loop"
    category_ids.each_with_index do |category_id, index|
      
      availability_params_hash = self.create_availability_hash(  category_id, index , is_target)
      puts "after availability params"
      availability = self.find( :first, :conditions => availability_params_hash )
      puts "before update_or_create"
      update_or_create_availability( availability , availability_params_hash, index , is_target )
    end
  end
    
  def self.handle_data( params )
    puts "Before set instance variables" 
    set_instance_variables( params )
    puts "Before handle target "
    self.handle_availability( true )
    puts "before handle real"
    self.handle_availability( false )
  end
  
  
end