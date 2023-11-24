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
    exec "testament pattern tests/*.nim"
    #exec "testament --colors:on --failing all"

task exedev, "Builds the release version of the nim app":
  exec "nim c -d:debug -d:ssl -o:bin/nim_fuzzy_duck_lib -r src/nim_fuzzy_duck_lib.nim"