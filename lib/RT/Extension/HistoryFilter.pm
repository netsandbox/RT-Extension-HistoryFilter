package RT::Extension::HistoryFilter;

use 5.008003;
use strict;
use warnings;

our $VERSION = '0.02';

my @types = sort qw(Create Status CommentEmailRecord EmailRecord Correspond 
    Comment CustomField Untake Take Force Steal Give AddWatcher DelWatcher
    Subject AddLink DeleteLink Told Set PurgeTransaction
    AddReminder OpenReminder ResolveReminder);

$RT::Config::META{'HistoryFilterTypes'} = {
    Section         => 'RT::Extension::HistoryFilter',
    Overridable     => 1,
    SortOrder       => 1,
    Widget          => '/Widgets/Form/Select',
    WidgetArguments => {
        Description => 'Transaction types that will be shown on the ticket display page', #loc
        Values      => [ @types ],
        Multiple    => 1,
        Size        => 5,
        },
    };

1;

__END__

=head1 NAME

RT::Extension::HistoryFilter - Filter history by type on ticket display page

=head1 SYNOPSIS

This plugin filter the history on the ticket display page by transaction types
that are defined in the user preferences.
By default it shows only the transaction types create, correspond and comment
that are defined in etc/HistoryFilter_Config.pm.

The history page shows always the full history.

It was created after an article in the Best Practical wiki and
an discussion in the rt-user mailing list (look at SEE ALSO) and
is an extended version of RT::Extension::BriefHistory

=head1 INSTALLATION

Installation instructions for RT-Extension-HistoryFilter:

	1. perl Makefile.PL
	2. make
	3. make install
	4. Add 'RT::Extension::HistoryFilter' to @Plugins in /opt/rt3/etc/RT_SiteConfig.pm
	5. Clear mason cache: rm -rf /opt/rt3/var/mason_data/obj
	6. Restart webserver

=head1 AUTHOR

Christian Loos <cloos@netsandbox.de>

=head1 COPYRIGHT AND LICENCE
 
Copyright (C) 2010-2011, Christian Loos.
 
This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<http://bestpractical.com/rt/>

L<http://wiki.bestpractical.com/view/HideTransactions>

L<http://lists.bestpractical.com/pipermail/rt-users/2010-May/064720.html>

=cut
