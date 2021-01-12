#Con este script se genera la lista de ejecuciones....
#!/usr/bin/perl
use strict;
use warnings;
use Getopt::Long;
my $file = "ExecutionFileDiversity";
my $fout;
open($fout, '>' ,$file);
my $Path =  `cd ..; pwd`;#"/home/joel.chacon/Current/MyResearchTopics/MOEA-D-Diversity/MOEAD-DE/vsd-moead-opt";
chomp $Path;

####Realizar la búsqueda del parámetro D inicial que proporcione mejores resultados
my $PathAlgorithm = $Path;

my $CR = 0.5;
my $F = 0.5;
my $prob = 0.9;
my $neighboursize = 20;
my $pops=100;
my $max_nfes=250000*$pops;
my $limit=2;
my @Instance = ("DTLZ1", "DTLZ2", "DTLZ3", "DTLZ4", "DTLZ5", "DTLZ6", "DTLZ7");
#   foreach(@Instance)
#   {
#   	my $nvar;
#   	
#   	for(my $nobj = 2; $nobj <=3; $nobj++)
#   	{
#  	   if( $nobj eq 2 ) 
#	   {
#	      $CR = 0.75;
#	      $F = 0.75;
#	   }
#  	   elsif( $nobj eq 3 ) 
#	   {
#	      $CR = 0.5;
#	      $F = 0.5;
#	   }
#      	   if($_ eq "DTLZ1")
#   	   {
#   	      $nvar=5+$nobj-1;
#   	   }
#   	   elsif($_ eq "DTLZ7")
#   	   {
#   	      $nvar=20+$nobj-1;
#   	   }
#   	   else
#   	   {
#   	      $nvar=10+$nobj-1;
#   	   }
#   	
#   	   for(my $Sed = 1; $Sed <=35; $Sed++) ##Realizar 35 ejecuciones con distintas semilla de cada instancia..
#   	   {
#   	   	print $fout "~$PathAlgorithm/moea $PathAlgorithm $_ $Sed $nobj $pops $max_nfes $neighboursize $prob $limit $CR $F $nvar\n";
#   	   }
#   	}
#   }

   @Instance = ("minusDTLZ1", "minusDTLZ2", "minusDTLZ3", "minusDTLZ4", "minusDTLZ5", "minusDTLZ6", "minusDTLZ7");
   foreach(@Instance)
   {
   	my $nvar;
   	
   	for(my $nobj = 2; $nobj <=3; $nobj++)
   	{
  	   if( $nobj eq 2 ) 
	   {
	      $CR = 0.75;
	      $F = 0.75;
	   }
  	   elsif( $nobj eq 3 ) 
	   {
	      $CR = 0.5;
	      $F = 0.5;
	   }
      	   if($_ eq "minusDTLZ1")
   	   {
   	      $nvar=5+$nobj-1;
   	   }
   	   elsif($_ eq "minusDTLZ7")
   	   {
   	      $nvar=20+$nobj-1;
   	   }
   	   else
   	   {
   	      $nvar=10+$nobj-1;
   	   }
   	
   	   for(my $Sed = 1; $Sed <=35; $Sed++) ##Realizar 35 ejecuciones con distintas semilla de cada instancia..
   	   {
   	   	print $fout "~$PathAlgorithm/moea $PathAlgorithm $_ $Sed $nobj $pops $max_nfes $neighboursize $prob $limit $CR $F $nvar\n";
   	   }
   	}
   }
#@Instance = ("WFG1", "WFG2", "WFG3", "WFG4", "WFG5", "WFG6", "WFG7", "WFG8", "WFG9", "minuWFG1", "minuWFG2", "minuWFG3", "minuWFG4", "minuWFG5", "minuWFG6", "minuWFG7", "minuWFG8", "minuWFG9");
@Instance = ("minusWFG1", "minusWFG2", "minusWFG3", "minusWFG4", "minusWFG5", "minusWFG6", "minusWFG7", "minusWFG8", "minusWFG9");
   foreach(@Instance)
   {
   	my $nvar;
   	
   	for(my $nobj = 2; $nobj <=3; $nobj++)
   	{
  	   if( $nobj eq 2 ) 
	   {
	      $CR = 0.75;
	      $F = 0.75;
	   }
  	   elsif( $nobj eq 3 ) 
	   {
	      $CR = 0.5;
	      $F = 0.5;
	   }

   	   my $k =4;# 2*($nobj-1);
   	   my $l =20;# 24-$k;
   	   $nvar=$l+$k;
   	
   	   for(my $Sed = 1; $Sed <=35; $Sed++) ##Realizar 35 ejecuciones con distintas semilla de cada instancia..
   	   {
   	   	print $fout "~$PathAlgorithm/moea $PathAlgorithm $_ $Sed $nobj $pops $max_nfes $neighboursize $prob $limit $CR $F $l $k\n";
		#   	   	print $fout "~$PathAlgorithm/moea $PathAlgorithm $_ $Sed $nobj $pops $max_nfes  $neighboursize $prob $l $k $Di\n";
   	   }
   	}
   }
   #}

   #@Instance = ("UF1", "UF2", "UF3", "UF4", "UF5", "UF6", "UF7", "BT1", "BT2", "BT3", "BT4", "BT5", "BT6", "BT7", "BT8");
@Instance = ("BT1", "BT2", "BT3", "BT4", "BT5", "BT6", "BT7", "BT8");
my $nobj=2;
$CR = 0.75;
$F = 0.75;

   foreach(@Instance)
   {
   	   my $nvar=30;
   	   for(my $Sed = 1; $Sed <=35; $Sed++) ##Realizar 35 ejecuciones con distintas semilla de cada instancia..
   	   {
		   #print $fout "~$PathAlgorithm/moea $PathAlgorithm $_ $Sed $nobj $pops $max_nfes  $neighboursize $prob $nvar $Di\n";
   	   	print $fout "~$PathAlgorithm/moea $PathAlgorithm $_ $Sed $nobj $pops $max_nfes $neighboursize $prob $limit $CR $F $nvar\n";
   	   }
   }

   #@Instance = ("UF8", "UF9", "UF10", "BT9");
@Instance = ("BT9");
$nobj=3;
$CR = 0.5;
$F = 0.5;

   foreach(@Instance)
   {
   	   my $nvar=30;
   	
   	   for(my $Sed = 1; $Sed <=35; $Sed++) ##Realizar 35 ejecuciones con distintas semilla de cada instancia..
   	   {
		   #print $fout "~$PathAlgorithm/moea $PathAlgorithm $_ $Sed $nobj $pops $max_nfes $neighboursize $prob $nvar $Di\n";
   	   	print $fout "~$PathAlgorithm/moea $PathAlgorithm $_ $Sed $nobj $pops $max_nfes $neighboursize $prob $limit $CR $F $nvar\n";
   	   }
   }
