import 'dart:io';

import 'package:flutter/foundation.dart';

enum ProofType {
  exhibit,
  personal,
}

class Proof {
  Proof({
    this.proofType = ProofType.personal,
    this.isExpertWitness = false,
    this.exhibitFileBytes,
    this.exhibitFileName = '',
    this.firstName = '',
    this.lastName = '',
    this.peselNumber = '',
    this.address = '',
    this.city = '',
    this.postCode = '',
  });

  ProofType proofType;
  bool isExpertWitness;
  Uint8List? exhibitFileBytes;
  String exhibitFileName;
  String firstName;
  String lastName;
  String peselNumber;
  String address;
  String city;
  String postCode;
}
