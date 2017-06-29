% Plots the sub and supersonic mach numbers of several gases versus a range
% of normalized areas

% -----------------------------------------------------------------------------

% create array of values for normalized area (A)
A = 1:0.1:4;

disp('Modified Secant Method')

% start timer
tic

% set up a new window for a new graph
graphsetup(...
    'Subsonic and Supersonic vs Normalized Area - Modified Secant Method',...
    [100 350 600 450], 1)
% calculate the mach number's subsonic and supersonic values
ms_msub_co2 = msecmethod(A, 1.285, 0.2, 0.001, []);
ms_msup_co2 = msecmethod(A, 1.284, 2.0, 0.001, []);
ms_msub_air = msecmethod(A, 1.400, 0.2, 0.001, []);
ms_msup_air = msecmethod(A, 1.400, 2.0, 0.001, []);
ms_msub_ng = msecmethod(A, 1.667, 0.2, 0.001, []);
ms_msup_ng = msecmethod(A, 1.667, 2.0, 0.001, []);
% plot the mach numbers vs the values of A
title(...
    'Subsonic and Supersonic vs Normalized Area - Modified Secant Method')
plot(A, ms_msub_co2)
plot(A, ms_msup_co2)
plot(A, ms_msub_air)
plot(A, ms_msup_air)
plot(A, ms_msub_ng)
plot(A, ms_msup_ng)
% add legend to graph when done
graphsetup('',[],0)
% update timer
toc

disp('Bisection Method')
% set up a new window for a new graph
graphsetup(...
    'Subsonic and Supersonic vs Normalized Area - Bisection Method',...
    [500 350 600 450], 1)

% calculate the mach number's subsonic and supersonic values
bsc_msub_co2 = bsectmethod( A, 1.285, 0,1,[]);
bsc_msup_co2 = bsectmethod( A, 1.285, 1,4,[]);
bsc_msub_air = bsectmethod( A, 1.400, 0,1,[]);
bsc_msup_air = bsectmethod( A, 1.400, 1,4,[]);
bsc_msub_ng = bsectmethod( A, 1.667, 0,1,[]);
bsc_msup_ng = bsectmethod( A, 1.667, 1,4,[]);
% plot the mach numbers vs the values of A
title(...
    'Subsonic and Supersonic vs Normalized Area - Bisection Method')
plot(A,bsc_msub_co2);
plot(A,bsc_msup_co2);
plot(A,bsc_msub_air);
plot(A,bsc_msup_air);
plot(A,bsc_msub_ng);
plot(A,bsc_msup_ng);
% add legend to graph when done
graphsetup('',[],0)
% update timer
toc