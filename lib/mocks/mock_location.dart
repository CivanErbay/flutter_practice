import '../models/location.dart';
import '../models/location_fact.dart';

// We are going to extend Location Class meaning we use all the properties and function but we are going to extend it by fetchAny Method
// Angle-brackets we define a list of locations facts <LocationFact>[]
class MockLocation extends Location {
  MockLocation({required super.name, required super.url, required super.facts});

  //static because we dont want to create an instance of this class and its final because we dont want to reassign it
  static final List<Location> locations = [
    Location(
      name: "Cairo",
      url:
          'https://upload.wikimedia.org/wikipedia/commons/1/11/Cairo%2C_Egypt_%2846845880222%29.jpg',
      facts: <LocationFact>[
        LocationFact(
            title: 'Located in Egypt',
            text:
                'Cairo, the bustling capital of Egypt, is a vibrant metropolis steeped in history, where ancient wonders like the pyramids coexist with modern urban life along the banks of the Nile.'),
        LocationFact(
            title: 'How to Get There',
            text:
                'You can reach Cairo by flying into Cairo International Airport, which serves as a major hub for both domestic and international flights.')
      ],
    ),
    Location(
      name: "Paris",
      url:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Paris_-_Eiffelturm_und_Marsfeld2.jpg/1280px-Paris_-_Eiffelturm_und_Marsfeld2.jpg',
      facts: <LocationFact>[
        LocationFact(
            title: 'Located in France',
            text:
                'Paris, the capital of France, is renowned for its romantic ambiance, historic landmarks, and artistic heritage.'),
        LocationFact(
            title: 'How to Get There',
            text:
                'You can reach Paris by flying into Charles de Gaulle Airport or Orly Airport, which are the main international airports serving the city.'),
      ],
    ),
    Location(
      name: "Tokyo",
      url:
          'https://upload.wikimedia.org/wikipedia/commons/0/06/Tokyo_Tower_and_Tokyo_Sky_Tree_-_night_view_from_Sumida_River_%28HDR%29.jpg',
      facts: <LocationFact>[
        LocationFact(
            title: 'Located in Japan',
            text:
                'Tokyo, the capital of Japan, is a bustling metropolis known for its futuristic technology, vibrant pop culture, and historic temples.'),
        LocationFact(
            title: 'How to Get There',
            text:
                'You can reach Tokyo by flying into Tokyo Haneda Airport or Narita International Airport, which are the two main airports serving the city.'),
      ],
    ),
    Location(
      name: "Rome",
      url:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Roma_BW_2013-05-05_15-40-34_DxO.jpg/1280px-Roma_BW_2013-05-05_15-40-34_DxO.jpg',
      facts: <LocationFact>[
        LocationFact(
            title: 'Located in Italy',
            text:
                'Rome, the capital of Italy, is a city steeped in history, with iconic landmarks such as the Colosseum, Vatican City, and the Pantheon.'),
        LocationFact(
            title: 'How to Get There',
            text:
                'You can reach Rome by flying into Leonardo da Vinci–Fiumicino Airport, which is the main international airport serving the city.'),
      ],
    ),
    Location(
      name: "New York City",
      url:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Manhattan%2C_New_York_City%2C_New_York%2C_United_States.jpg/1280px-Manhattan%2C_New_York_City%2C_New_York%2C_United_States.jpg',
      facts: <LocationFact>[
        LocationFact(
            title: 'Located in United States',
            text:
                'New York City, often simply referred to as NYC, is the most populous city in the United States.'),
        LocationFact(
            title: 'How to Get There',
            text:
                'You can reach New York City by flying into John F. Kennedy International Airport, LaGuardia Airport, or Newark Liberty International Airport, which are the main airports serving the city.'),
      ],
    ),
    Location(
      name: "Sydney",
      url:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Sydney_Opera_House_-_Dec_2008.jpg/1280px-Sydney_Opera_House_-_Dec_2008.jpg',
      facts: <LocationFact>[
        LocationFact(
            title: 'Located in Australia',
            text:
                'Sydney, the capital of New South Wales, is one of Australia\'s largest cities, known for its iconic Sydney Opera House, beautiful harbor, and vibrant cultural scene.'),
        LocationFact(
            title: 'How to Get There',
            text:
                'You can reach Sydney by flying into Sydney Airport, which is the main international airport serving the city.'),
      ],
    ),
  ];

  static Location FetchAny() {
    return MockLocation.locations[0];
  }

  static List<Location> FetchAll() {
    return MockLocation.locations;
  }

  static Location fetch(int index) {
    return MockLocation.locations[index];
  }
}
