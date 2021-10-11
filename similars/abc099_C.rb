# Bの類題 ちょっとむずかしい...
n = gets.to_i
ns = [1]
M = 6
(1..M).each do |i|
	ns.push(6**i) if 6**i <= n
  ns.push(9**i) if 9**i <= n	
end
ns.sort!
 
INF=10**8
dp=[INF]*(n+1)
dp[0]=0
 
(n+1).times do |i|
  ns.size.times do |j|
		break if i+ns[j] > n
                 
		dp[i+ns[j]] = [dp[i+ns[j]],dp[i]+1].min
	end
end
        
print dp[-1]