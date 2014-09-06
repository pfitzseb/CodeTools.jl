function showresult(value::String, opts; under = false, html = false)
  raise(opts[:editor], "julia.result",
        {"value" => value,
         "start" => opts[:bounds][1],
         "end"   => opts[:bounds][2],
         "under" => under,
         "html"  => html,
         "id"    => string(opts[:id])})
end

function showexception(req, value::String, bounds::(Int, Int))
  raise(req, "julia.error",
        {"value" => value,
         "start" => bounds[1],
         "end"   => bounds[2]})
end

function showexception(editor, e, bt, bounds::(Int, Int))
  notify_error(sprint(showerror, e))
  showexception(
    editor,
    sprint(showerror_html, e, bt, :include_string),
    bounds)
end
