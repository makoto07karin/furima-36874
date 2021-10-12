window.addEventListener('load', () => {
  console.log("OK");

const priceInput = document.getElementById("item-price");
console.log(priceInput);
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue*0.1);//ここに10％の式を入れたい
  console.log(addTaxDom);
  const profitDom = document.getElementById("profit");
  profitDom.innerHTML = Math.floor(inputValue*0.9);//ここに価格ー販売手数料を出したい
})

});

//ここの復習のキーワードはJSの基本と「innerHTM」の使い方constで定義するのでprofitDomなどは
//別の記述でも大丈夫！