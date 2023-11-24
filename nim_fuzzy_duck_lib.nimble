# Package

version       = "0.1.0"
author        = "Stablecaps"
description   = "A nim library that contains various algorithms that assist with fuzzy search"
license       = "Apache 2.0"
srcDir        = "src"


# Dependencies

requires "nim >= 1.6.12"

# tasks

task test, "Runs the test suite":
    # exec "testament --colors:on --failing run tests/dlsd/damerauLevinshteinDistanceTests.nim"
    exec "testament --colors:on --failing all"