n, k = gets.split.map(&:to_i)
a_list = gets.split.map(&:to_i)
dp = [false] * (k + 1)

(0..k).each do |i|
	a_list.each do |a|
		if i-a >= 0 && dp[i-a] == false
			dp[i] = true
			break
		end
	end
end

print dp[-1] ? "First" : "Second"
