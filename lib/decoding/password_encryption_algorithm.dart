class PasswordEncryptionAlgorithm {
  PasswordEncryptionAlgorithm({
    required this.encryptionMethod,
    required this.decryptionMethod,
  });

  PasswordEncryptionAlgorithm.defaultMethods() {
    encryptionMethod = ({
      required int charIndex,
      required int shiftingCharIndex,
      required int passKey,
    }) {
      return charIndex + passKey + shiftingCharIndex;
    };

    decryptionMethod = ({
      required int charIndex,
      required int shiftingCharIndex,
      required int passKey,
    }) {
      return charIndex - passKey - shiftingCharIndex;
    };
  }

  late final int Function({
    required int charIndex,
    required int shiftingCharIndex,
    required int passKey,
  }) encryptionMethod;

  late final int Function({
    required int charIndex,
    required int shiftingCharIndex,
    required int passKey,
  }) decryptionMethod;


}