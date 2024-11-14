# Trainer Programs

_TODO: document the trainers, how to use them_


## Under the Hood

_TODO: How they work in case you want to make your own._

* could have used Beschi messages converted to JSON and back, but that would lock you in to using Beschi in your module, so sends binary representation of shared memory block encoded as Base64
  * no compression or anything even though it would benefit because (a) simplicity and (b) this is only ever communicating over the loopback interface so bandwidth is not really a factor
