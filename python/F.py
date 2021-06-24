s = input()
t = input()
s_l = len(s)
t_l = len(t)

dp = [[0] * (t_l+1) for _ in range(s_l + 1)]

# dpテーブル作成
for i in range(1, s_l+1):
    for j in range(1, t_l+1):
        if s[i-1] == t[j-1]:
            dp[i][j] = dp[i-1][j-1] + 1
        else:
            dp[i][j] = max(dp[i-1][j], dp[i][j-1])
            
# 復元
i = s_l
j = t_l
ans = ''
while i > 0 and j > 0:
    
    if dp[i][j] == dp[i][j-1]:
        j -= 1
        
    elif dp[i][j] == dp[i-1][j]:
        i -= 1
    
    else:
        ans = s[i-1] + ans
        i -= 1
        j -= 1
    
print(ans)