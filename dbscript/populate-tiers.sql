START TRANSACTION;

insert ignore bureau set description = 'Operations Support';
insert ignore bureau set description = 'Planning & Analysis';
insert ignore bureau set description = 'Administration & Support';
insert ignore bureau set description = 'Field Operations';

insert ignore division set description='Special Operations', bureau_id='1';
insert ignore division set description='Investigations', bureau_id='1';
insert ignore division set description='Community Services & Support', bureau_id='4';
insert ignore division set description='Patrol Operations', bureau_id='4';
insert ignore division set description='(Administration and Support)', bureau_id='3';

insert ignore unit set description='Special Operations', division_id='1';
insert ignore unit set description='Special Events & Planning', division_id='1';
insert ignore unit set description='Special Investigations', division_id='1';
insert ignore unit set description='Criminal Investigations', division_id='2';
insert ignore unit set description='Administrative Services', division_id='5';
insert ignore unit set description='Training', division_id='5';
insert ignore unit set description='Support Services', division_id='5';
insert ignore unit set description='Communications', division_id='3';
insert ignore unit set description='Community Services', division_id='3';
insert ignore unit set description='Uniform Patrol (admin)', division_id='4';
insert ignore unit set description='First Platoon', division_id='4';
insert ignore unit set description='Second Platoon', division_id='4';
insert ignore unit set description='Third Platoon', division_id='4';
insert ignore unit set description='Auxiliary', division_id='4';

insert ignore squad set description='K-9 / Mounted Patrol', unit_id='1';
insert ignore squad set description='Tactical Response', unit_id='1';
insert ignore squad set description='Special Events', unit_id='2';
insert ignore squad set description='Strategic Traffic Enforcement', unit_id='2';
insert ignore squad set description='Special Investigations', unit_id='3';
insert ignore squad set description='Homicide & Robbery', unit_id='4';
insert ignore squad set description='Property Crimes', unit_id='4';
insert ignore squad set description='Special Victims', unit_id='4';
insert ignore squad set description='PTO Coordinator', unit_id='6';
insert ignore squad set description='Property & Evidence', unit_id='7';
insert ignore squad set description='Police Records', unit_id='7';
insert ignore squad set description='PSA-1 / PSA-3', unit_id='9';
insert ignore squad set description='Crime Prevention / PSA-2', unit_id='9';
insert ignore squad set description='PSA-4 / PSA-5', unit_id='9';

COMMIT