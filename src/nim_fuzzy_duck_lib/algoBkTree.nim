

# 0. https://towardsdatascience.com/symspell-vs-bk-tree-100x-faster-fuzzy-string-search-spell-checking-c4f10d80a078
# 1. https://nullwords.wordpress.com/2013/03/13/the-bk-tree-a-data-structure-for-spell-checking/
# 2. http://signal-to-noise.xyz/post/bk-tree/
# 3. https://news.ycombinator.com/item?id=14022424
# 4. http://blog.notdot.net/2007/4/Damn-Cool-Algorithms-Part-1-BK-Trees
# 5. http://www.geeksforgeeks.org/bk-tree-introduction-implementation/
# 6. http://blog.mishkovskyi.net/posts/2015/Jul/31/implementing-bk-tree-in-clojure
# 7. https://github.com/vy/bk-tree
# 8. https://www.activeloop.ai/resources/glossary/bk-tree-burkhard-keller-tree/#:~:text=The%20time%20complexity%20of%20a,required%20to%20find%20similar%20items.

# Wolf Garbe compared three C# implementations of the BK-Tree (ref 0)
# 1. tgriffith: https://github.com/tgriffith/Spellcheck/blob/master/BK-Tree/BKTree.cs
# 2. TarasRoshko: https://github.com/TarasRoshko/fast-fuzzy-matching/blob/master/src/FFM/FFM/BKTree/BKTree.cs
# 3. Xenopax: https://nullwords.wordpress.com/2013/03/13/the-bk-tree-a-data-structure-for-spell-checking/

# import classes

type
    Node = object
        dist: int
        dictWord: string
        childNodes: seq[Node]

    BkTreeNaive* = ref object
        root: string
        size: int

# class bkTreeNaive():
#     var bkTree = nil

# proc add(dictWord: string) =
#     if this.bktree is nil:
#         this.bktree = Node(Dist: 0, DictWord: dictWord)



proc makebkTreeNaive(allDictWordsSeq: seq[string]) =

    var xx = default(BkTreeNaive)
    # let myBkTree =  bkTreeNaive().init()

    # for dictWord in allDictWordsSeq:
    #     myBkTree.add(dictWord)


