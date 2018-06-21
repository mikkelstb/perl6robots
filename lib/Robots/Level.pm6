use v6c;
use Robots::GameCharacter;
use Robots::Coordinate;

class Level
{
    has Int $!rows;
    has Int $!columns;
    has Int $.number;
    has Bool $.completed;

    has Array[GameCharacter] %.game_characters;

    submethod BUILD(Int :$!rows, Int :$!columns, Int :$!number) {}
    {
    }
    
    method addGameCharacterType(Str $type_name)
    {
	%!game_characters{$type_name} = Array[GameCharacter].new;
    }

    method pickCoordinate returns Coordinate
    {
	return Coordinate.new(x => [0 .. $!rows-1].pick, y => [0 .. $!columns-1].pick);
    }

    method pickUniqueCoordinate returns Coordinate
    {
	my Coordinate $c;
	repeat while self.coordinateIsOccupied($c)
	{
	    $c = self.pickCoordinate;
	}
	return $c;
    }

    method coordinateIsOccupied(Coordinate $c) returns Bool
    {
	for %!game_characters.values -> GameCharacter @characters
	{
	    for @characters -> GameCharacter $gc
	    {
		return True if $gc.coordinate.equals($c);
	    }
	}
	return False;
    }

    method printCoordinates
    {
	for %!game_characters.values -> GameCharacter @characters
	{
	    for @characters -> GameCharacter $gc {say $gc.stringOf}
	}
    }

}
