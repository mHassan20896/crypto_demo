class Coin {
  Coin({
    required this.id,
    required this.name,
    required this.marketCap,
    required this.marketCapChange24H,
    this.content,
    required this.top3Coins,
    required this.volume24H,
    required this.updatedAt,
  });

  String id;
  String name;
  double marketCap;
  double marketCapChange24H;
  String? content;
  List<String> top3Coins;
  double volume24H;
  DateTime updatedAt;

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        id: json["id"],
        name: json["name"],
        marketCap: json["market_cap"].toDouble(),
        marketCapChange24H: json["market_cap_change_24h"].toDouble(),
        content: json["content"],
        top3Coins: List<String>.from(json["top_3_coins"].map((x) => x)),
        volume24H: json["volume_24h"].toDouble(),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "market_cap": marketCap,
        "market_cap_change_24h": marketCapChange24H,
        "content": content,
        "top_3_coins": List<dynamic>.from(top3Coins.map((x) => x)),
        "volume_24h": volume24H,
        "updated_at": updatedAt.toIso8601String(),
      };
}
