<%def name="explain(header, text)">
</pre><tr><td colspan="2">
% if 0:
    <h2>${header}</h2>
% endif

% if text:
    <p>${text}</p>
% endif
</td></tr>
</%def>

<%def name="pycode()">
<tr><td>
<pre name="code" class="python:nogutter:nocontrols">
</%def>

<%def name="rubycode()">
</pre></td><td>
<pre name="code" class="ruby:nogutter:nocontrols">
</%def>

<html><head><title>test</title></head>
<body>
<h1>Translating Selected Python idioms into Ruby</h1>
<table border="0" width="800">
${explain("None","The ruby equivalent of <code>None</code> is <code>nil</code>")}
${pycode()}None
${rubycode()}nil

${explain("print","The ruby equivalent of the print statement is the <code>puts()</code> function")}
${pycode()}>>> print "Twenty twelve"
Twenty twelve
${rubycode()}>>> puts "thirteen"
thirteen
=> nil

${explain("comments","Ruby comments begin with hashmarks and extend to the end of the line, just like in python")}
${pycode()}#this is a comment to the end of the line
${rubycode()}#so is this

${explain("boolean", """Ruby has boolean objects <code>true</code> and <code>false</code>""")}
${pycode()}>>> 42 == 42
True
>>> 42 == 43
False
${rubycode()}>>> 42 == 42
=> true
>>> 42 == 43
=> false

${explain("quotes", """Ruby strings may be enclosed in single or double quotes, just as in python, though double quotes
allow interpolation and single quotes don't; more on that later.""")}
${pycode()}>>> "spam" == 'spam'
True
${rubycode()}>>> "onyx" == 'onyx'
=> true

${explain("str()","The ruby equivalent of the <code>str()</code> function is the <code>to_s</code> method")}
${pycode()}>>> str(42)
"42"
${rubycode()}>>> 42.to_s
=> "42"

${explain("str()","Unsurprisingly, the ruby equivalent of the <code>int()</code> function is the <code>to_i</code> method")}
${pycode()}>>> int("42")
"42"
${rubycode()}>>> "42".to_i
=> 42

${explain("unpacking","You may unpack lists in Ruby just like in Python")}
${pycode()}>>> a,b = [42, 43]
>>> a
42
>>> b
43
${rubycode()}>>> a,b = [42, 43]
=> [42, 43]
>>> a
42
>>> b
43

${explain("tuples","Ruby has no concept of tuples; simply use lists for the same purpose")}
${pycode()}("spam", 42)
${rubycode()}["emerald", 42]

${explain("Functions", """Simple functions are defined almost identically by ruby and python. In ruby, whitespace
is not significant, and empty functions simply return nil.""")}
${pycode()}
def f():
    pass
${rubycode()}
def f()
end

${explain("Function calls","Ruby function calls do not always require parentheses; we'll revisit this more later")}
${pycode()}def f():
    return "spam"

>>> f()
'spam'
>>> f
&lt;function f at 0x000000&gt;
${rubycode()}def f()
    return "why?"
end

>>> f()
=> "why?"
>>> f
=> "why?"

${explain("Functions", """Standard positional arguments function the same way in python and ruby""")}
${pycode()}
def f(a, b, c):
    print a, b, c

f("alpha", 12, 'beta')
${rubycode()}
def f(a, b, c)
    puts a, b, c
end

#these two calls are identical
f("alpha", 12, 'beta')
f "alpha", 12, 'beta'

${explain("return","""Ruby has a return statement, but it will return the result of the last expression
in a function if one is not present""")}
${pycode()}def f():
    return "silly walk"
${rubycode()}def f()
    return "pearl"
end
def g()
    "pearl"
end

>>> f() == g()
=> true

${explain("rest","Ruby supports arbitrary argument lists similarly to Python")}
${pycode()}def f(a, *rest):
    return rest

>>> f(1,2,3,4)
(2,3,4)
${rubycode()}def f(a, *rest)
    rest
end

>>> f(1,2,3,4)
=> [2,3,4]

${explain("splat","Ruby also has a splat operator that works just like Python's")}
${pycode()}def f(a, b, c):
    return a + b + c

>>> f(*[1,2,3])
6
${rubycode()}def f(a, b, c)
    a + b + c
end

>>> f(*[1,2,3])
=> 6

</td></tr>
</table>
<link type="text/css" rel="stylesheet" href="/static/SyntaxHighlighter/SyntaxHighlighter.css"></link>
<script language="javascript" src="/static/SyntaxHighlighter/shCore.js"></script>
<script language="javascript" src="/static/SyntaxHighlighter/shBrushPython.js"></script>
<script language="javascript" src="/static/SyntaxHighlighter/shBrushRuby.js"></script>
<script language="javascript">
dp.SyntaxHighlighter.ClipboardSwf = '/static/SyntaxHighlighter/clipboard.swf';
dp.SyntaxHighlighter.HighlightAll('code');
</script>
</body>
</html>
