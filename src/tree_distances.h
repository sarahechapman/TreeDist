#include <stdint.h>
#include <limits>

/*************** TYPES      *******************/

typedef uint64_t splitbit;
typedef int64_t cost;
typedef int lap_row;
typedef int lap_col;

/*************** CONSTANTS  *******************/

const int BIN_SIZE = 64;
const int MAX_BINS = 32;
const int MAX_TIPS = BIN_SIZE * MAX_BINS;
const int MAX_SPLITS = MAX_TIPS; /* -3, but quicker if a power of two? */

const splitbit ALL_ONES = std::numeric_limits<splitbit>::max();

const cost BIG = std::numeric_limits<cost>::max() / MAX_SPLITS;
const double BIGL = double (BIG);

const splitbit right16bits = 65535U;
const uint32_t powers_of_two[16] = {1, 2, 4, 8, 16, 32, 64, 128, 256, 512,
                                    1024, 2048, 4096, 8192, 16384, 32768};
extern int count_bits (splitbit x);

/*************** FUNCTIONS  *******************/


extern uint32_t bitcounts[65536];
extern int count_bits (splitbit x);

extern double lg2_double_factorial[MAX_TIPS + MAX_TIPS - 2];
extern double lg2_rooted[MAX_TIPS + 1];
extern double lg2_unrooted[MAX_TIPS + 1];
extern double lg2_trees_matching_split(int a, int b);

extern cost lap(int dim, cost **assigncost,
                lap_col *rowsol, lap_row *colsol,
                cost *u, cost *v);


extern double p_lg2_p_frac (double p);
extern double p_lg2_p (double p);
extern double entropy2 (double p);
extern double entropy4 (double p1, double p2, double p3, double p4);

extern double one_overlap (int a, int b, int n);
extern double one_overlap_notb (int a, int n_minus_b, int n);
extern double mpi (splitbit* a_state, splitbit* b_state, int n_tips, 
                   int in_a, int in_b, double lg2_unrooted_n, int n_bins);