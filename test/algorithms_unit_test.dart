
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
    return V05(text.removeVersion(), password, mockContext).decrypt();
  }

  return V06(text.removeVersion(), password, mockContext).decrypt();
}


void main(){

  MockBuildContext mockContext = MockBuildContext();

  group('encryption valid characters test', () {
    /// in this case all plaintexts ans passwords
    /// should contains valid characters only
    test('Current version test', (){
      // should be valid characters
      const plainText = 'Mostafa Alazhariy 123';
      const password = 'mostafa123';

      final encryptedText1 = V06(plainText, password, mockContext).encrypt();
      final encryptedText2 = V06(plainText, password, mockContext).encrypt();
      final encryptedText3 = V06(plainText, password, mockContext).encrypt();
      final encryptedText4 = V06(plainText, password, mockContext).encrypt();
      final encryptedText5 = V06(plainText, password, mockContext).encrypt();
      final encryptedText6 = V06(plainText, password, mockContext).encrypt();
      final encryptedText7 = V06(plainText, password, mockContext).encrypt();
      final encryptedText8 = V06(plainText, password, mockContext).encrypt();
      final encryptedText9 = V06(plainText, password, mockContext).encrypt();
      final encryptedText10 = V06(plainText, password, mockContext).encrypt();

      // get version and encryptedText without version code
      String version = encryptedText5.getVersion();

      final decryptedText1 = V06(encryptedText1.removeVersion(), password, mockContext).decrypt();
      final decryptedText2 = V06(encryptedText2.removeVersion(), password, mockContext).decrypt();
      final decryptedText3 = V06(encryptedText3.removeVersion(), password, mockContext).decrypt();
      final decryptedText4 = V06(encryptedText4.removeVersion(), password, mockContext).decrypt();
      final decryptedText5 = V06(encryptedText5.removeVersion(), password, mockContext).decrypt();
      final decryptedText6 = V06(encryptedText6.removeVersion(), password, mockContext).decrypt();
      final decryptedText7 = V06(encryptedText7.removeVersion(), password, mockContext).decrypt();
      final decryptedText8 = V06(encryptedText8.removeVersion(), password, mockContext).decrypt();
      final decryptedText9 = V06(encryptedText9.removeVersion(), password, mockContext).decrypt();
      final decryptedText10 = V06(encryptedText10.removeVersion(), password, mockContext).decrypt();

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

    test('Version 05 test', (){
      // should be valid characters
      const plainText = 'مصطفى الأزهري mostafa alazhariy';
      const password = '@123';

      final encryptedText1 = V05(plainText, password, mockContext).encrypt();
      final encryptedText2 = V05(plainText, password, mockContext).encrypt();
      final encryptedText3 = V05(plainText, password, mockContext).encrypt();
      final encryptedText4 = V05(plainText, password, mockContext).encrypt();
      final encryptedText5 = V05(plainText, password, mockContext).encrypt();
      final encryptedText6 = V05(plainText, password, mockContext).encrypt();
      final encryptedText7 = V05(plainText, password, mockContext).encrypt();
      final encryptedText8 = V05(plainText, password, mockContext).encrypt();
      final encryptedText9 = V05(plainText, password, mockContext).encrypt();
      final encryptedText10 = V05(plainText, password, mockContext).encrypt();

      // get version and encryptedText without version code
      String version = encryptedText5.getVersion();

      final decryptedText1 = V05(encryptedText1.removeVersion(), password, mockContext).decrypt();
      final decryptedText2 = V05(encryptedText2.removeVersion(), password, mockContext).decrypt();
      final decryptedText3 = V05(encryptedText3.removeVersion(), password, mockContext).decrypt();
      final decryptedText4 = V05(encryptedText4.removeVersion(), password, mockContext).decrypt();
      final decryptedText5 = V05(encryptedText5.removeVersion(), password, mockContext).decrypt();
      final decryptedText6 = V05(encryptedText6.removeVersion(), password, mockContext).decrypt();
      final decryptedText7 = V05(encryptedText7.removeVersion(), password, mockContext).decrypt();
      final decryptedText8 = V05(encryptedText8.removeVersion(), password, mockContext).decrypt();
      final decryptedText9 = V05(encryptedText9.removeVersion(), password, mockContext).decrypt();
      final decryptedText10 = V05(encryptedText10.removeVersion(), password, mockContext).decrypt();

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

    test('Random versions test', (){
      // should be valid characters
      const plainText = 'مصطفى الأزهري mostafa alazhariy';
      const password = '###أهلا بالعالم ';

      final encryptedText1 = V06(plainText, password, mockContext).encrypt();
      final encryptedText2 = V05(plainText, password, mockContext).encrypt();
      final encryptedText3 = V06(plainText, password, mockContext).encrypt();
      final encryptedText4 = V05(plainText, password, mockContext).encrypt();
      final encryptedText5 = V05(plainText, password, mockContext).encrypt();
      final encryptedText6 = V06(plainText, password, mockContext).encrypt();
      final encryptedText7 = V05(plainText, password, mockContext).encrypt();
      final encryptedText8 = V06(plainText, password, mockContext).encrypt();
      final encryptedText9 = V05(plainText, password, mockContext).encrypt();
      final encryptedText10 = V06(plainText, password, mockContext).encrypt();

      final decryptedText1 = decrypt(text: encryptedText1, password: password, mockContext: mockContext);
      final decryptedText2 = decrypt(text: encryptedText2, password: password, mockContext: mockContext);
      final decryptedText3 = decrypt(text: encryptedText3, password: password, mockContext: mockContext);
      final decryptedText4 = decrypt(text: encryptedText4, password: password, mockContext: mockContext);
      final decryptedText5 = decrypt(text: encryptedText5, password: password, mockContext: mockContext);
      final decryptedText6 = decrypt(text: encryptedText6, password: password, mockContext: mockContext);
      final decryptedText7 = decrypt(text: encryptedText7, password: password, mockContext: mockContext);
      final decryptedText8 = decrypt(text: encryptedText8, password: password, mockContext: mockContext);
      final decryptedText9 = decrypt(text: encryptedText9, password: password, mockContext: mockContext);
      final decryptedText10 = decrypt(text: encryptedText10, password: password, mockContext: mockContext);

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