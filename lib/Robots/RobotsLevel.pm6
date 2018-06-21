use v6c;
use Robots::Coordinate;
use Robots::BasicRobot;
use Robots::Player;
use Robots::Level;

class RobotsLevel is Level
{
    submethod TWEAK
    {
	self.addGameCharacterType("BasicRobot");
	self.addGameCharacterType("Player");
	self!addRobots;
	self!addPlayer;
    }    

    method moveAllCharacters
    {
	[%.game_characters<Player>]>>.move(self);
	[%.game_characters<BasicRobot>]>>.move(self);
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
	    %.game_characters<BasicRobot>.push($robot);
	}
    }

    method !addPlayer
    {
	my Player $player = Player.new(coordinate => self.pickUniqueCoordinate);
	%.game_characters<Player>.push($player);
    }


}
