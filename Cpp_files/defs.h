#ifndef DEFS_H_
#define DEFS_H_

#include <stdlib.h>
#include <iostream>
#include <sstream>      
#include <fstream>
#include <iomanip>
#include <random>
#include <algorithm>
#include <queue>
#include <string>
#include <direct.h>
#include <Windows.h>

using std::cout;
using std::endl;
using std::ostream;
using std::ofstream;
using std::setfill;
using std::setw;
using std::queue;
using std::vector;
using std::string;

//                        0     , 1  , 2  , 3 , 4      , 5     , 6         , 7        , 8         , 9        , 10        , 11
typedef enum ALGORITHEM { RANDOM, JSQ, JIQ, PI, JSP_JIQ, JSP_PI, JSP_D2_JIQ, JSP_D2_PI, JSP_D3_JIQ, JSP_D3_PI, JSP_D5_JIQ, JSP_D5_PI } ALGORITHEM;//load balance algorithem
typedef enum TEST_SCALE { LARGE, SMALL } TEST_SCALE;//simulation size - 1:10 or 10:100 (entry:server)
typedef enum SERVER_UNITY { HOMOGENEOUS, HETEROGENEOUS_X2, HETEROGENEOUS_X10 } SERVER_UNITY;//difference between servers
typedef enum SERVER_SPEED_DISTRIBUTION { FAST_9_SLOW_1, FAST_5_SLOW_5, FAST_1_SLOW_9 } SERVER_SPEED_DISTRIBUTION;//server speed distribution. only if UNITY=HETEROGENEOUS
typedef float ENTRIES_TO_SERVERS_RATIO;//total entries speed divided by total servers speed

const int SEED = 12;
const int SIMULATION_TIME = 50000;

static std::default_random_engine random_generator(SEED);
static std::minstd_rand random_number(SEED);

class job;
class server;
class entry;
class test_params;

#endif // !DEFS_H_