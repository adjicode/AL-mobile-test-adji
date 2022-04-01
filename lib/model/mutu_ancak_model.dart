final String tableMutuAncak = 'mutuancak';

class MutuAncakFields {
  static final List<String> values = [
    /// Add all fields
    id, nameBlock, typeBlock, isiBaris
  ];

  static final String id = '_id';
  static final String nameBlock = 'nama_block';
  static final String typeBlock = 'type_block';
  static final String isiBaris = 'isiBaris';
}

class MutuAncak {
  final int? id;
  final String nameBlock;
  final String typeBlock;
  final String isiBaris;

  const MutuAncak({
    this.id,
    required this.nameBlock,
    required this.typeBlock,
    required this.isiBaris,
  });


  MutuAncak copy({
    int? id,
    String? nameBlock,
    String? typeBlock,
    String? isiBaris,
  }) =>
      MutuAncak(
        id: id ?? this.id,
        nameBlock: nameBlock ?? this.nameBlock,
        typeBlock: typeBlock ?? this.typeBlock,
        isiBaris: isiBaris ?? this.isiBaris,
      );

  static MutuAncak fromJson(Map<String, Object?> json) => MutuAncak(
    id: json[MutuAncakFields.id] as int?,
    nameBlock: json[MutuAncakFields.nameBlock] as String,
    typeBlock: json[MutuAncakFields.typeBlock] as String,
    isiBaris: json[MutuAncakFields.isiBaris] as String
  );

  Map<String, Object?> toJson() => {
    MutuAncakFields.id: id,
    MutuAncakFields.typeBlock: typeBlock,
    MutuAncakFields.nameBlock: nameBlock,
    MutuAncakFields.isiBaris: isiBaris,
  };

}