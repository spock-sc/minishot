                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module main
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _main
                             12 	.globl _eraseShot
                             13 	.globl _drawShot
                             14 	.globl _eraseEnemy
                             15 	.globl _drawEnemy
                             16 	.globl _drawPlayer
                             17 	.globl _cpct_getScreenPtr
                             18 	.globl _cpct_setPALColour
                             19 	.globl _cpct_setPalette
                             20 	.globl _cpct_waitVSYNC
                             21 	.globl _cpct_setVideoMode
                             22 	.globl _cpct_drawSprite
                             23 	.globl _cpct_drawSolidBox
                             24 	.globl _cpct_isKeyPressed
                             25 	.globl _cpct_scanKeyboard
                             26 	.globl _cpct_disableFirmware
                             27 ;--------------------------------------------------------
                             28 ; special function registers
                             29 ;--------------------------------------------------------
                             30 ;--------------------------------------------------------
                             31 ; ram data
                             32 ;--------------------------------------------------------
                             33 	.area _DATA
                             34 ;--------------------------------------------------------
                             35 ; ram data
                             36 ;--------------------------------------------------------
                             37 	.area _INITIALIZED
                             38 ;--------------------------------------------------------
                             39 ; absolute external ram data
                             40 ;--------------------------------------------------------
                             41 	.area _DABS (ABS)
                             42 ;--------------------------------------------------------
                             43 ; global & static initialisations
                             44 ;--------------------------------------------------------
                             45 	.area _HOME
                             46 	.area _GSINIT
                             47 	.area _GSFINAL
                             48 	.area _GSINIT
                             49 ;--------------------------------------------------------
                             50 ; Home
                             51 ;--------------------------------------------------------
                             52 	.area _HOME
                             53 	.area _HOME
                             54 ;--------------------------------------------------------
                             55 ; code
                             56 ;--------------------------------------------------------
                             57 	.area _CODE
                             58 ;src/main.c:30: void drawPlayer() {
                             59 ;	---------------------------------
                             60 ; Function drawPlayer
                             61 ; ---------------------------------
   412E                      62 _drawPlayer::
                             63 ;src/main.c:31: u8 * pvmem = cpct_getScreenPtr(CPCT_VMEM_START, PLAYER_X, PLAYER_Y);
   412E 21 25 BA      [10]   64 	ld	hl, #0xba25
   4131 E5            [11]   65 	push	hl
   4132 21 00 C0      [10]   66 	ld	hl, #0xc000
   4135 E5            [11]   67 	push	hl
   4136 CD 71 44      [17]   68 	call	_cpct_getScreenPtr
                             69 ;src/main.c:32: cpct_drawSprite(sp_player_ship, pvmem, SP_PLAYER_SHIP_W, SP_PLAYER_SHIP_H);
   4139 01 D8 40      [10]   70 	ld	bc, #_sp_player_ship+0
   413C 11 05 0E      [10]   71 	ld	de, #0x0e05
   413F D5            [11]   72 	push	de
   4140 E5            [11]   73 	push	hl
   4141 C5            [11]   74 	push	bc
   4142 CD F4 42      [17]   75 	call	_cpct_drawSprite
   4145 C9            [10]   76 	ret
                             77 ;src/main.c:39: void drawEnemy(u8 x) {
                             78 ;	---------------------------------
                             79 ; Function drawEnemy
                             80 ; ---------------------------------
   4146                      81 _drawEnemy::
   4146 DD E5         [15]   82 	push	ix
   4148 DD 21 00 00   [14]   83 	ld	ix,#0
   414C DD 39         [15]   84 	add	ix,sp
                             85 ;src/main.c:40: u8 * pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, ENEMY_Y);
   414E 3E 14         [ 7]   86 	ld	a, #0x14
   4150 F5            [11]   87 	push	af
   4151 33            [ 6]   88 	inc	sp
   4152 DD 7E 04      [19]   89 	ld	a, 4 (ix)
   4155 F5            [11]   90 	push	af
   4156 33            [ 6]   91 	inc	sp
   4157 21 00 C0      [10]   92 	ld	hl, #0xc000
   415A E5            [11]   93 	push	hl
   415B CD 71 44      [17]   94 	call	_cpct_getScreenPtr
                             95 ;src/main.c:41: cpct_drawSprite(sp_enemy_saucer, pvmem, SP_ENEMY_SAUCER_W, SP_ENEMY_SAUCER_H);
   415E 01 08 40      [10]   96 	ld	bc, #_sp_enemy_saucer+0
   4161 11 0D 10      [10]   97 	ld	de, #0x100d
   4164 D5            [11]   98 	push	de
   4165 E5            [11]   99 	push	hl
   4166 C5            [11]  100 	push	bc
   4167 CD F4 42      [17]  101 	call	_cpct_drawSprite
   416A DD E1         [14]  102 	pop	ix
   416C C9            [10]  103 	ret
                            104 ;src/main.c:48: void eraseEnemy(u8 x) {
                            105 ;	---------------------------------
                            106 ; Function eraseEnemy
                            107 ; ---------------------------------
   416D                     108 _eraseEnemy::
                            109 ;src/main.c:49: u8 * pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, ENEMY_Y);
   416D 3E 14         [ 7]  110 	ld	a, #0x14
   416F F5            [11]  111 	push	af
   4170 33            [ 6]  112 	inc	sp
   4171 21 03 00      [10]  113 	ld	hl, #3+0
   4174 39            [11]  114 	add	hl, sp
   4175 7E            [ 7]  115 	ld	a, (hl)
   4176 F5            [11]  116 	push	af
   4177 33            [ 6]  117 	inc	sp
   4178 21 00 C0      [10]  118 	ld	hl, #0xc000
   417B E5            [11]  119 	push	hl
   417C CD 71 44      [17]  120 	call	_cpct_getScreenPtr
                            121 ;src/main.c:50: cpct_drawSolidBox(pvmem, 0, SP_ENEMY_SAUCER_W, SP_ENEMY_SAUCER_H);
   417F 01 0D 10      [10]  122 	ld	bc, #0x100d
   4182 C5            [11]  123 	push	bc
   4183 01 00 00      [10]  124 	ld	bc, #0x0000
   4186 C5            [11]  125 	push	bc
   4187 E5            [11]  126 	push	hl
   4188 CD C9 43      [17]  127 	call	_cpct_drawSolidBox
   418B C9            [10]  128 	ret
                            129 ;src/main.c:57: void drawShot(u8 y) {
                            130 ;	---------------------------------
                            131 ; Function drawShot
                            132 ; ---------------------------------
   418C                     133 _drawShot::
   418C DD E5         [15]  134 	push	ix
   418E DD 21 00 00   [14]  135 	ld	ix,#0
   4192 DD 39         [15]  136 	add	ix,sp
                            137 ;src/main.c:58: u8 * pvmem = cpct_getScreenPtr(CPCT_VMEM_START, SHOT_X, y);
   4194 DD 56 04      [19]  138 	ld	d, 4 (ix)
   4197 1E 27         [ 7]  139 	ld	e,#0x27
   4199 D5            [11]  140 	push	de
   419A 21 00 C0      [10]  141 	ld	hl, #0xc000
   419D E5            [11]  142 	push	hl
   419E CD 71 44      [17]  143 	call	_cpct_getScreenPtr
                            144 ;src/main.c:59: cpct_drawSprite(sp_vshot, pvmem, SP_VSHOT_W, SP_VSHOT_H);
   41A1 01 00 40      [10]  145 	ld	bc, #_sp_vshot+0
   41A4 11 01 08      [10]  146 	ld	de, #0x0801
   41A7 D5            [11]  147 	push	de
   41A8 E5            [11]  148 	push	hl
   41A9 C5            [11]  149 	push	bc
   41AA CD F4 42      [17]  150 	call	_cpct_drawSprite
   41AD DD E1         [14]  151 	pop	ix
   41AF C9            [10]  152 	ret
                            153 ;src/main.c:66: void eraseShot(u8 y) {
                            154 ;	---------------------------------
                            155 ; Function eraseShot
                            156 ; ---------------------------------
   41B0                     157 _eraseShot::
                            158 ;src/main.c:67: u8 * pvmem = cpct_getScreenPtr(CPCT_VMEM_START, SHOT_X, y);
   41B0 21 02 00      [10]  159 	ld	hl, #2+0
   41B3 39            [11]  160 	add	hl, sp
   41B4 56            [ 7]  161 	ld	d, (hl)
   41B5 1E 27         [ 7]  162 	ld	e,#0x27
   41B7 D5            [11]  163 	push	de
   41B8 21 00 C0      [10]  164 	ld	hl, #0xc000
   41BB E5            [11]  165 	push	hl
   41BC CD 71 44      [17]  166 	call	_cpct_getScreenPtr
                            167 ;src/main.c:68: cpct_drawSolidBox(pvmem, 0, SP_VSHOT_W, SP_VSHOT_H);
   41BF 01 01 08      [10]  168 	ld	bc, #0x0801
   41C2 C5            [11]  169 	push	bc
   41C3 01 00 00      [10]  170 	ld	bc, #0x0000
   41C6 C5            [11]  171 	push	bc
   41C7 E5            [11]  172 	push	hl
   41C8 CD C9 43      [17]  173 	call	_cpct_drawSolidBox
   41CB C9            [10]  174 	ret
                            175 ;src/main.c:75: void main(void) {
                            176 ;	---------------------------------
                            177 ; Function main
                            178 ; ---------------------------------
   41CC                     179 _main::
   41CC DD E5         [15]  180 	push	ix
   41CE DD 21 00 00   [14]  181 	ld	ix,#0
   41D2 DD 39         [15]  182 	add	ix,sp
   41D4 3B            [ 6]  183 	dec	sp
                            184 ;src/main.c:77: u8 enemy_x = ENEMY_INIT_X;
                            185 ;src/main.c:78: u8 shot_y  = SHOT_INIT_Y;
   41D5 01 B2 43      [10]  186 	ld	bc,#0x43b2
                            187 ;src/main.c:79: u8 shot_on = TRUE;
   41D8 DD 36 FF 01   [19]  188 	ld	-1 (ix), #0x01
                            189 ;src/main.c:82: cpct_disableFirmware();
   41DC C5            [11]  190 	push	bc
   41DD CD B9 43      [17]  191 	call	_cpct_disableFirmware
   41E0 2E 00         [ 7]  192 	ld	l, #0x00
   41E2 CD AB 43      [17]  193 	call	_cpct_setVideoMode
   41E5 21 10 00      [10]  194 	ld	hl, #0x0010
   41E8 E5            [11]  195 	push	hl
   41E9 21 1E 41      [10]  196 	ld	hl, #_g_palette
   41EC E5            [11]  197 	push	hl
   41ED CD C5 42      [17]  198 	call	_cpct_setPalette
   41F0 21 10 14      [10]  199 	ld	hl, #0x1410
   41F3 E5            [11]  200 	push	hl
   41F4 CD E8 42      [17]  201 	call	_cpct_setPALColour
   41F7 C1            [10]  202 	pop	bc
                            203 ;src/main.c:88: while (TRUE) {
   41F8                     204 00127$:
                            205 ;src/main.c:92: if ( enemy_x == 0 ) { eraseEnemy(enemy_x); }
   41F8 78            [ 4]  206 	ld	a, b
   41F9 B7            [ 4]  207 	or	a, a
   41FA 20 0A         [12]  208 	jr	NZ,00102$
   41FC C5            [11]  209 	push	bc
   41FD C5            [11]  210 	push	bc
   41FE 33            [ 6]  211 	inc	sp
   41FF CD 6D 41      [17]  212 	call	_eraseEnemy
   4202 33            [ 6]  213 	inc	sp
   4203 C1            [10]  214 	pop	bc
   4204 18 08         [12]  215 	jr	00103$
   4206                     216 00102$:
                            217 ;src/main.c:93: else                { drawEnemy(enemy_x);  }   
   4206 C5            [11]  218 	push	bc
   4207 C5            [11]  219 	push	bc
   4208 33            [ 6]  220 	inc	sp
   4209 CD 46 41      [17]  221 	call	_drawEnemy
   420C 33            [ 6]  222 	inc	sp
   420D C1            [10]  223 	pop	bc
   420E                     224 00103$:
                            225 ;src/main.c:95: drawPlayer();
   420E C5            [11]  226 	push	bc
   420F CD 2E 41      [17]  227 	call	_drawPlayer
   4212 C1            [10]  228 	pop	bc
                            229 ;src/main.c:96: if ( shot_on == TRUE) {
   4213 DD 7E FF      [19]  230 	ld	a, -1 (ix)
   4216 3D            [ 4]  231 	dec	a
   4217 20 18         [12]  232 	jr	NZ,00108$
                            233 ;src/main.c:97: if ( shot_y == 0 ) { eraseShot(shot_y); }
   4219 79            [ 4]  234 	ld	a, c
   421A B7            [ 4]  235 	or	a, a
   421B 20 0B         [12]  236 	jr	NZ,00105$
   421D C5            [11]  237 	push	bc
   421E 79            [ 4]  238 	ld	a, c
   421F F5            [11]  239 	push	af
   4220 33            [ 6]  240 	inc	sp
   4221 CD B0 41      [17]  241 	call	_eraseShot
   4224 33            [ 6]  242 	inc	sp
   4225 C1            [10]  243 	pop	bc
   4226 18 09         [12]  244 	jr	00108$
   4228                     245 00105$:
                            246 ;src/main.c:98: else               { drawShot(shot_y);  }         
   4228 C5            [11]  247 	push	bc
   4229 79            [ 4]  248 	ld	a, c
   422A F5            [11]  249 	push	af
   422B 33            [ 6]  250 	inc	sp
   422C CD 8C 41      [17]  251 	call	_drawShot
   422F 33            [ 6]  252 	inc	sp
   4230 C1            [10]  253 	pop	bc
   4231                     254 00108$:
                            255 ;src/main.c:105: if (  shot_on
   4231 DD 7E FF      [19]  256 	ld	a, -1 (ix)
   4234 B7            [ 4]  257 	or	a, a
   4235 28 4B         [12]  258 	jr	Z,00110$
                            259 ;src/main.c:107: && shot_y + SP_VSHOT_H > ENEMY_Y + COL_MARGIN
   4237 79            [ 4]  260 	ld	a, c
   4238 D6 20         [ 7]  261 	sub	a, #0x20
   423A 30 46         [12]  262 	jr	NC,00110$
   423C 59            [ 4]  263 	ld	e, c
   423D 16 00         [ 7]  264 	ld	d, #0x00
   423F 21 08 00      [10]  265 	ld	hl, #0x0008
   4242 19            [11]  266 	add	hl, de
   4243 3E 18         [ 7]  267 	ld	a, #0x18
   4245 BD            [ 4]  268 	cp	a, l
   4246 3E 00         [ 7]  269 	ld	a, #0x00
   4248 9C            [ 4]  270 	sbc	a, h
   4249 E2 4E 42      [10]  271 	jp	PO, 00185$
   424C EE 80         [ 7]  272 	xor	a, #0x80
   424E                     273 00185$:
   424E F2 82 42      [10]  274 	jp	P, 00110$
                            275 ;src/main.c:109: && enemy_x + SP_ENEMY_SAUCER_W > SHOT_X + COL_MARGIN )
   4251 78            [ 4]  276 	ld	a, b
   4252 D6 24         [ 7]  277 	sub	a, #0x24
   4254 30 2C         [12]  278 	jr	NC,00110$
   4256 58            [ 4]  279 	ld	e, b
   4257 16 00         [ 7]  280 	ld	d, #0x00
   4259 21 0D 00      [10]  281 	ld	hl, #0x000d
   425C 19            [11]  282 	add	hl, de
   425D 3E 2B         [ 7]  283 	ld	a, #0x2b
   425F BD            [ 4]  284 	cp	a, l
   4260 3E 00         [ 7]  285 	ld	a, #0x00
   4262 9C            [ 4]  286 	sbc	a, h
   4263 E2 68 42      [10]  287 	jp	PO, 00186$
   4266 EE 80         [ 7]  288 	xor	a, #0x80
   4268                     289 00186$:
   4268 F2 82 42      [10]  290 	jp	P, 00110$
                            291 ;src/main.c:111: eraseEnemy(enemy_x);
   426B C5            [11]  292 	push	bc
   426C C5            [11]  293 	push	bc
   426D 33            [ 6]  294 	inc	sp
   426E CD 6D 41      [17]  295 	call	_eraseEnemy
   4271 33            [ 6]  296 	inc	sp
   4272 C1            [10]  297 	pop	bc
                            298 ;src/main.c:112: eraseShot(shot_y);
   4273 C5            [11]  299 	push	bc
   4274 79            [ 4]  300 	ld	a, c
   4275 F5            [11]  301 	push	af
   4276 33            [ 6]  302 	inc	sp
   4277 CD B0 41      [17]  303 	call	_eraseShot
   427A 33            [ 6]  304 	inc	sp
   427B C1            [10]  305 	pop	bc
                            306 ;src/main.c:113: shot_on = FALSE;
   427C DD 36 FF 00   [19]  307 	ld	-1 (ix), #0x00
                            308 ;src/main.c:114: enemy_x = 0;
   4280 06 00         [ 7]  309 	ld	b, #0x00
   4282                     310 00110$:
                            311 ;src/main.c:121: if ( enemy_x == 0 ) { enemy_x  = ENEMY_INIT_X; }
   4282 78            [ 4]  312 	ld	a, b
   4283 B7            [ 4]  313 	or	a, a
   4284 20 04         [12]  314 	jr	NZ,00116$
   4286 06 43         [ 7]  315 	ld	b, #0x43
   4288 18 04         [12]  316 	jr	00117$
   428A                     317 00116$:
                            318 ;src/main.c:122: else                { enemy_x += ENEMY_VX;  }    
   428A 78            [ 4]  319 	ld	a, b
   428B C6 FF         [ 7]  320 	add	a, #0xff
   428D 47            [ 4]  321 	ld	b, a
   428E                     322 00117$:
                            323 ;src/main.c:124: if ( shot_on ) {
   428E DD 7E FF      [19]  324 	ld	a, -1 (ix)
   4291 B7            [ 4]  325 	or	a, a
   4292 28 10         [12]  326 	jr	Z,00124$
                            327 ;src/main.c:125: if ( shot_y == 0 )  { shot_on  = FALSE; }
   4294 79            [ 4]  328 	ld	a, c
   4295 B7            [ 4]  329 	or	a, a
   4296 20 06         [12]  330 	jr	NZ,00119$
   4298 DD 36 FF 00   [19]  331 	ld	-1 (ix), #0x00
   429C 18 18         [12]  332 	jr	00125$
   429E                     333 00119$:
                            334 ;src/main.c:126: else                { shot_y += SHOT_VY;  } 
   429E 79            [ 4]  335 	ld	a, c
   429F C6 FE         [ 7]  336 	add	a, #0xfe
   42A1 4F            [ 4]  337 	ld	c, a
   42A2 18 12         [12]  338 	jr	00125$
   42A4                     339 00124$:
                            340 ;src/main.c:128: if ( cpct_isKeyPressed(Key_Space) ){
   42A4 C5            [11]  341 	push	bc
   42A5 21 05 80      [10]  342 	ld	hl, #0x8005
   42A8 CD DC 42      [17]  343 	call	_cpct_isKeyPressed
   42AB C1            [10]  344 	pop	bc
   42AC 7D            [ 4]  345 	ld	a, l
   42AD B7            [ 4]  346 	or	a, a
   42AE 28 06         [12]  347 	jr	Z,00125$
                            348 ;src/main.c:129: shot_on = TRUE;
   42B0 DD 36 FF 01   [19]  349 	ld	-1 (ix), #0x01
                            350 ;src/main.c:130: shot_y  = SHOT_INIT_Y;  
   42B4 0E B2         [ 7]  351 	ld	c, #0xb2
   42B6                     352 00125$:
                            353 ;src/main.c:137: cpct_scanKeyboard();
   42B6 C5            [11]  354 	push	bc
   42B7 CD 87 44      [17]  355 	call	_cpct_scanKeyboard
   42BA CD A3 43      [17]  356 	call	_cpct_waitVSYNC
   42BD C1            [10]  357 	pop	bc
   42BE C3 F8 41      [10]  358 	jp	00127$
   42C1 33            [ 6]  359 	inc	sp
   42C2 DD E1         [14]  360 	pop	ix
   42C4 C9            [10]  361 	ret
                            362 	.area _CODE
                            363 	.area _INITIALIZER
                            364 	.area _CABS (ABS)
