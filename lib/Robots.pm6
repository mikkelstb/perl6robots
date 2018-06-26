use v6c;
use Robots::RobotsLevel;

class Robots
{
    has RobotsLevel $!level;
    has Int $!level_number;
    has Int $!level_rows;
    has Int $!level_columns;


    submethod TWEAK
    {
	$!level_number = 0;
	$!level_rows = 30;
	$!level_columns = 80;
    }
    
    method start
    {
	$!level = RobotsLevel.new(rows => $!level_rows, columns => $!level_columns, number => $!level_number);
	$!level.start;

	say "Game Over";
    }
}
