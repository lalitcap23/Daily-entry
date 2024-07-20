function sumUpTo(n) {
    let ans = 0;
    for (let i = 1; i <= n; i++) {
        ans += i;
    }
    return ans;
}

function findtill100() {
    console.log(sumUpTo(100));  // Corrected function name
}

setTimeout(findtill100, 1000);
console.log("hello world");
.