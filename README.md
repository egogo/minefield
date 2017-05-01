
## Objective

There is a field of mines. Each mine is identified by a 2d-coordinate and a blast radius. When a mine explodes at time interval t, it explodes mines that lay within its blast radius at t + 1.

Given a list of mines consisting of their X & Y coordinates and blast radius (ex 2, 2, 5), write a program that finds which mine(s) in the list trigger the greatest number of explosions. Use the Euclidean distance to determine whether a mine lays within the radius of another mine. Your program should produce an output file showing the mines, identified by their coordinates & blast radius, in descending order of total generated explosions.

## Running

```bundle install```

```ruby runner.rb mines.txt results.txt``` or ```ruby runner.rb``` with default file names

 
## Testing

```rake```
 