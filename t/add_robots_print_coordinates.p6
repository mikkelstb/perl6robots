use v6c;
use lib 'lib';
use Robots::Level;
use Robots::Coordinate;
use Test;

my Level $l = Level.new(rows => 10, columns => 10, number => 1);

$l.initBasicLevel;
$l.addRobot;

for 1 .. 50 { $l.addRobot }

$l.printCoordinates;
