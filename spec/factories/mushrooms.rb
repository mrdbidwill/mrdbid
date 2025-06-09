FactoryBot.define do
  factory :mushroom do
    mushroom_name { "Magic Mushroom" }
    description { "A sample mushroom description" }
    state { association :state }
    country { association :country  }  # This uses the country from the state to avoid mismatches
    mushroom_location { association :mushroom_location }
    fungus_type { association :fungus_type }
    entered_by { state.entered_by }

    after(:build) do |mushroom|
      puts "Mushroom Factory Debug:"
      puts "Mushroom Name: #{mushroom.mushroom_name}"
      puts "Description: #{mushroom.description}"
      puts "State: #{mushroom.state.inspect}"
      puts "Country: #{mushroom.country.inspect}"
      puts "Mushroom Location: #{mushroom.mushroom_location.inspect}"
      puts "Fungus Type: #{mushroom.fungus_type.inspect}"
      puts "Entered by: #{mushroom.entered_by.inspect}"
    end
  end
end

