package RT::Extension::HistoryFilter;

use 5.008003;
use strict;
use warnings;

our $VERSION = '1.00';

my @types = sort qw(Create Status CommentEmailRecord EmailRecord Correspond 
    Comment CustomField Untake Take Force Steal Give AddWatcher DelWatcher
    Subject AddLink DeleteLink Told Set PurgeTransaction
    AddReminder OpenReminder ResolveReminder);

$RT::Config::META{'HistoryFilterTypes'} = {
    Section         => 'Ticket display',
    Overridable     => 1,
    SortOrder       => 99,
    Widget          => '/Widgets/Form/Select',
    WidgetArguments => {
        Description => 'Transaction types that will be shown on the ticket display page', #loc
        Values      => [ @types ],
        Multiple    => 1,
        },
};

=head1 NAME

RT::Extension::HistoryFilter - Filter history by type on ticket display page

=head1 DESCRIPTION

This plugin filter the history on the ticket display page by transaction types
that are defined in the user preferences.
By default it shows only the transaction types create, correspond and comment
that are defined in etc/HistoryFilter_Config.pm.

The history page shows always the full history.

It was created after an article in the Best Practical wiki and
an discussion in the rt-user mailing list (look at SEE ALSO) and
is an extended version of RT::Extension::BriefHistory

=head1 INSTALLATION

=over

=item perl Makefile.PL

=item make

=item make install

=item Edit your /opt/rt4/etc/RT_SiteConfig.pm

Add this line:

    Set(@Plugins, qw(RT::Extension::HistoryFilter));

or add C<RT::Extension::HistoryFilter> to your existing C<@Plugins> line.

=item Clear your mason cache

    rm -rf /opt/rt4/var/mason_data/obj/*

=item Restart your webserver

=back

=head1 AUTHOR

Christian Loos <cloos@netsandbox.de>

=head1 LICENCE AND COPYRIGHT
 
Copyright (C) 2010-2013, Christian Loos.
 
This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<http://bestpractical.com/rt/>

L<http://wiki.bestpractical.com/view/HideTransactions>

L<http://lists.bestpractical.com/pipermail/rt-users/2010-May/064649.html>

=cut

1;
