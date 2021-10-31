s = gets.chomp
t = gets.chomp

s_l = s.size
t_l = t.size

dp = Array.new(s_l+1){[0] * (t_l+1)}

s_l.times do |i|
	t_l.times do |j|
		if s[i] == t[j]
			dp[i+1][j+1] = dp[i][j] + 1
		else
			dp[i+1][j+1] = [dp[i+1][j], dp[i][j+1]].max
		end
	end
end

x = s_l
y = t_l
ans = []

while x > 0 && y > 0
	if dp[x-1][y] == dp[x][y]
		x -= 1
	elsif dp[x][y-1] == dp[x][y]
		y -= 1
	else
		ans << s[x-1]
		x -= 1
		y -= 1
	end
end

puts ans.reverse.join

