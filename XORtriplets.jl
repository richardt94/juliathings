# Find the one element that appears once in an array where every other element
# appears, using XOR tricks
## loop over numbers
function find_single(a)
   acc1 = 0
   acc2 = 0
   for ael = a
      #bits seen twice
      acc2 ⊻= ael & acc1
      #bits seen once (and clear the twice seen bits)
      acc1 ⊻= ael
      #clear bits seen three times
      thrice = acc1 & acc2
      acc1 -= thrice
      acc2 -= thrice
   end
   acc1
end

## tests
using Random
for i=1:100
   ntriplets = rand(0:20)
   inarray = repeat(rand(UInt,ntriplets),3);
   single = rand(UInt)
   inarray = [inarray; single]
   shuffle!(inarray)
   @assert find_single(inarray) == single
end
## test example
a = UInt64[0xd48cf29702dea517, 0xe16707b433ecd127, 0xc2aa12c39f97682c,
 0xd48cf29702dea517, 0xe16707b433ecd127, 0xc2aa12c39f97682c,
0xd48cf29702dea517, 0xe16707b433ecd127, 0xc2aa12c39f97682c, 0xcdacdb2bb483edb1]
shuffle!(a)
println(a)
find_single(a)
