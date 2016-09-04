#!/usr/bin/perl
#     Copyright (C) 2016 Takamitsu Miyaji (tkmmiyaji@gmail.com)
#     Distribiuted under:
#     GNU GENERAL PUBLIC LICENSE  Version 3, 29 June 2007
#     This program comes with ABSOLUTELY NO WARRANTY.
#     See the terms of aforementioned license.


($ra_d,$dec_d)=@ARGV; 
$orig=join(' ',@ARGV);

if ($ra_d eq "-h"){&print_help;}

if ($#ARGV >= 1){ #ra dec from command line

    &conv;

} else {
    print "! Input ra and dec from stdin.\n";
    while (<STDIN>){
	chop;  $orig=$_;
	($ra_d,$dec_d) = split;
	&conv;
    }
}

sub conv {

    if ( $orig =~ /\!/) {

	print "$orig \n";

    } else {

	if ($ra_d =~/\:/){
	    $ra_h = $ra_d;
	    $ra_d = &hms2deg($ra_h);	
	} else {
	    $ra_h = &deg2hms($ra_d);
	}

	if ($dec_d =~/\:/){
	    $dec_h = $dec_d;
	    $dec_d = &dms2deg($dec_h);
	} else {
	    $dec_h = &deg2dms($dec_d);
	}

	printf (" %10.5f %10.5f %s %s\n",$ra_d,$dec_d,$ra_h,$dec_h);
    }
}

sub dms2deg{
    local ($dd,$mm,$ss,$degr);
    ($dd,$mm,$ss)=split(/:/,$_[0]);
    $degr = abs($dd)+$mm/60.+$ss/3600.;
    if ($dd =~/\-/){$degr=-$degr;}
    $degr;
}  

sub hms2deg{
    &dms2deg($_[0])*15.;
}  

sub deg2dms{
    local ($sgn,$dd,$mm,$ss,$degr);
    $degr = $_[0]; $sign= ($degr < 0) ? "-":" ";
    $degr = abs($degr);
    $dd = int ($degr);$mm=($degr*60)%60;
    $ss=($degr*3600)-$dd*3600-$mm*60;
    sprintf("%1s%02d:%02d:%06.3f",$sign,$dd,$mm,$ss);    
}  

sub deg2hms{
    &deg2dms($_[0]/15.);
}  

        
sub print_help{
    print "\n Usage: $0 ra  dec \n\n";
    print "    Input RA,DEC in degrees or hh:mm:ss.ss dd:mm:ss.s format \n";
    print "   and output in both ways\n\n";
    print "   If no arguments are given, the program takes \n";
    print "   multiple lines of ra and dec from STDIN. \n\n\n";
    print `cat \`which $0\` | head -7 | tail -6`;
    exit (0);
}    







 
    
    
