import 'model/recipient.dart';

class RecipientsProvider {

  static final List<Recipient> recipients = [
    Recipient(imageUrl: "https://image.cnbcfm.com/api/v1/image/105797042-1552679396530gettyimages-1130598362.jpeg?v=1571866722&w=1400&h=950",
      name: "Elon Musk",
    ),
    Recipient(name: "Joe Rogan",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHyztF6Kw70zNZkrpzjxITjskgWmvnWqISAoKtlSFvUYVnwD8x&s"
    ),
    Recipient(name: "GSP",
      imageUrl: "https://www.bjpenn.com/wp-content/uploads/Michael-Bisping-2-696x399.png"
    ),
    Recipient(name: "Joanna",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRB2GKcN_GTAJ7vohaVhLFt9l6C2gw1O27ES1sjOg26eN6GuTOh&s"
    ),
  ];

}