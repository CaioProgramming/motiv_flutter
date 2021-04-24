class FontUtils {
  String loadFont(int index) {
    print('searching font $index');
    final List<String> fonts = [
      'Amatic SC',
      'Bangers',
      'Bigelow Rules',
      'Exo',
      'Caveat',
      'Cormorant Unicase',
      'Press Start 2P',
      'Indie Flower',
      'Libre Barcode 128 Text',
      'Lalezar',
      'Redressed',
      'Righteous',
      'Sacramento',
      'Pacifico',
      'Satisfy'
    ];
    try {
      return fonts[index];
    } catch (e) {
      print('erro ao carregar fonte  $e');
      return fonts[0];
    }
  }
}
