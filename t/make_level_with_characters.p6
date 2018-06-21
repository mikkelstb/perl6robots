use v6c;
use lib 'lib';
use Robots::RobotsLevel;
use Test;


my RobotsLevel $level = RobotsLevel.new(rows => 20, columns => 30, number => 5);

$level.printCoordinates;

#$level.movePlayer;
#$level.moveRobots;


