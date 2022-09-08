#include "stdio.h"
#ifdef __cplusplus
extern "C" {
#endif
extern char at_least_one_object_file;
extern void *kernel_scs_file_ht_new(const void *, int);
extern int kernel_scs_file_ht_get(void *, const char *, int *);
extern int  strcmp(const char*, const char*);
  typedef struct {
    char* dFileName;
  } lPkgFileInfoStruct;

  typedef struct {
    char* dFileName;
    char* dRealFileName;
    long dFileOffset;
    unsigned long dFileSize;
    int dFileModTime;
    unsigned int simFlag;
  } lFileInfoStruct;

static int lNumOfScsFiles;
  static lFileInfoStruct lFInfoArr[] = {
  {"synopsys_sim.setup_0", "./synopsys_sim.setup", 8188, 241, 1662379447, 0},
  {"synopsys_sim.setup_1", "/home/tools/Synopsys/vcs_mx_vN-2017.12/bin/synopsys_sim.setup", 8429, 4667, 1509116667, 0},
  {"./work/64/GF22_FLL.sim", "", 0, 8188, 0, 1},
  {"linux64/packages/IEEE/lib/64/NUMERIC_STD__.sim", "", 13096, 641728, 0, 0},
  {"linux64/packages/IEEE/lib/64/NUMERIC_STD.sim", "", 654824, 212281, 0, 0},
  {"./work/64/GF22_FLL.mra", "", 867105, 11, 0, 0},
  {"./work/64/GF22_FLL.mra", "", 867116, 11, 0, 0},
  {"./work/64/GF22_FLL__BEHAVIORAL.sim", "", 867127, 22911, 0, 1},
  {"./work/64/TOPLEVEL_CONFIGURATION_DEFAULT_GF22_FLL_BEHAVIORAL.sim", "", 890038, 120681, 0, 0},
  {"linux64/packages/IEEE/lib/64/MATH_REAL__.sim", "", 1010719, 134009, 0, 0},
  {"linux64/packages/IEEE/lib/64/MATH_REAL.sim", "", 1144728, 39100, 0, 0},
  {"./work/64/GF22_DCO.sim", "", 1183828, 4674, 0, 1},
  {"./work/64/GF22_DCO__BEHAVIORAL.sim", "", 1188502, 13157, 0, 1},
  {"./work/64/FLLPKG__.sim", "", 1201659, 4536, 0, 1},
  {"./work/64/FLLPKG.sim", "", 1206195, 3409, 0, 1},
  {"./work/64/FLL_DIGITAL.sim", "", 1209604, 10632, 0, 1},
  {"./work/64/FLL_DIGITAL__RTL.sim", "", 1220236, 109595, 0, 1},
  {"./work/64/FLL_GLITCHFREE_CLKMUX.sim", "", 1329831, 4291, 0, 1},
  {"./work/64/FLL_GLITCHFREE_CLKMUX__RTL.sim", "", 1334122, 16588, 0, 1},
  {"./work/64/FLL_MUX.sim", "", 1350710, 3623, 0, 1},
  {"./work/64/FLL_MUX__RTL.sim", "", 1354333, 4982, 0, 1},
  {"./work/64/FLL_CLOCK_GATED.sim", "", 1359315, 3939, 0, 1},
  {"./work/64/FLL_CLOCK_GATED__RTL.sim", "", 1363254, 6438, 0, 1},
  {"./work/64/FLL_CLK_DIVIDER.sim", "", 1369692, 5639, 0, 1},
  {"./work/64/FLL_CLK_DIVIDER__RTL.sim", "", 1375331, 37027, 0, 1},
  {"./work/64/FLL_LOOP_FILTER.sim", "", 1412358, 8636, 0, 1},
  {"./work/64/FLL_LOOP_FILTER__RTL.sim", "", 1420994, 28584, 0, 1},
  {"./work/64/FLL_SETTLING_MONITOR.sim", "", 1449578, 9023, 0, 1},
  {"./work/64/FLL_SETTLING_MONITOR__RTL.sim", "", 1458601, 23804, 0, 1},
  {"./work/64/FLL_ZERODELTA.sim", "", 1482405, 5246, 0, 1},
  {"./work/64/FLL_ZERODELTA__RTL.sim", "", 1487651, 26420, 0, 1},
  {"./work/64/FLL_SYNCHROEDGE.sim", "", 1514071, 5112, 0, 1},
  {"./work/64/FLL_SYNCHROEDGE__RTL.sim", "", 1519183, 10160, 0, 1},
  {"./work/64/FLL_DITHER_PATTERN_GEN.sim", "", 1529343, 5569, 0, 1},
  {"./work/64/FLL_DITHER_PATTERN_GEN__RTL.sim", "", 1534912, 12720, 0, 1},
  {"./work/64/FLL_CLK_PERIOD_QUANTIZER.sim", "", 1547632, 5347, 0, 1},
  {"./work/64/FLL_CLK_PERIOD_QUANTIZER__RTL.sim", "", 1552979, 15552, 0, 1},
  {"./work/64/FLL_REG.sim", "", 1568531, 5145, 0, 1},
  {"./work/64/FLL_REG__RTL.sim", "", 1573676, 8680, 0, 1},
  {"./work/64/FLL_GLITCHFREE_CLKDIV.sim", "", 1582356, 5689, 0, 1},
  {"./work/64/FLL_GLITCHFREE_CLKDIV__RTL.sim", "", 1588045, 30503, 0, 1},
