n, k = map(int, input().split())
h_list = list(map(int, input().split()))

dp = [0] * n
dp[1] = abs(h_list[1] - h_list[0])

for i in range(2,n):
    dp[i] = min([dp[j] + abs(h_list[i] - h_list[j]) for j in range(max(0, i-k), i)])

print(dp[n-1])