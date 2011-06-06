module AvailabilitiesHelper
  
  def color_notification( availability )
    return "" if availability == nil || availability.value == nil
    return "green-cell" if availability.value == 100
    return "yellow-cell" if  (95 <= availability.value)  &&  (availability.value < 100)
    return "red-cell"  if ( 90 <= availability.value ) &&  (availability.value < 95)
    return "black-cell" if availability.value < 90
  end
end
