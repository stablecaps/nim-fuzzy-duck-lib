[

![Ethan Nam](https://miro.medium.com/v2/resize:fill:88:88/1*qcYP8B2SMMHeNogUsyPvHQ.jpeg)



](https://medium.com/@ethannam?source=post_page-----c4285a5604f0--------------------------------)

I recently came across a situation where I needed fuzzy string matching functionality for a command line application I built. After googling a way to do this in Ruby, I found a Stack Overflow post telling me to install a ruby gem called **_levenshtein-ffi_** and be on my way. However, my curiosity got the best of me, and I went down an internet rabbit hole of trying to understand what is really going on behind the scenes. Ultimately, I landed on the [Levenshtein Distance Wikipedia page](https://en.wikipedia.org/wiki/Levenshtein_distance), where I saw this:

![](https://miro.medium.com/v2/resize:fit:1034/1*o9k-pcrM-4NUrMNAqQbH9A.png)

What?

I have minimal experience with matrices and have never taken Linear Algebra, so initially, I was bewildered. Eventually however, I was able to piece together an elementary understanding of what is happening, which I’ll attempt to explain below. This explanation is meant for beginners — anyone who is confused by the equation above or has never taken higher level mathematics courses. **Warning**: if you don’t fall into the above camp, you’ll probably find the explanation below needlessly tedious.

**Introduction**

The Levenshtein distance is a number that tells you how different two strings are. The higher the number, the more different the two strings are.

For example, the Levenshtein distance between “kitten” and “sitting” is 3 since, at a minimum, 3 edits are required to change one into the other.

1.  **k**itten → **s**itten (substitution of “s” for “k”)
2.  sitt**e**n → sitt**i**n (substitution of “i” for “e”)
3.  sittin → sittin**g** (insertion of “g” at the end).

An “edit” is defined by either an insertion of a character, a deletion of a character, or a replacement of a character.

**Functions**

A quick refresher if you haven’t looked at functions recently… The first thing to understand is that functions are a set of instructions that take a given input, follow a set of instructions, and yield an output. You probably saw lots of basic functions in your high school math courses.

![](https://miro.medium.com/v2/resize:fit:1034/1*LkYhmTP2bkmRwkpj3WGqQA.jpeg)

**Piecewise Functions**

Piecewise functions are more complex functions. In a piecewise function, there are multiple sets of instructions. You choose one set over another based on a certain condition. Consider the example below:

![](https://miro.medium.com/v2/resize:fit:1034/1*BLeovnNn68EGNrS1j9ZXQg.jpeg)

In the above example, we use different sets of instructions based on what the input is. Piecewise function are denoted by the brace { symbol.

With that in mind, the Levenshtein Distance equation should look a little more readable.

![](https://miro.medium.com/v2/resize:fit:1034/1*o9k-pcrM-4NUrMNAqQbH9A.png)

Original

![](https://miro.medium.com/v2/resize:fit:1034/1*c0Cf92gcZh5dJljJOnTp2A.jpeg)

In other words…

**What do a, b, i, and j stand for?**

a = string #1

b = string #2

i = the terminal character position of string #1

j = the terminal character position of string #2.

The positions are 1-indexed. Consider the below example where we compare string“cat” with string “cap”:

![](https://miro.medium.com/v2/resize:fit:1034/1*qJB_N3hI1JZfORX3dh8XPg.jpeg)

**The conditional (aᵢ ≠bⱼ)**

aᵢ refers to the character of string a at position i

bⱼ refers to the character of string b at position j

We want to check that these are not equal, because if they are equal, no edit is needed, so we should not add 1. Conversely, if they are not equal, we want to add 1 to account for a necessary edit.

![](https://miro.medium.com/v2/resize:fit:1034/1*WQ4TTkYbJfniimOBJcMiLQ.jpeg)

**Solving Using a Matrix**

The Levenshtein distance for strings A and B can be calculated by using a matrix. It is initialized in the following way:

![](https://miro.medium.com/v2/resize:fit:1023/1*1Eo8zD0vesOJraQq_VsEaA.jpeg)

From here, our goal is to fill out the entire matrix starting from the upper-left corner. Afterwards, the bottom-right corner will yield the Levenshtein distance.

Let’s fill out the matrix by following the piecewise function.

![](https://miro.medium.com/v2/resize:fit:1034/1*st1J8w7x_TurdmsLN7dk5w.jpeg)

![](https://miro.medium.com/v2/resize:fit:1034/1*Gh7uOddcEo5f7-p6MToK5Q.jpeg)

Now we can fill out the rest of the matrix using the same piecewise function for all the spots in the matrixes.

One more example:

![](https://miro.medium.com/v2/resize:fit:1034/1*omt1bI9M0sLvzFIZcni6xA.jpeg)

![](https://miro.medium.com/v2/resize:fit:837/1*geJQktVhgIIB74MpCKo2dQ.jpeg)

If you feel comfortable with the equation at this point, try to fill out the rest of the matrix. The result is posted below:

![](https://miro.medium.com/v2/resize:fit:818/1*bEWdxv_FoTQurG9fyS3nSA.jpeg)

Since the lower-right corner is 3, we know the Levenshtein distance of “kitten” and “sitting” is 3. This is what we expected since we already knew the Levenshtein distance was 3 (as explained in the introduction). This is also reflected in the matrix shown on the Levenshtein Distance Wikipedia page.

![](https://miro.medium.com/v2/resize:fit:529/1*xyoq20suqByW8wzlKe9O-A.png)

**Conclusion**

![](https://miro.medium.com/v2/resize:fit:1034/1*o9k-pcrM-4NUrMNAqQbH9A.png)

Oh, I see!

Hopefully, the above looks less intimidating to you now. Even better, I hope you understand what it means!

![](https://miro.medium.com/v2/resize:fit:319/1*6-In0Gj1Lbt54Td8RGDXlQ.jpeg)

Vladimir Levenshtein, inventor of the Levenshtein algorithm

Now that you understand to a certain degree what is happening under the hood, you can really appreciate all that’s happening when you download a gem like **_levenshtein-ffi_** and run a method like Levenshtein.distance(“kitten”, “sitting”) and get a return value of 3. All the hard work has been abstracted away so that you get a simple numerical representation of how different two strings are. We should all thank Vladimir Levenshtein, who came up with his algorithm in 1965. The algorithm hasn’t been improved in over 50 years and for good reason. [According to MIT](http://news.mit.edu/2015/algorithm-genome-best-possible-0610), it may very well be that Levenshtein’s algorithm is the best that we’ll ever get in terms of efficiency.

Works Used / Cited

## from https://medium.com/@ethannam/understanding-the-levenshtein-distance-equation-for-beginners-c4285a5604f0
