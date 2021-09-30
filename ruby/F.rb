s = gets.chomp
t = gets.chomp

s_l = s.length
t_l = t.length

dp = Array.new(s_l+1){[0] * (t_l+1)}

(1..s_l).each do |i|
  (1..t_l).each do |j|
    if s[i-1] == t[j-1]
      dp[i][j] = dp[i-1][j-1] + 1
    else
      dp[i][j] = [dp[i-1][j], dp[i][j-1]].max
    end
  end
end

x, y = s_l, t_l
ans = ''
while x > 0 && y > 0 do
  if dp[x][y] == dp[x-1][y]
    x -= 1
  elsif dp[x][y] == dp[x][y-1]
    y -= 1
  else
    ans = s[x-1] + ans
    x -= 1
    y -= 1
  end
end

print ans
