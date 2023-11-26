# This is just an example to get you started. A typical library package
# exports the main API in this file. Note that you cannot rename this file
# but you can remove it if you wish.

import std/strformat
import nim_fuzzy_duck_lib/algoHammingDistance
import nim_fuzzy_duck_lib/algoLevenshteinDistance
import nim_fuzzy_duck_lib/algoDamerauLevenshteinDistance


proc main() =
    ### HammingDistance
    # let hstr1 = "The Quick Brown Fox Jumped Over The Moon"
    # let hstr2 = "The Quick Brown Fox Jumped Over The Moon"
    # let str2 = "The Fat Brown Cow Jumped Over The Moon"
    # let str1 = "The Fat Brown moo Jumped Over The Moon"
    # discard hammingDist(str1=hstr2, str2=hstr2)

    ### LevenshteinDistance
    # let lstr1 = "kitten"
    # let lstr2 = "sitting"
    # let levinDistance = levinshteinDist(lstr1, lstr2)
    # echo fmt"levinDistance = {levinDistance}"

    ### damerauLevenshteinDistance
    # let str1 = "kitten"
    # let str2 = "sitting"
    # let str1 = "kitten"
    # let str2 = "kittne"
    # let str1 = "CA"
    # let str2 = "ABC"
    # let damerauLevinDistance = damerauLevinshteinDist(str1, str2)
    # echo fmt"damerauLevinDistance = {damerauLevinDistance}"

    ### BK-Tree initial
    let testDataSeq: seq[string] = @["some", "soft", "same", "mole", "soda", "salmon"]

main()
