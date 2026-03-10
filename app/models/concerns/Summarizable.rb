module Summarizable
    extend ActiveSupport::Concern

    # This is over-engineered for this small example, but assuming for scalability I would start pulling model methods into concerns
    class_methods do
        def create_summary
            all.reduce(Hash.new(0)) do |summary, dino|
                summary["#{dino['category']}"] += 1
                summary
            end
        end
    end
end
