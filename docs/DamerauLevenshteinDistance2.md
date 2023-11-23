> The Damerau–Levenshtein distance is a measure of the similarity between two strings, which takes into account the number of insertion, deletion, substitution, and transposition operations needed to transform one string into the other. 

It is named after the two mathematicians who separately introduced the idea in the 1960s: Russian Vladimir I. Levenshtein and American computer scientist Frederick J. Damerau.

## Definition:

The distance between two strings **a** and **b** can be defined by using a function **f<sub>a, b</sub>(i, j)** where **i** and **j** represent the prefix length of string **a** and **b** respectively which can be defined as follows:

![Damerau - Levenshtein distance](https://media.geeksforgeeks.org/wp-content/uploads/20230120110144/formula.png)

Damerau – Levenshtein distance

## Algorithms:

The Damerau – Levenshtein distance can be calculated in two ways namely:

-   Optimal String Alignment Distance (or Restricted Edit Distance)
-   Damerau Levensthein Distance with Adjacent Transposition

### 1\. Optimal String Alignment Distance:

The “Restricted Edit distance” also referred to as the “Optimal String Alignment Distance” calculates how well two strings match one another. 

> It is determined by calculating how many single-character alterations (insertions, deletions, or replacements) are necessary to change one string into another. 

**Example:** The ideal string alignment distance, between the words “kitten” and “sitting” is three because it takes three modifications to change one word into the other: replacing “k” with “s, ” replacing “e” with I, and adding “g” at the end.

**Algorithm:**

Here is an example of how [**dynamic programming**](https://www.geeksforgeeks.org/introduction-to-dynamic-programming-data-structures-and-algorithm-tutorials/) can be used to determine the ideal string alignment distance between two strings:

-   Create a matrix (say **dp\[\]\[\]**) of size **(m+1) x (n+1)** where **m**, and **n** are lengths of the strings. 
-   Initialize the matrix’s first row and column to be, respectively, **0, 1, 2, 3, . . ., n** and **0, 1, 2, 3, . . ., m**.
-   Use the formula below to determine the ideal string alignment distance for each additional cell in the matrix:
    -   The distance is equal to **dp\[i-1\]\[j-1\]** if the characters in the two strings’ respective locations match.
    -   If the characters in the two strings do not match at their respective places, the distance is min(dp\[i-1\]\[j-1\], dp\[i-1\]\[j\], dp\[i\]\[j-1\]) + 1.
-   The number in the matrix’s bottom-right cell represents the ideal string alignment distance.

Below is the implementation of the above approach.

-   C++
-   Java
-   Python3
-   C#
-   Javascript

## C++

## Java

## Python3

## C#

## Javascript

### 2\. Damerau – Levenshtein Distance with Adjacent Transpositions:

The Levenshtein distance algorithm can be modified to allow for the option of transposing (swapping) two consecutive characters in the input strings. This modification is known as Levenshtein distance with transpositions. This variant is frequently employed in situations where it makes more sense to treat transpositions as a single edit rather than as two independent edits (a deletion and an insertion), as is the case with the traditional Levenshtein distance. 

**Example:** The distance between the words “flom” and “molf, ” with adjacent transpositions, is 1, since just one transposition of the “m” and “f” is necessary to change one word into the other.

**Algorithm:**

A type of string metric used to compare two strings is called distance with contiguous transpositions. The **T-distance** or **T-transposition** distance are other names for it. Calculating the least amount of additions, subtractions, and substitutions required to change one string into another is involved in this:

-   You must first use the Levenshtein distance algorithm to get the edit distance between the two strings in order to apply this measure.
-   By multiplying the number of consecutive transpositions required to convert one string into the other, you may get the T-transposition distance once you have the edit distance. 
-   Two adjacent characters in a string are switched in an adjacent transposition.

You can use the following calculation to determine how many nearby transpositions are required:

> **T = (D – S – I) / 2**
>
> Where:
>
> -   T – is the required number of subsequent transpositions.
> -   D – is the space between the two strings that have been edited.
> -   S – is the number of substitutions required to change one string into the other, whereas I is the number of insertions required to do so.

The T-transposition distance can then be obtained by multiplying the required number of adjacent transpositions by the edit distance.

## Application:

This has a variety of uses in areas like:

-   **Correction of misspelled words:** The Damerau-Levenshtein distance is frequently employed in algorithms for spelling correction since it can quantify how similar a misspelled word is to a correctly spelled word in the dictionary. Following that, the algorithm may offer a list of words with tiny distances or the correct term with the least distance as potential corrections.
-   **Natural language processing:** The Damerau-Levenshtein distance can be employed in natural language processing tasks like text classification and language identification. For instance, the method can be used to determine how close a text is to a collection of recognized languages or categories, and then the text can be categorized according to the category with the least distance.
-   **Computational biologly:** The Damerau-Levenshtein distance is frequently used in computational biology to assess how similar DNA or protein sequences are to one another. Sequence alignment, mutation detection, and evolutionary link analysis can all be done using the technique.
-   **Processing and analysis of text:** The Damerau-Levenshtein distance, as a good indicator of the similarity between two strings, has numerous uses in the processing and analysis of the text.



Feeling lost in the world of random DSA topics, wasting time without progress? It's time for a change! Join our DSA course, where we'll guide you on an exciting journey to master DSA efficiently and on schedule.
Ready to dive in? Explore our Free Demo Content and join our DSA course, trusted by over 100,000 geeks!

-   [DSA in C++](https://www.geeksforgeeks.org/courses/dsa-self-paced?utm_source=geeksforgeeks&utm_medium=article_bottom_text&utm_campaign=courses)
-   [DSA in Java](https://www.geeksforgeeks.org/courses/dsa-self-paced?utm_source=geeksforgeeks&utm_medium=article_bottom_text&utm_campaign=courses)
-   [DSA in Python](https://www.geeksforgeeks.org/courses/Data-Structures-With-Python?utm_source=geeksforgeeks&utm_medium=article_bottom_text&utm_campaign=courses)
-   [DSA in JavaScript](https://www.geeksforgeeks.org/courses/data-structures-and-algorithms-in-javascript?utm_source=geeksforgeeks&utm_medium=article_bottom_text&utm_campaign=courses)



Last Updated : 07 Mar, 2023

Like Article

Save Article