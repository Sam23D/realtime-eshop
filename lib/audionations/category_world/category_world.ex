defmodule CategoryWorld do
    
    defstruct name: "", items_map: %{}
    
    alias CategoryItem, as: Item

    def instantiate_world( prev_map \\ %{} )do
        %__MODULE__{ name: "No Name", items_map: prev_map }
    end

    def new_random_world do
        1..100
        |> Enum.reduce(%__MODULE__{ },fn _, world -> put_item(world, Item.new_random_item) end )  
    end

    def get_item( world, item_uuid ) do
        get_in( world.items_map, [item_uuid] )
    end

    # CategoryWorld -> CategoryItem -> CategoryWorld
    def put_item(world, %CategoryItem{} = item) do
        %{ world |
            items_map: Map.put(world.items_map, item.uuid, item) 
        }
    end

    # CategoryWorld -> String -> Integer || {:error, Atom }
    def existance( world, item_uuid )do
        case get_item(world, item_uuid) do
            nil -> {:error, :item_not_exists}
            item -> item.inv
        end
    end

    # CategoryWorld -> String -> Integer -> CategoryWorld || {:error, :item_not_exists}
    def add_existance(world,  item_uuid, qty )do
        case get_item(world, item_uuid) do
            nil -> {:error, :item_not_exists}
            item -> 
                new_inv = Map.update(item, :inv, 0, &( &1 + qty ) )
                put_item(world, new_inv)
        end
    end

    def add_existance_sm(world, item_uuid, qty)do
        case get_item(world, item_uuid) do
            nil -> {:error, :item_not_exists}
            item -> 
                new_inv = Map.update(item, :inv, 0, &( &1 + qty ) )
                {:ok, put_item(world, new_inv), {item.inv, item.inv + qty }}
        end
    end

end