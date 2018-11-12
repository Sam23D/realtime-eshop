defmodule CategoryItem do
    
    defstruct name: "", desc: "", inv_en: true, inv: 0, price: 0, uuid: "" 

    def new_random_item do
        %__MODULE__{
            name: Faker.Pokemon.name,
            desc: Faker.Lorem.paragraph(2..3),
            inv: :rand.uniform(20) + 3,
            price: :rand.uniform(500) + 150,
            uuid: Faker.UUID.v4
        }
    end

end