/*   
     Program to calculate the angle between
     Two coordinates In degrees  
     By Takamitsu Miyaji (tkmmiyaji@gmail.com)
     Distribiuted under:
     GNU GENERAL PUBLIC LICENSE  Version 3, 29 June 2007
*/

#include   <stdio.h>
#include   <math.h>
#include   <stdlib.h>

void print_help(char *cm){
  printf ("\n*Usage: %s Long1 Lat1 Long2 Lat2 \n\n",cm);
  printf ("      The unit of the angles are in degrees \n\n");
  printf (" Copyright (C) 2016 Takamitsu Miyaji \n\n",cm);
  printf (" Distributed under GNU GENERAL PUBLIC LICENSE  Version 3 ");
  printf (" This program comes with ABSOLUTELY NO WARRANTY.\n");
  printf (" See GNU GENERAL PUBLIC LICENSE  Version 3.\n\n");
}

double angl (double ra1, double dc1, double ra2, double dc2){
  double d2r = 1.745329251994330e-02;
  double x1,y1,z1,x2,y2,z2,csa;
  x1=cos(d2r*dc1)*cos(d2r*ra1); y1=cos(d2r*dc1)*sin(d2r*ra1); 
  z1=sin(d2r*dc1); x2=cos(d2r*dc2)*cos(d2r*ra2); 
  y2=cos(d2r*dc2)*sin(d2r*ra2); z2=sin(d2r*dc2);
  csa = x1*x2+y1*y2+z1*z2;
  if (csa>1.){csa =1.;}  
  if (csa<-1.){csa =-1.;}  
  return(acos(csa)/d2r);
}

main(int argc, char *argv[]){
  double ra1,dc1,ra2,dc2,ang;
  if ((!strcmp(argv[1],"-h"))|| argc<5){
    print_help(argv[0]);
  }else{
    ra1=atof(argv[1]); dc1=atof(argv[2]);
    ra2=atof(argv[3]); dc2=atof(argv[4]);
    ang=angl(ra1,dc1,ra2,dc2);
    printf ("\n Angle: %9.5f [deg] %9.2f [amin] %9.1e [asec] \n\n",
	    ang,ang*60.,ang*3600);
  }
  return(0);
}  
	    
    	    



