function vprim=odefun(t,v)
Kp= 0.1;
Ki= 0.001;
A=[-5e-5 1 0; -Kp -1 -Ki; 1 0 0];
b=[-1e-3 1e-3 0]';
  
vprim=A*v+b;


