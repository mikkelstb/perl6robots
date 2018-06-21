use v6c;
use Robots::Coordinate;

role GameCharacter
{
    has Str $.default_character;
    has Str $.dead_character;
    has Coordinate $.coordinate is rw;
    
    method setCharacters(Str :$default, Str :$dead)
    {
	$!default_character = $default;
	$!dead_character = $dead;
    }

    method setCoordinate(Coordinate $c)
    {
	$!coordinate = $c;
    }

}
