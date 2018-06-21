use v6c;
use Robots::GameCharacter;
use Robots::Level;

class Player is GameCharacter does Moveable
{
    submethod TWEAK
    {
	$!default_character = "🏃";
	$!dead_character = "✝";
    }

    method move(Level $level)
    {
	say "Moving: " ~ self.WHO;
    }
}
