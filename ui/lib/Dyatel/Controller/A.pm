package Dyatel::Controller::A;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

Dyatel::Controller::A - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub auto :Private
{
	my ( $self, $c ) = @_;
	unless(grep { $_ eq 'admin' } @{ $c->stash->{badges} }) {
		$c->response->status(403);
		my $msg = 'User '.$c->user->username.' is not admin';
		$c->log->error($msg." (".$c->request->method." request for /".$c->request->path." from ".$c->request->address.")");
		$c->response->body($msg);
		return 0;
	}
	return 1;
}

sub index :Path Args(0) {
	my( $self, $c ) = @_;

	my $href = $c->uri_for('/a/users/list');
	my $jsredir = << "***";
<html><head>
 <script type="text/javascript">
  document.location = "/a/spa";
 </script>
 <noscript>
  <meta http-equiv="refresh" content="0; url=$href">
 </noscript>
</head><body>
</body></html>
***
	$c->response->body( $jsredir );
}

sub spa :Local {
	my($self, $c) = @_;
	$c->stash(template => 'spa.tt', no_wrapper => 1);
}

=encoding utf8

=head1 AUTHOR

Vasily i. Redkin,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
