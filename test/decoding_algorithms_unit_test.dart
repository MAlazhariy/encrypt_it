

import 'package:encryption_app/decoding/versions/version_05.dart';
import 'package:encryption_app/decoding/versions/version_06.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

extension Encryption on String {
  String getVersion () => substring(length - 2, length);
  String removeVersion () => substring(0, length - 2);
}

String decrypt ({
  required String text,
  required String password,
  required BuildContext mockContext,
}){
  final version = text.getVersion();

  if (version == '05') {
    return V05(text.removeVersion(), password, mockContext, false).decrypt();
  }

  return V06(text.removeVersion(), password, mockContext, false).decrypt();
}


void main(){

  MockBuildContext mockContext = MockBuildContext();

  group('encryption group test', () {


    test('Current version encryption test', (){
      // should be valid characters
      const plainText = 'Mostafa Alazhariy 123';
      const password = 'mostafa123';

      var encryptedText1 = V06(plainText, password, mockContext, true).encrypt();
      var encryptedText2 = V06(plainText, password, mockContext, true).encrypt();
      var encryptedText3 = V06(plainText, password, mockContext, true).encrypt();
      var encryptedText4 = V06(plainText, password, mockContext, true).encrypt();
      var encryptedText5 = V06(plainText, password, mockContext, true).encrypt();
      var encryptedText6 = V06(plainText, password, mockContext, true).encrypt();
      var encryptedText7 = V06(plainText, password, mockContext, true).encrypt();
      var encryptedText8 = V06(plainText, password, mockContext, true).encrypt();
      var encryptedText9 = V06(plainText, password, mockContext, true).encrypt();
      var encryptedText10 = V06(plainText, password, mockContext, true).encrypt();

      // get version and encryptedText without version code
      String version = encryptedText5.getVersion();

      var decryptedText1 = V06(encryptedText1.removeVersion(), password, mockContext, false).decrypt();
      var decryptedText2 = V06(encryptedText2.removeVersion(), password, mockContext, false).decrypt();
      var decryptedText3 = V06(encryptedText3.removeVersion(), password, mockContext, false).decrypt();
      var decryptedText4 = V06(encryptedText4.removeVersion(), password, mockContext, false).decrypt();
      var decryptedText5 = V06(encryptedText5.removeVersion(), password, mockContext, false).decrypt();
      var decryptedText6 = V06(encryptedText6.removeVersion(), password, mockContext, false).decrypt();
      var decryptedText7 = V06(encryptedText7.removeVersion(), password, mockContext, false).decrypt();
      var decryptedText8 = V06(encryptedText8.removeVersion(), password, mockContext, false).decrypt();
      var decryptedText9 = V06(encryptedText9.removeVersion(), password, mockContext, false).decrypt();
      var decryptedText10 = V06(encryptedText10.removeVersion(), password, mockContext, false).decrypt();

      expect(version, '06');
      expect(plainText, decryptedText1);
      expect(plainText, decryptedText2);
      expect(plainText, decryptedText3);
      expect(plainText, decryptedText4);
      expect(plainText, decryptedText5);
      expect(plainText, decryptedText6);
      expect(plainText, decryptedText7);
      expect(plainText, decryptedText8);
      expect(plainText, decryptedText9);
      expect(plainText, decryptedText10);
    });

    test('Version 05 decryption test', (){
      // should be valid characters
      const plainText = 'مصطفى الأزهري mostafa alazhariy';
      const password = '@123';

      var encryptedText1 = V05(plainText, password, mockContext, true).encrypt();
      var encryptedText2 = V05(plainText, password, mockContext, true).encrypt();
      var encryptedText3 = V05(plainText, password, mockContext, true).encrypt();
      var encryptedText4 = V05(plainText, password, mockContext, true).encrypt();
      var encryptedText5 = V05(plainText, password, mockContext, true).encrypt();
      var encryptedText6 = V05(plainText, password, mockContext, true).encrypt();
      var encryptedText7 = V05(plainText, password, mockContext, true).encrypt();
      var encryptedText8 = V05(plainText, password, mockContext, true).encrypt();
      var encryptedText9 = V05(plainText, password, mockContext, true).encrypt();
      var encryptedText10 = V05(plainText, password, mockContext, true).encrypt();

      // get version and encryptedText without version code
      String version = encryptedText5.getVersion();

      var decryptedText1 = V05(encryptedText1.removeVersion(), password, mockContext, false).decrypt();
      var decryptedText2 = V05(encryptedText2.removeVersion(), password, mockContext, false).decrypt();
      var decryptedText3 = V05(encryptedText3.removeVersion(), password, mockContext, false).decrypt();
      var decryptedText4 = V05(encryptedText4.removeVersion(), password, mockContext, false).decrypt();
      var decryptedText5 = V05(encryptedText5.removeVersion(), password, mockContext, false).decrypt();
      var decryptedText6 = V05(encryptedText6.removeVersion(), password, mockContext, false).decrypt();
      var decryptedText7 = V05(encryptedText7.removeVersion(), password, mockContext, false).decrypt();
      var decryptedText8 = V05(encryptedText8.removeVersion(), password, mockContext, false).decrypt();
      var decryptedText9 = V05(encryptedText9.removeVersion(), password, mockContext, false).decrypt();
      var decryptedText10 = V05(encryptedText10.removeVersion(), password, mockContext, false).decrypt();

      expect(version, '05');
      expect(plainText, decryptedText1);
      expect(plainText, decryptedText2);
      expect(plainText, decryptedText3);
      expect(plainText, decryptedText4);
      expect(plainText, decryptedText5);
      expect(plainText, decryptedText6);
      expect(plainText, decryptedText7);
      expect(plainText, decryptedText8);
      expect(plainText, decryptedText9);
      expect(plainText, decryptedText10);
    });

    test('Random versions encryption test', (){
      // should be valid characters
      const plainText = 'مصطفى الأزهري mostafa alazhariy';
      const password = '###أهلا بالعالم ';

      var encryptedText1 = V06(plainText, password, mockContext, true).encrypt();
      var encryptedText2 = V05(plainText, password, mockContext, true).encrypt();
      var encryptedText3 = V06(plainText, password, mockContext, true).encrypt();
      var encryptedText4 = V05(plainText, password, mockContext, true).encrypt();
      var encryptedText5 = V05(plainText, password, mockContext, true).encrypt();
      var encryptedText6 = V06(plainText, password, mockContext, true).encrypt();
      var encryptedText7 = V05(plainText, password, mockContext, true).encrypt();
      var encryptedText8 = V06(plainText, password, mockContext, true).encrypt();
      var encryptedText9 = V05(plainText, password, mockContext, true).encrypt();
      var encryptedText10 = V06(plainText, password, mockContext, true).encrypt();

      var decryptedText1 = decrypt(text: encryptedText1, password: password, mockContext: mockContext);
      var decryptedText2 = decrypt(text: encryptedText2, password: password, mockContext: mockContext);
      var decryptedText3 = decrypt(text: encryptedText3, password: password, mockContext: mockContext);
      var decryptedText4 = decrypt(text: encryptedText4, password: password, mockContext: mockContext);
      var decryptedText5 = decrypt(text: encryptedText5, password: password, mockContext: mockContext);
      var decryptedText6 = decrypt(text: encryptedText6, password: password, mockContext: mockContext);
      var decryptedText7 = decrypt(text: encryptedText7, password: password, mockContext: mockContext);
      var decryptedText8 = decrypt(text: encryptedText8, password: password, mockContext: mockContext);
      var decryptedText9 = decrypt(text: encryptedText9, password: password, mockContext: mockContext);
      var decryptedText10 = decrypt(text: encryptedText10, password: password, mockContext: mockContext);

      // expect
      expect(plainText, decryptedText1);
      expect(plainText, decryptedText2);
      expect(plainText, decryptedText3);
      expect(plainText, decryptedText4);
      expect(plainText, decryptedText5);
      expect(plainText, decryptedText6);
      expect(plainText, decryptedText7);
      expect(plainText, decryptedText8);
      expect(plainText, decryptedText9);
      expect(plainText, decryptedText10);
    });

  });

}