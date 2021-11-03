H, W = gets.split.map(&:to_i)
a_matrix = []
H.times do
	a_row = gets.chomp
	a_matrix.push(a_row)
end

dp = Array.new(H){[0]*W}
dp[0][0] = 1
MOD = 10**9 + 7

H.times do |h|
	W.times do |w|
		next if h == 0 && w == 0 || a_matrix[h][w] == "#"

		if h > 0 && w > 0
			dp[h][w] = dp[h-1][w] + dp[h][w-1]
		elsif h > 0
			dp[h][w] = dp[h-1][w]
		else
			dp[h][w] = dp[h][w-1]
		end

		dp[h][w] %= MOD
	end
end

print dp[H-1][W-1]