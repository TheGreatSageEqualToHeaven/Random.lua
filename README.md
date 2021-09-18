# Random.lua

## API

### Random.new([double seed])

Creates a new Random object from the given seed.
Multiple Randoms seeded with the same value will always produce the same number sequence.
If a seed isn’t specified, one will automatically be pulled from an internal entropy source.
int Random:NextInteger(int min, int max)

### int Random:NextInteger(int min, int max)

Returns a pseudorandom integer uniformly distributed over [min, max].

### double Random:NextNumber([double min=0, double max=1])

Returns a pseudorandom number uniformly distributed over [min, max).

### Random Random:Clone()

Returns a new Random object with the same state as the original.
This method can be useful for branching off the results of the RNG.
