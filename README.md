# The Helsinki Puzzle

## Project Description
A prolog program, given a square grid of size N, where the horizontal rows are numbered 1 to N from top to bottom and the vertical columns are numbered 1 to N from left to right. You must place a number in each cell of the N by N grid such that all the following constraints are satisfied.
1. Each row is unique.
2. Each row is exactly equal to one of the columns, however, it must not be the column with the same index as the row.
3. If X is the largest number you place in the grid, then you must also place 1, 2, ..., X - 1, such that X <= N.

## Examples
### For a 3 x 3 grid, you may have the following matrix
*defined by the following equalities: C1 = R2, C2 = R3, & C3 = R1*

|   | C1 | C2 | C3 |
| :--: | :--: | :--: | :--: |
| **R1** | 2 | 1 | 2 |
| **R2** | 2 | 2 | 1 |
| **R3** | 1 | 2 | 2 |


### For a 4 x 4 grid, you may have the following matrix
*defined by the following equalities: C1 = C4, C2 = R3, C3 = R2, C4 = 41*

|   | C1 | C2 | C3 | C4 |
| :--: |  :--: | :--: | :--: | :--: |
| **R1** | 1 | 2 | 3 | 1 |
| **R2** | 3 | 4 | 4 | 2 |
| **R3** | 2 | 4 | 4 | 3 |
| **R4** | 1 | 3 | 2 | 1 |

## Predicates

### grid_build/2
The predicate ***grid_gen(N,M)*** should succeed only if ***M*** represents a grid that is ***N*** by ***N*** such that each cell in M contains a value from the valid range ***1 ... N***.

### num_gen/3
The predicate ***num_gen(F,L,R)*** should succeed only if ***R*** represents a list of consecutive numbers starting from ***F*** until ***L***.
> [!NOTE]
> ***numGen(1,3,R)*** succeeds when ***R*** = ***[1,2,3]***

### check_num_grid/1
The predicate ***check_num_grid(G)*** succeeds if ***G*** does not contain a number ***X*** unless all the numbers ***1 ... X-1*** are there.

### acceptable_permutation/2 
The predicate ***acceptable_permutation(L,R)*** should succeed only if ***R*** represents an acceptable permutation of the list ***L***.
> [!NOTE]
> ***[2,1,3]*** is not an acceptable permutation of the list ***[1,2,3]*** because ***3*** did not change it’s position.

### acceptable_distribution/1 
The predicate ****acceptable_distribution(G)*** should succeed only if no row is placed in a column with the same index and no column is placed in a row with the same index.

### row_col_match/1
The predicate ***row_col_match(M)*** should succeed only if each row is equal to a column with a different index and each column is equal to a row with a different index.

### trans/2 
The predicate ***trans(M,M1)*** should succeed only if ***M1*** represents a transposed version of the matrix ***M***.


### distinct_rows/1
The predicate ***distinct_rows(M)*** should succeed only if ***M*** represents a matrix ***M*** where all rows are unique.

### distinct_columns/1
The predicate ***distinct_columns(M)*** should succeed only if ***M*** represents a matrix ***M*** where all columns are unique.
 
 ### helsinki/2 
The predicate ***helsinki(N,G)*** should succeed only if ***G*** is a square grid of size ***N\*N*** that satisfies all the helsinki puzzle properties.

