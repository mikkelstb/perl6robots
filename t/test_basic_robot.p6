use v6c;
use lib 'lib';
use Robots::BasicRobot;
use Robots::Coordinate;
use Test;

my BasicRobot $robot = BasicRobot.new(coordinate => Coordinate.new(x => 2, y => 3));

is($robot.dead_character, '☠️', 'Instance variable');
is($robot.default_character, '🤖', 'Instance variable');

