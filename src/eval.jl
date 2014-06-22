export get_thing

# Qualified names → objects

function get_thing(mod::Module, name::Vector{Symbol}, default = nothing)
  thing = mod
  for sym in name
    if isdefined(thing, sym)
      thing = thing.(sym)
    else
      return default
    end
  end
  return thing
end

get_thing(name::Vector{Symbol}, default = nothing) =
  get_thing(Main, name, default)

get_thing(mod::Module, name::String, default = nothing) =
  @as _ name split(_, ".") map(symbol, _) get_thing(mod, _, default)

get_thing(name::String, default = nothing) =
  get_thing(Main, name, default)