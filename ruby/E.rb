
n, w = gets.split.map(&:to_i)
wv_list = []
max_v = 0
n.times do
  ww, vv = gets.split.map(&:to_i)
  wv_list.push([ww, vv])
  max_v += vv
end

dp = Array.new(n+1){[10**5]*(max_v+1)}
dp[0][0] = 0

# vを獲得するための最小パスをメモしていく
n.times do |i|
  (max_v+1).times do |j|
    if wv_list[i][1] > j
      dp[i+1][j] = dp[i][j]
    else
      dp[i+1][j] = [(dp[i][j-wv_list[i][1]] + wv_list[i][0]), dp[i][j]].min
    end
  end
end

ans = 0
dp[-1].each_with_index do |min_w, i|
  if min_w <= w
    ans = i
  end
end

print ans