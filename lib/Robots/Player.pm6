use v6c;
use Robots::GameCharacter;


class Player does GameCharacter
{
    submethod TWEAK
    {
	$!default_character = "🏃";
	$!dead_character = "✝";
	$!alive = True;
    }

    method move(Str $direction)
    {
	given $direction
	{
	    when 'CursorUp' { $!coordinate.x-- }
	    when 'CursorDown' { $!coordinate.x++ }
	    when 'CursorLeft' { $!coordinate.y-- }
	    when 'CursorRight' { $!coordinate.y++ }
	}
    }
}
