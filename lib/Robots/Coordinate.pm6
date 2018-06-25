use v6c;

class Coordinate
{
    has Int $.x is rw;
    has Int $.y is rw;

    submethod BUILD(Int :$!x, Int :$!y){}


    method equals(Coordinate $c) returns Bool
    {
	if $c.x == $!x && $c.y == $!y
	{
	    return True;
	}
	return False;
    }

    method stringOf
    {
	say "x: $!x, y: $!y";
    }
}
