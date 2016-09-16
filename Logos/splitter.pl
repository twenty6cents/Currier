# Line-delimited file parser
# file format:
#	*\w\s*\n\:*\n\t*\w


sub MAIN($file, $dest_dir) {
	my @lines;
	my @S;

	my $book;
	my $chapter;
	my $destination;
	my $output;
	my @ref;
	my $text;
	my $verse;

	my $prev_chapter = 0;


	@lines = $file.IO.lines;

	for @lines -> $line {
		@S = $line.split(/\t/);

		$book = @S[0];
		@ref = @S[1].split(":");
		$text = @S[2];

		$chapter = @ref[0].fmt('%02i');
		$verse = @ref[1];


		$output = open("$dest_dir\\$chapter.amt", :a);

		$output.say($text);

		$prev_chapter = $chapter;
	}
}

