<pre>
Brainfuck interpreter written in Befunge-98
v1.3 (c) 2009-12-08 (YMD) Matus Goljer
matus[dot]goljer[at]gmail[dot]com

You can use this and/or modify at your will, I hereby declare this to
be in public domain.

Input works by redirecting stream/file to the stdin. This makes it
impossible to interactivly feed data into the program. If you need to
feed some data into program end your regular BF program with ! and
then type input data (<program>!13 will read char 1 and 3)

Your befunge interpreter should be compliant with (be)Funge-98 final
specification available here: http://quadium.net/funge/spec98.html I
was developing this on http://www.rcfunge98.com/ interpreter, version
2.02.00, but I've had to edit handling of some instructions to be
compliant with specs. (~&,.). I've notified the developer so hopefuly
it will get fixed in the future. For more info on this, visit
http://fi.muni.cz/~xgoljer/rcfunge-fix.txt This will not work on
out-of-the-box rcfunge interpreter! (I didn't try any other)
</pre>
