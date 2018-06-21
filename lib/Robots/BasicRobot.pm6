use v6c;
use Robots::Coordinate;
use Robots::GameCharacter;
#use Robots::Level;

class BasicRobot does GameCharacter
{
    submethod BUILD(Coordinate :$coordinate)
    {
	self.setCharacters(default => "🤖", dead => "☠️");
	self.coordinate = $coordinate;
    }

    # method move(Level $level)
    # {
    # 	return Nil;
    # }
    
}
