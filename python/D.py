"""
N 個の品物があります。 
品物には 1 , 2 , … , N と番号が振られています。 
各 i ( 1 ≤ i ≤ N ) について、品物 i の重さは w i で、価値は v i です。 
太郎君は、 N 個の品物のうちいくつかを選び、ナップサックに入れて持ち帰ることにしました。
ナップサックの容量は W であり、持ち帰る品物の重さの総和は W 以下でなければなりません。 
太郎君が持ち帰る品物の価値の総和の最大値を求めてください。
"""
n, w = map(int, input().split())
wv_list = [list(map(int, input().split())) for _ in range(n)]

dp = [[0] * (w+1) for _ in range(n+1)]

for i in range(n):
    for j in range(w+1):
        if wv_list[i][0] > j:
            dp[i+1][j] = dp[i][j]
        else:
            dp[i+1][j] = max((dp[i][j-wv_list[i][0]] + wv_list[i][1]), dp[i][j])
            
            
print(dp[n][w])