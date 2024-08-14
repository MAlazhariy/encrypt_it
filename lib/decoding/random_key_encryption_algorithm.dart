class RandomKeyEncryptionAlgorithm {
  RandomKeyEncryptionAlgorithm({
    required this.encryptionMethod,
    required this.decryptionMethod,
  });

  RandomKeyEncryptionAlgorithm.defaultMethods() {
    encryptionMethod = ({
      required int charIndex,
      required int shiftingCharIndex,
      required int randomKey,
    }) {
      return charIndex + randomKey + shiftingCharIndex;
    };

    decryptionMethod = ({
      required int charIndex,
      required int shiftingCharIndex,
      required int randomKey,
    }) {
      return charIndex - randomKey - shiftingCharIndex;
    };
  }

  late final int Function({
    required int charIndex,
    required int shiftingCharIndex,
    required int randomKey,
  }) encryptionMethod;

  late final int Function({
    required int charIndex,
    required int shiftingCharIndex,
    required int randomKey,
  }) decryptionMethod;
}
