%% single-channel FxLMS algorithm 
function Er = FxLMS(Len_Filter, Wc_initial, Dis, Rf, muw)
% Len_Filter : control filter length 
% Wc_initial : initial control filter 
% Dis        : the disturbance 
% Rf         : reference signal 
% muw        : step size 
N   = Len_Filter ;
Wc  = Wc_initial ;
Xtap  = zeros(N,1) ;
Er  = zeros(length(Rf),1);
    for t = 1:length(Rf) 
        Xtap   = [Rf(t);Xtap(1:end-1)];
        Rf_i = Xtap'         ;
        Rf_i = Rf_i'       ;
        y_t  = Wc'*Rf_i    ;
        e    = Dis(t)-y_t ;
        Er(t) = e         ;
        Wc     = Wc + muw*e*Rf_i;
    end
end
