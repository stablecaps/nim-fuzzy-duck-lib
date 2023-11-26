# Nim Fuzzy Search

## Overview

### THIS IS A WORK IN PROGRESS STILL!!!

A nim library that contains various algorithms that assist with fuzzy search

## fuzzy search

1. Hamming Distance
The Least complicated way to calculate the dissimilarities for string matching. It compares two equally sized strings for example “CAT” and “KAT”. Hamming distance provides the number of characters that don’t match corresponding to the index of that character. For instance “0” is the index that didn’t match and “1” is the number of characters.


2. Levenshtein distance
Levenshtein distance is a technique that is used to calculate the number of dissimilarities between two strings. To further stress, the technique focuses on substitution, deletion, and insertion for modifying one string to another. For example the levenshtein distance of “John Davis” and “John David” is one.

3. Damerau-Levenshtein distance
It is identical to levenshtein distance as the name suggests. The only difference is it also includes transposition to its added function.

4. Needleman–Wunsch algorithm
In N-gram based matching, a string is basically broken into a dataset of two components. For example “John” will be broken down to “Jo”,”oh”, and ”hn”. All these two components will be matched to the corresponding strings to generate results.

5. BK Tree
It is the fastest algorithm for string matching. It utilizes two techniques i.e. Levenshtein Distance and Triangle Inequality.

‍It creates a BK tree of words from a given dictionary. For example let dictionary dic={some, same, soft, salmon, soda, mole}

‍As mentioned in a diagram below, the levenshtein distance between the two strings in the dictionary will be generated. The first string of the dictionary will be the root node by default. If the corresponding string matches with the root node, the corresponding string will be made the child node and further on. If no child matches the corresponding string then the corresponding will be made the new children for the root node.

Once the tree is prepared, a threshold point is selected to which the string matching will happen. This threshold point is determined using Triangle Inequality. As per Triangle Inequality:

Distance (A,B) + Distance(B,C)≥Distance(A,C) where A,B,C are sides of a triangle.

Here the three sides of the triangle represent query, parent, and child. Also levenshtein distance is used as edge length.

6. Bitap Algorithm
‍It is another very fast algorithm that uses bitwise operation. The algorithm searches for approximate matches from a substring for a given pattern. This equality is determined using the levenshtein distance. If the substring and the pattern are at a provided distance of k then then they are considered equal otherwise not.
‍
7. Soundex Algorithm
‍This algorithm works on the format of determining phonetics. It is used for strings that sound the same but have different spelling. For example “wood” and “would”.

8. Meta Phone and Double Meta Phone Algorithm
‍It is an upgraded version of the soundex algorithm. Although, it is used while determining more than two words that sound similar but have different spelling. For example flour, floor, flower.

9. Cosine Similarity
‍In this algorithm, the matching is done using the cosine angle. It is done by breaking the two matching strings into n-gram. For example “cat” and “kat”. If we consider “cat” as base string then it will be written as “111” and “kat” will be written as “011”.

Taking the number of 1’s and 0’s and putting them in the cosine formula:

Cos =(A .B )/AB

And the resultant will give the matching percentage.

10. Jaro-Winkler algorithm
The Jaro-Winkler distance algorithm was proposed in 1990. It builds upon the Jaro similarity algorithm, which uses the following equation to calculate the similarity.

m = number of matching characters
t is half of the number of transpositions
|s1| and |s2| are the lengths of each string, respectively.

The Jaro similarity returns a score between 0 and 1, where 0 represents no match, and 1 represents that the strings are exactly alike. Jaro-Winkler modifies the formula by applying more weightage to the first i matching characters. I will not go into too much detail, but the final form is represented by the equation below.

11. Norvig's Spelling Corrector
12. SymSpell (Symmetric Delete spelling correction algorithm)
13. LinSpell (Linear search spelling correction algorithm)
14. strike a match
http://www.catalysoft.com/articles/StrikeAMatch.html

15. trie



0. https://www.amygb.ai/blog/how-does-fuzzy-matching-work

1. https://stackoverflow.com/questions/32337135/fuzzy-search-algorithm-approximate-string-matching-algorithm

2. https://www.forrestthewoods.com/blog/reverse_engineering_sublime_texts_fuzzy_match/

3. https://medium.com/@Srekel/implementing-a-fuzzy-search-algorithm-for-the-debuginator-cacc349e6c55

4. https://medium.com/codex/best-libraries-for-fuzzy-matching-in-python-cbb3e0ef87dd

5. https://bbarrows.com/posts/nim-fuzzy

6. https://forum.nim-lang.org/t/10221

7. https://sqlite.org/fts5.html#the_trigram_tokenizer

8. https://github.com/junegunn/fzf/blob/master/src/algo/algo.go

9. https://github.com/pigmej/fuzzy