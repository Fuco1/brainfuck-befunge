v   // Brainfuck interpreter written in Befunge-98
    // v1.3 (c) 2009-12-08 (YMD) Matus Goljer
    // matus[dot]goljer[at]gmail[dot]com
    // You can use this and/or modify at your will, I hereby declare this to be in public domain.
    //
    // Input works by redirecting stream/file to the stdin. This makes it impossible to
    // interactivly feed data into the program. If you need to feed some data into program
    // end your regular BF program with ! and then type input data (<program>!13 will read char 1 and 3)
    //
    // Your befunge interpreter should be compliant with (be)Funge-98 final specification available here:
    // http://quadium.net/funge/spec98.html
    // I was developing this on http://www.rcfunge98.com/ interpreter, version 2.02.00, but I've had to edit
    // handling of some instructions to be compliant with specs. (~&,.). I've notified the developer so hopefuly
    // it will get fixed in the future. For more info on this, visit http://fi.muni.cz/~xgoljer/rcfunge-fix.txt
    // This will not work on out-of-the-box rcfunge interpreter! (I didn't try any other)
    //
    // Expect more to come! :D
    //
    // Old versions can be found here: http://www.fi.muni.cz/~xgoljer/funge/bf/

    ----------- code begins here, altho this file is executable without changes as well ---------
v   // first, we load the whole brainfuck program into memory (funge cells),
0   // starting at [0,2]. We read from stdin. Memory stored at [0++,3]
1   // program code will be at this very line
1   // program memory will be at this very line
pv<     v    <          -!'<
v<|     < >v
>#v~::25*-|> 11g2p>11g1+11p^ // here, we store next byte at the correct position, and increment cell
  0       >$      ^          // counter which is at [1,1], initially set to zero.
  1                          // when we're done, we zero terminate the program code.
  1                          // we need to ignore #10 ASCII char
  g
  2
  p  // iterator counter is at [0,1] (ECX - counter), length of code is at [1,1]

       v                        <
  >001p>01g2g:!#v_01g2g,01g1+01p^
v               <  // just print the stuff out

>                                  v // debug info
v_,#! #:<*25"Setting memory..."*250< // >:#,_ will print out null-terminated string, _,#! #:< in the other way

   // we have to memset the memory to zero, 5^6 BF cells should be enough for start
   // this is the pattern for while (i--) loop

   /////////////////////////
   //v                    //
   //       v;loop code;< //
   //       '           . // // i is on stack so we print it, otherwise you HAVE
   //>99*>:s ;loop code;^ // // to pop it and leave stack "empty" (ie, in the
   //       :             // // pre-loop state)
   //    ^-1_@0"dnE">:#,_@//
   /////////////////////////
             v    <
             '
>5555554k*>:s 0\3p^
             :
          ^-1_v
v             <
0
2  // we have our code loaded, now parse it! BF IP stored at [2,1], init to zero, MP stored at [3,1], init to zero
1
p
>031pv // init MP
v    <

>                                    v  // debug info
v_,#! #:<"Memory set, parsing..."*250<
n // makes sure stack is empty

  // this is the main switch statement, each block matches one character from BF alphabet. Other chars are ignored.
  // IF BLOCK: "ab-!#v_F" Push a, b to the stack, if a==b then T else F. In our case, a = "21g2g" and b = "'X", where
  //                 T
  // X is one of the letters from BF alphabet

2 // shift next line (except first ">" char) 2 cells -> to see which instruction is being processed
>1g2g'>-!#v_21g2g'<-!#v_21g2g'+-!#v_21g2g'--!#v_21g2g',-!#v_21g2g'.-!#v_21g2g'[-!#v_21g2g']-!#v_ v
2           v           v           v           v           v           v           v           v
            '           '           '           '           '           '           '           '
            >           <           +           -           ,           .           [           ]
            ,           ,           ,           ,           ,           ,           ,           ,
          v <         v <         v <         v <         v <         v <         v <         v <
 v        <  v        <   v+1g3g13<   v-1g3g13<           #     vg3g13<  vg3g13g12<   v  g3g13<
 >31g1+31pv  >31g1-31pv   >31g3p  v   >31g3p  v   v    ,' <.'<  >#v,  v  >!#v_    v   >#v_  $ v      // $ on this line pops the IP
                                                          ~  ^    <                                  // of the matching '['
                                                          :
                                                    vp3g13<
                                                    >,    v
^v_v#g2g12<           <           <           <           <           <           <<          <  < <
 2 >25*"dnE"25*4k,@,k       +2*25*25"I/O Error"*25<                                     >  1-21p ^
 1                                                              v           <            // find matching '['
;g                                                              1                        // IP--, we increment
.1                                            // search for '[' 4 // init BC             // at the end of loop
g+                                            // match          1
12                                                              p
21                                                              v                <
;p                                                              >21g1+:21p2g:'[-v
^<                                                               v              <
// remove ; chars to see IP                                      >!#v_']-!#v_    ^
                                                                 "["4   "]"4
                                                                    1      1     ^_^  // lovely :D
                                                                    g      g
                                                                    1      1
                                                                    +      -      g
                                                                    >41pv  >41pv  1
                                                                    v   <  v  $<  4  // $ on this line pops the IP
                                                                    >$21g  >      ^  // of the matching '['
                                                                     //pop
                                                                     // char from stack and push current IP for '['

                                                        // forward search for ']'
                                                        // [4,1] is used as a '[' counter, init to 1
                                                        // when [4,1] == 0 we're at the matching ']'
                                                        // we leave IP as it is because we have to jump
                                                        // AFTER the ']', so the IP gets ++ by the end of
                                                        // the loop, pointing at the cell after ']'

// [0,1] temp loop variable
// [1,1] code length
// [2,1] instruction pointer (IP)
// [3,1] memory pointer (MP)
// [4,1] brackets counter (BC)

// line 2, starting at [0,2]: brainfuck code
// line 3, starting at [0,3]: brainfuck memory tape


// brainfuck instructions:
// > 	Move the pointer to the right
// < 	Move the pointer to the left
// + 	Increment the memory cell under the pointer
// - 	Decrement the memory cell under the pointer
// . 	Output the character signified by the cell at the pointer
// , 	Input a character and store it in the cell at the pointer
// [ 	Jump past the matching ] if the cell under the pointer is 0
// ] 	Jump back to the matching [ if the cell under the pointer is nonzero
