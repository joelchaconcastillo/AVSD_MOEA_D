#Con este script se genera la lista de ejecuciones....
#!/usr/bin/perl
use strict;
use warnings;
use Getopt::Long;
my $file = "ExecutionFileDiversity_d4";
my $fout;
open($fout, '>' ,$file);
my $Path =  `cd ..; pwd`;#"/home/joel.chacon/Current/MyResearchTopics/MOEA-D-Diversity/MOEAD-DE/vsd-moead-opt";
chomp $Path;

####Realizar la búsqueda del parámetro D inicial que proporcione mejores resultados
my $PathAlgorithm = $Path;

#for(my $Df=0.1; $Df <= 0.9; $Df+=0.2)
#{
#my @Instance = ("DTLZ1", "DTLZ2", "DTLZ3", "DTLZ4", "DTLZ5", "DTLZ6", "DTLZ7");
my $Di = 0.4;
my $Df = 0.5;
#my $pops=100;
my $max_nfes=25000000;
my $CR = 0.0;
my $F = 0.75;
my $nWeight = 500;
#foreach my $pops(("100", "200", "300", "400", "500")  )
foreach my $pops(("100"))
{
 my @Instance = ("DTLZ1", "DTLZ2", "DTLZ3", "DTLZ4", "DTLZ5", "DTLZ6", "DTLZ7");
#   foreach(@Instance)
#   {
#   	my $nvar;
#   	
#   	for(my $nobj = 2; $nobj <=3; $nobj++)
#   	{
#  	   if( $nobj eq 2 )
#	   {
#	        $nWeight= 501;
#	   }
#	   if( $nobj eq 3 )
#	   {
#	        $nWeight= 496;
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
#   	   	print $fout "$PathAlgorithm/Ejecutable $PathAlgorithm $_ $Sed $nobj $pops $nWeight $max_nfes $CR $F $nvar $Di $Df\n";
#   	   }
#   	}
#   }
# @Instance = ("minusDTLZ1", "minusDTLZ2", "minusDTLZ3", "minusDTLZ4");
#   foreach(@Instance)
#   {
#   	my $nvar;
#   	
#   	for(my $nobj = 2; $nobj <=3; $nobj++)
#   	{
#  	   if( $nobj eq 2 )
#	   {
#	        $nWeight= 501;
#	   }
#	   if( $nobj eq 3 )
#	   {
#	        $nWeight= 496;
#	   }
#      	   if($_ eq "minusDTLZ1")
#   	   {
#   	      $nvar=5+$nobj-1;
#   	   }
#   	   elsif($_ eq "minusDTLZ7")
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
#   	   	print $fout "$PathAlgorithm/Ejecutable $PathAlgorithm $_ $Sed $nobj $pops $nWeight $max_nfes $CR $F $nvar $Di $Df\n";
#   	   }
#   	}
#   }
#   @Instance = ("WFG1", "WFG2", "WFG3", "WFG4", "WFG5", "WFG6", "WFG7", "WFG8", "WFG9");
#      foreach(@Instance)
#      {
#      	my $nvar;
#      	
#      	for(my $nobj = 2; $nobj <=3; $nobj++)
#      	{
#           if( $nobj eq 2 )
#	   {
#	        $nWeight= 501;
#	   }
#	   if( $nobj eq 3 )
#	   {
#	        $nWeight= 496;
#	   }
#      	   my $k =4;# 2*($nobj-1);
#      	   my $l =20;# 24-$k;
#      	   $nvar=$l+$k;
#      	
#      	   for(my $Sed = 1; $Sed <=35; $Sed++) ##Realizar 35 ejecuciones con distintas semilla de cada instancia..
#      	   {
#      	   	print $fout "$PathAlgorithm/Ejecutable $PathAlgorithm $_ $Sed $nobj $pops $nWeight $max_nfes $CR $F $l $k $Di $Df\n";
#      	   }
#      	}
#      }
#   @Instance = ("minusWFG1", "minusWFG2", "minusWFG3", "minusWFG4", "minusWFG5", "minusWFG6", "minusWFG7", "minusWFG8", "minusWFG9");
#      foreach(@Instance)
#      {
#      	my $nvar;
#      	
#      	for(my $nobj = 2; $nobj <=3; $nobj++)
#      	{
#           if( $nobj eq 2 )
#	   {
#	        $nWeight= 501;
#	   }
#	   if( $nobj eq 3 )
#	   {
#	        $nWeight= 496;
#	   }
#      	   my $k =4;# 2*($nobj-1);
#      	   my $l =20;# 24-$k;
#      	   $nvar=$l+$k;
#      	
#      	   for(my $Sed = 1; $Sed <=35; $Sed++) ##Realizar 35 ejecuciones con distintas semilla de cada instancia..
#      	   {
#      	   	print $fout "$PathAlgorithm/Ejecutable $PathAlgorithm $_ $Sed $nobj $pops $nWeight $max_nfes $CR $F $l $k $Di $Df\n";
#      	   }
#      	}
#      }
 #@Instance = ("UF1", "UF2", "UF3", "UF4", "UF5", "UF6", "UF7", "BT1", "BT2", "BT3", "BT4", "BT5", "BT6", "BT7", "BT8");

   foreach my $b(("1.0", "0.5", "0.25", "0.125"))
   {
    @Instance = ("BT1", "BT2", "BT3", "BT4", "BT5", "BT6", "BT7", "BT8");
     my $nobj=2;
         foreach(@Instance)
         {
         	   my $nvar=30;
      	   $nWeight= 501;
         	   for(my $Sed = 1; $Sed <=35; $Sed++) ##Realizar 35 ejecuciones con distintas semilla de cada instancia..
         	   {
         	   	print $fout "$PathAlgorithm/Ejecutable $PathAlgorithm $_ $Sed $nobj $pops $nWeight $max_nfes $CR $F _ratiobias_$b $b $nvar $Di $Df\n";
         	   }
         }
#      @Instance = ("UF8", "UF9", "UF10", "BT9");
            @Instance = ("BT9");
            $nobj=3;
               foreach(@Instance)
               {
               	   my $nvar=30;
            	   $nWeight= 496;
               	   for(my $Sed = 1; $Sed <=35; $Sed++) ##Realizar 35 ejecuciones con distintas semilla de cada instancia..
               	   {
               	   	print $fout "$PathAlgorithm/Ejecutable $PathAlgorithm $_ $Sed $nobj $pops $nWeight $max_nfes $CR $F ratiobias_$b $b $nvar $Di $Df\n";
               	   }
               }
 }
}
