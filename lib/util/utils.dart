import 'package:intl/intl.dart';
enum LoadingState { DONE, LOADING, WAITING, ERROR }

final dollarFormat = NumberFormat("#,##0.00", "en_US");
final sourceFormat = DateFormat('yyyy-MM-dd');
final dateFormat = DateFormat.yMMMMd("en_US");

String formatRuntime(int runtime) {
  int hours = runtime ~/ 60;
  int minutes = runtime % 60;

  return '$hours\h $minutes\m';
}

String formatSeasonsAndEpisodes(int numberOfSeasons, int numberOfEpisodes) =>
    '$numberOfSeasons Seasons and $numberOfEpisodes Episodes';

String formatNumberToDollars(int amount) => '\$${dollarFormat.format(amount)}';

String formatDate(String date) {
  try {
    return dateFormat.format(sourceFormat.parse(date));
  } catch (Exception) {
    return "";
  }
}