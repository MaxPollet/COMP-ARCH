��   �   0     �    
     |     �  �      ,  �   -  7  �  �  7  -      F   .     u     �  7   �  �   �  �   q  �   $  I      �   j  �   �  �   �  �  ~  H   -     v  E   �  �   <    �  >   �  �   (  9   �  �   �  �   �  �      �   �   �   a!  �   �!  l   �"      #     :#     T#     n#     �#     �#     �#     �#     �#  z   $     �$     �$     �$  .   �$  6   %     ;%     N%     b%     g%  !   }%  !   �%  '   �%     �%     	&     )&  *   H&  /   s&  %   �&     �&  /   �&  ,   '     8'  4   N'  $   �'     �'     �'     �'     �'     (      0(      Q(  h   r(  <   �(     )  :   +)  &   f)  $   �)     �)  2   �)      *  $   *  /   B*  I   r*     �*     �*  3   �*  =   +  6   X+  d   �+  [   �+      P,  O   q,  .   �,  /   �,      -  A   ;-  .   }-  0   �-  )   �-     .     .     ).  ;   C.  <   .  8   �.  6   �.     ,/     I/     d/  (   y/  I   �/  !   �/  '   0  '   60  9   ^0     �0     �0  0   �0     �0  <   �0  -   )1  @   W1  8   �1  >   �1  /   2  7   @2  D   x2  5   �2  &   �2  '   3     B3  %   J3     p3     �3  
   �3  
   �3  
   �3  
   �3  
   �3  	   �3  	   �3  	   �3  	   �3  	   �3  	   �3  	   	4  "   4  *   64     a4  A   u4  Q   �4  *   	5  @   45  !   u5     �5  �  �5  �   77  �  58  !  �;  6   �=  P   >     l>     �>  6   �>  �   �>  �   �?  �   �@  O   �A  �   �A  9  ZB  �   �C  �  5D  s   %F  �   �F  J   !G  �   lG  4  H  M   LI  �   �I  @   lJ  �   �J  �   �K  �   L    �L  �   �M  �   sN  v   [O     �O     �O  #   P      0P  %   QP     wP     �P     �P     �P  �   �P     uQ  #   �Q     �Q  %   �Q  H   �Q     7R     KR     bR     gR  "   �R  #   �R  %   �R  %   �R  $   S     9S  4   WS  A   �S  1   �S      T  :   T  2   JT     }T  <   �T  )   �T     �T  !   U     @U     \U     {U  !   �U  (   �U  c   �U  H   DV     �V  K   �V  *   �V  :   W     UW  2   tW  #   �W  .   �W  1   �W  F   ,X     sX      �X  /   �X  P   �X  C   +Y  s   oY  r   �Y  %   VZ  N   |Z  2   �Z  2   �Z  "   1[  I   T[  F   �[  L   �[  9   2\     l\     z\     �\  ?   �\  B   �\  C   9]  >   }]     �]     �]     �]  -   ^  X   F^  .   �^  0   �^  -   �^  F   -_  &   t_     �_  A   �_     �_  A   �_  :   *`  K   e`  ?   �`  E   �`  3   7a  3   ka  V   �a  -   �a  (   $b  '   Mb  
   ub  +   �b     �b     �b     �b     �b     �b     �b     �b     �b     �b     �b     �b     �b      c     c  (   c  :   1c     lc  S   �c  v   �c  -   Rd  >   �d  '   �d     �d     �   V                       l   /       K       	          4   ^   O   �      y   E   �      k   @   o      p   J           M   h   �       $       G       %   |   ]       R       s   ~              e      N   #          &   �      Q   �          b           
   \      6   c       _           Y       "   i   >   .   S                  w          t           u   D       5   r       X               q   �      )      �           !   1   �   A               (       :   C   F   }   B   H   m   +       '   �               f   Z           �      �      �   �                  {   �             �   <   a   �   �   -   *   `   g   n   �   0           ?                   T          z           �       L      �       ,       3   x       �   �   �   �   d   �   j       I   �      [   �   �   9   �   2   7      8   W              U   ;      =   P           v      �d     �d  �  �  �  �  �    �d         
   ����e  2          ����De  0               ����ye  	       #   �����e  -          �����e  -               ���� 
  --delta[=OPTS]      Delta filter; valid OPTS (valid values; default):
                        dist=NUM   distance between bytes being subtracted
                                   from each other (1-256; 1) 
  --lzma1[=OPTS]      LZMA1 or LZMA2; OPTS is a comma-separated list of zero or
  --lzma2[=OPTS]      more of the following options (valid values; default):
                        preset=PRE reset options to a preset (0-9[e])
                        dict=NUM   dictionary size (4KiB - 1536MiB; 8MiB)
                        lc=NUM     number of literal context bits (0-4; 3)
                        lp=NUM     number of literal position bits (0-4; 0)
                        pb=NUM     number of position bits (0-4; 2)
                        mode=MODE  compression mode (fast, normal; normal)
                        nice=NUM   nice length of a match (2-273; 64)
                        mf=NAME    match finder (hc3, hc4, bt2, bt3, bt4; bt4)
                        depth=NUM  maximum search depth; 0=automatic (default) 
  --x86[=OPTS]        x86 BCJ filter (32-bit and 64-bit)
  --powerpc[=OPTS]    PowerPC BCJ filter (big endian only)
  --ia64[=OPTS]       IA-64 (Itanium) BCJ filter
  --arm[=OPTS]        ARM BCJ filter (little endian only)
  --armthumb[=OPTS]   ARM-Thumb BCJ filter (little endian only)
  --sparc[=OPTS]      SPARC BCJ filter
                      Valid OPTS for all BCJ filters:
                        start=NUM  start offset for conversions (default=0) 
 Basic file format and compression options:
 
 Custom filter chain for compression (alternative for using presets): 
 Operation modifiers:
 
 Other options:
 
With no FILE, or when FILE is -, read standard input.
       --block-list=SIZES
                      start a new .xz block after the given comma-separated
                      intervals of uncompressed data       --block-size=SIZE
                      start a new .xz block after every SIZE bytes of input;
                      use this to set the block size for threaded compression       --flush-timeout=TIMEOUT
                      when compressing, if more than TIMEOUT milliseconds has
                      passed since the previous flush and reading more input
                      would block, all pending data is flushed out       --ignore-check  don't verify the integrity check when decompressing       --info-memory   display the total amount of RAM and the currently active
                      memory usage limits, and exit       --memlimit-compress=LIMIT
      --memlimit-decompress=LIMIT
  -M, --memlimit=LIMIT
                      set memory usage limit for compression, decompression,
                      or both; LIMIT is in bytes, % of RAM, or 0 for defaults       --no-adjust     if compression settings exceed the memory usage limit,
                      give an error instead of adjusting the settings downwards       --no-sparse     do not create sparse files when decompressing
  -S, --suffix=.SUF   use the suffix `.SUF' on compressed files
      --files[=FILE]  read filenames to process from FILE; if FILE is
                      omitted, filenames are read from the standard input;
                      filenames must be terminated with the newline character
      --files0[=FILE] like --files but use the null character as terminator       --robot         use machine-parsable messages (useful for scripts)       --single-stream decompress only the first stream, and silently
                      ignore possible remaining input data       CheckVal %*s Header  Flags        CompSize    MemUsage  Filters   -0 ... -9           compression preset; default is 6; take compressor *and*
                      decompressor memory usage into account before using 7-9!   -F, --format=FMT    file format to encode or decode; possible values are
                      `auto' (default), `xz', `lzma', and `raw'
  -C, --check=CHECK   integrity check type: `none' (use with caution),
                      `crc32', `crc64' (default), or `sha256'   -Q, --no-warn       make warnings not affect the exit status   -T, --threads=NUM   use at most NUM threads; the default is 1; set to 0
                      to use as many threads as there are processor cores   -V, --version       display the version number and exit   -e, --extreme       try to improve compression ratio by using more CPU time;
                      does not affect decompressor memory requirements   -h, --help          display the short help (lists only the basic options)
  -H, --long-help     display this long help and exit   -h, --help          display this short help and exit
  -H, --long-help     display the long help (lists also the advanced options)   -k, --keep          keep (don't delete) input files
  -f, --force         force overwrite of output file and (de)compress links
  -c, --stdout        write to standard output and don't delete input files   -q, --quiet         suppress warnings; specify twice to suppress errors too
  -v, --verbose       be verbose; specify twice for even more verbose   -z, --compress      force compression
  -d, --decompress    force decompression
  -t, --test          test compressed file integrity
  -l, --list          list information about .xz files   Blocks:
    Stream     Block      CompOffset    UncompOffset       TotalSize      UncompSize  Ratio  Check   Blocks:             %s
   Check:              %s
   Compressed size:    %s
   Memory needed:      %s MiB
   Minimum XZ Utils version: %s
   Number of files:    %s
   Ratio:              %s
   Sizes in headers:   %s
   Stream padding:     %s
   Streams:
    Stream    Blocks      CompOffset    UncompOffset        CompSize      UncompSize  Ratio  Check      Padding   Streams:            %s
   Uncompressed size:  %s
  Operation mode:
 %s MiB of memory is required. The limit is %s. %s MiB of memory is required. The limiter is disabled. %s file
 %s files
 %s home page: <%s>
 %s:  %s: Cannot remove: %s %s: Cannot set the file group: %s %s: Cannot set the file owner: %s %s: Cannot set the file permissions: %s %s: Closing the file failed: %s %s: Error reading filenames: %s %s: Error seeking the file: %s %s: File already has `%s' suffix, skipping %s: File has setuid or setgid bit set, skipping %s: File has sticky bit set, skipping %s: File is empty %s: File seems to have been moved, not removing %s: Filename has an unknown suffix, skipping %s: Filter chain: %s
 %s: Input file has more than one hard link, skipping %s: Invalid argument to --block-list %s: Invalid filename suffix %s: Invalid multiplier suffix %s: Invalid option name %s: Invalid option value %s: Is a directory, skipping %s: Is a symbolic link, skipping %s: Not a regular file, skipping %s: Null character found when reading filenames; maybe you meant to use `--files0' instead of `--files'? %s: Options must be `name=value' pairs separated with commas %s: Read error: %s %s: Seeking failed when trying to create a sparse file: %s %s: Too many arguments to --block-list %s: Too small to be a valid .xz file %s: Unexpected end of file %s: Unexpected end of input when reading filenames %s: Unknown file format type %s: Unsupported integrity check type %s: Value is not a non-negative decimal integer %s: With --format=raw, --suffix=.SUF is required unless writing to stdout %s: Write error: %s %s: poll() failed: %s --list does not support reading from standard input --list works only on .xz files (--format=xz or --format=auto) 0 can only be used as the last element in --block-list Adjusted LZMA%c dictionary size from %s MiB to %s MiB to not exceed the memory usage limit of %s MiB Adjusted the number of threads from %s to %s to not exceed the memory usage limit of %s MiB Cannot establish signal handlers Cannot read data from standard input when reading filenames from standard input Compressed data cannot be read from a terminal Compressed data cannot be written to a terminal Compressed data is corrupt Compression and decompression with --robot are not supported yet. Compression support was disabled at build time Decompression support was disabled at build time Decompression will need %s MiB of memory. Disabled Empty filename, skipping Error creating a pipe: %s Error getting the file status flags from standard input: %s Error getting the file status flags from standard output: %s Error restoring the O_APPEND flag to standard output: %s Error restoring the status flags to standard input: %s Failed to enable the sandbox File format not recognized Internal error (bug) LZMA1 cannot be used with the .xz format Mandatory arguments to long options are mandatory for short options too.
 Maximum number of filters is four Memory usage limit for compression:     Memory usage limit for decompression:   Memory usage limit is too low for the given filter setup. Memory usage limit reached No No integrity check; not verifying file integrity None Only one file can be specified with `--files' or `--files0'. Report bugs to <%s> (in English or Finnish).
 Strms  Blocks   Compressed Uncompressed  Ratio  Check   Filename Switching to single-threaded mode due to --flush-timeout THIS IS A DEVELOPMENT VERSION NOT INTENDED FOR PRODUCTION USE. The .lzma format supports only the LZMA1 filter The environment variable %s contains too many arguments The exact options of the presets may vary between software versions. The filter chain is incompatible with --flush-timeout The sum of lc and lp must not exceed 4 Total amount of physical memory (RAM):  Totals: Try `%s --help' for more information. Unexpected end of input Unknown error Unknown-11 Unknown-12 Unknown-13 Unknown-14 Unknown-15 Unknown-2 Unknown-3 Unknown-5 Unknown-6 Unknown-7 Unknown-8 Unknown-9 Unsupported LZMA1/LZMA2 preset: %s Unsupported filter chain or filter options Unsupported options Unsupported type of integrity check; not verifying file integrity Usage: %s [OPTION]... [FILE]...
Compress or decompress FILEs in the .xz format.

 Using a preset in raw mode is discouraged. Valid suffixes are `KiB' (2^10), `MiB' (2^20), and `GiB' (2^30). Writing to standard output failed Yes Project-Id-Version: xz 5.2.4
Report-Msgid-Bugs-To: xz@tukaani.org
PO-Revision-Date: 2022-08-27 04:30+0300
Last-Translator: Emir SARI <emir_sari@icloud.com>
Language-Team: Turkish <gnome-turk@gnome.org>
Language: tr
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Bugs: Report translation errors to the Language-Team address.
Plural-Forms: nplurals=2; plural=(n > 1);
 
  --delta[=SÇNKLR]    Delta süzgeci; geçerli SÇNKLR (geçerli değerler;
                        öntanımlı):
                        dist=NUM   birbirinden çırakılar baytlar arasındaki
                                     uzaklık (1-256; 1) 
  --lzma1[=SÇNKLR]    LZMA1 veya LZMA2; OPTS, sıfır veya aşağıdaki
  --lzma2[=SÇNKLR]    seçeneklerin virgülle ayrılmış değerleridir (geçerli
                      değerler; öntanımlı):
                        preset=ÖNA seçenekleri bir önayara sıfırla (0-9[e])
                        dict=NUM   sözlük boyutu (4KiB - 1536MiB; 8MiB)
                        lc=NUM     düz bağlam bitlerinin sayısı (0-4; 3)
                        lp=NUM     düz konum bitlerinin sayısı (0-4; 0)
                        pb=NUM     konum bitlerinin sayısı (0-4; 2)
                        mode=KİP   sıkıştırma kipi (fast, normal; normal)
                        nice=NUM   bir eşleşmenin öncelik uzunluğu (2-273; 64)
                        mf=AD      eşleşme bul (hc3, hc4, bt2, bt3, bt4; bt4)
                        depth=NUM  en büyük arama derinliği; 0=oto (öntanımlı) 
  --x86[=SÇNKLR]      x86 BCJ süzgeci (32 bit ve 64 bit)
  --powerpc[=SÇNKLR]  PowerPC BCJ süzgeci (yalnızca yüksek son basamaklı)
  --ia64[=SÇNKLR]     IA-64 (Itanium) BCJ süzgeci
  --arm[=SÇNKLR]      ARM BCJ süzgeci (yalnızca düşük son basamaklı)
  --armthumb[=SÇNKLR] ARM-Thumb BCJ süzgeci (yalnızca düşük son basamaklı)
  --sparc[=SÇNKLR]    SPARC BCJ süzgeci
                      Tüm BCJ süzgeçleri için geçerli SÇNKLR:
                        start=NUM  dönüşümler başlangıç ofseti (öntanımlı=0) 
 Temel dosya biçimi ve sıkıştırma seçenekleri:
 
 Sıkıştırma için özel süzgeç zinciri (önayar kullanımı alternatifi): 
 İşlem değiştiricileri:
 
 Diğer seçenekler:
 
DSYA olmadan veya DSYA - iken standart girdi'yi oku.
       --block-list=BOYUTLAR
                      sıkıştırılmamış verinin virgülle ayrılmış verilen
                        aralıklarından sonra yeni bir .xz bloku başlat       --block-size=BOYUT
                      her BOYUT bayt girdiden sonra yeni bir .xz bloku başlat;
                        iş parçacığı kullanan sıkıştırma için blok boyutunu
                        ayarlamak için bunu kullanın       --flush-timeout=ZAMANAŞIMI
                      sıkıştırırken, bir önceki floştan bu yana ZAMANAŞIMI
                        milisaniye geçmişse ve daha çok girdi okuma bloklarsa
                        tüm bekleyen veri floşlanır       --ignore-check  sıkıştırma açarken bütünlük denetimini doğrulama       --info-memory   toplam RAM miktarını ve şu anki bellek kullanımı
                        limitlerini görüntüle ve çık       --memlimit-compress=LİMİT
      --memlimit-decompress=LİMİT
  -M, --memlimit=LİMİT
                      sıkıştırma, sıkıştırma açma veya her ikisi için bellek
                        kullanımı limitini ayarla; LİMİT, bayt, RAM % veya
                        öntanımlılar için 0'dır       --no-adjust     sıkıştırma ayarları bellek kullanımı limitini aşarsa
                        ayarı aşağı doğru düzeltmek yerine bir hata ver       --no-sparse     sıkıştırma açarken aralıklı dosyalar oluşturma
  -S, --suffix=.SUF   sıkıştırılmış dosyalarda `.SUF' sonekini kullan
      --files[=DOSYA] DOSYA'dan işlemek için dosya adlarını oku; DOSYA
                        atlanırsa dosya adları standart girdi'den okunur;
                        dosya adları, yenisatır karakteri ile sonlanmalıdır
      --files0[=DSYA] --files gibi; ancak sonlandırıcı olarak null karakteri
                        kullan       --robot         makine-ayrıştırılabilir iletiler kullan (betikler için
                        yararlı)       --single-stream yalnızca ilk akışın sıkıştırmasını aç ve sessizce
                        kalan girdi verisini yok say     DğrDentm %*s Üstvri  Bayrak     SkştrBoyut   BelKullnm  Süzgeçler   -0 ... -9           sıkıştırma önayarı; öntanımlı 6; 7-9 kullanmadan önce
                        sıkıştırma açıcı bellek kullanımını hesaba katın!   -F, --format=BÇM    kodlanacak veya kodu çözülecek dosya biçimi; olası
                        değerler: `auto' (öntanımlı), `xz', `lzma' ve `raw'
  -C, --check=DNTLE   bütünlük denetimi türü: `none' (dikkatlu kullanın),
                        `crc32', `crc64' (öntanımlı) veya `sha256'   -Q, --no-warn       uyarıların çıkış durumunu etkilemesine izin verme   -T, --threads=SAYI  en çok SAYI iş parçacığı kullan; öntanımlı 1; var olan
                        işlemci çekirdeği kadar iş parçacığı kullanmak için
                        0'a ayarlayın   -V, --version       sürüm numarasını görüntüle ve çık   -e, --extreme       daha çok CPU zamanı kullanarak sıkıştırma oranını
                        iyileştirmeye çalış; sıkıştırma açıcı bellek
                        gereksinimlerini etkilemez   -h, --help          kısa yardımı görüntüle (temel seçenekleri listeler)
  -H, --long-help     bu uzun yardımı görüntüle ve çık   -h, --help          bu kısa yardımı görüntüle ve çık
  -H, --long-help     uzun yardımı görüntüle (gelişmiş seçenekleri listeler)   -k, --keep          girdi dosyalarını tut (silme)
  -f, --force         çıktı dosyası üzerine yazmayı zorla ve bağlantıları
                        sıkıştır/sıkıştırmayı aç
  -c, --stdout        standart çıktıya yaz ve girdi dosyalarını silme   -q, --quiet         uyarıları sustur; hataları da susturmak için iki kez
                        belirt
  -v, --verbose       ayrıntılı ol; daha da çok ayrıntı için iki kez belirt   -z, --compress      sıkıştırmayı zorla
  -d, --decompress    sıkıştırma açmayı zorla
  -t, --test          sıkıştırılmış dosya bütünlüğünü sına
  -l, --list          .xz dosyaları hakkında bilgi listele   Bloklar:
      Akış      Blok     SkştrOfseti   SkştrmmşOfset     ToplamBoyut   SkştrmmşBoyut   Oran  Denetim   Bloklar:               %s
   Denetim:               %s
   Sıkıştırılmış boyut:   %s
   Gereken bellek:        %s MiB
   En düşük XZ Utils sürümü: %s
   Dosya sayısı:          %s
   Oran:                  %s
   Üstverideki boyut:     %s
   Akış dolgusu:          %s
   Akışlar:
      Akış   Bloklar     SkştrOfseti   SkştrmmşOfset      SkştrBoyut   SkştrmmşBoyut   Oran  Denetim      Dolgu   Akışlar:               %s
   Sıkıştırılmamış boyut: %s
  İşlem kipi:
 %s MiB bellek gerekiyor. Sınır, %s. %s MiB bellek gerekiyor. Sınırlandırıcı devre dışı bırakıldı. %s dosya
 %s dosya
 %s ana sayfası: <%s>
 %s:  %s: Kaldırılamıyor: %s %s: Dosya grubu ayarlanamıyor: %s %s: Dosya sahibi ayarlanamıyor: %s %s: Dosya izinleri ayarlanamıyor: %s %s: Dosyayı kapatma başarısız: %s %s: Dosya adları okunurken hata: %s %s: Dosyayı ararken hata: %s %s: Dosyada '%s' soneki halihazırda var, atlanıyor %s: Dosyanın setuid'si veya setgid biti ayarlanmış, atlanıyor %s: Dosyanın yapışkan bit seti var, atlanıyor %s: Dosya boş %s: Dosya taşınmış gibi görünüyor, kaldırılmıyor %s: Dosya adında bilinmeyen sonek var, atlanıyor %s: Süzgeç zinciri: %s
 %s: Girdi dosyasında birden çok sabit bağ var, atlanıyor %s: --block-list için geçersiz argüman %s: Geçersiz dosya adı soneki %s: Geçersiz çoklayıcı soneki %s: Geçersiz seçenek adı %s: Geçersiz seçenek değeri %s: Bir dizin, atlanıyor %s: Bir sembolik bağ, atlanıyor %s: Olağan bir dosya değil, atlanıyor %s: Dosya adları okunurken boş karakter bulundu; '--files' yerine '--files0' mı demek istediniz? %s: Seçenekler, virgülle ayrılmış 'ad=değer' çiftleri olmalıdır %s: Okuma hatası: %s %s: Bir aralıklı dosya oluşturmaya çalışırken arama başarısız: %s %s: --block-list için çok fazla argüman %s: Geçerli bir .xz dosyası olabilmek için pek küçük %s: Dosyanın beklenmedik sonu %s: Dosya adları okunurken beklenmedik girdi sonu %s: Bilinmeyen dosya biçimi türü %s: Desteklenmeyen bütünlük denetimi türü %s: Değer, bir negatif olmayan ondalık tamsayı %s: --format-raw ile, stdout'a yazılmıyorsa --suffix=.SUF gereklidir %s: Yazma hatası: %s %s: poll() başarısız oldu: %s --list, standart girdi'den okumayı desteklemez --list, yalnızca .xz dosyalarında çalışır (--format=xz veya --format=auto) 0, yalnızca --block-list içindeki son öge olarak kullanılabilir %4$s MiB bellek kullanımı sınırını aşmamak için LZMA%1$c sözlük boyutu %2$s MiB'tan %3$s MiB'a ayarlandı %3$s MiB bellek kullanımı sınırını aşmamak için iş parçacığı sayısı %1$s -> %2$s olarak düzenlendi Sinyal işleyicileri tesis edilemiyor Standart girdi'den dosya adları okunurken standart girdi'den veri okunamıyor Bir uçbirimden sıkıştırılmış veri okunamaz Bir uçbirime sıkıştırılmış veri yazılamaz Sıkıştırılmış veri hasarlı --robot ile sıkıştırma ve sıkıştırma açma henüz desteklenmiyor. Sıkıştırma desteği, yapım sırasında devre dışı bırakıldı Sıkıştırma açma desteği, yapım sırasında devre dışı bırakıldı Sıkıştırma açma, %s MiB belleğe gereksinim duyacak. Devre dışı Boş dosya adı, atlanıyor Veriyolu oluştururken hata: %s Standart girdi'den dosya durum bayrakları alınırken hata: %s Standart çıktı'dan dosya durum bayrakları alınırken hata: %s Standart çıktı'dan O_APPEND bayrağı geri yüklenirken hata: %s Standart girdi'ye durum bayrakları geri yüklenirken hata: %s Kum havuzu etkinleştirilemedi Dosya biçimi tanımlanamıyor İç hata (yazılım hatası) LZMA1, .xz biçimi ile birlikte kullanılamaz Uzun seçenekler için zorunlu olan argümanlar kısa seçenekler için de geçerlidir.
 Olabilecek en çok süzgeç sayısı dörttür Sıkıştırma için bellek kullanım sınırı: Açma için bellek kullanım sınırı:       Verilen süzgeç ayarı için bellek kullanım sınırı pek düşük. Bellek kullanım sınırına erişildi Hayır Bütünlülük denetimi yok; dosya bütünlüğü doğrulanmıyor Yok '--files' veya '--files0' ile yalnızca bir dosya belirtilebilir. Hataları <%s> adresine bildirin (İngilizce veya Fince).
  Akış    Blok  Sıkıştırıl. Sıkıştırmas.   Oran  Denetim Dosya ad --flush-timeout nedeniyle tek iş parçacıklı kipe geçiliyor BU, NORMAL KULLANIM İÇİN OLMAYAN BİR GELİŞTİRME SÜRÜMÜDÜR. .lzma biçimi, yalnızca LZMA1 süzgecini destekler Çevre değişkeni %s, pek fazla argüman içeriyor Önayarların kesin seçenekleri yazılım sürümleri arasında ayrım gösterebilir. Süzgeç zinciri, --flush-timeout ile uyumsuz lc ve lp'nin toplamı 4'ü geçmemelidir Toplam fiziksel bellek boyutu (RAM):    Toplamlar: Daha fazla bilgi için '%s --help' deneyin. Beklenmedik girdi sonu Bilinmeyen hata ?-11 ?-12 ?-13 ?-14 ?-15 ?-2 ?-3 ?-5 ?-6 ?-7 ?-8 ?-9 Desteklenmeyen LZMA1/LZMA2 önayarı: %s Desteklenmeyen süzgeç zinciri veya süzgeç seçenekleri Desteklenmeyen seçenekler Desteklenmeyen bütünlülük denetimi türü; dosya bütünlüğü doğrulanmıyor Kullanım: %s [SEÇENEK]... [DOSYA]...
.xz biçimindeki dosyaları sıkıştırın veya sıkıştırmasını açın.

 Ham kipte bir önayar kullanımı önerilmez. Geçerli sonekler: 'KiB' (2^10), 'MiB' (2^20) ve 'GiB' (2^30). Standart çıktı'ya yazma başarısız Evet PRIu32 PRIu64 Using up to % threads. The selected match finder requires at least nice=% Value of the option `%s' must be in the range [%, %] En çok % iş parçacığı kullanılıyor. Seçili eşleşme bulucusu en azından nice=% gerektirir '%s' seçeneği değeri erimde olmalıdır [%, %] 