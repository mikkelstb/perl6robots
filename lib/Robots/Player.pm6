use v6c;
use Robots::GameCharacter;


class Player does GameCharacter
{
    submethod TWEAK
    {
	$!default_character = "🏃";
	$!dead_character = "✝";
    }

    method move()
    {
	say "Moving: " ~ self.WHO;
    }
}
