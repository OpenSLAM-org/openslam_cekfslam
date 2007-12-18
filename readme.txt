Compressed Extended Kalman Fileter based SLAM simulator

by Zhang Haiqiang
Thanks to Tim Bailey and Juan Nieto for their code of EKF-SLAM 2004.Version 1.0

=========================================
To run this simulator:
1. load loop902.mat to the workspace
2. run "data = cekfslam(lm,wp)" in the command window
=========================================

+++++++++++++++++++++++++++++++++++++++++
2007-11-22
This code works well under:
Linux Matlab7.4.0.336 (R2007a)
Windows Matlab 7.0.0.19920 (R14) on the loop902.mat.

HOWEVER, ONLY NUMBER_LOOPS= 1 works fine.

If NUMBER_LOOPS is set to 2, the following error:

??? Error using ==> mtimes
Inner matrix dimensions must agree.

Error in ==> full_states_update at 15
    XB = XB + PAB'*PsiXB;

Error in ==> cekfslam at 176
            full_states_update();

will occur.

The reason is: when g_sim_time is 1577.5; XA(1) is 28.1654; the data association code should
associate the observation with (32.7,8.8), the 7th landmark in XA, but it wrongly with the 4th
landmark. The result is XA(1) changes from about 28.0 to -269.0. Then the SLAM collapses. 