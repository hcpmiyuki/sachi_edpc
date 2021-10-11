# Aの類題
n = gets.to_i
a_list = gets.split.map(&:to_i)
dp = [0] * n
dp[0] = 0
dp[1] = (a_list[0] - a_list[1]).abs
(2..(n-1)).each do |i|
	dp[i] = [(dp[i-1] + (a_list[i-1] - a_list[i]).abs), (dp[i-2] + (a_list[i-2] - a_list[i]).abs)].min
end

print dp[-1]