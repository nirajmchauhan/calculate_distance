require 'json'
require 'pry'
load 'helpers.rb'  

customers = []
IO.foreach("./customers.txt") do |l| 
	if is_json(l)
		customers.push(JSON.parse(l))
	end
end

#Sort by user_id
customers = customers.sort_by { |hash| hash['user_id'].to_i }
dublin,within = [53.3381985, -6.2592576], 100 #Default values for dublin location & within range
customers.each do |customer|
	distance = calculate_distance(dublin,[customer["latitude"].to_f,customer["longitude"].to_f])
	if(distance <= within)
		printf "%-4s %s\n", customer['user_id'].to_s, customer['name']
	end
end