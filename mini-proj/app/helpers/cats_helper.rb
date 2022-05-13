module CatsHelper
    def gender_icon(gender)
        case gender 
        when 'female' 
            'venus'
        when 'male'
            'mars'
        end
    end
end
