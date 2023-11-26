import std/strformat
import std/tables
import ../src/nim_fuzzy_duck_lib/algoDamerauLevenshteinDistance

# https://www.reddit.com/r/nim/comments/7dm3le/tutorial_for_types_having_a_hard_time/
# TODO: lookup object vs ref
type TestDataPoint = ref object
    title: string
    str1: string
    str2: string
    expected: int



let dlsdTestData: seq[TestDataPoint] = @[
    TestDataPoint(title: "empty string on str1", str1: "", str2: "shouldBeThisLen", expected: 15),
    TestDataPoint(title: "empty string on str2", str1: "shouldBeThisLen", str2: "", expected: 15),
    TestDataPoint(title: "empty string on both", str1: "", str2: "", expected: 0),
    TestDataPoint(title: "adding to end", str1: "azer", str2: "azerty", expected: 2),
    TestDataPoint(title: "adding to start", str1: "erty", str2: "azerty", expected: 2),
    TestDataPoint(title: "adding to both ends", str1: "zert", str2: "azerty", expected: 2),
    TestDataPoint(title: "adding to middle", str1: "azty", str2: "azerty", expected: 2),
    TestDataPoint(title: "adding to middle and both ends", str1: "zt", str2: "azerty", expected: 4),
    TestDataPoint(title: "removing from end???", str1: "azer", str2: "azerty", expected: 2),
    TestDataPoint(title: "removing from start???", str1: "erty", str2: "azerty", expected: 2),
    # TestDataPoint(title: "check transposition", str1: "ca", str2: "abc", expected: 2),
]

for idx, test in dlsdTestData:
    echo idx, "=", test.title
    var damerauLevinDistance = damerauLevinshteinDist(test.str1, test.str2)
    assert damerauLevinDistance == test.expected, fmt"<{test.title}> failed. Got <{damerauLevinDistance}>, but expected <{test.expected}>"



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