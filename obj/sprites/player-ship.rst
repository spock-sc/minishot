                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module player_ship
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _sp_player_ship
                             12 ;--------------------------------------------------------
                             13 ; special function registers
                             14 ;--------------------------------------------------------
                             15 ;--------------------------------------------------------
                             16 ; ram data
                             17 ;--------------------------------------------------------
                             18 	.area _DATA
                             19 ;--------------------------------------------------------
                             20 ; ram data
                             21 ;--------------------------------------------------------
                             22 	.area _INITIALIZED
                             23 ;--------------------------------------------------------
                             24 ; absolute external ram data
                             25 ;--------------------------------------------------------
                             26 	.area _DABS (ABS)
                             27 ;--------------------------------------------------------
                             28 ; global & static initialisations
                             29 ;--------------------------------------------------------
                             30 	.area _HOME
                             31 	.area _GSINIT
                             32 	.area _GSFINAL
                             33 	.area _GSINIT
                             34 ;--------------------------------------------------------
                             35 ; Home
                             36 ;--------------------------------------------------------
                             37 	.area _HOME
                             38 	.area _HOME
                             39 ;--------------------------------------------------------
                             40 ; code
                             41 ;--------------------------------------------------------
                             42 	.area _CODE
                             43 	.area _CODE
   40D8                      44 _sp_player_ship:
   40D8 00                   45 	.db #0x00	; 0
   40D9 00                   46 	.db #0x00	; 0
   40DA C0                   47 	.db #0xc0	; 192
   40DB 00                   48 	.db #0x00	; 0
   40DC 00                   49 	.db #0x00	; 0
   40DD 00                   50 	.db #0x00	; 0
   40DE 40                   51 	.db #0x40	; 64
   40DF 30                   52 	.db #0x30	; 48	'0'
   40E0 80                   53 	.db #0x80	; 128
   40E1 00                   54 	.db #0x00	; 0
   40E2 00                   55 	.db #0x00	; 0
   40E3 40                   56 	.db #0x40	; 64
   40E4 FF                   57 	.db #0xff	; 255
   40E5 80                   58 	.db #0x80	; 128
   40E6 00                   59 	.db #0x00	; 0
   40E7 00                   60 	.db #0x00	; 0
   40E8 40                   61 	.db #0x40	; 64
   40E9 FF                   62 	.db #0xff	; 255
   40EA 80                   63 	.db #0x80	; 128
   40EB 00                   64 	.db #0x00	; 0
   40EC 40                   65 	.db #0x40	; 64
   40ED 40                   66 	.db #0x40	; 64
   40EE C0                   67 	.db #0xc0	; 192
   40EF 80                   68 	.db #0x80	; 128
   40F0 80                   69 	.db #0x80	; 128
   40F1 90                   70 	.db #0x90	; 144
   40F2 C0                   71 	.db #0xc0	; 192
   40F3 BE                   72 	.db #0xbe	; 190
   40F4 C0                   73 	.db #0xc0	; 192
   40F5 60                   74 	.db #0x60	; 96
   40F6 D5                   75 	.db #0xd5	; 213
   40F7 C0                   76 	.db #0xc0	; 192
   40F8 3C                   77 	.db #0x3c	; 60
   40F9 C0                   78 	.db #0xc0	; 192
   40FA EA                   79 	.db #0xea	; 234
   40FB 81                   80 	.db #0x81	; 129
   40FC EA                   81 	.db #0xea	; 234
   40FD C0                   82 	.db #0xc0	; 192
   40FE D5                   83 	.db #0xd5	; 213
   40FF 42                   84 	.db #0x42	; 66	'B'
   4100 40                   85 	.db #0x40	; 64
   4101 57                   86 	.db #0x57	; 87	'W'
   4102 FF                   87 	.db #0xff	; 255
   4103 AB                   88 	.db #0xab	; 171
   4104 80                   89 	.db #0x80	; 128
   4105 00                   90 	.db #0x00	; 0
   4106 81                   91 	.db #0x81	; 129
   4107 FF                   92 	.db #0xff	; 255
   4108 42                   93 	.db #0x42	; 66	'B'
   4109 00                   94 	.db #0x00	; 0
   410A 00                   95 	.db #0x00	; 0
   410B 40                   96 	.db #0x40	; 64
   410C C0                   97 	.db #0xc0	; 192
   410D 80                   98 	.db #0x80	; 128
   410E 00                   99 	.db #0x00	; 0
   410F 00                  100 	.db #0x00	; 0
   4110 40                  101 	.db #0x40	; 64
   4111 C0                  102 	.db #0xc0	; 192
   4112 80                  103 	.db #0x80	; 128
   4113 00                  104 	.db #0x00	; 0
   4114 00                  105 	.db #0x00	; 0
   4115 81                  106 	.db #0x81	; 129
   4116 FF                  107 	.db #0xff	; 255
   4117 42                  108 	.db #0x42	; 66	'B'
   4118 00                  109 	.db #0x00	; 0
   4119 40                  110 	.db #0x40	; 64
   411A C0                  111 	.db #0xc0	; 192
   411B C0                  112 	.db #0xc0	; 192
   411C C0                  113 	.db #0xc0	; 192
   411D 80                  114 	.db #0x80	; 128
                            115 	.area _INITIALIZER
                            116 	.area _CABS (ABS)
