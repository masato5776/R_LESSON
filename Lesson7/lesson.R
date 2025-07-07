get_symbols <- function() {
  wheel <- c("DD","7","BBB","BB", "B", "C", "0")
  sample(wheel, size=3, replace = TRUE, 
         prob = c(0.03,0.03,0.06,0.1,0.25,0.01,0.52))
}

score <- function(symbols){
  # 場合の確定
  same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
  bars <- symbols %in% c("B", "BB", "BBB")
  # 賞金の計算
  if (same) {
    payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
    # unnameは名前属性を取り除いたオブジェクトのコピー返します
    prize <- unname(payouts[symbols[1]])
  } else if (all(bars)) {
    prize <- 5
  } else {
    cherries <- sum(symbols == "C")
    prize <- c(0,2,5)[cherries +1]
  }
  
  # ダイヤによる賞金の加算
  diamonds <- sum(symbols == "DD")
  prize * 2 ^ diamonds
  # 「^」は、R言語や多くのプログラミング言語で「べき乗」（指数演算）を表す記号
}

play <- function(){
  symbols <- get_symbols()
  print(symbols)
  score(symbols)
}