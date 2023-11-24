#{.push raises: [].}

import std/osproc
import std/strutils
import std/strformat
import sequtils
import std/tables
import system/iterators


# proc isIntValue(myInt: int, targetInt int): bool =
#     myInt == targetInt

type
    HammingDistanceResult* = object
        dissimilarityCount*, similarityCount*: int
        differenceLetterSeq*, identicalLetterSeq*: seq[char]
        differenceIndexesSeq*, identicalIndexesSeq*, dissimilarityMapSeq*: seq[int]




proc hammingDist*(str1: string, str2: string): HammingDistanceResult =
    ## Where the Hamming distance between two strings of equal length is the number of positions at which the corresponding character is different.

    let str1Len = len(str1)
    let str2Len = len(str2)

    let str1Lower = str1.toLowerAscii()
    let str2Lower = str2.toLowerAscii()

    var dissimilarityCount = 0
    var similarityCount = 0
    var differenceLetterSeq: seq[char]
    var identicalLetterSeq: seq[char]
    var differenceIndexesSeq: seq[int]
    var identicalIndexesSeq: seq[int]
    var dissimilarityMapSeq: seq[int]
    if str1Len != str2Len:
        let errmsg = fmt("String args 1 & 2 must be of the same length. Lenths are unequal: {str1Len} != {str2Len}")
        echo errmsg
        quit(42)
        #raise newException(ValueError, fmt("String args 1 & 2 must be of the same length. Lenths are unequal: {str1Len} != {str2Len}"))

    for idx, strChar in str1Lower:
        # echo "strChar: ", strChar
        if strChar == str2Lower[idx]:
            identicalLetterSeq.add(strChar)
            identicalIndexesSeq.add(idx)
            dissimilarityMapSeq.add(1)
            similarityCount += 1
        else:
            differenceLetterSeq.add(strChar)
            differenceIndexesSeq.add(idx)
            dissimilarityMapSeq.add(0)
            dissimilarityCount += 1

    let hammingDistanceResult = HammingDistanceResult(
                                   dissimilarityCount: dissimilarityCount,
                                   similarityCount: similarityCount,
                                   differenceLetterSeq: differenceLetterSeq,
                                   identicalLetterSeq: identicalLetterSeq,
                                   differenceIndexesSeq: differenceIndexesSeq,
                                   identicalIndexesSeq: identicalIndexesSeq,
                                   dissimilarityMapSeq: dissimilarityMapSeq)

    # if verbose:
    #     for fieldName, fieldValue in hammingDistanceResult.fieldPairs:
    #         echo fieldName," ",  fieldValue

    return hammingDistanceResult

# TODO:
#proc Hammingdistanceoftwobinarynumbers
# Note: For Hamming distance of two binary numbers, we can simply return a count of set bits in XOR of two numbers.