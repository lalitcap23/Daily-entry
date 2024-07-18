//     // Create a new Map
// const map = new Map();

// // Add some key-value pairs to the Map
// map.set('name', 'Alice');
// map.set('age', 30);
// map.set('job', 'Engineer');

// // Retrieve values from the Map
// console.log(map.get('name')); // Output: Alice
// console.log(map.get('age')); // Output: 30

// // Check if a key exists in the Map
// console.log(map.has('job')); // Output: true
// console.log(map.has('salary')); // Output: false

// // Get the size of the Map
// console.log(map.size); // Output: 3

// // Iterate over the Map
// map.forEach((value, key) => {
//   console.log(`${key}: ${value}`);
// });
// // Output:
// // name: Alice
// // age: 30
// // job: Engineer

// // Delete a key-value pair from the Map
// map.delete('age');
// console.log(map.size); // Output: 2

// // Clear all key-value pairs from the Map
// map.clear();
// console.log(map.size); // Output: 0

 const mynumers =[1,2,3,4,5,6,7]
  
//  const carst= mynumers.map((num)=> num*10     )
 const carst = mynumers
              .map((num) => num * 151)
              .map((num)=> num +52 )
            //   .filter((num)=> num *1056)
 console.log(carst)

