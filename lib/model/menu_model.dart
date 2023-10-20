class RecommendedMenuModel {
  
  String kategori;
  String nama;
  String bahan;
  String tahap;
  String kalori;
  String waktu;
  String foto;

  RecommendedMenuModel({
      required this.kategori,
      required this.nama, 
      required this.bahan, 
      required this.tahap, 
      required this.kalori, 
      required this.waktu,  
      required this.foto,
    }
  );
}

final List<RecommendedMenuModel> rekomendasi = [
  RecommendedMenuModel(
    kategori: 'Dinner',
    nama: 'Nasi goreng kecap',
    bahan: '- 2 piring nasi dingin\n- 5 buah bakso sapi\n- Daging ayam secukupnya\n'
            '- ½ buah paprika merah\n- ½ buah paprika hijau\n- 3 siung bawang putih (chop halus)\n'
            '- 2 siung bawang merah (chop halus)\n- 1 batang daun bawang (rajang halus)\n'
            '- 1 sdt garam\n- ½ sdt kaldu bubuk\n- 1 sachet kecil kecap manis\n'
            '- 2 sdm saos raja rasa\n- 1 sdm saos tomat\n- Minyak goreng secukupnya',
    tahap: '1. Siapakan bumbu dan pelengkap nasi goreng\n'
            '2. Panaskan wajan,tambahkan minyak dan tumis bawang merah dan bawang putih hingga harum\n'
            '3. Masukan secara bertahap daging ayam dan bakso terlebih dahulu hingga matang. Kemudian masukan paprika hijau,paprika merah dan daun bawang aduk rata\n'
            '4. Kemudian masukan nasi aduk sebentar dan bumbui dengan garam,kaldu bubuk,kecap manis, saos raja rasa dan saos tomat\n'
            '5. Aduk hingga tercampur rata\n'
            '6. Nasi goreng kecap siap disajikan',
    kalori: '343 kalori',
    waktu: '20 menit',
    foto: 'images/dinner2.jpeg'
  ),
  RecommendedMenuModel(
    kategori: 'Dessert',
      nama: 'Mango cheese cake',
      bahan: '- 100 gr keju cheddar, parut\n- 2 sdm gula pasir\n- 1 sdt garam\n- 2 sdm susu kental manis'
              '- 250 ml susu cair\n- 2 sdm tepung maizena, larutkan dengan 3 sdm air\n'
              '- 1 buah mangga harum manis, potong dadu kecil\n- 1 bungkus biskuit sari gandum, haluskan',
      tahap: 'Vla: campur keju, gula pasir, garam,susu kental manis, dan susu cair\n'
              '1. Masak sambil terus diaduk sampai mendidih'
              '2. Tambahkan larutan maizena. Aduk hingga kental'
              '3. Matikan api\n'
              '4. Masukkan potongan mangga ke dalam saus vla, aduk rata. Dinginkan\n'
              '5. Susun vla dan remahan biskuit selang seling hingga memenuhi gelas saji\n'
              '6. Simpan dalam lemari es hingga dingin.',
      kalori: '400 kalori',
      waktu: '20 menit',
      foto: 'images/dessert2.jpeg'
  ),
  RecommendedMenuModel(
    kategori: 'Dessert',
      nama: 'Pudding chocolate',
      bahan: '- premix Puding Chocolate\n- air\n- whipcream\n- chocochips',
      tahap: '1. Campurkan 1 kg Premix Puding Chocolate dengan 3000 cc air (15 gelas)\n'
              '2. Panaskan dengan api sedang hingga mendidih. Biarkan mendidih selama beberapa detik sebelum diangkat\n'
              '3. Angkat dan tuang dalam gelas/cetakan\n'
              '4. Tambahkan whipcream dan chocochips sesuai selera.',
      kalori: '141,7 kalori',
      waktu: '10 menit',
      foto: 'images/dessert1.jpeg'
  )
];

class MenuModel {
  
  String kategori;
  String nama;
  String bahan;
  String tahap;
  String kalori;
  String waktu;
  String foto;

  MenuModel({
      required this.kategori,
      required this.nama, 
      required this.bahan, 
      required this.tahap, 
      required this.kalori, 
      required this.waktu,  
      required this.foto,
    }
  );
}

final List<MenuModel> menu = [
  MenuModel(
    kategori: 'Lunch',
    nama: 'Tumis jamur tiram',
    bahan: '- 1 pak jamur tiram, suwir\n- 6 buah putren\n- 2 siung bawang putih cincang\n'
            '- 2 butir bawang merah iris\n- 2 cabe merah iris serong\n- 1 batang daun bawang iris serong\n'
            '- 1 sdm saus tiram\n- Garam, merica',
    tahap: '1. Cuci bersih jamur, siangi, sisihkan\n'
            '2. Tumis dua bawang dan cabai sampai harum\n'
            '3. Masukkan jamur, putren, daun bawang dan bumbu, aduk rata\n'
            '4. Beri sedikit air, masak sampai bumbu meresap\n'
            '5. Angkat dan sajikan',
    kalori: '118',
    waktu: '20',
    foto: 'images/lunch1.jpeg'
  ),
  MenuModel(
    kategori: 'Lunch',
    nama: 'Oseng sawi putih jagung manis',
    bahan: '- 1 buah/bonggol sawi putih potong-potong\n- 1 buah jagung manis, serut\n'
            '- 3 siung bawang putih cincang\n- secukupnya cabai\n- gula garam kaldu bubuk secukupnya\n- air secukupnya',
    tahap: '1. Tumis bawang putih sampai harum, masukkan cabai uleg, jagung, dan air\n'
            '2. Tunggu sampai jagung empuk/cukup matang\n'
            '3. Masukkan sawi putih, tambah garam gula dan kaldu bubuk\n'
            '4. Aduk rata tunggu sawi layu, matikan kompor\n'
            '5. Sajikan pada mangkuk.',
    kalori: '40',
    waktu: '30',
    foto: 'images/lunch2.jpeg'
  ),
  MenuModel(
    kategori: 'Dinner',
    nama: 'Kangkung telur puyuh',
    bahan: '- 1 ikat besar kangkung, petiki\n- 15 butir telur puyuh, rebus kupas\n'
            '- 1/2 buah bawang bombay, rajang\n- 3 butir bawang putih, cincang halus\n'
            '- 2 sdm tauco asin\n- 1 sdm saus tiram\n- Kecap asin sesuai selera\n'
            '- Kecap manis sesuai selera\n- Kaldu jamur bubuk sesuai selera\n'
            '- 1 sdt merica hitam tumbuk\n- 1 gelas air\n- Larutan 1 sdt tepung maizena\n- Minyak untuk menumis',
    tahap: '1. Tumis bawang putih dan bawang bobay hingga wangi. Masukkan tauco disusul saus tiram, kecap asin, kecap manis, kaldu bubuk, dan merica.\n'
            '2. Masukkan kangkung, tumis hingga layu lalu tuang air, jika sudah mendidih masukkan telur puyuh.\n'
            '3. Tuangkan larutan tepung maizena sedikit demi sedikit sambil terus diaduk hingga mengental.\n'
            '4. Koreksi rasa. Jika sudah matang matikan api. Angkat dan sajikan segera.',
    kalori: '225',
    waktu: '25',
    foto: 'images/dinner1.jpeg',
  ),
  MenuModel(
      kategori: 'Dinner',
      nama: 'Nasi goreng kecap',
      bahan: '- 2 piring nasi dingin\n- 5 buah bakso sapi\n- Daging ayam secukupnya\n'
              '- ½ buah paprika merah\n- ½ buah paprika hijau\n- 3 siung bawang putih (chop halus)\n'
              '- 2 siung bawang merah (chop halus)\n- 1 batang daun bawang (rajang halus)\n'
              '- 1 sdt garam\n- ½ sdt kaldu bubuk\n- 1 sachet kecil kecap manis\n'
              '- 2 sdm saos raja rasa\n- 1 sdm saos tomat\n- Minyak goreng secukupnya',
      tahap: '1. Siapakan bumbu dan pelengkap nasi goreng\n'
              '2. Panaskan wajan,tambahkan minyak dan tumis bawang merah dan bawang putih hingga harum\n'
              '3. Masukan secara bertahap daging ayam dan bakso terlebih dahulu hingga matang. Kemudian masukan paprika hijau,paprika merah dan daun bawang aduk rata\n'
              '4. Kemudian masukan nasi aduk sebentar dan bumbui dengan garam,kaldu bubuk,kecap manis, saos raja rasa dan saos tomat\n'
              '5. Aduk hingga tercampur rata\n'
              '6. Nasi goreng kecap siap disajikan',
      kalori: '343',
      waktu: '20',
      foto: 'images/dinner2.jpeg'
    ),
  MenuModel(
    kategori: 'Dessert',
    nama: 'Pudding chocolate',
    bahan: '- premix Puding Chocolate\n- air\n- whipcream\n- chocochips',
    tahap: '1. Campurkan 1 kg Premix Puding Chocolate dengan 3000 cc air (15 gelas)\n'
            '2. Panaskan dengan api sedang hingga mendidih. Biarkan mendidih selama beberapa detik sebelum diangkat\n'
            '3. Angkat dan tuang dalam gelas/cetakan\n'
            '4. Tambahkan whipcream dan chocochips sesuai selera.',
    kalori: '141',
    waktu: '10',
    foto: 'images/dessert1.jpeg',
  ),
  MenuModel(
    kategori: 'Dessert',
    nama: 'Mango cheese cake',
    bahan: '- 100 gr keju cheddar, parut\n- 2 sdm gula pasir\n- 1 sdt garam\n- 2 sdm susu kental manis'
            '- 250 ml susu cair\n- 2 sdm tepung maizena, larutkan dengan 3 sdm air\n'
            '- 1 buah mangga harum manis, potong dadu kecil\n- 1 bungkus biskuit sari gandum, haluskan',
    tahap: 'Vla: campur keju, gula pasir, garam,susu kental manis, dan susu cair\n'
            '1. Masak sambil terus diaduk sampai mendidih'
            '2. Tambahkan larutan maizena. Aduk hingga kental'
            '3. Matikan api\n'
            '4. Masukkan potongan mangga ke dalam saus vla, aduk rata. Dinginkan\n'
            '5. Susun vla dan remahan biskuit selang seling hingga memenuhi gelas saji\n'
            '6. Simpan dalam lemari es hingga dingin.',
    kalori: '400',
    waktu: '20',
    foto: 'images/dessert2.jpeg',
  ),
];