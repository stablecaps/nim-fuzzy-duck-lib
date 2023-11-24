import ../../src/DamerauLevenshteinDistanceAlgo

import std/tables


# https://www.reddit.com/r/nim/comments/7dm3le/tutorial_for_types_having_a_hard_time/
# TODO: lookup object vs ref
type TestDataPoint = ref object
    Title: string
    Str1: string
    Str2: string
    Expected: int



let dlsdTestData: seq[TestDataPoint] = @[
    TestDataPoint(Title: "empty string on Str1", Str1: "", Str2: "shouldBeThisLen", Expected: 15),
    TestDataPoint(Title: "empty string on Str2", Str1: "shouldBeThisLen", Str2: "", Expected: 15),
    TestDataPoint(Title: "empty string on both", Str1: "", Str2: "", Expected: 0),
    TestDataPoint(Title: "adding to end", Str1: "azer", Str2: "azerty", Expected: 2),
    TestDataPoint(Title: "adding to start", Str1: "erty", Str2: "azerty", Expected: 2),
    TestDataPoint(Title: "adding to both ends", Str1: "zert", Str2: "azerty", Expected: 2),
    TestDataPoint(Title: "adding to middle", Str1: "azty", Str2: "azerty", Expected: 2),
    TestDataPoint(Title: "adding to middle and both ends", Str1: "zt", Str2: "azerty", Expected: 4),
    TestDataPoint(Title: "removing from end???", Str1: "azer", Str2: "azerty", Expected: 2),
    TestDataPoint(Title: "removing from start???", Str1: "erty", Str2: "azerty", Expected: 2),
]

for idx, test in dlsdTestData:
    echo idx, "=", test.Title
    var damerauLevinDistance = calcDamerauLevinshteinDistance(test.Str1, test.Str2)
    assert damerauLevinDistance == test.Expected, "damerauLevinDistance does not match"



# {

# 	{2, "zert", "azerty"},   # removing from both ends
# 	{2, "azty", "azerty"},   # removing from middle
# 	{4, "zt", "azerty"},     # removing from middle and both ends
# 	{2, "azErtY", "azerty"}, # substitution
# 	{1, "azrety", "azerty"}, # permutation
# }.toTable

# var tableSimpel = []struct {
# 	score int
# 	a, b  string
# }{
# 	{0, "", ""},             # empty string
# 	{6, "azerty", ""},       # non empty against empty string
# 	{6, "", "qwerty"},       # empty against non empty string
# 	{2, "azer", "azerty"},   # adding to end
# 	{2, "erty", "azerty"},   # adding to start
# 	{2, "zert", "azerty"},   # adding to both ends
# 	{2, "azty", "azerty"},   # adding to middle
# 	{4, "zt", "azerty"},     # adding to middle and both ends
# 	{2, "azer", "azerty"},   # removing from end
# 	{2, "erty", "azerty"},   # removing from start
# 	{2, "zert", "azerty"},   # removing from both ends
# 	{2, "azty", "azerty"},   # removing from middle
# 	{4, "zt", "azerty"},     # removing from middle and both ends
# 	{2, "azErtY", "azerty"}, # substitution
# 	{1, "azrety", "azerty"}, # permutation

# 	# Couple of groups that's shown up in tests here and there,
# 	# doesn't hurt including them
# 	{4, "moral", "carry"},
# 	{5, "across", "is"},
# 	{4, "beak", "water"},
# 	{1, "teh", "the"},
# 	{1, "tets", "test"},
# 	{1, "fuor", "four"},
# 	{3, "kitten", "sitting"},
# 	{3, "Saturday", "Sunday"},
# 	{8, "rossettacode", "raisethysword"},
# }





# https:#github.com/lmas/Damerau-Levenshtein/blob/master/damerau-levenshtein_test.go
# https:#dev.to/ringabout/how-to-use-testament-in-nim-1l0h