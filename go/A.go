package main

import (
	"fmt"
)

func abs (x int) int{
	if x < 0{
		return -x
	} else {
		return x
	}
}

func min (x int, y int) int{
	if x  > y {
		return y
	} else {
		return x
	}
}

func main () {
	var n int
	fmt.Scan(&n)
	h_list := make([]int, n)
	for i := 0; i < n; i++ {
		fmt.Scan(&h_list[i])
	}
	dp := make([]int, n)
	dp[1] = abs(h_list[0] - h_list[1])

	for i := 2; i < n; i++ {
		dp[i] = min(dp[i-1] + abs(h_list[i] - h_list[i-1]), dp[i-2] + abs(h_list[i] - h_list[i-2]))
	}

	fmt.Println(dp[n-1])
}