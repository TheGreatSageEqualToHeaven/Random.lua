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

## Based on Multiply-with-carry and Roblox's Random API

In computer science, multiply-with-carry (MWC) is a method invented by George Marsaglia[1] for generating sequences of random integers based on an initial set from two to many thousands of randomly chosen seed values. The main advantages of the MWC method are that it invokes simple computer integer arithmetic and leads to very fast generation of sequences of random numbers with immense periods, ranging from around 260 to 22000000.

As with all pseudorandom number generators, the resulting sequences are functions of the supplied seed values.

Roblox's Random is used to generate high-quality pseudorandom numbers from a dedicated internal state, the alghorithm Roblox uses is the XSH-RR variant of the PCG family.

### https://handwiki.org/wiki/Multiply-with-carry
### https://devforum.roblox.com/t/a-random-feature/64517
