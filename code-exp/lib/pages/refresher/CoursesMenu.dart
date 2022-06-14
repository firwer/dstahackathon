class Course {
  final String name;
  final String abbr;
  final String page;

  Course({required this.name, required this.abbr, required this.page});
}

var course = <Course>[
  Course(
    name: 'Basic CPR Course',
    abbr: 'CPR',
    page: '/courses/cpr',
  ),
  Course(
    name: 'Soldier Fundementals',
    abbr: 'SOFUN',
    page: '/courses/sofun',
  ),
  Course(
    name: 'Vehicle Commander Refresher',
    abbr: 'VCR',
    page: '/courses/vcr',
  ),
  Course(
    name: 'Map Planning Exercise',
    abbr: 'MAPEX',
    page: '/courses/mapex',
  ),
];
