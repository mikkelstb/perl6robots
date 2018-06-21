use v6c;

class Coordinate
{
    has Int $.x;
    has Int $.y;

    submethod BUILD(Int :$!x, Int :$!y){}


    method equals(Coordinate $c) returns Bool
    {
	if $c.x == $!x && $c.y == $!y
	{
	    return True;
	}
	return False;
    }
}
