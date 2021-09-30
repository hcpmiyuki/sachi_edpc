n, m = gets.split.map(&:to_i)
@graph = Hash.new{|h, k| h[k] = []}
m.times do
  x, y = gets.split.map(&:to_i)
  @graph[x] << y
end

# ノードの名前が1からはじまるので、インデックス0はつかわない
@dp = [-1] * (n+1)

def rec(index)
  if @dp[index] != -1
    return @dp[index]
  end

  @dp[index] = 0

  @graph[index].each do |node|
    @dp[index] = [@dp[index], rec(node)+1].max
  end

  @dp[index]
end

# 各ノードを始点として探索する
(1..n).each do |index|
  rec(index)
end

print @dp.max