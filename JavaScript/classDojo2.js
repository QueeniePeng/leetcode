const S = 
'photo.jpg, Warsaw, 2013-09-05 14:08:15\nJay.png, London, 2015-06-20 15:13:22\nmyFriends.png, Warsaw, 2013-09-05 14:07:13\nEiffel.jpg, Paris, 2015-07-23 08:03:02\npisatower.jpg, Paris, 2015-07-22 23:59:59\nBOB.jpg, London, 2015-08-05 00:02:03\nnotredame.png, Paris, 2015-09-01 12:00:00\nme.jpg, Warsaw, 2013-09-06 15:40:22\na.png, Warsaw, 2016-02-13 13:33:50\nb.jpg, Warsaw, 2016-01-02 15:12:22\nc.jpg, Warsaw, 2016-01-02 14:34:30\nd.jpg, Warsaw, 2016-01-02 15:15:01\ne.png, Warsaw, 2016-01-02 09:49:09\nf.png, Warsaw, 2016-01-02 10:55:32\ng.jpg, Warsaw, 2016-02-29 22:13:11' 

// Warsaw02.jpg
// London1.png
// Warsaw01.png
// Paris2.jpg
// Paris1.jpg
// London2.jpg
// Paris3.png
// Warsaw03.jpg
// Warsaw09.png
// Warsaw07.jpg
// Warsaw06.jpg
// Warsaw08.jpg
// Warsaw04.png
// Warsaw05.png
// Warsaw10.jpg

class Photo {
  constructor(city, extension, date) {
    this.city = city;
    this.extension = extension;
    this.date = date;
  }
}

class PhotoAlbum {
  constructor(photos) {
    this.photos = photos;
  }

  renameCity = () => {
    const cities = this.getSortedCities();
    for (let photo of this.photos) {
      const cityIndex = this.getCityIndex(cities[photo.city], photo);
      photo.city += cityIndex;
    }
  }

  getCityNames = () => {
    var result = '';
    for (let photo of this.photos) {
      result += photo.city + '.' + photo.extension + '\n';
    }
    return result;
  }

  getSortedCities = () => {
    var cities = {};
    for(let photo of this.photos) {
      cities[photo.city]
        ? cities[photo.city].push(photo)
        : cities[photo.city] = [photo];
    }
    for (let key in cities) {
      cities[key].sort((a,b) => Date.parse(new Date(a.date)) - Date.parse(new Date(b.date)));
    }
    return cities;
  }

   // each location has <= 100 photos
  getCityIndex = (cities, photo) => {
    const index = cities.findIndex(p => p.date === photo.date);
    if (cities.length >= 100) {
      if (index + 1 >= 100) { return `${index + 1}`; } 
      if (index + 1 >= 10) {
        return `0${index + 1}`;
      } else {
        return `00${index + 1}`
      }
    }
    if (cities.length >= 10) {
      return (index + 1 >= 10) ? `${index + 1}` : `0${index + 1}`;
    }
    return `${index + 1}`;
  }
}

readPhoto = (s) => {
  var photos = [];
  for (let name of s.split('\n')) {
    var [ extension, city, date ] = name.split(',');
    photos.push(new Photo(
      city.replace(' ', ''),
      extension.split('.').pop(),
      date.replace(' ', '')
    ));
  }
  return photos;
}

solution = (S) => {
  const photos = readPhoto(S);
  const album = new PhotoAlbum(photos);
  album.renameCity();
  return album.getCityNames();
}

solution(S);