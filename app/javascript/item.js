function calculation() {
  const itemPrice = document.getElementById("item-price");
  itemPrice = addEventListener("keyup", () =>{
    const commission = Math.floor(itemPrice.value * 0.1);
    const result = itemPrice.value - commission;

    const calcTax = document.getElementById("add-tax-price");
    const calcProfit = document.getElementById("profit");

    calcTax.innerHTML = commission;
    calcProfit.innerHTML = result;
  });
};
  
window,addEventListener('load', calculation)