n = gets.to_i
a_list = gets.split.map(&:to_i)
dp = Array.new(n+1){[0]*(n+1)}
dp[0][0] = 0

# iがはじめ、jが終わりをあらわす
# jは開区間（含まない）
# 木の終わりから数える
(1..n).each do |len|
	(0..n-len).each do |i|
		j = len + i
		
		if (n - len).even?
			# 先手
			dp[i][j] = [(dp[i+1][j] + a_list[i]), (dp[i][j-1] + a_list[j-1])].max
		else
			# 後手
			dp[i][j] = [(dp[i+1][j] - a_list[i]), (dp[i][j-1] - a_list[j-1])].min
		end
	end
end

puts dp[0][n]