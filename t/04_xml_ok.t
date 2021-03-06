#!/usr/bin/env perl
# Copyright 2016 Frank Breedijk
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ------------------------------------------------------------------------------
# This little script checks all files te see if they are perl files and if so 
# ------------------------------------------------------------------------------

use strict;
use Test::More;
use XML::Simple;
use Data::Dumper;

my $tests = 0;

my @files = split(/\n/, `find . -type f`);

foreach my $file ( @files ) {
	if ( $file =~ /\.xml$/i || $file =~ /\.xml\..*example$/	) { #skip hidden files
		my $ref;
		eval { $ref = XMLin($file, KeyAttr => []) };
		is($@, '', "XML file $file parses");
		$tests++;
	}
}
done_testing($tests);
