function alpha_q = s_a_q(gs_lg,gp,q,ee,ne,dps)
tt = 0;
vt = [];
ii = 1;
ps = [];
while tt<max(gs_lg)
    tt = tt + ee;
    temp = find((tt-ee<=gs_lg) & (gs_lg<=tt));
    if length(temp)>0
        vt(ii) = temp(end);
    elseif ii~=1
        vt(ii) = vt(ii-1);
    else
        vt(ii) = 1;
    end
    if ii~=1 && vt(ii)>vt(ii-1)
        ps(ii) = sum(gp(temp));
    elseif ii == 1
        ps(ii) = sum(gp(temp));
    else
        ps(ii) = 0;
    end
    ii = ii + 1;
end
ps = ps + dps;
uu = ps.^q/sum(ps.^q);
alpha_q = sum(uu.*log10(ps))/log10(ee);
end