use v6c;
use Robots::Coordinate;

role GameCharacter
{
    has Str $!default_character;
    has Str $!dead_character;
    has Bool $!alive;

    has Coordinate $.coordinate;

    submethod BUILD(Coordinate :$!coordinate) {}
    
    method setCoordinate(Coordinate $c)
    {
	$!coordinate = $c;
    }

    method die
    {
	$!alive = False;
    }
    
    method character returns Str
    {
	if $!alive { return $!default_character }
	return $!dead_character;
    }

    method stringOf returns Str
    {
	
	return self.character ~ "- (" ~ $.coordinate.x ~ "," ~ $.coordinate.y ~ ")";
    }

}
