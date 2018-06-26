use v6c;
use Robots::Coordinate;
use Robots::BasicRobot;
use Robots::Player;
use Robots::Level;
use Terminal::Print::DecodedInput;

class RobotsLevel is Level
{
    submethod TWEAK
    {
	#self.addGameCharacterType("BasicRobot");
	#self.addGameCharacterType("Player");
	
	self!addPlayer;
	self!addRobots;
    }

    method start
    {
    	while %.game_characters<Player>[0].alive
	{
	    self.printAllCharacters;
	    self.moveAllCharacters;
	    self.checkForCollision;
	}
	self.printAllCharacters;
    }

    method getArrowInput returns Str
    {
	my Str $pressed;
	
	my $in-supply = decoded-input-supply;
	react
	{
	    whenever $in-supply -> $c
	    {
		if $c ~~ SpecialKey
		{
		    $pressed = $c.Str;
		    done;
		}
	    }
	}
	return $pressed;
    }
    
    method moveAllCharacters
    {
	[%.game_characters<Player>]>>.move(self.getArrowInput);
	[%.game_characters<BasicRobot>]>>.moveTowardsTarget(%.game_characters<Player>[0].coordinate);
    }

    method checkForCollision
    {
	for %.game_characters<BasicRobot>.kv -> Int $index, BasicRobot $br
	{
	    for %.game_characters<BasicRobot>[$index+1 .. *].kv -> Int $index2, BasicRobot $br2
	    {
		if $br.coordinate.equals($br2.coordinate)
		{
		    $br.die;
		    $br2.die;
		    last;
		}
	    }
	    for %.game_characters<Player>[0 .. *] -> Player $player
	    {
		if $br.coordinate.equals($player.coordinate)
		{
		    $br.die;
		    $player.die;
		}
	    }
	}
    }

    method printAllCharacters
    {
	say [%.game_characters<Player>]>>.stringOf;
	say [%.game_characters<BasicRobot>]>>.stringOf;
    }
    
    method !addRobots()
    {
	for (0 .. $.number+2)
	{
	    my BasicRobot $robot = BasicRobot.new;
	    my Coordinate $c;

	    repeat while self.coordinateIsOccupied($c)
	    {
		$c = self.pickCoordinate;
	    }
	    $robot.setCoordinate($c);
	    self.addGameCharacter($robot);
	}
    }

    method !addPlayer
    {
	my Player $player = Player.new(coordinate => self.pickUniqueCoordinate);
	self.addGameCharacter($player);
    }
}
