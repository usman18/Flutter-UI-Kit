import 'model/tour.dart';

class ToursProvider {
  int _tourNumber = 0;

  final List<Tour> _tours = [
    Tour(tourName: "Red Autumnal Leaves", tourTime: "3h", price: "\$15", placesCount: "12", closeHrs: "23", rating: 4.3,
      coverPic: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F9b%2Fa0%2Fc7%2F9ba0c7c67ff533d3469b6d27c481f377.jpg&f=1&nofb=1"
    ),
    Tour(tourName: "Spring in Amsterdam", tourTime: "4h", price: "\$20", placesCount: "4", closeHrs: "20", rating: 4.2,
      coverPic: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.eatingeurope.com%2Fwp-content%2Fuploads%2F2018%2F06%2FAmsterdam-canals-in-springtime.jpg&f=1&nofb=1"
    ),
    Tour(tourName: "Sunset Resort", tourTime: "5h", price: "\$18", placesCount: "2", closeHrs: "23", rating: 4.5,
      coverPic: "https://farm4.staticflickr.com/3344/3579647660_18989d1921_b.jpg"
    ),
    Tour(tourName: "Island", tourTime: "2h", price: "\$45", placesCount: "1", closeHrs: "12", rating: 4.2,
      coverPic: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.VQgRzwj5hBhFwT3QB9ucegHaLI%26pid%3DApi&f=1"
    ),
    Tour(tourName: "Out of the Blue", tourTime: "4h", price: "\$35", placesCount: "5", closeHrs: "22", rating: 4.0,
      coverPic: "https://www.californiabeaches.com/wp-content/uploads/2014/09/bigs-Chimney-Rock-Beach-Point-Reyes-National-Seashore-CA-160900316-Large.jpg"
    ),

  ];

  Tour nextTour() {
    _tourNumber = ++_tourNumber % _tours.length;
    Tour tour =  _tours[_tourNumber];
    return tour;
  }

  Tour previousTour() {
    _tourNumber = _tourNumber - 1 < 0 ? _tours.length - 1 : _tourNumber - 1;
    return _tours[_tourNumber];
  }



}