                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module enemy_saucer
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _sp_enemy_saucer
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
   4008                      44 _sp_enemy_saucer:
   4008 00                   45 	.db #0x00	; 0
   4009 00                   46 	.db #0x00	; 0
   400A 00                   47 	.db #0x00	; 0
   400B 00                   48 	.db #0x00	; 0
   400C C0                   49 	.db #0xc0	; 192
   400D C0                   50 	.db #0xc0	; 192
   400E C0                   51 	.db #0xc0	; 192
   400F C0                   52 	.db #0xc0	; 192
   4010 00                   53 	.db #0x00	; 0
   4011 00                   54 	.db #0x00	; 0
   4012 00                   55 	.db #0x00	; 0
   4013 00                   56 	.db #0x00	; 0
   4014 00                   57 	.db #0x00	; 0
   4015 00                   58 	.db #0x00	; 0
   4016 00                   59 	.db #0x00	; 0
   4017 40                   60 	.db #0x40	; 64
   4018 C0                   61 	.db #0xc0	; 192
   4019 E0                   62 	.db #0xe0	; 224
   401A CF                   63 	.db #0xcf	; 207
   401B CF                   64 	.db #0xcf	; 207
   401C D0                   65 	.db #0xd0	; 208
   401D C0                   66 	.db #0xc0	; 192
   401E 80                   67 	.db #0x80	; 128
   401F 00                   68 	.db #0x00	; 0
   4020 00                   69 	.db #0x00	; 0
   4021 00                   70 	.db #0x00	; 0
   4022 00                   71 	.db #0x00	; 0
   4023 40                   72 	.db #0x40	; 64
   4024 D0                   73 	.db #0xd0	; 208
   4025 DA                   74 	.db #0xda	; 218
   4026 C0                   75 	.db #0xc0	; 192
   4027 CF                   76 	.db #0xcf	; 207
   4028 CF                   77 	.db #0xcf	; 207
   4029 C0                   78 	.db #0xc0	; 192
   402A E5                   79 	.db #0xe5	; 229
   402B E0                   80 	.db #0xe0	; 224
   402C 80                   81 	.db #0x80	; 128
   402D 00                   82 	.db #0x00	; 0
   402E 00                   83 	.db #0x00	; 0
   402F 00                   84 	.db #0x00	; 0
   4030 D0                   85 	.db #0xd0	; 208
   4031 CF                   86 	.db #0xcf	; 207
   4032 DA                   87 	.db #0xda	; 218
   4033 C0                   88 	.db #0xc0	; 192
   4034 CF                   89 	.db #0xcf	; 207
   4035 CF                   90 	.db #0xcf	; 207
   4036 C0                   91 	.db #0xc0	; 192
   4037 E5                   92 	.db #0xe5	; 229
   4038 CF                   93 	.db #0xcf	; 207
   4039 E0                   94 	.db #0xe0	; 224
   403A 00                   95 	.db #0x00	; 0
   403B 00                   96 	.db #0x00	; 0
   403C 40                   97 	.db #0x40	; 64
   403D E5                   98 	.db #0xe5	; 229
   403E E5                   99 	.db #0xe5	; 229
   403F DA                  100 	.db #0xda	; 218
   4040 94                  101 	.db #0x94	; 148
   4041 C0                  102 	.db #0xc0	; 192
   4042 C0                  103 	.db #0xc0	; 192
   4043 68                  104 	.db #0x68	; 104	'h'
   4044 E5                  105 	.db #0xe5	; 229
   4045 DA                  106 	.db #0xda	; 218
   4046 DA                  107 	.db #0xda	; 218
   4047 80                  108 	.db #0x80	; 128
   4048 00                  109 	.db #0x00	; 0
   4049 D0                  110 	.db #0xd0	; 208
   404A CF                  111 	.db #0xcf	; 207
   404B E5                  112 	.db #0xe5	; 229
   404C DA                  113 	.db #0xda	; 218
   404D 94                  114 	.db #0x94	; 148
   404E FF                  115 	.db #0xff	; 255
   404F 3C                  116 	.db #0x3c	; 60
   4050 68                  117 	.db #0x68	; 104	'h'
   4051 E5                  118 	.db #0xe5	; 229
   4052 DA                  119 	.db #0xda	; 218
   4053 CF                  120 	.db #0xcf	; 207
   4054 E0                  121 	.db #0xe0	; 224
   4055 00                  122 	.db #0x00	; 0
   4056 C5                  123 	.db #0xc5	; 197
   4057 DA                  124 	.db #0xda	; 218
   4058 F0                  125 	.db #0xf0	; 240
   4059 E5                  126 	.db #0xe5	; 229
   405A E0                  127 	.db #0xe0	; 224
   405B 3C                  128 	.db #0x3c	; 60
   405C 3C                  129 	.db #0x3c	; 60
   405D D0                  130 	.db #0xd0	; 208
   405E DA                  131 	.db #0xda	; 218
   405F F0                  132 	.db #0xf0	; 240
   4060 E5                  133 	.db #0xe5	; 229
   4061 CA                  134 	.db #0xca	; 202
   4062 00                  135 	.db #0x00	; 0
   4063 C0                  136 	.db #0xc0	; 192
   4064 E5                  137 	.db #0xe5	; 229
   4065 E5                  138 	.db #0xe5	; 229
   4066 CF                  139 	.db #0xcf	; 207
   4067 DA                  140 	.db #0xda	; 218
   4068 C0                  141 	.db #0xc0	; 192
   4069 C0                  142 	.db #0xc0	; 192
   406A E5                  143 	.db #0xe5	; 229
   406B CF                  144 	.db #0xcf	; 207
   406C DA                  145 	.db #0xda	; 218
   406D DA                  146 	.db #0xda	; 218
   406E C0                  147 	.db #0xc0	; 192
   406F 00                  148 	.db #0x00	; 0
   4070 D0                  149 	.db #0xd0	; 208
   4071 D0                  150 	.db #0xd0	; 208
   4072 CF                  151 	.db #0xcf	; 207
   4073 CF                  152 	.db #0xcf	; 207
   4074 CF                  153 	.db #0xcf	; 207
   4075 F0                  154 	.db #0xf0	; 240
   4076 F0                  155 	.db #0xf0	; 240
   4077 CF                  156 	.db #0xcf	; 207
   4078 CF                  157 	.db #0xcf	; 207
   4079 CF                  158 	.db #0xcf	; 207
   407A E0                  159 	.db #0xe0	; 224
   407B E0                  160 	.db #0xe0	; 224
   407C 00                  161 	.db #0x00	; 0
   407D C5                  162 	.db #0xc5	; 197
   407E E0                  163 	.db #0xe0	; 224
   407F D0                  164 	.db #0xd0	; 208
   4080 CF                  165 	.db #0xcf	; 207
   4081 CF                  166 	.db #0xcf	; 207
   4082 CF                  167 	.db #0xcf	; 207
   4083 CF                  168 	.db #0xcf	; 207
   4084 CF                  169 	.db #0xcf	; 207
   4085 CF                  170 	.db #0xcf	; 207
   4086 E0                  171 	.db #0xe0	; 224
   4087 D0                  172 	.db #0xd0	; 208
   4088 CA                  173 	.db #0xca	; 202
   4089 00                  174 	.db #0x00	; 0
   408A D0                  175 	.db #0xd0	; 208
   408B DA                  176 	.db #0xda	; 218
   408C E0                  177 	.db #0xe0	; 224
   408D C0                  178 	.db #0xc0	; 192
   408E E5                  179 	.db #0xe5	; 229
   408F CF                  180 	.db #0xcf	; 207
   4090 CF                  181 	.db #0xcf	; 207
   4091 DA                  182 	.db #0xda	; 218
   4092 C0                  183 	.db #0xc0	; 192
   4093 D0                  184 	.db #0xd0	; 208
   4094 E5                  185 	.db #0xe5	; 229
   4095 E0                  186 	.db #0xe0	; 224
   4096 00                  187 	.db #0x00	; 0
   4097 40                  188 	.db #0x40	; 64
   4098 E5                  189 	.db #0xe5	; 229
   4099 DA                  190 	.db #0xda	; 218
   409A F0                  191 	.db #0xf0	; 240
   409B C0                  192 	.db #0xc0	; 192
   409C C0                  193 	.db #0xc0	; 192
   409D C0                  194 	.db #0xc0	; 192
   409E C0                  195 	.db #0xc0	; 192
   409F F0                  196 	.db #0xf0	; 240
   40A0 E5                  197 	.db #0xe5	; 229
   40A1 DA                  198 	.db #0xda	; 218
   40A2 80                  199 	.db #0x80	; 128
   40A3 00                  200 	.db #0x00	; 0
   40A4 00                  201 	.db #0x00	; 0
   40A5 D0                  202 	.db #0xd0	; 208
   40A6 E5                  203 	.db #0xe5	; 229
   40A7 CF                  204 	.db #0xcf	; 207
   40A8 F0                  205 	.db #0xf0	; 240
   40A9 F0                  206 	.db #0xf0	; 240
   40AA F0                  207 	.db #0xf0	; 240
   40AB F0                  208 	.db #0xf0	; 240
   40AC CF                  209 	.db #0xcf	; 207
   40AD DA                  210 	.db #0xda	; 218
   40AE E0                  211 	.db #0xe0	; 224
   40AF 00                  212 	.db #0x00	; 0
   40B0 00                  213 	.db #0x00	; 0
   40B1 00                  214 	.db #0x00	; 0
   40B2 40                  215 	.db #0x40	; 64
   40B3 D0                  216 	.db #0xd0	; 208
   40B4 F0                  217 	.db #0xf0	; 240
   40B5 CF                  218 	.db #0xcf	; 207
   40B6 CF                  219 	.db #0xcf	; 207
   40B7 CF                  220 	.db #0xcf	; 207
   40B8 CF                  221 	.db #0xcf	; 207
   40B9 F0                  222 	.db #0xf0	; 240
   40BA E0                  223 	.db #0xe0	; 224
   40BB 80                  224 	.db #0x80	; 128
   40BC 00                  225 	.db #0x00	; 0
   40BD 00                  226 	.db #0x00	; 0
   40BE 00                  227 	.db #0x00	; 0
   40BF 00                  228 	.db #0x00	; 0
   40C0 40                  229 	.db #0x40	; 64
   40C1 C0                  230 	.db #0xc0	; 192
   40C2 F0                  231 	.db #0xf0	; 240
   40C3 F0                  232 	.db #0xf0	; 240
   40C4 F0                  233 	.db #0xf0	; 240
   40C5 F0                  234 	.db #0xf0	; 240
   40C6 C0                  235 	.db #0xc0	; 192
   40C7 80                  236 	.db #0x80	; 128
   40C8 00                  237 	.db #0x00	; 0
   40C9 00                  238 	.db #0x00	; 0
   40CA 00                  239 	.db #0x00	; 0
   40CB 00                  240 	.db #0x00	; 0
   40CC 00                  241 	.db #0x00	; 0
   40CD 00                  242 	.db #0x00	; 0
   40CE 00                  243 	.db #0x00	; 0
   40CF C0                  244 	.db #0xc0	; 192
   40D0 C0                  245 	.db #0xc0	; 192
   40D1 C0                  246 	.db #0xc0	; 192
   40D2 C0                  247 	.db #0xc0	; 192
   40D3 00                  248 	.db #0x00	; 0
   40D4 00                  249 	.db #0x00	; 0
   40D5 00                  250 	.db #0x00	; 0
   40D6 00                  251 	.db #0x00	; 0
   40D7 00                  252 	.db #0x00	; 0
                            253 	.area _INITIALIZER
                            254 	.area _CABS (ABS)
