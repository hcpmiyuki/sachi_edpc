h, w = gets.split.map(&:to_i)

dp = Array.new(h){[0] * w}
dp[0][0] = 1
meiro = []
MOD = 10**9 + 7
h.times do
  a = gets.chomp
  meiro.push(a)
end

h.times do |i|
  w.times do |j|
    next if meiro[i][j] == '#'
    dp[i+1][j] = (dp[i+1][j] + dp[i][j]) % MOD if i+1 < h
    dp[i][j+1] = (dp[i][j+1] + dp[i][j]) % MOD if j+1 < w
  end
end

print dp[-1][-1]
