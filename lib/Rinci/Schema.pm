package Rinci::Schema;

use 5.010;
use strict;
use warnings;

our $VERSION = '1.1.32.1'; # VERSION

# only validates metadata v1.1

# Rinci::metadata
our $base = ['hash' => {
    # XXX handle: ignore keys prefixed with _
    # XXX handle: handle .alt.lang.* suffix
    req_keys => ['v'],
    keys => {
        v => ['float*' => {
            in => [1.1],
        }],

        default_lang => ['str' => {
            # XXX regex
            default => 'en_US',
        }],

        name => ['str*' => {
            # XXX regex
        }],

        summary => ['str*' => {
            # XXX warn if contains newline
        }],

        tags => ['array*' => {
            of => 'str*',
        }],

        links => ['array*' => {
            # XXX: schema for each link
            of => 'hash*',
        }],

        description => ['str*' => {
        }],

        text_markup => ['str' => {
            in => [qw/markdown org none/],
            default => 'none',
        }],

    },
}];

our $function = ['Rinci::metadata' => {
    '[merge+]keys' => {
        is_func => ['bool' => {
            default => 1,
        }],

        is_meth => ['bool' => {
            default => 0,
        }],

        is_class_meth => ['bool' => {
            default => 0,
        }],

        args => ['hash*' => {
            # XXX: regex for arg

            # XXX: schema for each arg

            #   XXX: known keys
            #          summary|description|tags|default_lang|
            #          schema|req|pos|greedy|
            #          completion|
            #          cmdline_aliases|
            #          cmdline_src

            #   XXX: there should only one argument with
            #         src=stdin/stdin_or_files.

            #   XXX: there should not be another argument with req=>1 + pos=>0,
            #        there must not be one if there is argument with src.
        }],

        args_as => ['str*' => {
        }],

        result => ['hash*' => {
            keys => {
                schema => 'schema*',
            },
        }],

        result_naked => ['bool' => {
            default => 0,
        }],

        examples => ['hash*' => {
            # XXX: schema for each example
        }],

        features => ['hash' => {
            default => {},
            keys => {
                reverse => 'bool',
                undo => 'bool',
                dry_run => 'bool',
                pure => 'bool',
                immutable => 'bool',
            },
        }],

        # XXX define this as 'Rinci::function::deps'
        deps => ['hash' => {
            default => {},
            keys => {
                env  => 'str*',
                exec => 'str*',
                code => 'str*',
                any  => ['array*' => {of=>'Rinci::function::deps*'}],
                all  => ['array*' => {of=>'Rinci::function::deps*'}],
                none => ['array*' => {of=>'Rinci::function::deps*'}],
            },
        }],

    },
}];

our $package = ['Rinci::metadata' => {
    '[merge+]keys' => {
    },
}];

our $variable = ['Rinci::metadata' => {
    '[merge+]keys' => {
    },
}];

1;
# ABSTRACT: Schemas for Rinci metadata


__END__
=pod

=head1 NAME

Rinci::Schema - Schemas for Rinci metadata

=head1 VERSION

version 1.1.32.1

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

