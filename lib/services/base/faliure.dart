class Failure {
  String devMessage;
  String prettyMessage;
  Failure({
    required this.devMessage,
    required this.prettyMessage,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Failure &&
        other.devMessage == devMessage &&
        other.prettyMessage == prettyMessage;
  }

  @override
  int get hashCode => devMessage.hashCode ^ prettyMessage.hashCode;

  @override
  String toString() =>
      'Failure(devMessage: $devMessage, prettyMessage: $prettyMessage)';
}
