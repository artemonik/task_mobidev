price = [100.0, 112.2, 301.1]
discount = [10.0, 0.0, 0.0]

def percent(price, discount)
	new_price = price - price * discount / 100
end

def calculate(price, discount)
	return "error" if price.length != discount.length
	sum = 0
	for i in 0..price.length - 1
		sum += percent(price[i], discount[i])
	end
	return "Total sum is #{sum}"
end

puts calculate(price, discount)