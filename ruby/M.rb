n, k = gets.split.map(&:to_i)
a_list = gets.split.map(&:to_i)
dp = Array.new(n+1){[0]*(k+1)}
dp[0][0] = 1

MOD = (10 ** 9) + 7
n.times do |i|
	# 累積和使う
	# 0からスタートするので、jのインデックスとはずれる
	cumsum = [0] * (k+1)
	cumsum[0] = 0
	(0..k).each do |j|
		cumsum[j+1] = (cumsum[j] + dp[i][j])
	end

	(0..k).each do |j|
		dp[i+1][j] = (cumsum[j+1] - cumsum[[j-a_list[i], 0].max]) % MOD
	end
end

print dp[n][k]