#!/usr/bin/perl

=head1 NAME

two-second-pause.pl

=head1 SYNOPSIS

<load Rhythmbox playlist>

Run: ./two-second-pause.pl

<press play>

=head1 DESCRIPTION

Attempts to detect a track change in Rhythmbox and insert a 2-second pause at
those points. It uses rhythmbox-client in an endless loop, this causes a high
load average due to continual chatter to the dbus daemon. It is mainly to be
used with minidisc recorders connected via an analogue or digital connection
while a playlist is played. Occasionally two trackmarks will be inserted right
next to each other. However the goal of marking each song for ease of tracking
during playback is achieved.

In it's terminal window, two-second-pause.pl will output the currently playing
track at each title change point.

Change the $PAUSE parameter (unit of seconds) if you wish to produce a longer
pause.

=cut

use strict;

my $VERSION = 1.1;
my $PAUSE = 2;
my $NOT_PLAYING = 'Not playing';
my $old_title;

while(1)
{
	my $title = `rhythmbox-client --print-playing-format "%tt" 2>/dev/null`;
	chomp($title);

	if(not defined $old_title)
	{
		$old_title = $title;
		print "NOW PLAYING\t[$title]\n";
	}
	elsif($title ne $old_title)
	{
		if($title eq $NOT_PLAYING)
		{
			print "EXIT\n";
			last;
		}
		else
		{
			`rhythmbox-client --pause`;
			sleep $PAUSE;
			`rhythmbox-client --play`;
			$old_title = $title;
			print "TITLE CHANGE\t[$title]\n";
		}
	}
}

=head1 AUTHOR

Imran Chaudhry, <ichaudhry@gmail.com>

=head1 COPYRIGHT

This program is free software, you can redistribute it and/or modify it under
the same terms as Perl itself.

=cut
