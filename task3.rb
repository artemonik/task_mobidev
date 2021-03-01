def diff_price(h1, h2, item)
	diff = (h1[item] - h2[item])
end


def available_goods(h_city, start_coins)
	a = []
	for i in 0..h_city.values.length - 1
		if h_city.values[i] <= start_coins
			a.push(h_city.values[i])
		end
	end
	return a
end


def min_index(array)
	for i in 0..array.length - 1
		return i if array[i] == array.min
	end
end


def max_index(array)
	for i in 0..array.length - 1
		return i if array[i] == array.max
	end
end


def find_third_city(array, city, current_city)
	for i in 0..array.length - 1
		return array[i] if array[i] != city && array[i] != current_city
	end
end


def profit(result)
	coins = []
	for i in 0..result.length - 1
		coins.push(result[i][-1])
		result[i].delete_at(-1)
	end
	puts result[max_index(coins)]
end


def start (city)
	start_coins = 50
	h_city = {
		'Lubeck' => {'salt' => 20, 'fish' => 50, 'cloth' => 60, 'copper' => 36, 'furs' => 96}, 
	    'Reval' => {'salt' => 35, 'fish' => 50, 'cloth' => 40, 'copper' => 60, 'furs' => 45},
	    'Bergen' => {'salt' => 62, 'fish' => 15, 'cloth' => 18, 'copper' => 82, 'furs' => 54}
			 }

	a = h_city.keys
	g = available_goods(h_city[city], start_coins)
	puts "Start from city: #{city}"
	puts "Initial coins: #{start_coins}"

	result = Array.new(g.length)
	for i in 0..g.length - 1
		result[i] = []
	
		current_coins = start_coins - g[i]
		result[i].push("Buy #{h_city[city].key(g[i])} for #{g[i]} coins in #{city}. #{current_coins} coins left.")

		b = []
		for j in 0..a.length - 1
			b.push(diff_price(h_city[city], h_city[a[j]], h_city[city].key(g[i])))
		end
		id = min_index(b)

		current_city = a[id]
		current_coins += h_city[a[id]][h_city[city].key(g[i])]
		
		result[i].push("Sell #{h_city[city].key(g[i])} for #{h_city[current_city][h_city[city].key(g[i])]} coins in #{current_city}. #{current_coins} coins left.")
		
		third_city = find_third_city(a, city, current_city)

		f = available_goods(h_city[current_city], current_coins)
		
		v = []
		for m in 0..f.length - 1
			v.push(diff_price(h_city[current_city], h_city[third_city], h_city[current_city].key(f[m])))
		end
		id2 = min_index(v)

		current_coins -= h_city[current_city].values[id2]
		result[i].push("Buy #{h_city[current_city].key(h_city[current_city].values[id2])} for #{h_city[current_city].values[id2]} coins in #{current_city}. #{current_coins} coins left.")
		current_coins += h_city[third_city].values[id2]
		result[i].push("Sell #{h_city[current_city].key(h_city[current_city].values[id2])} for #{h_city[third_city].values[id2]} coins in #{third_city}. #{current_coins} coins left.")
		result[i].push("Final coins: #{current_coins}")
		result[i].push(current_coins)
	end
	profit(result)
end


start('Lubeck')
puts '---------------------------------------------------'
start('Reval')
puts '---------------------------------------------------'
start('Bergen')