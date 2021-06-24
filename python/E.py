import math

N, W = map(int, input().split())
L = 10**5
dp = [[math.inf] * (L + 1) for _ in range(N+1)]
dp[0][0] = 0

for i in range(N):
    w, v = map(int, input().split())
    for j in range(L+1):
        if v > j:
            dp[i+1][j] = dp[i][j]
        else:
            dp[i+1][j] = min((dp[i][j-v] + w), dp[i][j])
            
for i, min_w in enumerate(dp[N]):
    if min_w <= W:
        max_v = i
        
print(max_v)
        