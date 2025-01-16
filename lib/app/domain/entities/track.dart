import 'package:objectbox/objectbox.dart';

@Entity()
class Track {
  @Id()
  int id;

  Track({
    this.id = 0,
  });
}
