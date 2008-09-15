module Merb
  module GlobalHelpers
    # helpers defined here available to all views.  
    
    def pluralize_with_count_display(count, singular, plural = nil)
       ( (count == 1 || count == '1') ? ( count.to_s + " " + singular ) : ( count.to_s + " " + ( plural || singular.pluralize) ) )
    end
    
  end
end
