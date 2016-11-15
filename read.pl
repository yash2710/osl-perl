use Firebase;
my $fb=Firebase->new(firebase => 'chat-perl',
auth => {secret => 'rrvWXn5AYHgFBjb6REDQ6r3v3IxjMLa4E8mh9kES',
data => {uid => 'xxx', username => 'fred'}, admin => \1
});

my $msgs = $fb->get('chats');
#my $r = $fb -> put('foo',{this=>'that'});
foreach (sort reverse keys %{$msgs}){
	my $key = $msgs->{$_};
	foreach (sort keys %{$key}){
		if($_ eq "email"){
			print $key->{$_}." said \n";
		}
		if($_ eq "msg"){
			print "\"".$key->{$_}."\" \n";
		}
		if($_ eq "timestamp"){
			print "on ".localtime($key->{$_})."\n";
		}
	}
}
print('Do you want to send a message? y/n ');
my $ch = <STDIN>;
chomp($ch);
if($ch eq "y"){

	print('Enter your Email'."\n");
	$email = <STDIN>;
	chomp($email);
	#my $pattern = "^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})\$";
	#my $regex = eval { $email/$pattern/ };
	#die "invalid regex: $@" if $@;
	print('Enter your Message'."\n");
	$input = <STDIN>;
	chomp($input);
	my $result = $fb->post('chats', {email=>$email, msg=>$input, timestamp=>time()});

}else{
	print "Thank You";
}
