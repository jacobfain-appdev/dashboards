Rails.application.routes.draw do
  
get("/forex", {:controller => "currencies", :action => "first_currency"})
get("/forex/:currency1", {:controller => "currencies", :action => "second_currency"})
get("/forex/:currency1/:currency2",{:controller => "currencies", :action => "convert"})
end
