things that need to be tested at some point

* player class
    * feeding non-wasm byte array
    * feeding invalid wasm
    * feeding program that refuses start
    * feeding program that crashes on setup
    * passing negative or invalid string length
    * crash at each of the three call points: setup, receiveGameParams, and tick
        * have one that plays just fine for X turns and THEN crashes
