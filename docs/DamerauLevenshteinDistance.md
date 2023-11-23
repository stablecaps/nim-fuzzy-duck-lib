From Wikipedia, the free encyclopedia

In [information theory](https://en.wikipedia.org/wiki/Information_theory "Information theory") and [computer science](https://en.wikipedia.org/wiki/Computer_science "Computer science"), the **Damerau–Levenshtein distance** (named after [Frederick J. Damerau](https://en.wikipedia.org/wiki/Frederick_J._Damerau "Frederick J. Damerau") and [Vladimir I. Levenshtein](https://en.wikipedia.org/wiki/Vladimir_Levenshtein "Vladimir Levenshtein")<sup id="cite_ref-1"><a href="https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_note-1">[1]</a></sup><sup id="cite_ref-bard_2-0"><a href="https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_note-bard-2">[2]</a></sup><sup id="cite_ref-3"><a href="https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_note-3">[3]</a></sup>) is a [string metric](https://en.wikipedia.org/wiki/String_metric "String metric") for measuring the [edit distance](https://en.wikipedia.org/wiki/Edit_distance "Edit distance") between two sequences. Informally, the Damerau–Levenshtein distance between two words is the minimum number of operations (consisting of insertions, deletions or substitutions of a single character, or [transposition](https://en.wikipedia.org/wiki/Transposition_(mathematics) "Transposition (mathematics)") of two adjacent characters) required to change one word into the other.

The Damerau–Levenshtein distance differs from the classical [Levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance "Levenshtein distance") by including transpositions among its allowable operations in addition to the three classical single-character edit operations (insertions, deletions and substitutions).<sup id="cite_ref-4"><a href="https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_note-4">[4]</a></sup><sup id="cite_ref-bard_2-1"><a href="https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_note-bard-2">[2]</a></sup>

In his seminal paper,<sup id="cite_ref-5"><a href="https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_note-5">[5]</a></sup> Damerau stated that in an investigation of spelling errors for an information-retrieval system, more than 80% were a result of a single error of one of the four types. Damerau's paper considered only misspellings that could be corrected with at most one edit operation. While the original motivation was to measure distance between human misspellings to improve applications such as [spell checkers](https://en.wikipedia.org/wiki/Spell_checker "Spell checker"), Damerau–Levenshtein distance has also seen uses in biology to measure the variation between protein sequences.<sup id="cite_ref-6"><a href="https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_note-6">[6]</a></sup>

## Definition\[[edit](https://en.wikipedia.org/w/index.php?title=Damerau%E2%80%93Levenshtein_distance&action=edit&section=1 "Edit section: Definition")\]

To express the Damerau–Levenshtein distance between two strings ![a](https://wikimedia.org/api/rest_v1/media/math/render/svg/ffd2487510aa438433a2579450ab2b3d557e5edc) and ![b](https://wikimedia.org/api/rest_v1/media/math/render/svg/f11423fbb2e967f986e36804a8ae4271734917c3), a function ![d_{a,b}(i,j)](https://wikimedia.org/api/rest_v1/media/math/render/svg/111cfb1e67dffec0fd0c1a5f230a927827248b42) is defined, whose value is a distance between an ![i](https://wikimedia.org/api/rest_v1/media/math/render/svg/add78d8608ad86e54951b8c8bd6c8d8416533d20)\-symbol prefix (initial substring) of string ![a](https://wikimedia.org/api/rest_v1/media/math/render/svg/ffd2487510aa438433a2579450ab2b3d557e5edc) and a ![j](https://wikimedia.org/api/rest_v1/media/math/render/svg/2f461e54f5c093e92a55547b9764291390f0b5d0)\-symbol prefix of ![b](https://wikimedia.org/api/rest_v1/media/math/render/svg/f11423fbb2e967f986e36804a8ae4271734917c3).

The _restricted distance_ function is defined recursively as:<sup id="cite_ref-Boytsov_7-0"><a href="https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_note-Boytsov-7">[7]</a></sup><sup><span title="Page / location: A:11">: A:11 </span></sup> 

![{\displaystyle d_{a,b}(i,j)=\min {\begin{cases}0&{\text{if }}i=j=0,\\d_{a,b}(i-1,j)+1&{\text{if }}i>0,\\d_{a,b}(i,j-1)+1&{\text{if }}j>0,\\d_{a,b}(i-1,j-1)+1_{(a_{i}\neq b_{j})}&{\text{if }}i,j>0,\\d_{a,b}(i-2,j-2)+1_{(a_{i}\neq b_{j})}&{\text{if }}i,j>1{\text{ and }}a_{i}=b_{j-1}{\text{ and }}a_{i-1}=b_{j},\\\end{cases}}}](https://wikimedia.org/api/rest_v1/media/math/render/svg/16e456e8c9cd61681b59d619a3434765cc4e2e57)

where ![1_{(a_{i}\neq b_{j})}](https://wikimedia.org/api/rest_v1/media/math/render/svg/52512ede08444b13838c570ba4a3fc71d54dbce9) is the [indicator function](https://en.wikipedia.org/wiki/Indicator_function "Indicator function") equal to 0 when ![a_{i}=b_{j}](https://wikimedia.org/api/rest_v1/media/math/render/svg/231fda9ee578f0328c5ca28088d01928bb0aaaec) and equal to 1 otherwise.

Each recursive call matches one of the cases covered by the Damerau–Levenshtein distance:

The Damerau–Levenshtein distance between a and b is then given by the function value for full strings: ![{\displaystyle d_{a,b}{\big (}|a|,|b|{\big )}}](https://wikimedia.org/api/rest_v1/media/math/render/svg/71b4ff8cb95f06ae5b5dacc080bbbca10057c685), where ![{\displaystyle i=|a|}](https://wikimedia.org/api/rest_v1/media/math/render/svg/e84d4d0c6dbc47632487de809e655b65ba9fbca8) denotes the length of string a, and ![{\displaystyle j=|b|}](https://wikimedia.org/api/rest_v1/media/math/render/svg/89416e99fbce1771f1dcb70f046f284f6ec27c30) is the length of b.

## Algorithm\[[edit](https://en.wikipedia.org/w/index.php?title=Damerau%E2%80%93Levenshtein_distance&action=edit&section=2 "Edit section: Algorithm")\]

Presented here are two algorithms: the first,<sup id="cite_ref-oommen_8-0"><a href="https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_note-oommen-8">[8]</a></sup> simpler one, computes what is known as the _optimal string alignment distance_ or _restricted edit distance_,<sup id="cite_ref-Boytsov_7-1"><a href="https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_note-Boytsov-7">[7]</a></sup> while the second one<sup id="cite_ref-LW75_9-0"><a href="https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_note-LW75-9">[9]</a></sup> computes the Damerau–Levenshtein distance with adjacent transpositions. Adding transpositions adds significant complexity. The difference between the two algorithms consists in that the _optimal string alignment algorithm_ computes the number of edit operations needed to make the strings equal under the condition that _no substring is edited more than once_, whereas the second one presents no such restriction.

Take for example the edit distance between **CA** and **ABC**. The Damerau–Levenshtein distance LD(**CA**, **ABC**) = 2 because **CA** → **AC** → **ABC**, but the optimal string alignment distance OSA(**CA**, **ABC**) = 3 because if the operation **CA** → **AC** is used, it is not possible to use **AC** → **ABC** because that would require the substring to be edited more than once, which is not allowed in OSA, and therefore the shortest sequence of operations is **CA** → **A** → **AB** → **ABC**. Note that for the optimal string alignment distance, the [triangle inequality](https://en.wikipedia.org/wiki/Triangle_inequality "Triangle inequality") does not hold: OSA(**CA**, **AC**) + OSA(**AC**, **ABC**) < OSA(**CA**, **ABC**), and so it is not a true metric.

### Optimal string alignment distance\[[edit](https://en.wikipedia.org/w/index.php?title=Damerau%E2%80%93Levenshtein_distance&action=edit&section=3 "Edit section: Optimal string alignment distance")\]

Optimal string alignment distance can be computed using a straightforward extension of the [Wagner–Fischer](https://en.wikipedia.org/wiki/Wagner%E2%80%93Fischer_algorithm "Wagner–Fischer algorithm") [dynamic programming](https://en.wikipedia.org/wiki/Dynamic_programming "Dynamic programming") algorithm that computes [Levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance "Levenshtein distance"). In [pseudocode](https://en.wikipedia.org/wiki/Pseudocode "Pseudocode"):

```
algorithm OSA-distance is
    input: strings a[1..length(a)], b[1..length(b)]
    output: distance, integer

    let d[0..length(a), 0..length(b)] be a 2-d array of integers, dimensions length(a)+1, length(b)+1
    // note that d is zero-indexed, while a and b are one-indexed.

    for i := 0 to length(a) inclusive do
        d[i, 0] := i
    for j := 0 to length(b) inclusive do
        d[0, j] := j

    for i := 1 to length(a) inclusive do
        for j := 1 to length(b) inclusive do
            if a[i] = b[j] then
                cost := 0
            else
                cost := 1
            d[i, j] := minimum(d[i-1, j] + 1,     // deletion
                               d[i, j-1] + 1,     // insertion
                               d[i-1, j-1] + cost)  // substitution
            if i > 1 and j > 1 and a[i] = b[j-1] and a[i-1] = b[j] then
                d[i, j] := minimum(d[i, j],
                                   d[i-2, j-2] + 1)  // transposition
    return d[length(a), length(b)]

```

The difference from the algorithm for Levenshtein distance is the addition of one recurrence:

```
if i > 1 and j > 1 and a[i] = b[j-1] and a[i-1] = b[j] then
    d[i, j] := minimum(d[i, j],
                       d[i-2, j-2] + 1)  // transposition

```

### Distance with adjacent transpositions\[[edit](https://en.wikipedia.org/w/index.php?title=Damerau%E2%80%93Levenshtein_distance&action=edit&section=4 "Edit section: Distance with adjacent transpositions")\]

The following algorithm computes the true Damerau–Levenshtein distance with adjacent transpositions; this algorithm requires as an additional parameter the size of the alphabet Σ, so that all entries of the arrays are in \[0, |Σ|):<sup id="cite_ref-Boytsov_7-2"><a href="https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_note-Boytsov-7">[7]</a></sup><sup><span title="Page / location: A:93">: A:93 </span></sup> 

```
algorithm DL-distance is
    input: strings a[1..length(a)], b[1..length(b)]
    output: distance, integer

    da := new array of |Σ| integers
    for i := 1 to |Σ| inclusive do
        da[i] := 0

    let d[−1..length(a), −1..length(b)] be a 2-d array of integers, dimensions length(a)+2, length(b)+2
    // note that d has indices starting at −1, while a, b and da are one-indexed.

    maxdist := length(a) + length(b)
    d[−1, −1] := maxdist
    for i := 0 to length(a) inclusive do
        d[i, −1] := maxdist
        d[i, 0] := i
    for j := 0 to length(b) inclusive do
        d[−1, j] := maxdist
        d[0, j] := j

    for i := 1 to length(a) inclusive do
        db := 0
        for j := 1 to length(b) inclusive do
            k := da[b[j]]
            ℓ := db
            if a[i] = b[j] then
                cost := 0
                db := j
            else
                cost := 1
            d[i, j] := minimum(d[i−1, j−1] + cost,  //substitution
                               d[i,   j−1] + 1,     //insertion
                               d[i−1, j  ] + 1,     //deletion
                               d[k−1, ℓ−1] + (i−k−1) + 1 + (j-ℓ−1)) //transposition
        da[a[i]] := i
    return d[length(a), length(b)]

```

To devise a proper algorithm to calculate unrestricted Damerau–Levenshtein distance, note that there always exists an optimal sequence of edit operations, where once-transposed letters are never modified afterwards. (This holds as long as the cost of a transposition, ![W_{T}](https://wikimedia.org/api/rest_v1/media/math/render/svg/b5e774fbd671b6614715dc70422ea94dbd0968c6), is at least the average of the cost of an insertion and deletion, i.e., ![{\displaystyle 2W_{T}\geq W_{I}+W_{D}}](https://wikimedia.org/api/rest_v1/media/math/render/svg/a8bbdc9b74e9bfa8623e13cf9ca42917b09d5dd2).<sup id="cite_ref-LW75_9-1"><a href="https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_note-LW75-9">[9]</a></sup>) Thus, we need to consider only two symmetric ways of modifying a substring more than once: (1) transpose letters and insert an arbitrary number of characters between them, or (2) delete a sequence of characters and transpose letters that become adjacent after deletion. The straightforward implementation of this idea gives an algorithm of cubic complexity: ![{\displaystyle O{\big (}M\cdot N\cdot \max(M,N){\big )}}](https://wikimedia.org/api/rest_v1/media/math/render/svg/84158eb17f1747b6878394f63c53f33febfc40be), where _M_ and _N_ are string lengths. Using the ideas of Lowrance and Wagner,<sup id="cite_ref-LW75_9-2"><a href="https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_note-LW75-9">[9]</a></sup> this naive algorithm can be improved to be ![{\displaystyle O(M\cdot N)}](https://wikimedia.org/api/rest_v1/media/math/render/svg/38ed9125876c64bc1b81fb38bce5d886fc4c6941) in the worst case, which is what the above pseudocode does.

It is interesting that the [bitap algorithm](https://en.wikipedia.org/wiki/Bitap_algorithm "Bitap algorithm") can be modified to process transposition. See the information retrieval section of<sup id="ref_itman"><a href="https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#endnote_itman">[1]</a></sup> for an example of such an adaptation.

## Applications\[[edit](https://en.wikipedia.org/w/index.php?title=Damerau%E2%80%93Levenshtein_distance&action=edit&section=5 "Edit section: Applications")\]

Damerau–Levenshtein distance plays an important role in [natural language processing](https://en.wikipedia.org/wiki/Natural_language_processing "Natural language processing"). In natural languages, strings are short and the number of errors (misspellings) rarely exceeds 2. In such circumstances, restricted and real edit distance differ very rarely. Oommen and Loke<sup id="cite_ref-oommen_8-1"><a href="https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_note-oommen-8">[8]</a></sup> even mitigated the limitation of the restricted edit distance by introducing _generalized transpositions_. Nevertheless, one must remember that the restricted edit distance usually does not satisfy the [triangle inequality](https://en.wikipedia.org/wiki/Triangle_inequality "Triangle inequality"), and thus cannot be used with [metric trees](https://en.wikipedia.org/wiki/Metric_tree "Metric tree").

### DNA\[[edit](https://en.wikipedia.org/w/index.php?title=Damerau%E2%80%93Levenshtein_distance&action=edit&section=6 "Edit section: DNA")\]

Since [DNA](https://en.wikipedia.org/wiki/DNA "DNA") frequently undergoes insertions, deletions, substitutions, and transpositions, and each of these operations occurs on approximately the same timescale, the Damerau–Levenshtein distance is an appropriate metric of the variation between two strands of DNA. More common in DNA, protein, and other bioinformatics related alignment tasks is the use of closely related algorithms such as [Needleman–Wunsch algorithm](https://en.wikipedia.org/wiki/Needleman%E2%80%93Wunsch_algorithm "Needleman–Wunsch algorithm") or [Smith–Waterman algorithm](https://en.wikipedia.org/wiki/Smith%E2%80%93Waterman_algorithm "Smith–Waterman algorithm").

### Fraud detection\[[edit](https://en.wikipedia.org/w/index.php?title=Damerau%E2%80%93Levenshtein_distance&action=edit&section=7 "Edit section: Fraud detection")\]

The algorithm can be used with any set of words, like vendor names. Since entry is manual by nature, there is a risk of entering a false vendor. A fraudster employee may enter one real vendor such as "Rich Heir Estate Services" versus a false vendor "Rich Hier State Services". The fraudster would then create a false bank account and have the company route checks to the real vendor and false vendor. The Damerau–Levenshtein algorithm will detect the transposed and dropped letter and bring attention of the items to a fraud examiner.

### Export control\[[edit](https://en.wikipedia.org/w/index.php?title=Damerau%E2%80%93Levenshtein_distance&action=edit&section=8 "Edit section: Export control")\]

The U.S. Government uses the Damerau–Levenshtein distance with its Consolidated Screening List API.<sup id="cite_ref-10"><a href="https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_note-10">[10]</a></sup>

## See also\[[edit](https://en.wikipedia.org/w/index.php?title=Damerau%E2%80%93Levenshtein_distance&action=edit&section=9 "Edit section: See also")\]

-   [Ispell](https://en.wikipedia.org/wiki/Ispell "Ispell") suggests corrections that are based on a Damerau–Levenshtein distance of 1
-   [Typosquatting](https://en.wikipedia.org/wiki/Typosquatting "Typosquatting")

## References\[[edit](https://en.wikipedia.org/w/index.php?title=Damerau%E2%80%93Levenshtein_distance&action=edit&section=10 "Edit section: References")\]

1.  **[^](https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_ref-1 "Jump up")** Brill, Eric; Moore, Robert C. (2000). [_An Improved Error Model for Noisy Channel Spelling Correction_](https://web.archive.org/web/20121221172057/http://acl.ldc.upenn.edu/P/P00/P00-1037.pdf) (PDF). Proceedings of the 38th Annual Meeting on Association for Computational Linguistics. pp. 286–293. [doi](https://en.wikipedia.org/wiki/Doi_(identifier) "Doi (identifier)"):[10.3115/1075218.1075255](https://doi.org/10.3115%2F1075218.1075255). Archived from [the original](http://acl.ldc.upenn.edu/P/P00/P00-1037.pdf) (PDF) on 2012-12-21.
2.  ^ [Jump up to: <sup><i><b>a</b></i></sup>](https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_ref-bard_2-0) [<sup><i><b>b</b></i></sup>](https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_ref-bard_2-1) Bard, Gregory V. (2007), "Spelling-error tolerant, order-independent pass-phrases via the Damerau–Levenshtein string-edit distance metric", [_Proceedings of the Fifth Australasian Symposium on ACSW Frontiers : 2007, Ballarat, Australia, January 30 - February 2, 2007_](http://dl.acm.org/citation.cfm?id=1274531.1274545), Conferences in Research and Practice in Information Technology, vol. 68, Darlinghurst, Australia: Australian Computer Society, Inc., pp. 117–124, [ISBN](https://en.wikipedia.org/wiki/ISBN_(identifier) "ISBN (identifier)") [978-1-920682-49-1](https://en.wikipedia.org/wiki/Special:BookSources/978-1-920682-49-1 "Special:BookSources/978-1-920682-49-1").
3.  **[^](https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_ref-3 "Jump up")** Li; et al. (2006). [_Exploring distributional similarity based models for query spelling correction_](https://web.archive.org/web/20100401081500/http://acl.ldc.upenn.edu/P/P06/P06-1129.pdf) (PDF). Proceedings of the 21st International Conference on Computational Linguistics and the 44th annual meeting of the Association for Computational Linguistics. pp. 1025–1032. [doi](https://en.wikipedia.org/wiki/Doi_(identifier) "Doi (identifier)"):[10.3115/1220175.1220304](https://doi.org/10.3115%2F1220175.1220304). Archived from [the original](http://acl.ldc.upenn.edu/P/P06/P06-1129.pdf) (PDF) on 2010-04-01.
4.  **[^](https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_ref-4 "Jump up")** Levenshtein, Vladimir I. (February 1966), "Binary codes capable of correcting deletions, insertions, and reversals", _Soviet Physics Doklady_, **10** (8): 707–710, [Bibcode](https://en.wikipedia.org/wiki/Bibcode_(identifier) "Bibcode (identifier)"):[1966SPhD...10..707L](https://ui.adsabs.harvard.edu/abs/1966SPhD...10..707L)
5.  **[^](https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_ref-5 "Jump up")** [Damerau, Fred J.](https://en.wikipedia.org/wiki/Frederick_J._Damerau "Frederick J. Damerau") (March 1964), "A technique for computer detection and correction of spelling errors", _Communications of the ACM_, **7** (3): 171–176, [doi](https://en.wikipedia.org/wiki/Doi_(identifier) "Doi (identifier)"):[10.1145/363958.363994](https://doi.org/10.1145%2F363958.363994), [S2CID](https://en.wikipedia.org/wiki/S2CID_(identifier) "S2CID (identifier)") [7713345](https://api.semanticscholar.org/CorpusID:7713345)
6.  **[^](https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_ref-6 "Jump up")** The method used in: Majorek, Karolina A.; Dunin-Horkawicz, Stanisław; et al. (2013), "The RNase H-like superfamily: new members, comparative structural analysis and evolutionary classification", _Nucleic Acids Research_, **42** (7): 4160–4179, [doi](https://en.wikipedia.org/wiki/Doi_(identifier) "Doi (identifier)"):[10.1093/nar/gkt1414](https://doi.org/10.1093%2Fnar%2Fgkt1414), [PMC](https://en.wikipedia.org/wiki/PMC_(identifier) "PMC (identifier)") [3985635](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3985635), [PMID](https://en.wikipedia.org/wiki/PMID_(identifier) "PMID (identifier)") [24464998](https://pubmed.ncbi.nlm.nih.gov/24464998)
7.  ^ [Jump up to: <sup><i><b>a</b></i></sup>](https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_ref-Boytsov_7-0) [<sup><i><b>b</b></i></sup>](https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_ref-Boytsov_7-1) [<sup><i><b>c</b></i></sup>](https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_ref-Boytsov_7-2) Boytsov, Leonid (May 2011). "Indexing methods for approximate dictionary searching". _Journal of Experimental Algorithmics_. **16**: 1. [doi](https://en.wikipedia.org/wiki/Doi_(identifier) "Doi (identifier)"):[10.1145/1963190.1963191](https://doi.org/10.1145%2F1963190.1963191). [S2CID](https://en.wikipedia.org/wiki/S2CID_(identifier) "S2CID (identifier)") [15635688](https://api.semanticscholar.org/CorpusID:15635688).
8.  ^ [Jump up to: <sup><i><b>a</b></i></sup>](https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_ref-oommen_8-0) [<sup><i><b>b</b></i></sup>](https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_ref-oommen_8-1) Oommen, B. J.; Loke, R. K. S. (1997). "Pattern recognition of strings with substitutions, insertions, deletions and generalized transpositions". _Pattern Recognition_. **30** (5): 789–800. [Bibcode](https://en.wikipedia.org/wiki/Bibcode_(identifier) "Bibcode (identifier)"):[1997PatRe..30..789O](https://ui.adsabs.harvard.edu/abs/1997PatRe..30..789O). [CiteSeerX](https://en.wikipedia.org/wiki/CiteSeerX_(identifier) "CiteSeerX (identifier)") [10.1.1.50.1459](https://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.50.1459). [doi](https://en.wikipedia.org/wiki/Doi_(identifier) "Doi (identifier)"):[10.1016/S0031-3203(96)00101-X](https://doi.org/10.1016%2FS0031-3203%2896%2900101-X).
9.  ^ [Jump up to: <sup><i><b>a</b></i></sup>](https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_ref-LW75_9-0) [<sup><i><b>b</b></i></sup>](https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_ref-LW75_9-1) [<sup><i><b>c</b></i></sup>](https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_ref-LW75_9-2) Lowrance, Roy; Wagner, Robert A. (April 1975), "An Extension of the String-to-String Correction Problem", _J ACM_, **22** (2): 177–183, [doi](https://en.wikipedia.org/wiki/Doi_(identifier) "Doi (identifier)"):[10.1145/321879.321880](https://doi.org/10.1145%2F321879.321880), [S2CID](https://en.wikipedia.org/wiki/S2CID_(identifier) "S2CID (identifier)") [18892193](https://api.semanticscholar.org/CorpusID:18892193)
10.  **[^](https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#cite_ref-10 "Jump up")** ["Consolidated Screening List API"](https://web.archive.org/web/20191030151056/https://developer.trade.gov/consolidated-screening-list.html). _Trade.gov Developer Portal_. International Trade Administration, U.S. Department of Commerce. Archived from [the original](https://developer.trade.gov/consolidated-screening-list.html) on 2019-10-30.

## Further reading\[[edit](https://en.wikipedia.org/w/index.php?title=Damerau%E2%80%93Levenshtein_distance&action=edit&section=11 "Edit section: Further reading")\]

-   Navarro, Gonzalo (March 2001), "A guided tour to approximate string matching", _ACM Computing Surveys_, **33** (1): 31–88, [doi](https://en.wikipedia.org/wiki/Doi_(identifier) "Doi (identifier)"):[10.1145/375360.375365](https://doi.org/10.1145%2F375360.375365), [S2CID](https://en.wikipedia.org/wiki/S2CID_(identifier) "S2CID (identifier)") [207551224](https://api.semanticscholar.org/CorpusID:207551224)