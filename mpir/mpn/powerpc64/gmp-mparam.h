/* Generated by tuneup.c, 2010-05-23, gcc 4.0 */

#define MUL_KARATSUBA_THRESHOLD          16
#define MUL_TOOM3_THRESHOLD              81
#define MUL_TOOM4_THRESHOLD             169
#define MUL_TOOM8H_THRESHOLD            173

#define SQR_BASECASE_THRESHOLD            4
#define SQR_KARATSUBA_THRESHOLD          28
#define SQR_TOOM3_THRESHOLD              97
#define SQR_TOOM4_THRESHOLD             266
#define SQR_TOOM8_THRESHOLD             266

#define POWM_THRESHOLD                  984

#define GCD_ACCEL_THRESHOLD             387
#define GCD_THRESHOLD                   969
#define GCDEXT_THRESHOLD                674
#define JACOBI_BASE_METHOD                1

#define DIVREM_1_NORM_THRESHOLD           0  /* always */
#define DIVREM_1_UNNORM_THRESHOLD         0  /* always */
#define MOD_1_NORM_THRESHOLD              0  /* always */
#define MOD_1_UNNORM_THRESHOLD            0  /* always */
#define USE_PREINV_DIVREM_1               1
#define USE_PREINV_MOD_1                  1
#define DIVREM_2_THRESHOLD                0  /* always */
#define DIVEXACT_1_THRESHOLD              0  /* always */
#define MODEXACT_1_ODD_THRESHOLD          0  /* always */
#define MOD_1_1_THRESHOLD                 8
#define MOD_1_2_THRESHOLD                 8
#define MOD_1_3_THRESHOLD                25
#define DIVREM_HENSEL_QR_1_THRESHOLD     31
#define RSH_DIVREM_HENSEL_QR_1_THRESHOLD     58
#define DIVREM_EUCLID_HENSEL_THRESHOLD      8

#define ROOTREM_THRESHOLD                 6

#define GET_STR_DC_THRESHOLD             12
#define GET_STR_PRECOMPUTE_THRESHOLD     23
#define SET_STR_DC_THRESHOLD           5510
#define SET_STR_PRECOMPUTE_THRESHOLD  93171

#define MUL_FFT_TABLE  { 304, 672, 1600, 2304, 7168, 20480, 81920, 458752, 1310720, 5242880, 0 }
#define MUL_FFT_MODF_THRESHOLD          272
#define MUL_FFT_FULL_THRESHOLD         1728

#define SQR_FFT_TABLE  { 272, 672, 1600, 2304, 7168, 20480, 81920, 458752, 1310720, 5242880, 0 }
#define SQR_FFT_MODF_THRESHOLD          216
#define SQR_FFT_FULL_THRESHOLD         1728

#define MULLOW_BASECASE_THRESHOLD         0  /* always */
#define MULLOW_DC_THRESHOLD              47
#define MULLOW_MUL_THRESHOLD           3114

#define MULHIGH_BASECASE_THRESHOLD        4
#define MULHIGH_DC_THRESHOLD             47
#define MULHIGH_MUL_THRESHOLD          3114

#define MULMOD_2EXPM1_THRESHOLD          14

#define FAC_UI_THRESHOLD              31169
#define DC_DIV_QR_THRESHOLD              21
#define DC_DIVAPPR_Q_N_THRESHOLD         52
#define INV_DIV_QR_THRESHOLD           3031
#define INV_DIVAPPR_Q_N_THRESHOLD        52
#define DC_DIV_Q_THRESHOLD               83
#define INV_DIV_Q_THRESHOLD            2492
#define DC_DIVAPPR_Q_THRESHOLD           69
#define INV_DIVAPPR_Q_THRESHOLD        5113
#define DC_BDIV_QR_THRESHOLD             48
#define DC_BDIV_Q_THRESHOLD              21
/* Tuneup completed successfully, took 865 seconds */

#define MUL_FFT_TABLE2 {{1, 4}, {242, 5}, {485, 6}, {519, 5}, {555, 6}, {1238, 7}, {1294, 6}, {1352, 7}, {2191, 8}, {2340, 7}, {2445, 8}, {5478, 9}, {5721, 8}, {6518, 9}, {6661, 8}, {6957, 9}, {7756, 8}, {8100, 9}, {10980, 10}, {11467, 9}, {13939, 10}, {15535, 9}, {16944, 10}, {19722, 9}, {20154, 10}, {23970, 9}, {24495, 10}, {27898, 11}, {31091, 10}, {40326, 11}, {47962, 10}, {52305, 11}, {53451, 12}, {63570, 10}, {69326, 11}, {80681, 10}, {82448, 11}, {98051, 12}, {127165, 11}, {164920, 12}, {196129, 13}, {254354, 12}, {259924, 10}, {392279, 11}, {719463, 9}, {735218, 10}, {751318, 11}, {784582, 12}, {MP_SIZE_T_MAX,0}}

#define MUL_FFTM_TABLE2 {{1, 4}, {210, 5}, {220, 4}, {242, 5}, {266, 4}, {272, 5}, {485, 6}, {519, 5}, {555, 6}, {971, 7}, {1038, 6}, {1109, 7}, {1159, 6}, {1185, 7}, {2445, 8}, {2610, 7}, {2668, 8}, {5478, 9}, {5721, 8}, {5976, 9}, {6661, 8}, {6957, 9}, {10980, 10}, {11467, 9}, {13061, 10}, {13347, 9}, {13939, 10}, {15535, 9}, {15876, 10}, {21979, 11}, {22953, 10}, {27898, 11}, {31091, 10}, {36184, 11}, {39461, 10}, {40326, 11}, {47962, 10}, {49013, 11}, {55819, 12}, {58292, 13}, {62207, 12}, {63570, 11}, {80681, 12}, {95949, 11}, {104637, 12}, {106929, 13}, {124440, 12}, {127165, 11}, {138676, 12}, {161386, 11}, {164920, 12}, {200424, 13}, {223352, 12}, {228243, 13}, {254354, 12}, {329862, 13}, {392279, 14}, {508731, 13}, {519871, 11}, {719463, 9}, {735218, 10}, {751318, 11}, {784582, 12}, {MP_SIZE_T_MAX,0}}

#define SQR_FFT_TABLE2 {{1, 4}, {210, 5}, {215, 4}, {220, 5}, {225, 4}, {248, 5}, {485, 6}, {507, 5}, {555, 6}, {1238, 7}, {1294, 6}, {1352, 7}, {2191, 8}, {2340, 7}, {2499, 8}, {2849, 7}, {2976, 8}, {5478, 9}, {5721, 8}, {6518, 9}, {6661, 8}, {6957, 9}, {7756, 8}, {8100, 9}, {10980, 10}, {11467, 9}, {13939, 10}, {15535, 9}, {16944, 10}, {19722, 9}, {20154, 10}, {23970, 9}, {24495, 10}, {27898, 11}, {31091, 10}, {40326, 11}, {47962, 10}, {52305, 11}, {53451, 12}, {63570, 10}, {66386, 11}, {80681, 10}, {82448, 11}, {98051, 12}, {127165, 11}, {129950, 10}, {132796, 11}, {151230, 10}, {154542, 11}, {164920, 12}, {196129, 13}, {254354, 12}, {259924, 11}, {359720, 12}, {375647, 11}, {383873, 12}, {392279, 11}, {508731, 12}, {542888, 11}, {566925, 12}, {719463, 13}, {784582, 12}, {995682, 13}, {MP_SIZE_T_MAX,0}}

#define SQR_FFTM_TABLE2 {{1, 4}, {210, 5}, {225, 4}, {242, 5}, {485, 6}, {519, 5}, {555, 6}, {1109, 7}, {2239, 8}, {2289, 7}, {2445, 8}, {2610, 7}, {2727, 8}, {5478, 9}, {5721, 8}, {5976, 9}, {10980, 10}, {11467, 9}, {13061, 10}, {13347, 9}, {13939, 10}, {15535, 9}, {15876, 10}, {21508, 11}, {22461, 10}, {27898, 11}, {31091, 10}, {36184, 11}, {39461, 10}, {40326, 11}, {47962, 10}, {49013, 11}, {55819, 12}, {58292, 13}, {62207, 12}, {63570, 11}, {80681, 12}, {95949, 11}, {104637, 12}, {106929, 13}, {124440, 12}, {127165, 11}, {138676, 12}, {161386, 11}, {164920, 12}, {196129, 13}, {254354, 12}, {259924, 11}, {265616, 12}, {296001, 11}, {359720, 12}, {367597, 13}, {392279, 14}, {508731, 13}, {519871, 12}, {604990, 13}, {618238, 12}, {631776, 13}, {645611, 12}, {719463, 13}, {784582, 12}, {855595, 13}, {913042, 12}, {995682, 13}, {MP_SIZE_T_MAX,0}}

#define MUL_FFT_FULL_TABLE2 {{16, 3}, {1022, 1}, {1045, 2}, {1068, 1}, {1092, 4}, {1141, 2}, {1166, 4}, {1192, 5}, {1219, 2}, {1274, 1}, {1302, 2}, {1361, 1}, {1422, 4}, {1454, 1}, {1696, 4}, {1734, 5}, {1772, 1}, {1851, 2}, {1892, 1}, {1934, 2}, {1977, 4}, {2021, 2}, {2112, 1}, {2207, 4}, {2256, 6}, {2306, 4}, {2409, 2}, {2516, 3}, {2572, 2}, {2746, 1}, {2869, 2}, {2932, 4}, {2997, 1}, {3343, 2}, {3417, 1}, {3492, 4}, {3569, 1}, {3980, 2}, {4068, 1}, {4158, 2}, {4250, 1}, {4440, 4}, {4538, 5}, {4740, 4}, {4844, 1}, {4951, 2}, {5060, 3}, {5171, 1}, {5401, 4}, {5520, 1}, {5641, 2}, {5765, 1}, {5892, 4}, {6154, 6}, {6289, 2}, {6568, 1}, {6712, 4}, {6859, 1}, {7010, 4}, {7164, 2}, {7321, 1}, {7814, 2}, {8161, 1}, {8340, 2}, {8523, 1}, {8710, 2}, {8901, 1}, {9296, 4}, {9709, 1}, {9922, 3}, {10363, 1}, {10822, 2}, {11059, 1}, {11302, 2}, {11550, 1}, {11803, 4}, {12327, 1}, {14040, 2}, {14663, 1}, {15993, 2}, {17068, 4}, {17442, 2}, {17824, 5}, {19022, 1}, {19865, 3}, {20745, 1}, {21665, 2}, {23121, 1}, {23628, 2}, {24146, 4}, {24675, 1}, {28104, 4}, {29992, 1}, {32007, 2}, {34157, 5}, {34905, 2}, {35670, 5}, {37251, 4}, {38901, 1}, {39753, 3}, {41514, 1}, {42424, 2}, {44303, 1}, {47280, 4}, {49374, 3}, {53845, 5}, {55025, 2}, {56230, 1}, {58721, 4}, {60007, 3}, {62664, 6}, {64037, 8}, {65440, 10}, {66873, 11}, {68338, 10}, {69835, 6}, {71365, 8}, {72928, 5}, {74525, 4}, {79530, 1}, {81272, 3}, {83052, 2}, {88630, 1}, {94582, 4}, {98771, 7}, {100934, 10}, {103145, 6}, {105404, 9}, {107713, 5}, {110072, 1}, {130905, 2}, {142755, 5}, {149076, 6}, {152341, 3}, {166130, 2}, {185136, 1}, {189190, 2}, {197567, 4}, {201894, 1}, {261830, 2}, {267564, 5}, {273423, 3}, {279411, 2}, {291783, 3}, {304703, 2}, {311376, 5}, {318195, 3}, {325163, 2}, {332284, 5}, {346997, 1}, {354596, 2}, {362361, 1}, {386691, 2}, {395159, 4}, {412655, 5}, {421691, 3}, {430925, 2}, {440362, 1}, {459859, 3}, {469929, 1}, {523686, 2}, {535154, 5}, {546873, 3}, {571086, 2}, {583592, 1}, {596372, 3}, {609431, 5}, {622776, 4}, {636414, 1}, {664591, 3}, {694016, 1}, {724743, 4}, {740613, 2}, {790340, 4}, {825333, 6}, {843406, 3}, {861875, 2}, {900034, 1}, {919743, 3}, {960464, 4}, {981496, 6}, {MP_SIZE_T_MAX,0}}

#define SQR_FFT_FULL_TABLE2 {{16, 3}, {1022, 1}, {1045, 2}, {1068, 1}, {1092, 2}, {1192, 5}, {1219, 2}, {1274, 1}, {1302, 4}, {1331, 6}, {1361, 2}, {1391, 1}, {1422, 2}, {1454, 1}, {1519, 3}, {1553, 1}, {1588, 2}, {1623, 5}, {1659, 1}, {1696, 4}, {1772, 6}, {1811, 2}, {1851, 1}, {1934, 2}, {2112, 1}, {2256, 2}, {2306, 5}, {2357, 4}, {2409, 2}, {2462, 3}, {2572, 6}, {2629, 4}, {2746, 1}, {2807, 2}, {2932, 3}, {2997, 1}, {3131, 2}, {3271, 1}, {3343, 2}, {3492, 4}, {3569, 1}, {3980, 2}, {4068, 1}, {4158, 2}, {4250, 1}, {4440, 4}, {4538, 5}, {4740, 4}, {4844, 1}, {4951, 3}, {5171, 1}, {5401, 4}, {5520, 1}, {5641, 2}, {5765, 1}, {5892, 4}, {6154, 6}, {6289, 2}, {6568, 1}, {6712, 4}, {6859, 2}, {7010, 4}, {7164, 2}, {7321, 1}, {7814, 2}, {8161, 1}, {8340, 2}, {8523, 1}, {8710, 2}, {8901, 5}, {9296, 4}, {9709, 1}, {9922, 3}, {10363, 1}, {10822, 2}, {11550, 1}, {11803, 4}, {12327, 1}, {12873, 2}, {13155, 1}, {13444, 2}, {13739, 1}, {14040, 4}, {14348, 2}, {14663, 1}, {15993, 2}, {17068, 1}, {17442, 2}, {17824, 5}, {19022, 4}, {19439, 1}, {19865, 3}, {20745, 1}, {21665, 2}, {22625, 1}, {23628, 2}, {24146, 4}, {24675, 1}, {25769, 2}, {26334, 1}, {28104, 4}, {28720, 1}, {29349, 4}, {29992, 1}, {32007, 2}, {35670, 5}, {36452, 6}, {37251, 4}, {38901, 1}, {39753, 3}, {41514, 2}, {45274, 1}, {47280, 4}, {49374, 3}, {53845, 5}, {55025, 2}, {56230, 1}, {58721, 4}, {60007, 3}, {62664, 6}, {64037, 9}, {65440, 12}, {66873, 11}, {68338, 10}, {69835, 6}, {71365, 8}, {72928, 5}, {74525, 4}, {79530, 1}, {81272, 3}, {83052, 2}, {88630, 1}, {94582, 4}, {96654, 7}, {98771, 10}, {100934, 9}, {103145, 8}, {105404, 9}, {107713, 5}, {110072, 1}, {130905, 2}, {142755, 5}, {149076, 6}, {152341, 3}, {166130, 2}, {185136, 1}, {189190, 2}, {197567, 4}, {201894, 1}, {261830, 2}, {291783, 3}, {298173, 6}, {304703, 2}, {311376, 1}, {339561, 3}, {346997, 1}, {362361, 2}, {370296, 1}, {386691, 2}, {395159, 4}, {412655, 3}, {430925, 2}, {440362, 1}, {469929, 3}, {480220, 4}, {490736, 1}, {523686, 2}, {546873, 3}, {558848, 2}, {583592, 1}, {596372, 2}, {609431, 5}, {622776, 4}, {636414, 1}, {664591, 3}, {694016, 1}, {724743, 2}, {740613, 5}, {756831, 2}, {790340, 4}, {825333, 3}, {861875, 6}, {880748, 7}, {900034, 6}, {919743, 5}, {939883, 4}, {981496, 3}, {MP_SIZE_T_MAX,0}}

