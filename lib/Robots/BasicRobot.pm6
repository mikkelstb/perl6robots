use v6c;
use Robots::GameCharacter;
use Robots::Coordinate;

class BasicRobot does GameCharacter
{
    submethod TWEAK
    {
	$!default_character = "🤖";
	$!dead_character = "☠️";
	$!alive = True;
    }

    method moveTowardsTarget(Coordinate $target)
    {
    	unless self.coordinate.equals($target) || !($!alive)
	{
	    if self.coordinate.x < $target.x
	    {
		$.coordinate.x++
	    }
	    elsif self.coordinate.x > $target.x
	    {
		$.coordinate.x--
	    }
	    if self.coordinate.y < $target.y
	    {
		$.coordinate.y++
	    }
	    elsif self.coordinate.y > $target.y
	    {
		$.coordinate.y--
	    }	    
	}
    }
}
