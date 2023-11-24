# This is just an example to get you started. A typical library package
# exports the main API in this file. Note that you cannot rename this file
# but you can remove it if you wish.

proc add*(x, y: int): int =
  ## Adds two files together.
  return x + y
  
  
# import fuzzySearch
import std/strformat
import hammingDistanceAlgo
import LevenshteinDistanceAlgo
import DamerauLevenshteinDistanceAlgo


# simple()


proc main() =
    ### HammingDistance
    # let str1 = "The Quick Brown Fox Jumped Over The Moon"
    # let str2 = "The Quick Brown Fox Jumped Over The Moon"
    # let str2 = "The Fat Brown Cow Jumped Over The Moon"
    # let str1 = "The Fat Brown moo Jumped Over The Moon"
    # discard calcHammingDistance(str1=str2, str2=str3, verbose=true)

    ### LevenshteinDistance
    # let str1 = "kitten"
    # let str2 = "sitting"
    # let levinDistance = calcLevinshteinDistance(str1, str2)
    # echo fmt"levinDistance = {levinDistance}"

    ### damerauLevenshteinDistance
    # let str1 = "kitten"
    # let str2 = "sitting"
    # let str1 = "kitten"
    # let str2 = "kittne"
    let str1 = "CA"
    let str2 = "ABC"
    let damerauLevinDistance = calcDamerauLevinshteinDistance(str1, str2)
    echo fmt"damerauLevinDistance = {damerauLevinDistance}"


main()
