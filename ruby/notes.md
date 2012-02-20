# Notes about Ruby #

 * Installing using rvm (which i assume means Ruby Version Manager) (from https://rvm.beginrescueend.com/rvm/install/):

    $ bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)

  Reload your shell environment:

    $ source ~/.bash_profile

    $ rvm requirements

  Install ruby:

    $ rvm install 1.9.3

 * Make it the default:

~~~
    $ rvm use 1.9.2
~~~

 * Check if it's working:

~~~
    $ ruby -v
~~~

-------------------------------------

# Starting #

 * From (http://ruby-doc.org/docs/ProgrammingRuby/)

 * irb:

~~~
    "gin joint".length	»	9
    "Rick".index("c")	»	2
    -1942.abs	»	1942
    sam.play(aSong)	»	"duh dum, da dum de dum ..."
~~~

 * defs

~~~
    def sayGoodnight(name)
      result = "Goodnight, " + name
      return result
    end

    \# Time for bed...
    puts sayGoodnight("John-Boy")
    puts sayGoodnight("Mary-Ellen")
~~~

 * parenthesis

~~~
    puts sayGoodnight "John-Boy"
    puts sayGoodnight("John-Boy")
    puts(sayGoodnight "John-Boy")
    puts(sayGoodnight("John-Boy"))
~~~

 > However, life isn't always that simple, and precedence rules can make it difficult
 > to know which argument goes with which method invocation, so we recommend using parentheses
 > in all but the simplest cases.

 * String interpolation

~~~
    name="Bleh"
    "Goodnight, #{name}"
    'goodbay, #{bleh}'
~~~

 * Variable names convention
 
<table>
    <tr><td>Scope</td>      <td>Name</td></tr>
    <tr><td>local</td>      <td>i_am_local</td></tr>
    <tr><td>global</td>     <td>$global_var</td></tr>
    <tr><td>instance</td>   <td>@some_instance</td></tr>
    <tr><td>class</td>      <td>@@static</td></tr>
    <tr><td>class name</td> <td>AClassName</td></tr>
    <tr><td>constant</td>   <td>CONSTANT</td></tr>
</table>

 * Arrays
 
~~~
    1.9.3p125 :004 > a = [1, "cat", "goodbye, #{name}", nil]
    => [1, "cat", "goodbye, bleh", nil] 
    
    empty1 = []
    empty2 = Array.new
    a[0] # 1
    a[1] = nil
    a[1] # nil
    
    b = %w{ ant bee cat dog elk } # crazy array syntax
    b[1] # "ant"
~~~

 * Hashes (misnamed maps)

~~~
    instSection = {
      'cello'     => 'string',
      'clarinet'  => 'woodwind',
      'drum'      => 'percussion',
      'oboe'      => 'woodwind',
      'trumpet'   => 'brass',
      'violin'    => 'string'
    }
    
    instSection['oboe'] # "woodwind"
    instSection['piano'] # nil
~~~

  * Hashes can have default values

~~~
    my_hash = Hash.new("oh, fortuna") # new hash with default 'oh, fortuna'
    my_hash['velut luna']  # "oh, fortuna"
~~~

 * Control structures

~~~
    def testIf(count)
        if count > 10
            puts "Try again"
        elsif count<3
            puts "You lose"
        else
            puts "bleh"
        end
    end
~~~

  * nonsense if too:

~~~
    puts "Danger, Will Robinson" if radiation > 3000


    while square < 1000
     square = square*square
    end
~~~
  * as IF wasn't enough, nonsense while, which I don't dare to imagine the evaluation order

~~~
    square = square*square  while square < 1000
~~~	

 * wow, how convenient, they got regex in the language:

~~~
  /\d\d:\d\d:\d\d/     # a time such as 12:34:56
  /Perl.*Python/       # Perl, zero or more other chars, then Python
  /Perl\s+Python/      # Perl, one or more spaces, then Python
  /Ruby (Perl|Python)/ # Ruby, a space, and either Perl or Python
~~~

  * The match operator:

~~~
  line="Something about Python"
  line =~ /Perl|Python/   # results 16
~~~
   
   Which returns the position of the match or nil

  * How could I live without regular expressions in the language, it's amazing:

~~~
  line.sub(/Perl/, 'Ruby')    # replace first 'Perl' with 'Ruby'
  line.gsub(/Python/, 'Ruby') # replace every 'Python' with 'Ruby'
~~~

## Classes and objects, finally ##

 * A simple class named song with name, artist and duration properties
~~~
class Song
  def initialize(name, artist, duration)
    @name     = name
    @artist   = artist
    @duration = duration
  end
end
~~~

 * Instantiating and inspecting its contents
~~~
aSong = Song.new("Bicylops", "Fleck", 260)
aSong.inspect  # results <Song:0x401b4924 @duration=260, @artist=\"Fleck\", @name=\"Bicylops\">
aSong.@name # Error, notice it's private
~~~~

 * Ruby classes are open - or as I like to think - never closed. So at any given time methods can me be added
~~~
class Song
  def to_s
    "Song: #{@name}--#{@artist} (#{@duration})"
  end
end
~~~

 * It's interesting to notice that our new method to_s was also 'added' to already existing instances

 * Inheritance 
~~~
class KaraokeSong < Song
  def initialize(name, artist, duration, lyrics)
    super(name, artist, duration)
    @lyrics = lyrics
  end
end
~~~

 * And fixing the to string method to show our new property
~~~
class KaraokeSong < Song
  def to_s
    super + " [#{@lyrics}]"
  end
end
~~~

 * Attributes
~~~
aSong.@name # results in a error, because @name is a private attribute
~~~

  * To amend that accessors are created and it's even taking advantage of the never-closed-ness of Ruby classes:
~~~
class Song
  def name
    @name
  end
  def artist
    @artist
  end
  def duration
    @duration
  end
end
~~~
  
  * And you say "Hey dude, it's so boring to keep writing all this stuff for every class". Indeed it is. Check Ruby's solution:
~~~
class Song
  attr_reader :name, :artist, :duration
end
~~~

> This example has introduced something new. The construct :artist is an expression that returns a Symbol 
> object corresponding to artist. You can think of :artist as meaning the name of the variable artist, while 
> plain artist is the value of the variable. In this example, we named the accessor methods name, artist, and 
> duration. The corresponding instance variables, @name, @artist, and @duration, will be created automatically. 
> These accessor methods are identical to the ones we wrote by hand earlier.

  * Setters

~~~
class Song
  def duration=(newDuration)
    @duration = newDuration
  end
end

aSong.duration="3 hours" # let's pretend it's a opera
~~~~

  * The short way
~~~
class Song
  attr_writer :duration
end
aSong = Song.new("Bicylops", "Fleck", 260)
aSong.duration = 257
~~~

  * Virtual attributes - or as I like to call it - derivated attributes - although Ruby apparently encourages the its usage for mutation too:
~~~
class Song
  def durationInMinutes
    @duration/60.0   # force floating point
  end
  def durationInMinutes=(value)
    @duration = (value*60).to_i
  end
end
~~~

