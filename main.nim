
# import fuzzySearch
import std/strformat
import hammingDistanceAlgo
import LevenshteinDistanceAlgo


# simple()


proc main() =
    ### HammingDistance
    let str1 = "The Quick Brown Fox Jumped Over The Moon"
    let str2 = "The Quick Brown Fox Jumped Over The Moon"
    # let str2 = "The Fat Brown Cow Jumped Over The Moon"
    # let str1 = "The Fat Brown moo Jumped Over The Moon"
    # discard calcHammingDistance(str1=str2, str2=str3, verbose=true)

    ### LevenshteinDistance
    # let str2 = "kitten"
    # let str1 = "sitting"
    let levinDistance = levin(str1, str2)
    echo fmt"levinDistance = {levinDistance}"

main()