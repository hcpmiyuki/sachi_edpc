n, m = map(int, input().split())
G = {i+1:[] for i in range(n)}

for _ in range(m):
    x, y = map(int, input().split())
    G[x].append(y)
    
dp = [-1] * (n+1)


def rec(x):
    if dp[x] != -1:
        return dp[x]
    
    dp[x] = 0
    
    # 深ぼる
    for node in G[x]:
        dp[x] = max(dp[x], rec(node)+1)

    return dp[x]

for i in range(n):
    rec(i+1)
    
print(max(dp))
            
    
        