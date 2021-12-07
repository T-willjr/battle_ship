ITERATION 1 Ship Tests 

--------------***********************
Test "can create an instance"
-Tested to see if Ship class could create and instance of itself with two parameters(name & length).

Ship class
-Added name and length parameters to initialize method so that whenever an instance is created name and length are required

--------------***********************
Test "has a name and length"

-Tested to see if ship has name and length parameter.

Ship Class

-Created attr_reader and instance variables for name and length so they can be called outside of Ship class

--------------***********************
Test "has health"

-Tested to see if ship has health. Health should be equal to length

Ship Class

-Created instance variable health, added @health to attr_reader, and assigned @health a value of the length parameter

--------------***********************
Test "by default is not sunk"

-Tested to see if ship.sunk? is by default false

Ship class

-Created sunk? method. Created @sunk instance variable with a value of false.
Added @sunk to sunk? method

--------------***********************
Test it "can take a hit" do

-Tested to see once ship.hit method is executed ship loses 1 health

Ship class

-Created a method called hit. Added @health - 1 to hit method.

--------------***********************
Test "is sunk when health is 0"

-Tested to see once ship.health is equal to 0 then ship.sunk? should be equal to true

Ship class

-Inside sunk? method created if statement to return true if @health instance variable was equal to 0 and false for anything else
