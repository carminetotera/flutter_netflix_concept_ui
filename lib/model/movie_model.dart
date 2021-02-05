class Movie {
  String imageUrl;
  String title;
  String categories;
  int year;
  String country;
  int length;
  String description;
  List<String> screenshots;

  Movie({
    this.imageUrl,
    this.title,
    this.categories,
    this.year,
    this.country,
    this.length,
    this.description,
    this.screenshots,
  });
}

final List<Movie> movies = [
  Movie(
    imageUrl: 'assets/images/suicide_squad.jpg',
    title: 'Suicide Squad',
    categories: 'Adventure, Action',
    year: 2016,
    country: 'USA',
    length: 123,
    description:
        "In the one-year aftermath of Superman's death, intelligence officer Amanda Waller convinces Washington, D.C. officials to allow her to assemble Task Force X, a team of dangerous criminals imprisoned at Belle Reve Special Security Barracks...",
    screenshots: [
      'assets/images/suicide_squad_1.jpg',
      'assets/images/suicide_squad_2.jpg',
      'assets/images/suicide_squad_3.jpg',
    ],
  ),
  Movie(
    imageUrl: 'assets/images/jumanji.jpeg',
    title: 'Jumanji: Welcome to the Jungle',
    categories: 'Fantasy, Adventure',
    year: 2018,
    country: 'USA',
    length: 129,
    description:
        "In 1996, Brantford, New Hampshire, teenager Alex Vreeke receives a board game called Jumanji from his father who discovered it half buried in sand at the coast while jogging.[a] Uninterested, Alex sets it aside, only to find it transformed into a video game cartridge later that night. Opting to play the game, he is suddenly sucked inside upon choosing a character. His disappearance results in his father becoming despondent and his home becoming known as the freak house' and falling into disrepair. Twenty-one years later, four Brantford High School students – rebellious Martha Kaply, shallow Bethany Walker, awkward Spencer Gilpin, and athlete Anthony 'Fridge' Johnson – are sent by Principal Bentley to clean the school's basement for detention – Bethany for talking on her phone during a quiz, Martha for objecting to participating in physical education, and Spencer and Fridge for the former writing the latter's essay assignment for him as it was considered cheating. Fridge discovers Alex's discarded video game system, which he and Spencer decide to play and encourage the girls to join them. Upon starting the game, they are sucked into Jumanji, landing in a jungle as their chosen characters – Spencer as muscular explorer and archaeologist Dr. Xander 'Smolder' Bravestone; Fridge as diminutive zoologist Franklin 'Mouse' Finbar; Martha as commando and martial arts expert Ruby Roundhouse; and Bethany as male cartographer and paleontologist Professor Sheldon 'Shelly' Oberon.",
    screenshots: [
      'assets/images/jumanji_1.jpg',
      'assets/images/jumanji_2.jpeg',
      'assets/images/jumanji_3.jpg',
    ],
  ),
  Movie(
    imageUrl: 'assets/images/madagascar.jpg',
    title: 'Madagascar',
    categories: 'Adventure',
    year: 2005,
    country: 'USA',
    length: 86,
    description:
        "At the Central Park Zoo, Marty the zebra celebrates his tenth birthday but has grown bored with his daily routine and longs to experience the wild. Marty's best friend is Alex the lion, who enjoys showing off for the public and his celebrity status as 'the king of New York'. Alex attempts to cheer Marty up, but Marty, still unsatisfied, learns that the zoo's penguins—Skipper, Kowalski, Rico, and Private—are trying to escape, and follows them out. Alex, Melman the giraffe, and Gloria the hippopotamus pursue Marty and attempt to convince him to return. The four, along with the penguins and two chimpanzees named Mason and Phil, converge at Grand Central Station where the authorities sedate them using tranquilizer guns. Under pressure from anti-captivity activists, the zoo is forced to ship the escaped animals by sea to a Kenyan wildlife preserve. During their travels, the penguins escape and take over the ship, intent on taking it to Antarctica. Their antics on the bridge cause the crates containing Alex, Marty, Melman, and Gloria to fall overboard and wash ashore on Madagascar.",
    screenshots: [
      'assets/images/madagascar_1.jpg',
      'assets/images/madagascar_2.jpeg',
      'assets/images/madagascar_3.png',
    ],
  ),
];

final List<String> labels = [
  'Discover',
  'Categories',
  'Specials',
  'New',
];

final List<String> imageLabel = [
  'assets/images/avengers.jpeg',
  'assets/images/minions.jpg',
  'assets/images/casa_di_carta.jpg',
  'assets/images/avatar.jpg',
];

final List<String> myList = [
  'assets/images/visavis.jpg',
  'assets/images/gotham.jpg',
  'assets/images/friends.jpg',
  'assets/images/narcos.jpg',
  'assets/images/lupin.jpg',
];

final List<String> popular = [
  'assets/images/bojack.jpg',
  'assets/images/money_heist.jpg',
  'assets/images/the_crown.jpg',
  'assets/images/orange.jpg',
];
