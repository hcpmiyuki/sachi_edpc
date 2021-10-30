# Eの類題

def solve1
	n_half = N.div(2)
	vw_set_L = $vw_list[0..n_half]
	vw_set_R = $vw_list[(n_half+1)..-1]

	def calc_combs(vw_set)
		vw_combs = []
		vw_set.size.times do |i|
			combs = vw_set.to_a.combination(i+1)
			next if combs.size == 0

			combs.each do |comb|
				v_sum = 0
				w_sum = 0

				comb.each do |v, w|
					v_sum += v
					w_sum += w
				end
				vw_combs.push([v_sum, w_sum]) if w_sum <= W
			end
		end

		vw_combs.sort_by{ |comb| -comb[1] }
	end

	vw_combs_L = calc_combs(vw_set_L)
	vw_combs_R = calc_combs(vw_set_R)

	def merge(l, r)
		ans = 0

		l.each do |vl, wl|
			idx = r.bsearch_index do |(_, wr)|
				wl + wr <= W
			end
			ans = r[idx][0] + vl if idx && r[idx][0] + vl > ans
		end

		ans
	end

	ans = merge(vw_combs_L, vw_combs_R)

	print ans
end

def solve2
	dp = Array.new(N+1){[0]*(W+1)}
	
	N.times do |i|
		v, w = $vw_list[i]
		W.times do |j|
			if w > j
				dp[i+1][j] = dp[i][j]
			else
				dp[i+1][j] = [dp[i][j-w]+v, dp[i][j]].max
			end
		end
	end
	
	print dp[n][w]
end

def solve3
	dp = Array.new(N+1){[10**5]*(v_max+1)}
	dp[0][0] = 0

	N.times do |i|
		v, w = $vw_list[i]
		v_max.times do |j|
			if v > j
				dp[i+1][j] = dp[i][j]
			else
				dp[i+1][j] = [dp[i][j-v]+w, dp[i][j]].min
			end
		end
	end
	
	ans = 0
	dp[n].each_with_index do |min_w, i|
		if min_w <= W
			ans = i
		end
	end
	
	print ans
end

N, W = gets.split.map(&:to_i)
$vw_list = []

v_max = 0
flag = true
N.times do |i|
	v, w = gets.split.map(&:to_i)
	$vw_list.push([v, w])
	flag = false if w > 1000
	v_max += v
end

if N <= 30
	solve1
elsif flag
	solve2
else
	solve3
end
