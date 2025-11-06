import 'dart:math';

import 'package:encryption_app/decoding/versions/version_05.dart';
import 'package:encryption_app/decoding/versions/version_05_old.dart';
import 'package:encryption_app/decoding/versions/version_06.dart';
import 'package:encryption_app/decoding/versions/version_06_old.dart';
import 'package:encryption_app/decoding/versions/version_07.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

extension EncryptionX on String {
  String getVersion() => substring(length - 2, length);

  String removeVersion() => substring(0, length - 2);
}

String decrypt({
  required String text,
  required String password,
}) {
  final version = text.getVersion();

  if (version == '05') {
    return V05(text: text.removeVersion(), password: password).decrypt();
  } else if (version == '06') {
    return V06(text: text.removeVersion(), password: password).decrypt();
  } else {
    return V07(text: text.removeVersion(), password: password).decrypt();
  }
}

int _getRandom({
  int min = 5,
  int max = 7,
}) {
  return Random().nextInt(max - min + 1) + min;
}

void main() {
  group('encryption valid characters test', () {
    /// in this case all plaintexts ans passwords
    /// should contains valid characters only
    test('Current version 06 test', () {
      // should be valid characters
      const plainText = 'مصطفى الأزهري Mostafa Alazhariy 123';
      const password = 'mostafa123';

      final encryptedText1 = V06(text: plainText, password: password).encrypt();
      final encryptedText2 = V06(text: plainText, password: password).encrypt();
      final encryptedText3 = V06(text: plainText, password: password).encrypt();
      final encryptedText4 = V06(text: plainText, password: password).encrypt();
      final encryptedText5 = V06(text: plainText, password: password).encrypt();
      final encryptedText6 = V06(text: plainText, password: password).encrypt();
      final encryptedText7 = V06(text: plainText, password: password).encrypt();
      final encryptedText8 = V06(text: plainText, password: password).encrypt();
      final encryptedText9 = V06(text: plainText, password: password).encrypt();
      final encryptedText10 = V06(text: plainText, password: password).encrypt();

      final encryptedTexts = List.generate(
        500,
        (index) => V06(text: plainText, password: password).encrypt(),
      );

      // get version and encryptedText without version code
      final version = encryptedTexts.first.getVersion();

      final decryptedTexts = List.generate(
        encryptedTexts.length,
        (index) => V06(text: encryptedTexts[index].removeVersion(), password: password).decrypt(),
      );

      final decryptedText1 = V06(text: encryptedText1.removeVersion(), password: password).decrypt();
      final decryptedText2 = V06(text: encryptedText2.removeVersion(), password: password).decrypt();
      final decryptedText3 = V06(text: encryptedText3.removeVersion(), password: password).decrypt();
      final decryptedText4 = V06(text: encryptedText4.removeVersion(), password: password).decrypt();
      final decryptedText5 = V06(text: encryptedText5.removeVersion(), password: password).decrypt();
      final decryptedText6 = V06(text: encryptedText6.removeVersion(), password: password).decrypt();
      final decryptedText7 = V06(text: encryptedText7.removeVersion(), password: password).decrypt();
      final decryptedText8 = V06(text: encryptedText8.removeVersion(), password: password).decrypt();
      final decryptedText9 = V06(text: encryptedText9.removeVersion(), password: password).decrypt();
      final decryptedText10 = V06(text: encryptedText10.removeVersion(), password: password).decrypt();

      expect(version, '06');

      for (var i = 0; i < encryptedTexts.length; i++) {
        expect(plainText, decryptedTexts[i]);
      }
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

    test('encrypt Old V06 -> decrypt V06', () {
      // should be valid characters
      const plainText = 'مصطفى الأزهري\n mostafa alazhariy';
      const password = '@123';

      final encryptedTexts = List.generate(
        500,
        (index) => OldV06(text: plainText, password: password).encrypt(),
      );

      // get version and encryptedText without version code
      final version = encryptedTexts.first.getVersion();

      final decryptedTexts = List.generate(
        encryptedTexts.length,
        (index) => V06(text: encryptedTexts[index].removeVersion(), password: password).decrypt(),
      );

      expect(version, '06');

      for (var i = 0; i < encryptedTexts.length; i++) {
        expect(plainText, decryptedTexts[i]);
      }
    });

    test('encrypt new V06 -> encrypt Old V06', () {
      // should be valid characters
      const plainText = 'مصطفى الأزهري\n mostafa alazhariy';
      const password = '@123';

      final encryptedTexts = List.generate(
        500,
        (index) => V06(text: plainText, password: password).encrypt(),
      );

      // get version and encryptedText without version code
      final version = encryptedTexts.first.getVersion();

      final decryptedTexts = List.generate(
        encryptedTexts.length,
        (index) => OldV06(text: encryptedTexts[index].removeVersion(), password: password).decrypt(),
      );

      expect(version, '06');

      for (var i = 0; i < encryptedTexts.length; i++) {
        expect(plainText, decryptedTexts[i]);
      }
    });

    test('Version 05 test', () {
      // should be valid characters
      const plainText = 'مصطفى الأزهري mostafa \nalazhariy';
      const password = '@123';

      // +z$dك:ث9شY,^ه1BٍAق<٧v_\a‘(٤9أ/afUذقOر05

      final encryptedText1 = V05(text: plainText, password: password).encrypt();
      final encryptedText2 = V05(text: plainText, password: password).encrypt();
      final encryptedText3 = V05(text: plainText, password: password).encrypt();
      final encryptedText4 = V05(text: plainText, password: password).encrypt();
      final encryptedText5 = V05(text: plainText, password: password).encrypt();
      final encryptedText6 = V05(text: plainText, password: password).encrypt();
      final encryptedText7 = V05(text: plainText, password: password).encrypt();
      final encryptedText8 = V05(text: plainText, password: password).encrypt();
      final encryptedText9 = V05(text: plainText, password: password).encrypt();
      final encryptedText10 = V05(text: plainText, password: password).encrypt();

      // get version and encryptedText without version code
      String version = encryptedText5.getVersion();

      final decryptedText1 = V05(text: encryptedText1.removeVersion(), password: password).decrypt();
      final decryptedText2 = V05(text: encryptedText2.removeVersion(), password: password).decrypt();
      final decryptedText3 = V05(text: encryptedText3.removeVersion(), password: password).decrypt();
      final decryptedText4 = V05(text: encryptedText4.removeVersion(), password: password).decrypt();
      final decryptedText5 = V05(text: encryptedText5.removeVersion(), password: password).decrypt();
      final decryptedText6 = V05(text: encryptedText6.removeVersion(), password: password).decrypt();
      final decryptedText7 = V05(text: encryptedText7.removeVersion(), password: password).decrypt();
      final decryptedText8 = V05(text: encryptedText8.removeVersion(), password: password).decrypt();
      final decryptedText9 = V05(text: encryptedText9.removeVersion(), password: password).decrypt();
      final decryptedText10 = V05(text: encryptedText10.removeVersion(), password: password).decrypt();

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

    test('encrypt OLD V05 -> decrypt new V05', () {
      // should be valid characters
      const plainText = 'مصطفى الأزهري mostafa \nalazhariy';
      const password = '@123';

      final encryptedTexts = List.generate(
        500,
        (index) => OldV05(text: plainText, password: password).encrypt(),
      );

      // get version and encryptedText without version code
      final version = encryptedTexts.first.getVersion();

      final decryptedTexts = List.generate(
        encryptedTexts.length,
        (index) => V05(text: encryptedTexts[index].removeVersion(), password: password).decrypt(),
      );

      expect(version, '05');
      for (var i = 0; i < encryptedTexts.length; i++) {
        expect(plainText, decryptedTexts[i]);
      }
    });

    test('Version 07 test', () {
      const plainText = 'مصطفى الأزهري \$¥€\nMostafa Alazhariy 123';
      const password = 'mostafa@123';

      final encryptedTexts = List.generate(
        500,
        (index) => V07(text: plainText, password: password).encrypt(),
      );

      final version = encryptedTexts.first.getVersion();

      final decryptedTexts = List.generate(
        encryptedTexts.length,
        (index) => V07(text: encryptedTexts[index].removeVersion(), password: password).decrypt(),
      );

      expect(version, '07');

      for (var i = 0; i < encryptedTexts.length; i++) {
        expect(plainText, decryptedTexts[i]);
      }
    });

    test('Random versions test', () {
      // should be valid characters
      const plainText = 'مصطفى الأزهري mostafa \nalazhariy';
      const password = '###أهلا بالعالم ';
      const count = 1000;

      final encryptedTexts = List.generate(
        count,
        (index) {
          final rVersion = _getRandom();
          switch (rVersion) {
            case 5:
              return V05(text: plainText, password: password).encrypt();
            case 6:
              return V06(text: plainText, password: password).encrypt();
            case 7:
              return V07(text: plainText, password: password).encrypt();
            default:
              return "";
          }
        },
      );

      final decryptedTexts = List.generate(
        count,
        (index) => decrypt(text: encryptedTexts[index], password: password),
      );

      for (var i = 0; i < count; i++) {
        expect(plainText, decryptedTexts[i]);
      }
    });
  });

  group('Multi-encryption test', () {
    test('encrypt Old V06 -> decrypt V06', () {
      // should be valid characters
      const plainText = 'مصطفى الأزهري\n mostafa alazhariy';
      const password = '@123';
      const count = 500;

      final encryptedTexts = List.generate(
        count,
        (index) => OldV06(text: plainText, password: password).encrypt(),
      );

      final encryptedTexts2 = List.generate(
        count,
        (index) => OldV06(text: encryptedTexts[index], password: password).encrypt(),
      );

      final encryptedTexts3 = List.generate(
        count,
        (index) => OldV06(text: encryptedTexts2[index], password: password).encrypt(),
      );

      // get version and encryptedText without version code
      final version = encryptedTexts3.first.getVersion();

      final decryptedTexts = List.generate(
        count,
        (index) => V06(text: encryptedTexts3[index].removeVersion(), password: password).decrypt(),
      );

      final decryptedTexts2 = List.generate(
        count,
        (index) => V06(text: decryptedTexts[index].removeVersion(), password: password).decrypt(),
      );

      final decryptedTexts3 = List.generate(
        count,
        (index) => V06(text: decryptedTexts2[index].removeVersion(), password: password).decrypt(),
      );

      expect(version, '06');

      for (var i = 0; i < encryptedTexts.length; i++) {
        expect(plainText, decryptedTexts3[i]);
      }
    });
    test('encrypt new V06 -> encrypt Old V06', () {
      // should be valid characters
      const plainText = 'مصطفى الأزهري\n mostafa alazhariy';
      const password = '@123';
      const count = 500;

      final encryptedTexts = List.generate(
        count,
        (index) => V06(text: plainText, password: password).encrypt(),
      );

      final encryptedTexts2 = List.generate(
        count,
        (index) => V06(text: encryptedTexts[index], password: password).encrypt(),
      );

      final encryptedTexts3 = List.generate(
        count,
        (index) => V06(text: encryptedTexts2[index], password: password).encrypt(),
      );

      // get version and encryptedText without version code
      final version = encryptedTexts3.first.getVersion();

      final decryptedTexts = List.generate(
        count,
        (index) => OldV06(text: encryptedTexts3[index].removeVersion(), password: password).decrypt(),
      );

      final decryptedTexts2 = List.generate(
        count,
        (index) => OldV06(text: decryptedTexts[index].removeVersion(), password: password).decrypt(),
      );

      final decryptedTexts3 = List.generate(
        count,
        (index) => OldV06(text: decryptedTexts2[index].removeVersion(), password: password).decrypt(),
      );

      expect(version, '06');

      for (var i = 0; i < encryptedTexts.length; i++) {
        expect(plainText, decryptedTexts3[i]);
      }
    });
    test('V05', () {
      // should be valid characters
      const plainText = 'مصطفى الأزهري\n mostafa alazhariy';
      const password = '@123';
      const count = 500;

      final encryptedTexts = List.generate(
        count,
        (index) => V05(text: plainText, password: password).encrypt(),
      );

      final encryptedTexts2 = List.generate(
        count,
        (index) => V05(text: encryptedTexts[index], password: password).encrypt(),
      );

      final encryptedTexts3 = List.generate(
        count,
        (index) => V05(text: encryptedTexts2[index], password: password).encrypt(),
      );

      // get version and encryptedText without version code
      final version = encryptedTexts3.first.getVersion();

      final decryptedTexts = List.generate(
        count,
        (index) => V05(text: encryptedTexts3[index].removeVersion(), password: password).decrypt(),
      );

      final decryptedTexts2 = List.generate(
        count,
        (index) => V05(text: decryptedTexts[index].removeVersion(), password: password).decrypt(),
      );

      final decryptedTexts3 = List.generate(
        count,
        (index) => V05(text: decryptedTexts2[index].removeVersion(), password: password).decrypt(),
      );

      expect(version, '05');

      for (var i = 0; i < encryptedTexts.length; i++) {
        expect(plainText, decryptedTexts3[i]);
      }
    });
    test('encrypt OLD V05 -> decrypt new V05', () {
      // should be valid characters
      const plainText = 'مصطفى الأزهري\n mostafa alazhariy';
      const password = '@123';
      const count = 500;

      final encryptedTexts = List.generate(
        count,
        (index) => OldV05(text: plainText, password: password).encrypt(),
      );

      final encryptedTexts2 = List.generate(
        count,
        (index) => OldV05(text: encryptedTexts[index], password: password).encrypt(),
      );

      final encryptedTexts3 = List.generate(
        count,
        (index) => OldV05(text: encryptedTexts2[index], password: password).encrypt(),
      );

      // get version and encryptedText without version code
      final version = encryptedTexts3.first.getVersion();

      final decryptedTexts = List.generate(
        count,
        (index) => V05(text: encryptedTexts3[index].removeVersion(), password: password).decrypt(),
      );

      final decryptedTexts2 = List.generate(
        count,
        (index) => V05(text: decryptedTexts[index].removeVersion(), password: password).decrypt(),
      );

      final decryptedTexts3 = List.generate(
        count,
        (index) => V05(text: decryptedTexts2[index].removeVersion(), password: password).decrypt(),
      );

      expect(version, '05');

      for (var i = 0; i < encryptedTexts.length; i++) {
        expect(plainText, decryptedTexts3[i]);
      }
    });
    test('V07', () {
      const plainText = 'مصطفى الأزهري\$¥€\n mostafa alazhariy';
      const password = '@123';
      const count = 500;

      final encryptedTexts = List.generate(
        count,
        (index) => V07(text: plainText, password: password).encrypt(),
      );

      final encryptedTexts2 = List.generate(
        count,
        (index) => V07(text: encryptedTexts[index], password: password).encrypt(),
      );

      final encryptedTexts3 = List.generate(
        count,
        (index) => V07(text: encryptedTexts2[index], password: password).encrypt(),
      );

      final version = encryptedTexts3.first.getVersion();

      final decryptedTexts = List.generate(
        count,
        (index) => V07(text: encryptedTexts3[index].removeVersion(), password: password).decrypt(),
      );

      final decryptedTexts2 = List.generate(
        count,
        (index) => V07(text: decryptedTexts[index].removeVersion(), password: password).decrypt(),
      );

      final decryptedTexts3 = List.generate(
        count,
        (index) => V07(text: decryptedTexts2[index].removeVersion(), password: password).decrypt(),
      );

      expect(version, '07');

      for (var i = 0; i < encryptedTexts.length; i++) {
        expect(plainText, decryptedTexts3[i]);
      }
    });
  });
}
