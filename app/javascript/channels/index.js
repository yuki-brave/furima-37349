// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

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