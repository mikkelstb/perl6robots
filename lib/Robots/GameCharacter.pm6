use v6c;
use Robots::Coordinate;

role GameCharacter
{
    has Str $.default_character;
    has Str $.dead_character;

    has Coordinate $.coordinate;

    submethod BUILD(Coordinate :$!coordinate) {}
    
    method setCoordinate(Coordinate $c)
    {
	$!coordinate = $c;
    }

    method stringOf returns Str
    {
	return $.default_character ~ "- (" ~ $.coordinate.x ~ "," ~ $.coordinate.y ~ ")";
    }

    method move() { ... }

}
