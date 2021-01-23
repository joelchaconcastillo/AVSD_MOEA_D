#Con este script se genera la lista de ejecuciones....
#!/usr/bin/perl
use strict;
use warnings;
use Getopt::Long;
my $file = "ExecutionFileDiversity";
my $fout;
open($fout, '>' ,$file);
my $Instance=0;
my $Sed=0;


my @Conf =(
"UF1 30 2",
"UF2 30 2",
"UF3 30 2",
"UF4 30 2",
"UF5 30 2",
"UF6 30 2",
"UF7 30 2",
#"UF8 30 3",
#"UF9 30 3",
#"UF10 30 3",
#"R2_DTLZ2_M5 30 5",
##"R2_DTLZ3_M5 30 5",
##"WFG1_M5     30 5",
"WFG1 24 2",
"WFG2 24 2",
"WFG3 24 2",
"WFG4 24 2",
"WFG5 24 2",
"WFG6 24 2",
"WFG7 24 2",
"WFG8 24 2",
"WFG9 24 2",
"DTLZ1 6 2",
"DTLZ2 11 2",
"DTLZ3 11 2",
"DTLZ4 11 2",
"DTLZ5 11 2",
"DTLZ6 11 2",
"DTLZ7 21 2");
#"WFG1 24 3",
#"WFG2 24 3",
#"WFG3 24 3",
#"WFG4 24 3",
#"WFG5 24 3",
#"WFG6 24 3",
#"WFG7 24 3",
#"WFG8 24 3",
#"WFG9 24 3",
#"DTLZ1 7 3",
#"DTLZ2 12 3",
#"DTLZ3 12 3",
#"DTLZ4 12 3",
#"DTLZ5 12 3",
#"DTLZ6 12 3",
#"DTLZ7 22 3");

my $Path = "/home/joel.chacon/MOEAFBINARIES/MOEAFramework-2.12/build/MOEAFramework-2.12/";
my @G_CR = ("0.75");
my @G_F = ("0.5");
foreach my $CR(@G_CR)
{
  foreach my $F(@G_F)
  {
   foreach my $configuration (@Conf)
   {
   	for(my $Sed = 1; $Sed <=35; $Sed++) ##Realizar 35 ejecuciones con distintas semilla de cada instancia..
   	{
   	      my @configuration2 = split ' ', $configuration;#~ s/ /_/g; 
   	      my $v = $configuration2[1];
	      print $fout "/home/joel.chacon/Final_Experiment_Decomposition/R2-EMOA-L-Poly/r2emoacode-de/matlab_batcher.sh R2EMOA ".$configuration2[0].",$Sed,".$configuration2[2].",".$configuration2[1].",".$CR.",".$F." \\'".$configuration2[0]."\\',struct\\(\\'nObj\\',\\'".$configuration2[2]."\\',\\'nVar\\',\\'".$configuration2[1]."\\',\\'seed\\',\\'".$Sed."\\',\\'f_name\\',\\'/home/joel.chacon/Final_Experiment_Decomposition/R2-EMOA-L-Poly/Results/".$configuration2[0]."_".$configuration2[2]."_".$Sed."_nvar_".$configuration2[1]."_CR_".$CR."_F_".$F."\\',\\'useDE\\',\\'true\\'\\,\\'DE_CombinedCR\\',\\'false\\',\\'DE_CR\\',\\'".$CR."\\',\\'DE_F\\',\\'".$F."\\',\\'maxEval\\',\\'25000000\\'\\) \n";

	      #print $fout $configuration2[0]."_".$configuration2[2]."_".$Sed."_nvar_".$configuration2[1]."_CR_".$CR."_F_".$F."\n";
   
   	}
   }
  }
}
	
@Conf =(
	#"UF1 30 2",
	#"UF2 30 2",
	#"UF3 30 2",
	#"UF4 30 2",
	#"UF5 30 2",
	#"UF6 30 2",
	#"UF7 30 2",
"UF8 30 3",
"UF9 30 3",
"UF10 30 3",
#"R2_DTLZ2_M5 30 5",
##"R2_DTLZ3_M5 30 5",
##"WFG1_M5     30 5",
#"WFG1 24 2",
#"WFG2 24 2",
#"WFG3 24 2",
#"WFG4 24 2",
#"WFG5 24 2",
#"WFG6 24 2",
#"WFG7 24 2",
#"WFG8 24 2",
#"WFG9 24 2",
#"DTLZ1 6 2",
#"DTLZ2 11 2",
#"DTLZ3 11 2",
#"DTLZ4 11 2",
#"DTLZ5 11 2",
#"DTLZ6 11 2",
#"DTLZ7 21 2",
"WFG1 24 3",
"WFG2 24 3",
"WFG3 24 3",
"WFG4 24 3",
"WFG5 24 3",
"WFG6 24 3",
"WFG7 24 3",
"WFG8 24 3",
"WFG9 24 3",
"DTLZ1 7 3",
"DTLZ2 12 3",
"DTLZ3 12 3",
"DTLZ4 12 3",
"DTLZ5 12 3",
"DTLZ6 12 3",
"DTLZ7 22 3");

@G_CR = ("0.5");
@G_F = ("0.5");
foreach my $CR(@G_CR)
{
  foreach my $F(@G_F)
  {
   foreach my $configuration (@Conf)
   {
   	for(my $Sed = 1; $Sed <=35; $Sed++) ##Realizar 35 ejecuciones con distintas semilla de cada instancia..
   	{
   	      my @configuration2 = split ' ', $configuration;#~ s/ /_/g; 
   	      my $v = $configuration2[1];
	      print $fout "/home/joel.chacon/Final_Experiment_Decomposition/R2-EMOA-L-Poly/r2emoacode-de/matlab_batcher.sh R2EMOA ".$configuration2[0].",$Sed,".$configuration2[2].",".$configuration2[1].",".$CR.",".$F." \\'".$configuration2[0]."\\',struct\\(\\'nObj\\',\\'".$configuration2[2]."\\',\\'nVar\\',\\'".$configuration2[1]."\\',\\'seed\\',\\'".$Sed."\\',\\'f_name\\',\\'/home/joel.chacon/Final_Experiment_Decomposition/R2-EMOA-L-Poly/Results/".$configuration2[0]."_".$configuration2[2]."_".$Sed."_nvar_".$configuration2[1]."_CR_".$CR."_F_".$F."\\',\\'useDE\\',\\'true\\'\\,\\'DE_CombinedCR\\',\\'false\\',\\'DE_CR\\',\\'".$CR."\\',\\'DE_F\\',\\'".$F."\\',\\'maxEval\\',\\'25000000\\'\\)\n";
	      #   	      print $fout $configuration2[0]."_".$configuration2[2]."_".$Sed."_nvar_".$configuration2[1]."_CR_".$CR."_F_".$F."\n";
   
   	}
   }
  }
}
	

exit;
####Scalablity
#######
#######
#####
#####
####
####my @Conf =(
####	"UF1 2",
####	"UF2 2",
####	"UF3 2",
####	"UF4 2",
####	"UF5 2",
####	"UF6 2",
####	"UF7 2",
####	"UF8 3",
####	"UF9 3",
####	"UF10 3",
####	"DTLZ1 2",
####	"DTLZ2 2",
####	"DTLZ3 2",
####	"DTLZ4 2",
####	"DTLZ5 2",
####	"DTLZ6 2",
####	"DTLZ7 2",
####	"DTLZ1 3",
####	"DTLZ2 3",
####	"DTLZ3 3",
####	"DTLZ4 3",
####	"DTLZ5 3",
####	"DTLZ6 3",
####	"DTLZ7 3");
####
####
####my @Variables= ("50","100","250", "500");#, "1000");
#####my @Variables= ("1000");
####
####my $Path = "/home/joel.chacon/MOEAFBINARIES/MOEAFramework-2.12/build/MOEAFramework-2.12/";
####
####foreach my $v (@Variables)
####{
####	foreach my $configuration (@Conf)
####	{
####		for(my $Sed = 1; $Sed <=35; $Sed++) ##Realizar 35 ejecuciones con distintas semilla de cada instancia..
####		{
####		      my @configuration2 = split ' ', $configuration;#~ s/ /_/g; 
####		      #my $v = $configuration2[1];
####		      #		      print $fout "/home/joel.chacon/R2MOEA/r2emoacode/matlab_batcher.sh R2EMOA ".$configuration2[0].",$Sed,".$configuration2[1].",".$v." \\'".$configuration2[0]."\\',struct\\(\\'nObj\\',\\'".$configuration2[1]."\\',\\'nVar\\',\\'".$v."\\',\\'seed\\',\\'".$Sed."\\',\\'f_name\\',\\'/home/joel.chacon/R2MOEA/Scalability/".$configuration2[0]."_".$configuration2[1]."_".$Sed."_nvar_".$v."\\'\\) \n";
####
####	              print $fout "/home/joel.chacon/R2MOEA/r2emoacode-de/matlab_batcher.sh R2EMOA ".$configuration2[0].",$Sed,".$configuration2[1].",".$v." \\'".$configuration2[0]."\\',struct\\(\\'nObj\\',\\'".$configuration2[1]."\\',\\'nVar\\',\\'".$v."\\',\\'seed\\',\\'".$Sed."\\',\\'f_name\\',\\'/home/joel.chacon/R2MOEA/Results-de-scalability/".$configuration2[0]."_".$configuration2[1]."_".$Sed."_nvar_".$v."\\',\\'useDE\\',\\'true\\'\\,\\'DE_CombinedCR\\',\\'false\\'\\) \n";
#####		      print $fout "/home/joel.chacon/R2MOEA/r2emoacode/matlab_batcher.sh R2EMOA ".$configuration2[0].",$Sed,".$configuration2[2].",".$configuration2[1]." \\'".$configuration2[0]."\\',struct\\(\\'nObj\\',\\'".$configuration2[2]."\\',\\'nVar\\',\\'".$configuration2[1]."\\',\\'seed\\',\\'".$Sed."\\',\\'f_name\\',\\'/home/joel.chacon/R2MOEA/ResultShortShortTerm/".$configuration2[0]."_".$configuration2[2]."_".$Sed."_nvar_".$configuration2[1]."\\'\\) \n";
####		}
####	}
####	
####}
#### @Variables= ("50","100","250", "500");#, "1000");
####
####@Conf =(
####"WFG1 2",
####"WFG2 2",
####"WFG3 2",
####"WFG4 2",
####"WFG5 2",
####"WFG6 2",
####"WFG7 2",
####"WFG8 2",
####"WFG9 2",
####"WFG1 3",
####"WFG2 3",
####"WFG3 3",
####"WFG4 3",
####"WFG5 3",
####"WFG6 3",
####"WFG7 3",
####"WFG8 3",
####"WFG9 3");
####
####
####
####foreach my $v (@Variables)
####{
####	foreach my $configuration (@Conf)
####	{
####		for(my $Sed = 1; $Sed <=35; $Sed++) ##Realizar 35 ejecuciones con distintas semilla de cada instancia..
####		{
####		      my @configuration2 = split ' ', $configuration;#~ s/ /_/g; 
####		      #my $v = $configuration2[1];
####	              print $fout "/home/joel.chacon/R2MOEA/r2emoacode-de/matlab_batcher.sh R2EMOA ".$configuration2[0].",$Sed,".$configuration2[1].",".$v." \\'".$configuration2[0]."\\',struct\\(\\'nObj\\',\\'".$configuration2[1]."\\',\\'nVar\\',\\'".$v."\\',\\'seed\\',\\'".$Sed."\\',\\'f_name\\',\\'/home/joel.chacon/R2MOEA/Results-de-scalability/".$configuration2[0]."_".$configuration2[1]."_".$Sed."_nvar_".$v."\\',\\'useDE\\',\\'true\\'\\,\\'DE_CombinedCR\\',\\'false\\'\\) \n";
####		      #		      print $fout "/home/joel.chacon/R2MOEA/r2emoacode/matlab_batcher.sh R2EMOA ".$configuration2[0].",$Sed,".$configuration2[1].",".$v." \\'".$configuration2[0]."\\',struct\\(\\'nObj\\',\\'".$configuration2[1]."\\',\\'nVar\\',\\'".$v."\\',\\'seed\\',\\'".$Sed."\\',\\'f_name\\',\\'/home/joel.chacon/R2MOEA/Scalability/".$configuration2[0]."_".$configuration2[1]."_".$Sed."_nvar_".$v."\\'\\) \n";
#####		      print $fout "/home/joel.chacon/R2MOEA/r2emoacode/matlab_batcher.sh R2EMOA ".$configuration2[0].",$Sed,".$configuration2[2].",".$configuration2[1]." \\'".$configuration2[0]."\\',struct\\(\\'nObj\\',\\'".$configuration2[2]."\\',\\'nVar\\',\\'".$configuration2[1]."\\',\\'seed\\',\\'".$Sed."\\',\\'f_name\\',\\'/home/joel.chacon/R2MOEA/ResultShortShortTerm/".$configuration2[0]."_".$configuration2[2]."_".$Sed."_nvar_".$configuration2[1]."\\'\\) \n";
####		}
####	}
####	
####}
