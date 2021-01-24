#Con este script se genera la lista de ejecuciones....
#!/usr/bin/perl
use strict;
use warnings;
use Getopt::Long;
my $file = "ExecutionFileDiversity2";
my $fout;
open($fout, '>' ,$file);
my $Path = `cd ..; pwd`; #   "/home/joel.chacon/Chacon/DE_diversity/CEC2018/";
chomp $Path;

my $Sed=0;
my $NEjecutions=35;

my @Algorithms= ("NSGAII_main");
my @DirAlgorithms= ("NSGAII");
foreach my $b(("1.0", "0.5", "0.25", "0.125", "0.0625", "0.03125", "0.015625", "0.0078125", "0.00390625", "0.001953125", "0.000976562"))
{
   my $CR = 0.75;
   my $F = 0.5;
#   my @NVariables = ("24", "24", "24", "24", "24", "24", "24", "24", "24","6", "11", "11", "11", "11", "11", "21");
   my @Instances = ("WFG1","WFG2", "WFG3", "WFG4", "WFG5", "WFG6", "WFG7", "WFG8", "WFG9","DTLZ1","DTLZ2", "DTLZ3", "DTLZ4", "DTLZ5", "DTLZ6", "DTLZ7"); ##La ZDT5 es para cadenas binarias.....
#   @Algorithms= ("NSGAII_main");
#   @DirAlgorithms= ("NSGAII");
#   
#   for(my $i = 0; $i < scalar(@Algorithms); $i++ )
#   {
#           my $contv = 0;
#   	foreach my $Instance(@Instances) ##Para cada instancia WFG...
#   	{
#   		for($Sed = 1; $Sed <=35; $Sed++) ##Realizar 35 ejecuciones con distintas semillas de cada instancia..
#   		{
#   			print $fout "$Path/bin/main/".$Algorithms[$i]." $Instance Real ".$NVariables[$contv]." 2 $Sed $Path/".$DirAlgorithms[$i]." $CR $F \n";
#   		}
#   	   $contv++;
#   	}
#   }
#@Instances= ("UF1", "UF2", "UF3", "UF4", "UF5", "UF6", "UF7"); 
    @Instances= ("BT1", "BT2", "BT3", "BT4", "BT5", "BT6", "BT7", "BT8"); 
   for(my $i = 0; $i < scalar(@Algorithms); $i++ )
   {
   	foreach my $Instance(@Instances) 
   	{
   		for($Sed = 1; $Sed <=35; $Sed++) ##Realizar 35 ejecuciones con distintas semillas de cada instancia..
   		{
   
   			print $fout "$Path/bin/main/".$Algorithms[$i]." $Instance Real 30 2 $b $Sed $Path/".$DirAlgorithms[$i]." $CR $F \n";
   		}
   	}
   
   }
   
   #   @Instances = ("WFG1","WFG2", "WFG3", "WFG4", "WFG5", "WFG6", "WFG7", "WFG8", "WFG9","DTLZ1","DTLZ2", "DTLZ3", "DTLZ4", "DTLZ5", "DTLZ6", "DTLZ7"); ##La ZDT5 es para cadenas binarias.....
   #   @NVariables = ("24", "24", "24", "24", "24", "24", "24", "24", "24","7", "12", "12", "12", "12", "12", "22");
   $CR = 0.0;
   $F = 0.25;

   #   for(my $i = 0; $i < scalar(@Algorithms); $i++ )
   #   {
   #           my $contv = 0;
   #   	foreach my $Instance(@Instances) ##Para cada instancia WFG...
   #   	{
   #   		for($Sed = 1; $Sed <=35; $Sed++) ##Realizar 35 ejecuciones con distintas semillas de cada instancia..
   #   		{
   #   			print $fout "$Path/bin/main/".$Algorithms[$i]." $Instance Real ".$NVariables[$contv]." 3 $Sed $Path/".$DirAlgorithms[$i]." $CR $F\n";
   #   		}
   #   	   $contv++;
   #   	}
   #   }
   
   
   #   @Instances= ("UF8", "UF9", "UF10"); 
   @Instances= ("BT9"); 
   for(my $i = 0; $i < scalar(@Algorithms); $i++ )
   {
   	foreach my $Instance(@Instances) 
   	{
   		for($Sed = 1; $Sed <=35; $Sed++) ##Realizar 35 ejecuciones con distintas semillas de cada instancia..
   		{
   			print $fout "$Path/bin/main/".$Algorithms[$i]." $Instance Real 30 3 $b $Sed $Path/".$DirAlgorithms[$i]." $CR $F\n";
   		}
   	}
   
   }

 }
