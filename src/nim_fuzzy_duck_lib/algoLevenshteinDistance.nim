#{.push raises: [].}

import std/osproc
import std/strutils
import std/strformat
import sequtils
import std/tables
import system/iterators
import neo

# proc levenshteinCalc(idx int, jdx int) =
#     pass


proc levinshteinDist*(str1: string, str2: string): int =
    # Note Levenshtein matrix is 1 indexed.
    # TODO: should we convert string into list for performance?

    let str1Len = len(str1)
    let str2Len = len(str2)

    ### Quick return
    if str1Len == 0:
        return str2Len
    if str2Len == 0:
        return str1Len
    if str1 == str2:
        return 0

    let maxIdx = str1Len+1
    let maxJdx = str2Len+1

    var levMatrix = makeMatrix(maxIdx, maxJdx, proc(i, j: int): int = 0)
    # echo ""
    # echo levMatrix

    let str1Lower = str1.toLowerAscii()
    let str2Lower = str2.toLowerAscii()
    # echo "str1Lower: ", str1Lower

    ### Populate indexes
    for idx in 1..str1Len:
        levMatrix[idx, 0] = idx
    for jdx in 1..str2Len:
        levMatrix[0, jdx] = jdx

    for idx in 1..<str1Len + 1:
        for jdx in 1..<str2Len + 1:
            var iChar = str1Lower[idx-1]
            var jChar = str2Lower[jdx-1]

            # echo fmt"x {$idx}, {$jdx}, {$value}"
            var debugStatement = fmt"{idx}-{$iChar} - {jdx}-{$jChar}"
            var cost: int
            if iChar == jChar:
                cost = 0
            else:
                cost = 1

            var levenHolder = @[
                    levMatrix[(idx - 1), jdx]  + 1, # deletion
                    levMatrix[idx, (jdx - 1)] + 1,  # insertion
                    levMatrix[(idx - 1), (jdx - 1)] + cost, # substitution
            ]
            echo fmt"levenHolder = {levenHolder}"

            var levenMin = min(levenHolder)
            levMatrix[idx, jdx] = levenMin

            debugStatement.add(fmt" {levenMin}")
            echo fmt"debugStatement = {debugStatement}"

    echo ""
    echo levMatrix
    let levinDistance = levMatrix[str1Len, str2Len]
    return levinDistance

