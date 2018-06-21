use v6c;
use lib 'lib';
use Robots::Level;
use Test;



my Level $level = Level.new(rows => 20, columns => 30, number => 1);

$level.initRobots;
$level.initPlayer;

say $level.getCoordinates;

$level.movePlayer;
$level.moveRobots;

say $level.getCoordinates;
