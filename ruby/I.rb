n = gets.to_i
p_list = gets.split.map(&:to_f)
dp = Array.new(n+1){[0] * (n+1)}
# 1枚目が裏
dp[1][0] = 1 - p_list[0]
# 1枚目が表
dp[1][1] = p_list[0]

(2..n).each do |i|
	(1..i).each do |j|
		# 表
		dp[i][j] += dp[i-1][j-1] * p_list[i-1]
		# 裏
		dp[i][j-1] += dp[i-1][j-1] * (1 - p_list[i-1])
	end
end

print dp[n][(n - n.div(2))..-1].sum