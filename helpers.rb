#Check if the string is JSON
def is_json(str)
	begin
		JSON.parse(str)
		return true
	rescue JSON::ParserError => e 
		return false
	end
end

def calculate_distance(from, target)
  radian_per_deg = Math::PI/180 # PI / 180
  rkm = 6371 # Earth radius in kilometers

  # Convert into radian
  from_location = from.collect{ |x| x*radian_per_deg}
  target_location = target.collect{ |x| x*radian_per_deg}

  # Get the delta
  delta_lat = (target_location[0]-from_location[0])
  delta_long = (target_location[1]-from_location[1])

  # Use the formula
  a = Math.sin(delta_lat/2)**2 + Math.cos(from_location[0]) * Math.cos(target_location[0]) * Math.sin(delta_long/2)**2
  c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

  # In kms
  rkm * c
end