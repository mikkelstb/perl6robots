use v6c;
use lib 'lib';
use Robots::RobotsLevel;
use Robots::Coordinate;
use Test;

my RobotsLevel $l = RobotsLevel.new(rows => 10, columns => 10, number => 1);

$l.moveAllCharacters;
