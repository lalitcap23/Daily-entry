// let a = prompt("Hey ,what is your age.") 
// console.log(typeof a)
 

let sum =0;
for( let i= 0; i<= 100; i++){
    sum = sum + i;
}
console.log(sum);
  function greet(){
    console.log("hello world");
  }
  setTimeout(greet, 1*10000)
  setInterval(greet ,1*1000)