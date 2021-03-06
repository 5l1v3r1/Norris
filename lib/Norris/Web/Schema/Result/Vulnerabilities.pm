package Norris::Web::Schema::Result::Vulnerabilities;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("vulnerabilities");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "type",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "input",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-11-19 13:46:48
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:J6QZVCs6kXy563wuwstwsA

__PACKAGE__->has_many(
    "point_of_interest_vulnerability",
    "Norris::Web::Schema::Result::PointOfInterestVulnerability",
    { "foreign.vulnerability_id" => "self.id" },
);

__PACKAGE__->many_to_many('points_of_interest','point_of_interest_vulnerability','point_of_interest');

# You can replace this text with custom content, and it will be preserved on regeneration
1;
