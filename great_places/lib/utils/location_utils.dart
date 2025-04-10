const Google_MAPS_API_KEY = 'AIzaSyBHSJ0CE82ehZJuhPL5d99QTb71NtorDZc';

class LocationUtils {
  static String generateLocationPreviewImage({
    required double latitude,
    required double longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$Google_MAPS_API_KEY';
  }
}
// https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=AIzaSyCvboa2f9c4bIHuVHikSpFB2uB5ONQddC0&signature=hjgGbJh6fujS374MoWSTlfm5E8I

// https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=AIzaSyBHSJ0CE82ehZJuhPL5d99QTb71NtorDZc&signature=hjgGbJh6fujS374MoWSTlfm5E8I

