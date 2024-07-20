// const arrl = [1, 2, 3, 3, 4];

// const initialValue = 0;
// const sumWith = arrl.reduce(
//   (accumulator, currentValue) => accumulator + currentValue,
//   initialValue // acting as accumulator's initial value
// );
const shopping = [
    {
        itemname: "js course",
        price: 278
    },
    {
        itemname: "py course",
        price: 91
    },
    {
        itemname: "ml course",
        price: 82
    }
];

const priceToPay = shopping.reduce((acc, item) => acc + item.price, 0);
console.log(priceToPay); // Output: 451
