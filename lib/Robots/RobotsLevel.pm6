use v6c;
use Robots::Coordinate;
use Robots::BasicRobot;
use Robots::Player;
use Robots::Level;


class RobotsLevel is Level
{
    submethod TWEAK
    {
	#self.addGameCharacterType("BasicRobot");
	#self.addGameCharacterType("Player");
	
	self!addPlayer;
	self!addRobots;

	loop
	{
	    self.moveAllCharacters;
	    self.checkForCollision;
	    self.printAllCharacters;
	    prompt;
	}

	
    }    

    method moveAllCharacters
    {
	[%.game_characters<BasicRobot>]>>.moveTowardsTarget(%.game_characters<Player>[0].coordinate);
    }

    method checkForCollision
    {
	for %.game_characters<BasicRobot>.kv -> Int $index, BasicRobot $br
	{
	    for %.game_characters<BasicRobot>[$index+1 .. *].kv -> Int $index2, BasicRobot $br2
	    {
		say "comparing $index to $index2";
		if $br.coordinate.equals($br2.coordinate)
		{
		    $br.die;
		    $br2.die;
		    last;
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
