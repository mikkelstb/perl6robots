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
	self!addPlayer;
    }    

    method moveAllCharacters
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
