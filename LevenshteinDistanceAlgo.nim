#{.push raises: [].}

import std/osproc
import std/strutils
import std/strformat
import sequtils
import std/tables
import system/iterators
import neo


func levin*(): bool =
    let m1 = makeMatrix(6, 6, proc(i, j: int): int = 0)

    for t, x in m1:
        let (i, j) = t
        debugEcho i, " ", j, " ", x

    debugEcho ""
    debugEcho m1
    return true

