n = int(input())
h_list = list(map(int, input().split()))

dp = [0] * n

for i in range(1, n):
    if i == 1:
        dp[i] = dp[i-1] + abs(h_list[i-1] - h_list[i])
    else:
        dp[i] = min(dp[i-1] + abs(h_list[i-1] - h_list[i]),
                    dp[i-2] + abs(h_list[i-2] - h_list[i]))

print(dp[n-1])
