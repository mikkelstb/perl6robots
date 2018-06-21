use v6c;
use lib 'lib';
use Robots::Coordinate;
use Test;

plan 6;

my Coordinate $c = Coordinate.new(x => 2, y => 3);
my Coordinate $d = Coordinate.new(y => 10, x => 4);
my Coordinate $e = Coordinate.new(y => 3, x => 2);

is($c.x, 2, 'x-coordinate');
is($c.y, 3, 'y-coordinate');

is($d.x, 4, 'x-coordinate');
is($d.y, 10, 'y-coordinate');

is($c.equals($d), False, 'C equals D');
is($c.equals($e), True, 'C equals E');
