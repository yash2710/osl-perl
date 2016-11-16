use Firebase;
my $fb=Firebase->new(firebase => 'chat-perl',
auth => {secret => 'rrvWXn5AYHgFBjb6REDQ6r3v3IxjMLa4E8mh9kES',
data => {uid => 'xxx', username => 'yash'}, admin => \1
});
print('Enter your mail ID'."\n");
$email = <STDIN>;
chomp($email);
print('Enter your Message'."\n");
$input = <STDIN>;
chomp($input);
my $result = $fb->post('chats', {email=>$email, msg=>$input, timestamp=>time()});
