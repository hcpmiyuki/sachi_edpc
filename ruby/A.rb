n = gets.to_i
hs = gets.split(" ").map(&:to_i)

dp = Array.new(n, 0)
dp[1] = (hs[1] - hs[0]).abs

i = 2

while i < n do
    dp[i] = [(dp[i-2] + (hs[i] - hs[i-2]).abs), (dp[i-1] + (hs[i] - hs[i-1]).abs)].min
    i += 1
end

print dp[n-1]