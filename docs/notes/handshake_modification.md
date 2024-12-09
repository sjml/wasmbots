handshake is changing, but not all the libraries are moved over yet. leaving notes here since not doing immediately but want to retain for future work. 

(probably need to let these changes shake out a little on the C and Zig sides before moving everything over)

## todo
* modify handshake expectations
  * ✅ api json
  * ✅ engine
  * client libraries + examples
    * ✅ C
    * ✅ Zig
    * ✅ Rust
    * (leaving others for now while I let these shake out for a bit)

## procedure
* update bot version number
* new `clientReceiveGameParams` function that takes `InitialParameters` and returns bool for "yes I'll play"
  * should setup be done here? hrm. 
  * setup extern as necessary
* `clientSetup` loses parameters,
* `receiveGameParams` loses second parameter
  * now reads a `InitialParameters` from the offset instead of manually parsing
  * returns result of `clientReceiveGameParams`
  * does not write bot name/version anymore; that's moved to `setup`
* bot metadata (if existing) loses `ready` member
