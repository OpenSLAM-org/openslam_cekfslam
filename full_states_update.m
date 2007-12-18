function full_states_update()
%function full_states_update()
%
% GLOBAL INPUTS:
%   XB PAB PB PsiXB PhiPAB OmegaPB
%
% GLOBAL OUTPUTS:
%   XB PAB PB PsiXB PhiPAB OmegaPB
%

global XB PAB PB PsiXB PhiPAB OmegaPB JXA

if size(XB,1) ~= 1 && size(OmegaPB,1) ~= 1
    % update part B
    XB = XB + PAB'*PsiXB;
    PB = PB - PAB'*OmegaPB*PAB;
    PAB = PhiPAB*PAB;
end

% reset auxiliary coef.
PsiXB= zeros(1);
OmegaPB= zeros(1);
PhiPAB= zeros(1);
JXA= zeros(1);

