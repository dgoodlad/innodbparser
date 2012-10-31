#!/usr/bin/perl -w

use strict;

use InnoDBParser;
use DBI;
use DBD::mysql;
use Data::Dumper;

my $dbh = DBI->connect(
    "dbi:mysql:database=mysql;host=localhost",
    'root',
    'daggad'
);

my $parser = InnoDBParser->new;

my ($type, $name, $status) = $dbh->selectrow_array('SHOW ENGINE INNODB STATUS');
my $innodb_status = $parser->parse_status_text(
    $status,
    0,
);

print Dumper($innodb_status);

#print $innodb_status->{'sections'}->{'lg'}->{'log_ios_s'};
#print "\n";
#print $innodb_status->{'sections'}->{'lg'}->{'log_ios_s'};
#print "\n";

#my $status = <>;
#print $status;
