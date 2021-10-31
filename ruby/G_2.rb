n, m = gets.split.map(&:to_i)
$graph = Hash.new{|h, k| h[k] = []}
m.times do
	x, y = gets.split.map(&:to_i)
	$graph[x] << y
end

$dp = [-1] * (n+1)

def rec(i)
	return $dp[i] if $dp[i] != -1

	$dp[i] = 0

	nodes = $graph[i]

	nodes.each do |node|
		$dp[i] = [$dp[i], rec(node)+1].max
	end

	return $dp[i]
end

n.times do |i|
	rec(i+1)
end

puts $dp.max