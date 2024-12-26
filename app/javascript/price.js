function price (){

  const sellPrice  = document.getElementById("item-price");
  sellPrice.addEventListener("input", () => {
    const sellPriceValue = sellPrice.value; 
    
    const fee = Math.floor(sellPriceValue * 0.1);
    const profit = sellPriceValue - fee;


    const feeValue  = document.getElementById("add-tax-price"); 
    feeValue.innerHTML = `${fee.toLocaleString()}`;

    const profitValue  = document.getElementById("profit"); 
    profitValue.innerHTML = `${profit.toLocaleString()}`;

  });
};

window.addEventListener('turbo:load', price);
window.addEventListener("turbo:render", price);