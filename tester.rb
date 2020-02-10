vm = [[[{:name=>"Vanilla Cookies", :price=>3}, {:name=>"Pistachio Cookies",
:price=>3}, {:name=>"Chocolate Cookies", :price=>3}, {:name=>"Chocolate Chip
Cookies", :price=>3}], [{:name=>"Tooth-Melters", :price=>12},
{:name=>"Tooth-Destroyers", :price=>12}, {:name=>"Enamel Eaters",
:price=>12}, {:name=>"Dentist's Nighmare", :price=>20}], [{:name=>"Gummy Sour
Apple", :price=>3}, {:name=>"Gummy Apple", :price=>5}, {:name=>"Gummy Moldy
Apple", :price=>1}]], [[{:name=>"Grape Drink", :price=>1}, {:name=>"Orange
Drink", :price=>1}, {:name=>"Pineapple Drink", :price=>1}], [{:name=>"Mints",
:price=>13}, {:name=>"Curiously Toxic Mints", :price=>1000}, {:name=>"US
Mints", :price=>99}]]]

def snack_collection(machine)
  collection = []
  row_index = 0
  while row_index < machine.length do
    column_index = 0
    while column_index < machine[row_index].length do
      inner_len = machine[row_index][column_index].length
      inner_index = 0
      while inner_index < inner_len do
        collection <<
          machine[row_index][column_index][inner_index]
        inner_index += 1
      end
      column_index += 1
    end
    row_index += 1
  end
  collection
end
 
p snack_collection(vm)