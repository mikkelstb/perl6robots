use v6c;
use Robots::Coordinate;
use Robots::GameCharacter;

class Player does GameCharacter
{
    submethod BUILD(Coordinate :$coordinate)
    {
	self.setCharacters(default => "🏃", dead => "✝️");
	self.coordinate = $coordinate;
    }

    # method move(Level $level)
    # {
    # 	return Nil;
    # }
}
