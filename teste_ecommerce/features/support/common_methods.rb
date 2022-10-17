class CommonMethods

    class << self
        include Capybara::DSL

        def fill_in(field, with:)
            with = ERB.new(with).result(binding)
            page.find(EL[field]).set(with)

            instance_variable_set("@#{field}", with)
            puts "\t#{field}: #{with}"
        end

        def assert_text(text)
            text = ERB.new(text).result(binding)
            page.assert_text(text)
            puts "\t#{text}"
        end

    end
end