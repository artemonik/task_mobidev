m1 = [
['X','',''],
['','X',''],
['O','','O']
]

m2 = [
['','X',''],
['X','X',''],
['O','','O']
]

def check_diagonals(matrix)
	x = 0
	o = 0
	for i in 0..matrix.length - 1
		x+=1 if matrix[i][i] == 'X'
		o+=1 if matrix[i][i] == 'O'
	end
	return "X" if x == 3
	return "O" if o == 3

	x = 0
	o = 0
	for i in 0..matrix.length - 1
		x+=1 if matrix[matrix.length - i -1][i] == 'X'
		o+=1 if matrix[matrix.length - i -1][i] == 'O'
	end
	return "X" if x == 3
	return "O" if o == 3
end

def check_lines(matrix)
	for i in 0..matrix.length - 1
		row_x = 0
		row_o = 0
		col_x = 0
		col_o = 0
		for j in 0..matrix.length - 1
			row_x+=1 if matrix[i][j] == 'X'
			row_o+=1 if matrix[i][j] == 'O'
			col_x+=1 if matrix[j][i] == 'X'
			col_o+=1 if matrix[j][i] == 'O'
		end
		return "X" if row_x ==3
		return "O" if row_o ==3
	end
	return "X" if col_x == 3
	return "O" if col_o == 3
end

def start(matrix)
	check_diagonals(matrix)
	check_lines(matrix)
end

s = start(m2)
puts "Output: #{s}"