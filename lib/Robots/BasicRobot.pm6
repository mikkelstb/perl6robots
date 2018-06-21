use v6c;
use Robots::GameCharacter;
use Robots::Level;

class BasicRobot is GameCharacter
{
    submethod TWEAK
    {
	$!default_character = "🤖";
	$!dead_character = "☠️";
    }

    method move(Level $level)
    {
	say "Moving: " ~ self.WHO;
    }
    
}
