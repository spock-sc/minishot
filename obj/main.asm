;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _eraseShot
	.globl _drawShot
	.globl _eraseEnemy
	.globl _drawEnemy
	.globl _drawPlayer
	.globl _cpct_getScreenPtr
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_waitVSYNC
	.globl _cpct_setVideoMode
	.globl _cpct_drawSprite
	.globl _cpct_drawSolidBox
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard
	.globl _cpct_disableFirmware
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/main.c:30: void drawPlayer() {
;	---------------------------------
; Function drawPlayer
; ---------------------------------
_drawPlayer::
;src/main.c:31: u8 * pvmem = cpct_getScreenPtr(CPCT_VMEM_START, PLAYER_X, PLAYER_Y);
	ld	hl, #0xba25
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:32: cpct_drawSprite(sp_player_ship, pvmem, SP_PLAYER_SHIP_W, SP_PLAYER_SHIP_H);
	ld	bc, #_sp_player_ship+0
	ld	de, #0x0e05
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	ret
;src/main.c:39: void drawEnemy(u8 x) {
;	---------------------------------
; Function drawEnemy
; ---------------------------------
_drawEnemy::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:40: u8 * pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, ENEMY_Y);
	ld	a, #0x14
	push	af
	inc	sp
	ld	a, 4 (ix)
	push	af
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:41: cpct_drawSprite(sp_enemy_saucer, pvmem, SP_ENEMY_SAUCER_W, SP_ENEMY_SAUCER_H);
	ld	bc, #_sp_enemy_saucer+0
	ld	de, #0x100d
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	pop	ix
	ret
;src/main.c:48: void eraseEnemy(u8 x) {
;	---------------------------------
; Function eraseEnemy
; ---------------------------------
_eraseEnemy::
;src/main.c:49: u8 * pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, ENEMY_Y);
	ld	a, #0x14
	push	af
	inc	sp
	ld	hl, #3+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:50: cpct_drawSolidBox(pvmem, 0, SP_ENEMY_SAUCER_W, SP_ENEMY_SAUCER_H);
	ld	bc, #0x100d
	push	bc
	ld	bc, #0x0000
	push	bc
	push	hl
	call	_cpct_drawSolidBox
	ret
;src/main.c:57: void drawShot(u8 y) {
;	---------------------------------
; Function drawShot
; ---------------------------------
_drawShot::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:58: u8 * pvmem = cpct_getScreenPtr(CPCT_VMEM_START, SHOT_X, y);
	ld	d, 4 (ix)
	ld	e,#0x27
	push	de
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:59: cpct_drawSprite(sp_vshot, pvmem, SP_VSHOT_W, SP_VSHOT_H);
	ld	bc, #_sp_vshot+0
	ld	de, #0x0801
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	pop	ix
	ret
;src/main.c:66: void eraseShot(u8 y) {
;	---------------------------------
; Function eraseShot
; ---------------------------------
_eraseShot::
;src/main.c:67: u8 * pvmem = cpct_getScreenPtr(CPCT_VMEM_START, SHOT_X, y);
	ld	hl, #2+0
	add	hl, sp
	ld	d, (hl)
	ld	e,#0x27
	push	de
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:68: cpct_drawSolidBox(pvmem, 0, SP_VSHOT_W, SP_VSHOT_H);
	ld	bc, #0x0801
	push	bc
	ld	bc, #0x0000
	push	bc
	push	hl
	call	_cpct_drawSolidBox
	ret
;src/main.c:75: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:77: u8 enemy_x = ENEMY_INIT_X;
;src/main.c:78: u8 shot_y  = SHOT_INIT_Y;
	ld	bc,#0x43b2
;src/main.c:79: u8 shot_on = TRUE;
	ld	-1 (ix), #0x01
;src/main.c:82: cpct_disableFirmware();
	push	bc
	call	_cpct_disableFirmware
	ld	l, #0x00
	call	_cpct_setVideoMode
	ld	hl, #0x0010
	push	hl
	ld	hl, #_g_palette
	push	hl
	call	_cpct_setPalette
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
	pop	bc
;src/main.c:88: while (TRUE) {
00127$:
;src/main.c:92: if ( enemy_x == 0 ) { eraseEnemy(enemy_x); }
	ld	a, b
	or	a, a
	jr	NZ,00102$
	push	bc
	push	bc
	inc	sp
	call	_eraseEnemy
	inc	sp
	pop	bc
	jr	00103$
00102$:
;src/main.c:93: else                { drawEnemy(enemy_x);  }   
	push	bc
	push	bc
	inc	sp
	call	_drawEnemy
	inc	sp
	pop	bc
00103$:
;src/main.c:95: drawPlayer();
	push	bc
	call	_drawPlayer
	pop	bc
;src/main.c:96: if ( shot_on == TRUE) {
	ld	a, -1 (ix)
	dec	a
	jr	NZ,00108$
;src/main.c:97: if ( shot_y == 0 ) { eraseShot(shot_y); }
	ld	a, c
	or	a, a
	jr	NZ,00105$
	push	bc
	ld	a, c
	push	af
	inc	sp
	call	_eraseShot
	inc	sp
	pop	bc
	jr	00108$
00105$:
;src/main.c:98: else               { drawShot(shot_y);  }         
	push	bc
	ld	a, c
	push	af
	inc	sp
	call	_drawShot
	inc	sp
	pop	bc
00108$:
;src/main.c:105: if (  shot_on
	ld	a, -1 (ix)
	or	a, a
	jr	Z,00110$
;src/main.c:107: && shot_y + SP_VSHOT_H > ENEMY_Y + COL_MARGIN
	ld	a, c
	sub	a, #0x20
	jr	NC,00110$
	ld	e, c
	ld	d, #0x00
	ld	hl, #0x0008
	add	hl, de
	ld	a, #0x18
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jp	PO, 00185$
	xor	a, #0x80
00185$:
	jp	P, 00110$
;src/main.c:109: && enemy_x + SP_ENEMY_SAUCER_W > SHOT_X + COL_MARGIN )
	ld	a, b
	sub	a, #0x24
	jr	NC,00110$
	ld	e, b
	ld	d, #0x00
	ld	hl, #0x000d
	add	hl, de
	ld	a, #0x2b
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jp	PO, 00186$
	xor	a, #0x80
00186$:
	jp	P, 00110$
;src/main.c:111: eraseEnemy(enemy_x);
	push	bc
	push	bc
	inc	sp
	call	_eraseEnemy
	inc	sp
	pop	bc
;src/main.c:112: eraseShot(shot_y);
	push	bc
	ld	a, c
	push	af
	inc	sp
	call	_eraseShot
	inc	sp
	pop	bc
;src/main.c:113: shot_on = FALSE;
	ld	-1 (ix), #0x00
;src/main.c:114: enemy_x = 0;
	ld	b, #0x00
00110$:
;src/main.c:121: if ( enemy_x == 0 ) { enemy_x  = ENEMY_INIT_X; }
	ld	a, b
	or	a, a
	jr	NZ,00116$
	ld	b, #0x43
	jr	00117$
00116$:
;src/main.c:122: else                { enemy_x += ENEMY_VX;  }    
	ld	a, b
	add	a, #0xff
	ld	b, a
00117$:
;src/main.c:124: if ( shot_on ) {
	ld	a, -1 (ix)
	or	a, a
	jr	Z,00124$
;src/main.c:125: if ( shot_y == 0 )  { shot_on  = FALSE; }
	ld	a, c
	or	a, a
	jr	NZ,00119$
	ld	-1 (ix), #0x00
	jr	00125$
00119$:
;src/main.c:126: else                { shot_y += SHOT_VY;  } 
	ld	a, c
	add	a, #0xfe
	ld	c, a
	jr	00125$
00124$:
;src/main.c:128: if ( cpct_isKeyPressed(Key_Space) ){
	push	bc
	ld	hl, #0x8005
	call	_cpct_isKeyPressed
	pop	bc
	ld	a, l
	or	a, a
	jr	Z,00125$
;src/main.c:129: shot_on = TRUE;
	ld	-1 (ix), #0x01
;src/main.c:130: shot_y  = SHOT_INIT_Y;  
	ld	c, #0xb2
00125$:
;src/main.c:137: cpct_scanKeyboard();
	push	bc
	call	_cpct_scanKeyboard
	call	_cpct_waitVSYNC
	pop	bc
	jp	00127$
	inc	sp
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
