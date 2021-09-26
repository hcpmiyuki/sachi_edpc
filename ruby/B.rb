n, k = gets.split(" ").map(&:to_i)
hs = gets.split(" ").map(&:to_i)

dp = Array.new(n, 0)
dp[1] = (hs[1] - hs[0]).abs

for j in 2...n do
    min_cost = 10**9
    for i in ([0, j-k].max)...j do
        if (dp[i] + (hs[j] - hs[i]).abs) < min_cost
            min_cost = (dp[i] + (hs[j] - hs[i]).abs)
        end
    end
    dp[j] = min_cost
end

print(dp[n-1])

