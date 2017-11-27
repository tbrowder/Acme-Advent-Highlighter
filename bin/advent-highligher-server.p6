
use Acme::Advent::Highlighter;

sub MAIN ($token? is copy, Bool :$wrap) {
    $token = $token
        // "token".IO.slurp
        // %*ENV<ACME_ADVENT_HIGHLIGHTER_TOKEN>
        // die 'Missing Gist token. Put it into file `token` or'
            ~ ' ACME_ADVENT_HIGHLIGHTER_TOKEN env var';

    my $content = "content".IO.slurp;
    my $hl = Acme::Advent::Highlighter.new: :token($token.trim);
    say 
    $hl.render: $content, :$wrap;
}
