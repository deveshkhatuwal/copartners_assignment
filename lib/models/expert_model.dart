class Expert {
  final String id;
  final String name;
  final String legalName;
  final String expertImagePath;
  final int expertTypeId;
  final String sebiRegNo;
  final String email;
  final double experience;
  final double rating;
  final String mobileNumber;
  final String channelName;
  final String chatId1;
  final String chatId2;
  final String chatId3;
  final String pan;
  final String address;
  final String state;
  final String signatureImage;
  final String gst;
  final String telegramChannel;
  final String premiumTelegramChannel1;
  final String premiumTelegramChannel2;
  final String premiumTelegramChannel3;
  final int telegramFollower;
  final bool isCoPartner;
  final int fixCommission;
  final String sebiRegCertificatePath;
  final bool isActive;
  final DateTime createdOn;

  Expert({
    required this.id,
    required this.name,
    required this.legalName,
    required this.expertImagePath,
    required this.expertTypeId,
    required this.sebiRegNo,
    required this.email,
    required this.experience,
    required this.rating,
    required this.mobileNumber,
    required this.channelName,
    required this.chatId1,
    required this.chatId2,
    required this.chatId3,
    required this.pan,
    required this.address,
    required this.state,
    required this.signatureImage,
    required this.gst,
    required this.telegramChannel,
    required this.premiumTelegramChannel1,
    required this.premiumTelegramChannel2,
    required this.premiumTelegramChannel3,
    required this.telegramFollower,
    required this.isCoPartner,
    required this.fixCommission,
    required this.sebiRegCertificatePath,
    required this.isActive,
    required this.createdOn,
  });

  factory Expert.fromJson(Map<String, dynamic> json) {
    return Expert(
      id: json['id'],
      name: json['name'],
      legalName: json['legalName'],
      expertImagePath: json['expertImagePath'],
      expertTypeId: json['expertTypeId'],
      sebiRegNo: json['sebiRegNo'],
      email: json['email'],
      experience: json['experience'],
      rating: json['rating'],
      mobileNumber: json['mobileNumber'],
      channelName: json['channelName'],
      chatId1: json['chatId1'],
      chatId2: json['chatId2'],
      chatId3: json['chatId3'],
      pan: json['pan'],
      address: json['address'],
      state: json['state'],
      signatureImage: json['signatureImage'],
      gst: json['gst'],
      telegramChannel: json['telegramChannel'],
      premiumTelegramChannel1: json['premiumTelegramChannel1'],
      premiumTelegramChannel2: json['premiumTelegramChannel2'],
      premiumTelegramChannel3: json['premiumTelegramChannel3'],
      telegramFollower: json['telegramFollower'],
      isCoPartner: json['isCoPartner'],
      fixCommission: json['fixCommission'],
      sebiRegCertificatePath: json['sebiRegCertificatePath'],
      isActive: json['isActive'],
      createdOn: DateTime.parse(json['createdOn']),
    );
  }
}