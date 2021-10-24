# C,Dの類題
w = gets.to_i
n, k = gets.split.map(&:to_i)
dp = Array.new(n+1){Array.new(w+1){[0]*(k+1)}}

n.times do |i|
	a, b = gets.split.map(&:to_i)
	(1..w).each do |j|
		(1..k).each do |l|
			if a > j
				dp[i+1][j][l] = dp[i][j][l]
			else
				dp[i+1][j][l] = [dp[i][j][l], dp[i][j-a][l-1] + b].max
			end
		end
	end
end

print(dp[-1][w][k])