# spiral-memory

*** This README contains the problem statement, how to run the program and some assumptions/edge cases. ***

### Problem Statement


Your goal is to build a program that statisfies the requirements below. The code should be clean, idiomatic, and contain automated tests.

### Spiral Memory 

#### The layout:
There is an experimental new kind of memory stored on an infinite two-dimensional grid.

Each square on the grid is allocated in a spiral pattern starting at a location marked `[1]` below and then counting up while spiraling outward. 

For example, the first few squares are allocated like this:

```
17  16  15  14  13
18   5   4   3  12
19   6  [1]  2  11
20   7   8   9  10
21  22  23---> ...
```

While this is very space-efficient (no squares are skipped), requested data must be carried back to square `[1]` (the location of the only access port for this memory system) by programs that can only move up, down, left, or right. They always take the shortest path: the [Manhattan Distance](https://en.wikipedia.org/wiki/Taxicab_geometry) between the location of the data and square 1.

For example:
- Data from square `1` is carried `0` steps, since it's at the access port.
- Data from square `12` is carried `3` steps, such as: down, left, left.
- Data from square `23` is carried only `2` steps: up twice.
- Data from square `1024` must be carried `31` steps.

#### The Data:

We populate the memory grid with data. First, we store the value 1 in square 1. Then, in the same allocation order as shown above, we store the sum of the values in all adjacent squares, including diagonals.

For example:
- Square `1` starts with the value `1`.
- Square `2` has only one adjacent filled square (with value 1), so it also stores `1`.
- Square `3` has both of the above squares as neighbors and stores the sum of their values, `2`.
- Square `4` has all three of the aforementioned squares as neighbors and stores the sum of their values, `4`.
- Square `5` only has the first and fourth squares as neighbors, so it gets the value `5`.

Once a square is written, its value does not change. Therefore, the first few squares would receive the following values:

```
147  142  133  122   59
304    5    4    2   57
330   10   [1]   1   54
351   11   23   25   26
362  747  806--->   ...
```

#### The problem:

What is the Manhattan Distance of the first value written that is larger than the program input?

### How to run this program?

Open Terminal or CMD(Windows) or git bash(Windows) and go to the location of "solution.rb".
Simply type " ruby solution.rb"   (Note: without quotes)
And check if all the test cases pass.

### Assumptions/Edge cases for the input_number (i.e. program input)

The assumption could be made for this problem, like to consider only positive intergers as valid input, but since nothing was mentioned in the problem, the edge cases even for non-positive integers have been taken in to consideration

###
Edge Cases (related to the input_number)

1. if 1 is passed to the function find_manhattan_distance_general, then 0 is returned
2. if non-positive integer is passed to find_manhattan_distance_data_grid, then 0 is returned as there is a case of ambiguity as 1 is present twice in the data grid.
