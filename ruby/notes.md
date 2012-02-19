# Notes about Ruby #

 * Installing using rvm (which i assume means Ruby Version Manager) (from https://rvm.beginrescueend.com/rvm/install/):

    $ bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)

  Reload your shell environment:

    $ source ~/.bash_profile

    $ rvm requirements

  Install ruby:

    $ rvm install 1.9.3

 * Make it the defaul:

    $ rvm use 1.9.2

 * Check if it's working:

    $ ruby -v

-------------------------------------

# Starting #

 *  From (http://ruby-doc.org/docs/ProgrammingRuby/)

 * irb:

    "gin joint".length	»	9
    "Rick".index("c")	»	2
    -1942.abs	»	1942
    sam.play(aSong)	»	"duh dum, da dum de dum ..."

 * defs

    def sayGoodnight(name)
      result = "Goodnight, " + name
      return result
    end

    \# Time for bed...
    puts sayGoodnight("John-Boy")
    puts sayGoodnight("Mary-Ellen")

 * parentesis

    puts sayGoodnight "John-Boy"
    puts sayGoodnight("John-Boy")
    puts(sayGoodnight "John-Boy")
    puts(sayGoodnight("John-Boy"))

 > However, life isn't always that simple, and precedence rules can make it difficult
 > to know which argument goes with which method invocation, so we recommend using parentheses
 > in all but the simplest cases.

 * String interpolation

    name="Bleh"
    "Goodnight, #{name}"
	'goodbay, #{bleh}'
	
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