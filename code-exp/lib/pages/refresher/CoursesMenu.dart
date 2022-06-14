class Course {
  final String name;
  final String abbr;

  Course({required this.name, required this.abbr});
}

var course = <Course>[
  Course(
    name: 'Basic CPR Course',
    abbr: 'CPR',
  ),
  Course(
    name: 'Soldier Fundementals',
    abbr: 'SOFUN',
  ),
  Course(
    name: 'Vehicle Commander \nRefresher Course',
    abbr: 'VCR',
  ),
  Course(
    name: 'Map Planning Exercise',
    abbr: 'MAPEX',
  ),
];
