defmodule CategoryWorldProcess do
    
    alias CategoryWorld, as: CatWrld

    def start_link( %{ name: _, world: %CatWrld{} } = args )do
        name = args.name || "noname"
        GenServer.start_link(__MODULE__, [], name: name)
    end

    def init( world )do
        {:ok, world}
    end




end