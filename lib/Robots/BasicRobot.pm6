use v6c;
use Robots::Coordinate;
use Robots::GameCharacter;

class BasicRobot is GameCharacter
{
    submethod BUILD(Coordinate :$coordinate)
    {
	self.setCharacters(default => "🤖", dead => "☠️");
	self.coordinate = $coordinate;
    }
}
