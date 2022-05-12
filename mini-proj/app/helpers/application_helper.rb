module ApplicationHelper
    # Convert flash class name for Devise
    def flash_class_name(name) 
        case name 
        when 'notice' then 'success'
        when 'alert' then 'danger'
        else name 
        end
    end
end
