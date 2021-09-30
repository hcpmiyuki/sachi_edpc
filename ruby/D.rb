n, w = gets.split.map(&:to_i)
wv_list = []
n.times do
  wv_list.push(gets.split.map(&:to_i))
end

dp = Array.new(n+1){[0]*(w+1)}

n.times do |i|
  (w+1).times do |j|
    if wv_list[i][0] > j
      dp[i+1][j] = dp[i][j]
    else
      dp[i+1][j] = [dp[i][j], dp[i][j-wv_list[i][0]] + wv_list[i][1]].max
    end
  end
end

print dp[-1].max