function price (){

  const sellPrice  = document.getElementById("item-price");
  sellPrice.addEventListener("keyup", () => {
    const sellPriceValue = sellPrice.value; // 入力値を取得し数値に変換
    const profit = sellPriceValue * 0.9; // 計算を実行
    const fee = sellPriceValue * 0.8;


    const feeValue  = document.getElementById("add-tax-price");  //要素
    feeValue.innerHTML = `${fee}`;

    const profitValue  = document.getElementById("profit");  //要素
    profitValue.innerHTML = `${profit}`;

  });
};

window.addEventListener('turbo:load', price);