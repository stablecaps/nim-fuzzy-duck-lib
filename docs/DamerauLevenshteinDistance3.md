The Damerau–Levenshtein distance is defined as the recursive function da,b(n,m)\\displaystyle d\_{a,b}(n, m) of two strings a,b{\\displaystyle a, b} with the lengths n,mn, m, where i,ji, j are the indices of characters of these words, respectively:

a\=a1...ai...anb\=b1...bj...bmda,b(i,j)\=min{0if i\=j\=0da,b(i−1,j)+1if i\>0da,b(i,j−1)+1if j\>0da,b(i−1,j−1)if i,j\>0 and ai\=bjda,b(i−1,j−1)+1if i,j\>0 and ai≠bjda,b(i−2,j−2)+1if i,j\>0 and ai\=bj−1 and ai−1\=bja=a\_1...a\_i...a\_n \\newline b=b\_1...b\_j...b\_m \\newline \\newline d\_{a,b}(i, j) = min \\begin{cases} 0 & \\quad \\text{if } i=j=0\\\\ d\_{a,b}(i-1,j)+1 & \\quad \\text{if } i>0 \\\\ d\_{a,b}(i,j-1)+1 & \\quad \\text{if } j>0 \\\\ d\_{a,b}(i-1,j-1) & \\quad \\text{if } i,j>0 \\text{ and } a\_i=b\_j \\\\ d\_{a,b}(i-1,j-1) +1& \\quad \\text{if } i,j>0 \\text{ and } a\_i \\neq b\_j \\\\ d\_{a,b}(i-2,j-2)+1 & \\quad \\text{if } i,j>0 \\text{ and } a\_i = b\_{j-1} \\text{ and } a\_{i-1}=b\_j \\\\ \\end{cases}

For a better understanding, have a look at an illustration of the algorithm:

![Illustration of the algorithm](https://ucarecdn.com/37166e77-4039-4960-9963-60999c4d2caf/)

To calculate the Damerau–Levenshtein distance, we need to fill the distance matrix with values. The idea is the following:

1.  Define a distance matrix, where the number of rows and columns is equal to the length of the provided strings.

2.  Add an extra row and column that will hold characters' indices to count.

3.  Calculate the values of the function da,b(i,j)d\_{a, b}(i,j), which depend on the row ii and the column jj, using the formula.

4.  Choose the minimum among all possible da,b(i,j)d\_{a, b}(i,j) values.

5.  Fill up the cell at the intersection of the column and the row with the found minimum value.

6.  After filling up the matrix, the score in the lower-right cell will be the answer.


Let's consider how this function would work on a real example: let our words be "Saturday" and "Sunday". You will see that there is no problem with strings of different lengths. This one will have 8 columns and 6 rows.

You can see that the numbering in the distance matrix starts with one, but the formula includes zeros. Keep in mind that we count characters in the words from one, but ii and jj can be zeros.

The first 2×2 matrix (let's call it a **square**) to be considered is (011?)\\begin{pmatrix} 0 & 1\\\\ 1 & ?\\\\ \\end{pmatrix}:

![the distance matrix](https://ucarecdn.com/a1c5a310-a85a-48ea-8d62-76743f49c60c/)

Here, _i_ and _j_ are ones, while we consider the first row and the first column, so there are three options:

1\. i > 0. This is a case of deletion:

da,b(i−1,j)+1\=dsaturday,sunday(1−1,1)+1\=dsaturday,sunday(0,1)+1\=0+1\=1d\_{a, b}(i-1, j) + 1 = d\_{saturday, sunday}(1 - 1, 1) + 1 = d\_{saturday, sunday}(0, 1) + 1 = 0+1 =1

2\. j > 0. A case of insertion:

da,b(i,j−1)+1\=dsaturday,sunday(1,1−1)+1\=dsaturday,sunday(1,0)+1\=\[case of i\>0\]\=(dsaturday,sunday(1−1,0)+1)+1\=(dsaturday,sunday(0,0)+1)+1\=(0+1)+1\=2d\_{a, b}(i, j-1) + 1 = d\_{saturday, sunday}(1, 1-1) + 1 = d\_{saturday, sunday}(1, 0) + 1 = \[\\text{case of } i>0\]= (d\_{saturday, sunday}(1-1, 0) + 1)+1= (d\_{saturday, sunday}(0, 0) + 1)+1=(0+1)+1=2

3\. i, j > 0 and ai\=bja\_i = b\_j:

da,b(i−1,j−1)\=dsaturday,sunday(1−1,1−1)\=dsaturday,sunday(0,0)\=0d\_{a, b}(i-1, j-1) = d\_{saturday, sunday}(1-1, 1-1) = d\_{saturday, sunday}(0, 0)=\\color{red}0

Now, we need to choose the minimum among the values we have calculated. Among 1,21, 2, and 00 the last one is the smallest.

Here we have faced the matching of the respective symbols, so the distance between them is zero.

![matching of the respective symbols](https://ucarecdn.com/05dc9539-088d-4f1a-80c2-715ff21c187d/)

In continuation, we repeat the same process: pick a 2x2 square with three filled cells and calculate the value for the bottom-right cell. For the square (120?)\\begin{pmatrix} 1 & 2\\\\ 0 & ?\\\\ \\end{pmatrix}it will be 1:

Firstly, i = 2 and j = 1, because we consider the cell in the second column and in the first row. For these indices, characters in the words are 'a' and 's', respectively.

1\. i > 0:

da,b(i−1,j)+1\=dsaturday,sunday(2−1,1)+1\=dsaturday,sunday(1,1)+1\=0+1\=1d\_{a, b}(i-1, j) + 1 = d\_{saturday, sunday}(2 - 1, 1) + 1 = d\_{saturday, sunday}(1, 1) + 1 = 0+1 =\\color{red}1

2\. j > 0:da,b(i,j−1)+1\=dsaturday,sunday(2,1−1)+1\=dsaturday,sunday(2,0)+1\=\[case of i\>0\]\=(dsaturday,sunday(2−1,0)+1)+1\=0+1+1\=2d\_{a, b}(i, j-1) + 1 = d\_{saturday, sunday}(2, 1-1) + 1 = d\_{saturday, sunday}(2, 0) + 1 = \[\\text{case of } i>0\]= (d\_{saturday, sunday}(2-1, 0) + 1)+1= 0+1+1=2

3\. i, j > 0 and ai≠bja\_i \\neq b\_j:

da,b(i−1,j−1)+1\=dsaturday,sunday(2−1,1−1)+1\=dsaturday,sunday(1,0)+1\=\[case of i\>0\]\=(dsaturday,sunday(0,0)+1)+1\=0+1\=1d\_{a, b}(i-1, j-1) + 1 = d\_{saturday, sunday}(2-1, 1-1) + 1 = d\_{saturday, sunday}(1, 0) + 1 = \[\\text{case of } i>0\]= (d\_{saturday, sunday}(0, 0) + 1)+1= 0+1=\\color{red}1

You can notice that here both deletion and mismatching of the symbols give us the same answer. It means that it doesn't matter which operation we use: both of them fit the situation.

![filling the distance matrix](https://ucarecdn.com/e73f506d-4b3c-4b48-80bc-2f5878be2ae1/)

![filling the distance matrix, part two](https://ucarecdn.com/b13fad5a-81df-4518-8851-fd6a7f800715/)

With a few more iterations, we will obtain a full matrix. Now let's calculate the last step. We need to consider the square (344?)\\begin{pmatrix} 3 & 4\\\\ 4 & ?\\\\ \\end{pmatrix}.

![Full matrix](https://ucarecdn.com/5fe7afd9-e574-493a-8d7e-3151f2830771/)

At first, we have i = 8 and j = 6, and for them, current characters are 'y' for both words. For this case, three options are possible:

1\. i > 0:

da,b(i−1,j)+1\=dsaturday,sunday(8−1,6)+1\=dsaturday,sunday(7,6)+1\=4+1\=5d\_{a, b}(i-1, j) + 1 = d\_{saturday, sunday}(8 - 1, 6) + 1 = d\_{saturday, sunday}(7, 6) + 1 = 4 + 1 = 5

2\. j > 0:

da,b(i,j−1)+1\=dsaturday,sunday(8,6−1)+1\=dsaturday,sunday(8,5)+1\=4+1\=5d\_{a, b}(i, j-1) + 1 = d\_{saturday, sunday}(8, 6-1) + 1 = d\_{saturday, sunday}(8, 5) + 1 = 4+1=5

3\. i, j > 0 and ai\=bja\_i=b\_j:

da,b(i−1,j−1)\=dsaturday,sunday(8−1,6−1)\=dsaturday,sunday(7,5)\=3d\_{a, b}(i-1, j-1) = d\_{saturday, sunday}(8-1, 6-1) = d\_{saturday, sunday}(7, 5) = \\color{red}3

The answer is in the blue cell: the Damerau-Levenshtein distance between "Saturday" and "Sunday" is 3.