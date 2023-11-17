
# import fuzzySearch
import hammingDistanceAlgo
import LevenshteinDistanceAlgo


# simple()


proc main() =
    ### HammingDistance
    # let str1 = "The Quick Brown Fox Jumped Over The Moon"
    # let str2 = "The Fat Brown Cow Jumped Over The Moon"
    # let str3 = "The Fat Brown moo Jumped Over The Moon"
    # discard calcHammingDistance(str1=str2, str2=str3, verbose=true)

    ### LevenshteinDistance
    discard levin()

main()