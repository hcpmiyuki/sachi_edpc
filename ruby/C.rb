n = gets.to_i
dp = Array.new(n+1){[0, 0, 0]}

n.times do |i|
  abc = gets.split.map(&:to_i)
  3.times do |j|
    dp[i+1][j] += [dp[i][(j+1)%3], dp[i][(j+2)%3]].max + abc[j]
  end
end

print dp[-1].max
