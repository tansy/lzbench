The following results are obtained with `lzbench 1.8` with the `-t16,16 -eall` options using 1 core of Intel Core i7-8700K, Ubuntu 18.04.3 64-bit, and clang 9.0.1
with ["silesia.tar"](https://github.com/DataCompression/corpus-collection/tree/main/Silesia-Corpus) which contains zipped files from [Silesia compression corpus](http://sun.aei.polsl.pl/~sdeor/index.php?page=silesia).
The results are sorted by ratio. The results in **bold** show pareto frontier on compression ratio.

| Compressor name         | Compress.  |Decompress. | Compr. size | Ratio |
| ---------------         | -----------| -----------| ----------- | ----- |
| lzlib 1.11 -9           | **1.82 MB/s** | **76 MB/s** |    48296889 | 22.79 |
| fastlzma2 1.0.1 -10     | **3.99 MB/s** | **105 MB/s** |    48666065 | 22.96 |
| lzma 19.00 -9           |  2.66 MB/s | **107 MB/s** |    48707450 | 22.98 |
| xz 5.2.4 -9             |  2.62 MB/s |    88 MB/s |    48745306 | 23.00 |
| fastlzma2 1.0.1 -8      | **5.18 MB/s** |   103 MB/s |    49126740 | 23.18 |
| xz 5.2.4 -6             |  2.95 MB/s |    89 MB/s |    49195929 | 23.21 |
| lzma 19.00 -5           |  3.28 MB/s |   103 MB/s |    49710307 | 23.45 |
| lzlib 1.11 -6           |  2.82 MB/s |    74 MB/s |    49777495 | 23.49 |
| csc 2016-10-13 -5       |  3.86 MB/s |    77 MB/s |    49801577 | 23.50 |
| brotli 2019-10-01 -11   |  0.63 MB/s | **451 MB/s** |    50412404 | 23.79 |
| fastlzma2 1.0.1 -5      | **7.44 MB/s** |   103 MB/s |    51209571 | 24.16 |
| zstd 1.4.3 -22          |  2.28 MB/s | **865 MB/s** |    52738312 | 24.88 |
| tornado 0.6a -16        |  2.15 MB/s |   207 MB/s |    53257046 | 25.13 |
| csc 2016-10-13 -3       | **9.38 MB/s** |    71 MB/s |    53477914 | 25.23 |
| zstd 1.4.3 -18          |  3.58 MB/s | **912 MB/s** |    53690572 | 25.33 |
| fastlzma2 1.0.1 -3      | **11 MB/s** |    94 MB/s |    54023837 | 25.49 |
| bzip2 1.0.8 -9          | **15 MB/s** |    41 MB/s |    54572811 | 25.75 |
| lzham 1.0 -d26 -1       |  2.98 MB/s |   340 MB/s |    54740589 | 25.83 |
| tornado 0.6a -13        |  6.94 MB/s |   202 MB/s |    55614072 | 26.24 |
| bzip2 1.0.8 -5          | **16 MB/s** |    44 MB/s |    55724395 | 26.29 |
| xz 5.2.4 -3             |  6.76 MB/s |    84 MB/s |    55745125 | 26.30 |
| csc 2016-10-13 -1       | **21 MB/s** |    73 MB/s |    56201092 | 26.52 |
| lzlib 1.11 -3           |  6.81 MB/s |    69 MB/s |    56320674 | 26.57 |
| brotli 2019-10-01 -8    |    10 MB/s |   533 MB/s |    57140168 | 26.96 |
| zstd 1.4.3 -15          |  7.12 MB/s | **1024 MB/s** |    57167422 | 26.97 |
| lzma 19.00 -4           |    14 MB/s |    95 MB/s |    57201645 | 26.99 |
| tornado 0.6a -10        |  5.73 MB/s |   192 MB/s |    57588241 | 27.17 |
| lzma 19.00 -2           | **25 MB/s** |    91 MB/s |    58867911 | 27.77 |
| tornado 0.6a -7         |    16 MB/s |   194 MB/s |    59026325 | 27.85 |
| fastlzma2 1.0.1 -1      |    23 MB/s |    90 MB/s |    59030954 | 27.85 |
| zstd 1.4.3 -11          |    20 MB/s |  1001 MB/s |    59239357 | 27.95 |
| brotli 2019-10-01 -5    | **35 MB/s** |   520 MB/s |    59568603 | 28.11 |
| bzip2 1.0.8 -1          |    18 MB/s |    52 MB/s |    60484813 | 28.54 |
| zling 2018-10-12 -4     | **46 MB/s** |   226 MB/s |    60626768 | 28.60 |
| lizard 1.0 -49          |  1.95 MB/s | **1729 MB/s** |    60679215 | 28.63 |
| zstd 1.4.3 -8           |    46 MB/s |  1055 MB/s |    60757793 | 28.67 |
| zling 2018-10-12 -3     | **53 MB/s** |   226 MB/s |    60999828 | 28.78 |
| xpack 2016-06-02 -9     |    17 MB/s |  1116 MB/s |    61240928 | 28.89 |
| zling 2018-10-12 -2     | **60 MB/s** |   225 MB/s |    61503093 | 29.02 |
| zling 2018-10-12 -1     | **67 MB/s** |   221 MB/s |    62022546 | 29.26 |
| xpack 2016-06-02 -6     |    43 MB/s |  1086 MB/s |    62213845 | 29.35 |
| tornado 0.6a -6         |    34 MB/s |   195 MB/s |    62364583 | 29.42 |
| xz 5.2.4 -0             |    24 MB/s |    70 MB/s |    62579435 | 29.53 |
| zling 2018-10-12 -0     | **75 MB/s** |   216 MB/s |    62990590 | 29.72 |
| crush 1.0 -2            |  0.82 MB/s |   468 MB/s |    63746223 | 30.08 |
| lzlib 1.11 -0           |    36 MB/s |    61 MB/s |    63847386 | 30.12 |
| zstd 1.4.3 -5           | **104 MB/s** |   932 MB/s |    63993747 | 30.19 |
| lzma 19.00 -0           |    34 MB/s |    80 MB/s |    64013917 | 30.20 |
| lzham 1.0 -d26 -0       |    11 MB/s |   271 MB/s |    64089870 | 30.24 |
| tornado 0.6a -5         |    51 MB/s |   195 MB/s |    64129604 | 30.26 |
| libdeflate 1.3 -12      |  7.39 MB/s |   900 MB/s |    64801629 | 30.57 |
| brieflz 1.2.0 -8        |  0.46 MB/s |   473 MB/s |    64912139 | 30.63 |
| libdeflate 1.3 -9       |    16 MB/s |   898 MB/s |    65701539 | 31.00 |
| crush 1.0 -1            |  6.11 MB/s |   455 MB/s |    66494412 | 31.37 |
| brieflz 1.2.0 -6        |    19 MB/s |   468 MB/s |    67208420 | 31.71 |
| lizard 1.0 -45          |    17 MB/s | **1810 MB/s** |    67317588 | 31.76 |
| lzfse 2017-03-08        |    90 MB/s |   934 MB/s |    67624281 | 31.91 |
| zlib 1.2.11 -9          |    14 MB/s |   404 MB/s |    67644548 | 31.92 |
| libdeflate 1.3 -6       |    99 MB/s |   924 MB/s |    67928189 | 32.05 |
| brotli 2019-10-01 -2    | **154 MB/s** |   485 MB/s |    68060686 | 32.11 |
| zlib 1.2.11 -6          |    35 MB/s |   407 MB/s |    68228431 | 32.19 |
| lizard 1.0 -29          |  2.07 MB/s |  2697 MB/s |    68694227 | 32.41 |
| zstd 1.4.3 -2           | **356 MB/s** |  1067 MB/s |    69594511 | 32.84 |
| ucl_nrv2e 1.03 -9       |  2.13 MB/s |   429 MB/s |    69645134 | 32.86 |
| lizard 1.0 -39          |  4.37 MB/s | **2475 MB/s** |    69807522 | 32.94 |
| ucl_nrv2d 1.03 -9       |  2.09 MB/s |   422 MB/s |    70053895 | 33.05 |
| tornado 0.6a -4         |   133 MB/s |   310 MB/s |    70513617 | 33.27 |
| libdeflate 1.3 -3       |   161 MB/s |   912 MB/s |    70668968 | 33.34 |
| ucl_nrv2b 1.03 -9       |  2.09 MB/s |   407 MB/s |    71031195 | 33.51 |
| xpack 2016-06-02 -1     |   171 MB/s |   890 MB/s |    71090065 | 33.54 |
| tornado 0.6a -3         |   186 MB/s |   301 MB/s |    72662044 | 34.28 |
| crush 1.0 -0            |    53 MB/s |   413 MB/s |    73064603 | 34.47 |
| ucl_nrv2e 1.03 -6       |    21 MB/s |   391 MB/s |    73302012 | 34.58 |
| libdeflate 1.3 -1       |   201 MB/s |   865 MB/s |    73318371 | 34.59 |
| lizard 1.0 -42          |   131 MB/s |  1621 MB/s |    73350988 | 34.61 |
| zstd 1.4.3 -1           | **480 MB/s** |  1203 MB/s |    73508823 | 34.68 |
| ucl_nrv2d 1.03 -6       |    21 MB/s |   386 MB/s |    73757673 | 34.80 |
| ucl_nrv2b 1.03 -6       |    20 MB/s |   375 MB/s |    73902185 | 34.87 |
| lizard 1.0 -35          |    95 MB/s |  2279 MB/s |    74563583 | 35.18 |
| lzo1z 2.10 -999         |  8.67 MB/s |   814 MB/s |    75061331 | 35.42 |
| lzo1x 2.10 -999         |  8.76 MB/s |   827 MB/s |    75301903 | 35.53 |
| lzsse8 2019-04-18 -12   |  9.86 MB/s | **4491 MB/s** |    75464339 | 35.61 |
| lzsse8 2019-04-18 -16   |  9.90 MB/s |  4461 MB/s |    75464339 | 35.61 |
| lzsse8 2019-04-18 -6    |    10 MB/s | **4503 MB/s** |    75469717 | 35.61 |
| lzo1y 2.10 -999         |  8.87 MB/s |   822 MB/s |    75503849 | 35.62 |
| brieflz 1.2.0 -3        |   108 MB/s |   436 MB/s |    75550736 | 35.65 |
| lzsse2 2019-04-18 -16   |  9.82 MB/s |  3762 MB/s |    75829973 | 35.78 |
| lzsse2 2019-04-18 -12   |  9.74 MB/s |  3754 MB/s |    75829973 | 35.78 |
| lzsse2 2019-04-18 -6    |    10 MB/s |  3741 MB/s |    75837101 | 35.78 |
| lizard 1.0 -25          |    18 MB/s |  2853 MB/s |    75867915 | 35.80 |
| lzsse4 2019-04-18 -16   |    10 MB/s |  4291 MB/s |    76113017 | 35.91 |
| lzsse4 2019-04-18 -12   |    10 MB/s |  4272 MB/s |    76113017 | 35.91 |
| lzsse4 2019-04-18 -6    |    10 MB/s |  4272 MB/s |    76118298 | 35.91 |
| lzmat 1.01              |    38 MB/s |   479 MB/s |    76485353 | 36.09 |
| lzo1b 2.10 -999         |    12 MB/s |   945 MB/s |    76594292 | 36.14 |
| zlib 1.2.11 -1          |   119 MB/s |   383 MB/s |    77259029 | 36.45 |
| lz4hc 1.9.2 -12         |    11 MB/s |  4427 MB/s |    77262620 | 36.45 |
| lizard 1.0 -19          |  4.60 MB/s |  4043 MB/s |    77416400 | 36.53 |
| lz4hc 1.9.2 -9          |    33 MB/s |  4378 MB/s |    77884448 | 36.75 |
| brotli 2019-10-01 -0    |   420 MB/s |   419 MB/s |    78433298 | 37.01 |
| lizard 1.0 -32          |   193 MB/s |  1641 MB/s |    78652654 | 37.11 |
| lz4hc 1.9.2 -4          |    81 MB/s |  4210 MB/s |    79807909 | 37.65 |
| lzo1c 2.10 -999         |    24 MB/s |   878 MB/s |    80396741 | 37.93 |
| lzvn 2017-03-08         |    73 MB/s |  1223 MB/s |    80814609 | 38.13 |
| lizard 1.0 -40          |   354 MB/s |  1497 MB/s |    80843049 | 38.14 |
| lzo1f 2.10 -999         |    21 MB/s |   833 MB/s |    80890206 | 38.17 |
| brieflz 1.2.0 -1        |   197 MB/s |   431 MB/s |    81138803 | 38.28 |
| lizard 1.0 -15          |    85 MB/s |  4081 MB/s |    81187330 | 38.31 |
| ucl_nrv2e 1.03 -1       |    59 MB/s |   330 MB/s |    81195560 | 38.31 |
| ucl_nrv2d 1.03 -1       |    59 MB/s |   333 MB/s |    81461976 | 38.43 |
| ucl_nrv2b 1.03 -1       |    58 MB/s |   322 MB/s |    81703168 | 38.55 |
| quicklz 1.5.0 -3        |    59 MB/s |  1069 MB/s |    81822241 | 38.60 |
| lzsse8 2019-04-18 -1    |    19 MB/s |  4166 MB/s |    81866245 | 38.63 |
| lzsse4 2019-04-18 -1    |    21 MB/s |  3965 MB/s |    82542106 | 38.94 |
| lzo2a 2.10 -999         |    27 MB/s |   667 MB/s |    82809337 | 39.07 |
| lzg 1.0.10 -8           |  9.30 MB/s |   762 MB/s |    83606901 | 39.45 |
| lz4hc 1.9.2 -1          |   131 MB/s |  4071 MB/s |    83803769 | 39.54 |
| yalz77 2015-09-19 -12   |    24 MB/s |   518 MB/s |    84050625 | 39.66 |
| quicklz 1.5.0 -2        |   286 MB/s |   708 MB/s |    84555627 | 39.89 |
| lizard 1.0 -22          |   149 MB/s |  2904 MB/s |    84866725 | 40.04 |
| yalz77 2015-09-19 -8    |    35 MB/s |   532 MB/s |    85153287 | 40.18 |
| lzo1b 2.10 -99          |   126 MB/s |   839 MB/s |    85653376 | 40.41 |
| lizard 1.0 -30          |   453 MB/s |  1414 MB/s |    85727429 | 40.45 |
| lizard 1.0 -12          |   179 MB/s |  3955 MB/s |    86232422 | 40.69 |
| yalz77 2015-09-19 -4    |    56 MB/s |   539 MB/s |    87392632 | 41.23 |
| density 0.14.2 -3       |   432 MB/s |   529 MB/s |    87649866 | 41.35 |
| gipfeli 2016-07-13      |   403 MB/s |   663 MB/s |    87931759 | 41.49 |
| lzsse2 2019-04-18 -1    |    24 MB/s |  3276 MB/s |    87976095 | 41.51 |
| lzo1c 2.10 -99          |   110 MB/s |   828 MB/s |    88112288 | 41.57 |
| lzo1b 2.10 -9           |   186 MB/s |   816 MB/s |    89261884 | 42.12 |
| lzg 1.0.10 -6           |    29 MB/s |   702 MB/s |    89490220 | 42.22 |
| tornado 0.6a -2         |   300 MB/s |   488 MB/s |    90076660 | 42.50 |
| pithy 2011-12-24 -9     |   400 MB/s |  2256 MB/s |    90360813 | 42.63 |
| lzrw 15-Jul-1991 -5     |   150 MB/s |   677 MB/s |    90818810 | 42.85 |
| lzo1c 2.10 -9           |   169 MB/s |   820 MB/s |    91040386 | 42.95 |
| lzo1b 2.10 -6           |   244 MB/s |   823 MB/s |    91382355 | 43.12 |
| pithy 2011-12-24 -6     | **483 MB/s** |  2221 MB/s |    92090898 | 43.45 |
| lzo1a 2.10 -99          |   121 MB/s |   869 MB/s |    92666265 | 43.72 |
| lzo1c 2.10 -6           |   211 MB/s |   819 MB/s |    93303623 | 44.02 |
| yalz77 2015-09-19 -1    |   105 MB/s |   578 MB/s |    93952728 | 44.33 |
| lzo1b 2.10 -3           |   255 MB/s |   821 MB/s |    94044578 | 44.37 |
| quicklz 1.5.0 -1        | **550 MB/s** |   715 MB/s |    94720562 | 44.69 |
| lzo1 2.10 -99           |   123 MB/s |   857 MB/s |    94946129 | 44.80 |
| lzg 1.0.10 -4           |    53 MB/s |   655 MB/s |    95930551 | 45.26 |
| slz_zlib 1.0.0 -3       |   293 MB/s |   379 MB/s |    96187780 | 45.38 |
| lzo1c 2.10 -3           |   262 MB/s |   829 MB/s |    96716153 | 45.63 |
| slz_zlib 1.0.0 -2       |   297 MB/s |   378 MB/s |    96863094 | 45.70 |
| lizard 1.0 -20          |   481 MB/s |  2985 MB/s |    96924204 | 45.73 |
| lzo1b 2.10 -1           |   257 MB/s |   805 MB/s |    97036087 | 45.78 |
| pithy 2011-12-24 -3     | **597 MB/s** |  2083 MB/s |    97255186 | 45.89 |
| yappy 2014-03-22 -100   |    96 MB/s |  3001 MB/s |    98672514 | 46.56 |
| lzo1c 2.10 -1           |   269 MB/s |   812 MB/s |    99550904 | 46.97 |
| slz_zlib 1.0.0 -1       |   301 MB/s |   380 MB/s |    99657958 | 47.02 |
| lzo1f 2.10 -1           |   244 MB/s |   793 MB/s |    99743329 | 47.06 |
| yappy 2014-03-22 -10    |   128 MB/s |  2969 MB/s |   100018673 | 47.19 |
| lzrw 15-Jul-1991 -4     |   392 MB/s |   630 MB/s |   100131356 | 47.24 |
| lzo1x 2.10 -1           | **680 MB/s** |   868 MB/s |   100572537 | 47.45 |
| lz4 1.9.2               |   737 MB/s |  4448 MB/s |   100880800 | 47.60 |
| fastlz 0.1 -2           |   368 MB/s |   811 MB/s |   100906072 | 47.61 |
| lzo1y 2.10 -1           |   674 MB/s |   863 MB/s |   101258318 | 47.78 |
| lzo1x 2.10 -15          | **699 MB/s** |   871 MB/s |   101462094 | 47.87 |
| density 0.14.2 -2       | **933 MB/s** |  1433 MB/s |   101651444 | 47.96 |
| lzf 3.6 -1              |   398 MB/s |   914 MB/s |   102041092 | 48.14 |
| snappy 2019-09-30       |   591 MB/s |  1868 MB/s |   102146767 | 48.19 |
| pithy 2011-12-24 -0     |   647 MB/s |  2084 MB/s |   103072463 | 48.63 |
| lzo1x 2.10 -12          |   717 MB/s |   875 MB/s |   103238859 | 48.71 |
| lizard 1.0 -10          |   635 MB/s |  4173 MB/s |   103402971 | 48.79 |
| lzo1a 2.10 -1           |   309 MB/s |   811 MB/s |   104202251 | 49.16 |
| fastlz 0.1 -1           |   341 MB/s |   806 MB/s |   104628084 | 49.37 |
| lzrw 15-Jul-1991 -3     |   381 MB/s |   726 MB/s |   105424168 | 49.74 |
| lzf 3.6 -0              |   400 MB/s |   869 MB/s |   105682088 | 49.86 |
| yappy 2014-03-22 -1     |   165 MB/s |  2809 MB/s |   105750956 | 49.89 |
| lzo1 2.10 -1            |   308 MB/s |   799 MB/s |   106474519 | 50.24 |
| lzo1x 2.10 -11          |   735 MB/s |   893 MB/s |   106604629 | 50.30 |
| lz4fast 1.9.2 -3        |   838 MB/s |  4423 MB/s |   107066190 | 50.52 |
| tornado 0.6a -1         |   437 MB/s |   520 MB/s |   107381846 | 50.66 |
| lzg 1.0.10 -1           |    91 MB/s |   653 MB/s |   108553667 | 51.22 |
| wflz 2015-09-16         |   305 MB/s |  1183 MB/s |   109605264 | 51.71 |
| lzrw 15-Jul-1991 -1     |   317 MB/s |   646 MB/s |   113761625 | 53.67 |
| lzjb 2010               |   394 MB/s |   601 MB/s |   122671613 | 57.88 |
| lz4fast 1.9.2 -17       | **1201 MB/s** |  **4632 MB/s** |   131732802 | 62.15 |
| density 0.14.2 -1       | **2214 MB/s** |  2677 MB/s |   133042166 | 62.77 |
| blosclz 2.0.0 -9        |   403 MB/s |  1037 MB/s |   135557850 | 63.96 |
| blosclz 2.0.0 -6        |   412 MB/s |  1083 MB/s |   137571765 | 64.91 |
| shrinker 0.1            |   985 MB/s |  3180 MB/s |   172535778 | 81.40 |
| blosclz 2.0.0 -3        |  1073 MB/s | **5909 MB/s** |   199437330 | 94.10 |
| blosclz 2.0.0 -1        | **6485 MB/s** | **7959 MB/s** |   211947520 |100.00 |
