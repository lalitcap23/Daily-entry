//   const mynums=[1,2,3,4,5,6,7,8,9];
// const newnnum =  mynums.filter(( num)=>  num >4);
//  console.log(newnnum);

// const  newnnums = []
// mynums.forEach((num) => {
// if (num>4){
//     newnums.push(num)
// }   
// });
// console.log(newnnums)
// filter and maps


const mynums = [1, 2, 3, 4, 5, 6, 7, 8, 9];
const newnnum = mynums.filter((num) => num > 4);
console.log(newnnum);

const newnnums = [];
mynums.forEach((num) => {
  if (num > 4) {
    newnnums.push(num);
  }
});
console.log(newnnums);


const users = [
    { name: 'Alice', age: 25 },
    { name: 'Bob', age: 30 },
    { name: 'Charlie', age: 35 }
  ];
  const adults = users.filter(user => user.age >= 30);
  console.log(adults); 
// allow you to remove the data     
  const mixedArray = [0, 1, '', null, 'hello', undefined, 42];
const cleanedArray = mixedArray.filter(Boolean);
console.log(cleanedArray); 

//complex filtration logic 
const products = [
    { name: 'Laptop', price: 1000, available: true },
    { name: 'Phone', price: 500, available: false },
    { name: 'Tablet', price: 700, available: true }
  ];
  const availableExpensiveProducts = products.filter(product => product.available && product.price > 600);
  console.log(availableExpensiveProducts); // [{ name: 'Laptop', price: 1000, available: true }, { name: 'Tablet', price: 700, available: true }]
  