use warnings; 
use strict;
use LWP::Simple;
use WWW::Mechanize;
my $count = 0;

my $url = "http://www.spanishdict.com";


# gets the source code for the website and saves it to a file (close statement at the bottom of file)
	#my $page = get($url);

	#open(FILE, ">website.html");
	#print FILE $page; 

my $mech = WWW::Mechanize->new();
$mech->get($url);

my @links = $mech->find_all_images();

for my $link (@links) {
	my $urls = $link->url; 
	my $length = length($urls);
	my $next = substr($urls, $length - 3);


	if(!(substr($urls, 0, 7) eq "http://")) {
		$urls = "http://www.spanishdict.com/" . $urls;
	}
	getstore($urls, 'image' . $count . '.jpg');
	print "jpg saved successfully!\n";
	
	
	$count=$count+1;
	
}

# close (FILE);