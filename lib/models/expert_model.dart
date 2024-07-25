class ExpertDetails {
  String name;
  String legalName;
  String expertImagePath;
  int expertTypeId;
  String sebiRegNo;
  String email;
  double experience;
  double rating;
  String mobileNumber;
  String channelName;
  String chatId1;
  String chatId2;
  String chatId3;
  String pan;
  String address;
  String state;
  String signatureImage;
  String gst;
  String telegramChannel;
  String premiumTelegramChannel1;
  String premiumTelegramChannel2;
  String premiumTelegramChannel3;
  int telegramFollower;
  bool isCoPartner;
  int fixCommission;
  String sebiRegCertificatePath;
  String? relationshipManagerId;
  bool isActive;
  String id;
  DateTime createdOn;
  DateTime? updatedOn;
  bool isDeleted;
  String? deletedBy;
  DateTime? deletedOn;

  ExpertDetails({
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
    this.relationshipManagerId,
    required this.isActive,
    required this.id,
    required this.createdOn,
    this.updatedOn,
    required this.isDeleted,
    this.deletedBy,
    this.deletedOn,
  });

  factory ExpertDetails.fromJson(Map<String, dynamic> json) {
    return ExpertDetails(
      name: json['name'],
      legalName: json['legalName'],
      expertImagePath: json['expertImagePath'],
      expertTypeId: json['expertTypeId'],
      sebiRegNo: json['sebiRegNo'],
      email: json['email'],
      experience: json['experience'].toDouble(),
      rating: json['rating'].toDouble(),
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
      relationshipManagerId: json['relationshipManagerId'],
      isActive: json['isActive'],
      id: json['id'],
      createdOn: DateTime.parse(json['createdOn']),
      updatedOn: json['updatedOn'] != null ? DateTime.parse(json['updatedOn']) : null,
      isDeleted: json['isDeleted'],
      deletedBy: json['deletedBy'],
      deletedOn: json['deletedOn'] != null ? DateTime.parse(json['deletedOn']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'legalName': legalName,
      'expertImagePath': expertImagePath,
      'expertTypeId': expertTypeId,
      'sebiRegNo': sebiRegNo,
      'email': email,
      'experience': experience,
      'rating': rating,
      'mobileNumber': mobileNumber,
      'channelName': channelName,
      'chatId1': chatId1,
      'chatId2': chatId2,
      'chatId3': chatId3,
      'pan': pan,
      'address': address,
      'state': state,
      'signatureImage': signatureImage,
      'gst': gst,
      'telegramChannel': telegramChannel,
      'premiumTelegramChannel1': premiumTelegramChannel1,
      'premiumTelegramChannel2': premiumTelegramChannel2,
      'premiumTelegramChannel3': premiumTelegramChannel3,
      'telegramFollower': telegramFollower,
      'isCoPartner': isCoPartner,
      'fixCommission': fixCommission,
      'sebiRegCertificatePath': sebiRegCertificatePath,
      'relationshipManagerId': relationshipManagerId,
      'isActive': isActive,
      'id': id,
      'createdOn': createdOn.toIso8601String(),
      'updatedOn': updatedOn?.toIso8601String(),
      'isDeleted': isDeleted,
      'deletedBy': deletedBy,
      'deletedOn': deletedOn?.toIso8601String(),
    };
  }
}
class Expert {
  String id;
  String expertsId;
  String imagePath;
  String serviceType;
  String planType;
  String chatId;
  int durationMonth;
  double amount;
  String premiumTelegramLink;
  String description;
  double discountedAmount;
  double? discountPercentage;
  DateTime? discountValidFrom;
  DateTime? discountValidTo;
  bool isCustom;
  bool isActive;
  String createdBy;
  DateTime createdOn;
  String? updatedBy;
  DateTime? updatedOn;
  bool isDeleted;
  String? deletedBy;
  DateTime? deletedOn;
  ExpertDetails experts;

  Expert({
    required this.id,
    required this.expertsId,
    required this.imagePath,
    required this.serviceType,
    required this.planType,
    required this.chatId,
    required this.durationMonth,
    required this.amount,
    required this.premiumTelegramLink,
    required this.description,
    required this.discountedAmount,
    this.discountPercentage,
    this.discountValidFrom,
    this.discountValidTo,
    required this.isCustom,
    required this.isActive,
    required this.createdBy,
    required this.createdOn,
    this.updatedBy,
    this.updatedOn,
    required this.isDeleted,
    this.deletedBy,
    this.deletedOn,
    required this.experts,
  });

  factory Expert.fromJson(Map<String, dynamic> json) {
    return Expert(
      id: json['id'],
      expertsId: json['expertsId'],
      imagePath: json['imagePath'],
      serviceType: json['serviceType'],
      planType: json['planType'],
      chatId: json['chatId'],
      durationMonth: json['durationMonth'],
      amount: json['amount'].toDouble(),
      premiumTelegramLink: json['premiumTelegramLink'],
      description: json['description'],
      discountedAmount: json['discountedAmount'].toDouble(),
      discountPercentage: json['discountPercentage']?.toDouble(),
      discountValidFrom: json['discountValidFrom'] != null ? DateTime.parse(json['discountValidFrom']) : null,
      discountValidTo: json['discountValidTo'] != null ? DateTime.parse(json['discountValidTo']) : null,
      isCustom: json['isCustom'],
      isActive: json['isActive'],
      createdBy: json['createdBy'],
      createdOn: DateTime.parse(json['createdOn']),
      updatedBy: json['updatedBy'],
      updatedOn: json['updatedOn'] != null ? DateTime.parse(json['updatedOn']) : null,
      isDeleted: json['isDeleted'],
      deletedBy: json['deletedBy'],
      deletedOn: json['deletedOn'] != null ? DateTime.parse(json['deletedOn']) : null,
      experts: ExpertDetails.fromJson(json['experts']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'expertsId': expertsId,
      'imagePath': imagePath,
      'serviceType': serviceType,
      'planType': planType,
      'chatId': chatId,
      'durationMonth': durationMonth,
      'amount': amount,
      'premiumTelegramLink': premiumTelegramLink,
      'description': description,
      'discountedAmount': discountedAmount,
      'discountPercentage': discountPercentage,
      'discountValidFrom': discountValidFrom?.toIso8601String(),
      'discountValidTo': discountValidTo?.toIso8601String(),
      'isCustom': isCustom,
      'isActive': isActive,
      'createdBy': createdBy,
      'createdOn': createdOn.toIso8601String(),
      'updatedBy': updatedBy,
      'updatedOn': updatedOn?.toIso8601String(),
      'isDeleted': isDeleted,
      'deletedBy': deletedBy,
      'deletedOn': deletedOn?.toIso8601String(),
      'experts': experts.toJson(),
    };
  }
}