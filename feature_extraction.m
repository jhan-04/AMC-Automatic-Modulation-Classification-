function [c20,c21,c40,c41,c42,c60,c63,c80]=feature_extraction(rx)

    %%mean(rx)

    m40=mean(rx.^4);
    m20=mean(rx.^2);
    m41=mean(rx.^3.*conj(rx));
    m21=mean(rx.*conj(rx));%%
    m42=mean(rx.^2.*conj(rx).^2);
    m60=mean(rx.^6);
    m63=mean(rx.^3.*conj(rx).^3);
    m80=mean(rx.^8);
    
    
    
    c20=mean(rx.^2);
    c21=mean(abs(rx).^2);
    c40=mean(rx.^4)-3*mean(rx.^2)^2;
    c41=m41-3*m21*m20;
    c42=m42-abs(m20)^2-2*m21^2;
    c60=m60-15*m40*m20+30*m20^3;
    c63=m63-9*m21*m41-6*m21^3;
    c80=m80-35*m40^2-28*m60*m20+420*m40*m20^2-630*m20^4;
    

end