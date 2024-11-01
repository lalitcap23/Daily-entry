// findIndexOf("hello ji ki hal sab thik ", "sab");
// console.log(findIndexOf);
// getlength("hello wrl")

// slice function..
const value ="lalit rajput ";
let ans= value.slice(0,5)
console.log(ans)

console.log(ans.length);

const  currentdate = new Date();
console.log("This is the month ",currentdate.getMonth());
console.log("This is the year ",currentdate.getFullYear());

function currenttimepage(){
     console.log(new Date().getTime());
     }
//setInterval(currenttimepage);
// this is for the current timer .

//setInterval(currenttimepage, 1000); 
// Logs the time every 1000 milliseconds (1 second)

// Countdown Timer Function
function startCountdown(seconds) {
     let remainingTime = seconds;
 
     const countdownInterval = setInterval(() => {
         if (remainingTime > 0) {
             console.log(`Time Remaining: ${remainingTime} seconds`);
             remainingTime--;
         } else {
             console.log("Time's up!");
             clearInterval(countdownInterval); // Stop the timer when it reaches zero
         }
     }, 1000); // 1000 ms = 1 second
 }
 
 // Start a countdown from 10 seconds (you can change this value)
 startCountdown(10);
 //peace out 