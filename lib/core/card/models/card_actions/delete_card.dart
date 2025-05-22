final class DeleteCard {
  final int cardId;
  final String username;

  const DeleteCard({required this.cardId, required this.username});

  Map<String, dynamic> toJson() => {'sepetId': cardId, 'kullaniciAdi': username};
}
