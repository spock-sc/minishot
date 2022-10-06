.area _DATA
.area _CODE

.include "cpctelera.h.s"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  GLOBAL SYMBOLS                                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  CPCtelera symbols
.globl cpct_disableFirmware_asm
.globl cpct_setVideoMode_asm
.globl cpct_setPalette_asm
.globl cpct_getScreenPtr_asm
.globl cpct_drawSprite_asm
.globl cpct_drawSolidBox_asm
.globl cpct_waitVSYNC_asm
.globl cpct_scanKeyboard_asm
.globl cpct_isKeyPressed_asm
;; Game symbols defined elsewhere
.globl _g_palette
.globl _sp_player_ship
.globl _sp_vshot
.globl _sp_enemy_saucer


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  DEFINED VALUES                                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;Sprite Sizes
  SP_PLAYER_SHIP_W    = 5
  SP_PLAYER_SHIP_H    = 14
  SP_ENEMY_SAUCER_W   = 13
  SP_ENEMY_SAUCER_H   = 16
  SP_VSHOT_W          = 1
  SP_VSHOT_H          = 8
 ;; True and false---
  FALSE               = 0
  TRUE                = 1
 ;; Entity Constant Locations and Velocities
  PLAYER_X            = 37
  PLAYER_Y            = 200 - SP_PLAYER_SHIP_H
  ENEMY_INIT_X        = 80 - SP_ENEMY_SAUCER_W
  ENEMY_Y             = 10
  ENEMY_VX            = -1
  SHOT_X              = PLAYER_X + 2 
  SHOT_INIT_Y         = PLAYER_Y - SP_VSHOT_H
  SHOT_VY             = -2  
 ;; Automatic variable offsets
  enemy_x             = 0
  shot_y              = 1
  shot_on             = 2
  reserve_bytes       = 3 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;/////////////////////////////////////////////
;// FUNCTION                                //
;/////////////////////////////////////////////
drawPlayer:
    ;;  Calculate Video Memory Address where
    ;;  to draw the sprite
    ld  de, #CPCT_VMEM_START_ASM    ;; Start of video memory
    ld  b,  #PLAYER_Y               ;; Y Coord = 40 (bytes)
    ld  c,  #PLAYER_X               ;; X Coord = 100 (pixels = bytes)    
    call cpct_getScreenPtr_asm
    ;;  HL = pvmem

    ex  de, hl                      ;; DE = pvmem (where to draw the sprite) 
    ld  hl, #_sp_player_ship        ;; Address where sprite data start   
    ld  b, #SP_PLAYER_SHIP_H        ;; sprite width (bytes)
    ld  c, #SP_PLAYER_SHIP_W        ;; sprite height (pixels = bytes)
    call cpct_drawSprite_asm        

    ret
;/////////////////////////////////////////////

;/////////////////////////////////////////////
;// FUNCTION                                //
;// Input:                                  //    
;//      C - Enemy X                        //            
;/////////////////////////////////////////////
drawEnemy:
    ;;  Calculate Video Memory Address where
    ;;  to draw the sprite
    ld  de, #CPCT_VMEM_START_ASM    ;; Start of video memory
    ld  b,  #ENEMY_Y                ;; Y Coord = 40 (bytes)
    call cpct_getScreenPtr_asm
    ;;  HL = pvmem

    ex  de, hl                      ;; DE = pvmem (where to draw the sprite) 
    ld  hl, #_sp_enemy_saucer       ;; Address where sprite data start   
    ld  b, #SP_ENEMY_SAUCER_H        ;; sprite width (bytes)
    ld  c, #SP_ENEMY_SAUCER_W       ;; sprite height (pixels = bytes)
    call cpct_drawSprite_asm        

    ret

;/////////////////////////////////////////////

;/////////////////////////////////////////////
;// FUNCTION                                //
;// Input:                                  //    
;//     C - Enemy X                         //            
;/////////////////////////////////////////////
eraseEnemy:
    ;;  Calculate Video Memory Address where
    ;;  to draw the sprite
    ld  de, #CPCT_VMEM_START_ASM    ;; Start of video memory
    ld  b,  #ENEMY_Y                ;; Y Coord = 40 (bytes)
    call cpct_getScreenPtr_asm
    ;;  HL = pvmem

    ex  de, hl                      ;; DE = pvmem (where to draw the sprite) 
    ld  a, #0                       ;; Color de fondo   
    ld  b, #SP_ENEMY_SAUCER_H       ;; sprite width (bytes)
    ld  c, #SP_ENEMY_SAUCER_W       ;; sprite height (pixels = bytes)
    call cpct_drawSolidBox_asm         

    ret  
;/////////////////////////////////////////////  

;/////////////////////////////////////////////
;// FUNCTION                                //
;// Input:                                  //        
;//    B - Shot Y                           //
;/////////////////////////////////////////////
drawShot:
    ;;  Calculate Video Memory Address where
    ;;  to draw the sprite
    ld  de, #CPCT_VMEM_START_ASM    ;; Start of video memory
    ld  c,  #SHOT_X                 ;; X Coord = 100 (pixels = bytes)    
    call cpct_getScreenPtr_asm
    ;;  HL = pvmem

    ex  de, hl                      ;; DE = pvmem (where to draw the sprite) 
    ld  hl, #_sp_vshot        ;; Address where sprite data start   
    ld  b, #SP_VSHOT_H        ;; sprite width (bytes)
    ld  c, #SP_VSHOT_W        ;; sprite height (pixels = bytes)
    call cpct_drawSprite_asm        

    ret
;/////////////////////////////////////////////

;/////////////////////////////////////////////
;// FUNCTION                                //
;// Input:                                  //    
;//     B - Shot_y                          //            
;/////////////////////////////////////////////
eraseShot:
    ;;  Calculate Video Memory Address where
    ;;  to draw the sprite
    ld  de, #CPCT_VMEM_START_ASM    ;; Start of video memory
    ld  c,  #SHOT_X                 ;; X Coord
    call cpct_getScreenPtr_asm
    ;;  HL = pvmem

    ex  de, hl                 ;; DE = pvmem (where to draw the sprite) 
    ld  a, #0                  ;; Color de fondo   
    ld  b, #SP_VSHOT_H         ;; sprite width (bytes)
    ld  c, #SP_VSHOT_W         ;; sprite height (pixels = bytes)
    call cpct_drawSolidBox_asm         

    ret  
;/////////////////////////////////////////////

;/////////////////////////////////////////////
;// MAIN FUNCTION                           //
;/////////////////////////////////////////////
_main::
    ;;---------------------------
    ;; Initialize Local Variables
    ;;---------------------------
    ld      ix, #reserve_bytes     ;;/ Reserve bytes byte in the stack
    add     ix, sp      ;;| Reserved> [R][S|S|S|S] <Strack
    ld      sp, ix      ;;\      IX=SP-^
    
    ;; u8 enemy_x = ENEMY_INIT_X;
    ;; u8 shot_y = SHOT_INIT_Y;
    ld      enemy_x(ix), #ENEMY_INIT_X
    ld      shot_y(ix), #SHOT_INIT_Y
    ld      shot_on(ix), #TRUE

    ;;---------------------------
    ;;Inicialize Amstrad CPC
    ;;---------------------------
    call  cpct_disableFirmware_asm   ;; Disable Firmware
    ld    c, #0                      ;; / Set Mode 0
    call  cpct_setVideoMode_asm      ;; \ 160x200x16
    ld    hl, #_g_palette            ;; /
    ld    de, #16                    ;; | Set Palette
    call  cpct_setPalette_asm        ;; \    
    cpctm_setBorder_asm HW_BLACK     ;; Border = Black

     

    ;; Infinite Loop to prevent Amstrad CPC from rebooting
loop:

    call  drawPlayer
    ld      a, enemy_x(ix)
    cp      #0
    jr      z, draw_enemy_at_0
    ;; draw enemy_not_at_0
        ld    c, enemy_x(ix)
        call  drawEnemy
        jr    draw_enemy_end_if 

draw_enemy_at_0:
    ld      c, enemy_x(ix)
    call    eraseEnemy    
    
    ;; updateEnemy
    ;;;; If enemy is at 0, move enemy to init, else
             
draw_enemy_end_if:

;;;if ( shot_on != FALSE )
    ld  a, shot_on(ix)
    cp #FALSE
    jr  z, endif_drawshot
   ;{ @( shot_on != FALSE )@
    ;;;if ( shot_y == 0 )
        ld a, shot_y(ix)
        cp #0
        jr z, else_drawshot_in
        ;{ @( shot_y != 0 )@
            ld      b, shot_y(ix)
            call    drawShot
            jr      endif_drawshot
        else_drawshot_in:
        ;{ @( shot_y == 0 )@
            ld      b, shot_y(ix)
            call    eraseShot
    ;;;}

    endif_drawshot:
;;;}

;;;if ( enemy_x == 0 ) 
    ld      a, enemy_x(ix)          ;;/
    cp     #0                       ;;| if (enemy_x == 0)
    jr      z, enemy_is_at_0        ;;\    
    ;{ @( enemy_x != 0 )@
        ld      a, enemy_x(ix)      ;;/
        add     #ENEMY_VX           ;;| enemy_x += ENEMY_VX
        ld      enemy_x(ix), a      ;;\    
        jr      enemy_is_at_end_if
    enemy_is_at_0:
    ;{ @( enemy_x == 0 )@ {     
        ld enemy_x(ix), #ENEMY_INIT_X ;; enemy_x == 0}

    enemy_is_at_end_if: 
;;;}
    ;; updateShot
;;;if ( shot_on )
   ld  a, shot_on(ix)
   cp  #FALSE
   jr  z, else_updateshot_on
  ;{ @( shot_on != FALSE ) {
   ;;;if ( shot_y == 0 ) 
        ld  a, shot_y(ix)
        cp  #0
        jr  z,else_shotupdate
       ;{ @( shot_y != 0 )@
            ld   a, shot_y(ix)   ;;/
            add  #SHOT_VY        ;;| shot_y += SHOT_VY  
            ld   shot_y(ix), a   ;;\
            jr   endif_shotupdate
        else_shotupdate:
       ;} @( shot_y == 0 )@ {
            ld   shot_on(ix), #FALSE
        endif_shotupdate:
   ;;;}
   jr endif_updateshot_on
  else_updateshot_on:
  ;} @( shot_on == FALSE ) {
    ;;;if ( cpct_isKeyPressed(Key_Space) )
        ld  hl, #Key_Space
        call cpct_isKeyPressed_asm
        jr  z, endif_updateshot_on        
       ;{ @( cpct_isKeyPressed(Key_Space == TRUE) )@
            ld  shot_on(ix), #TRUE
            ld  shot_y(ix), #SHOT_INIT_Y 
  endif_updateshot_on:
;;;}
    ;;-------------------------
    ;; VSYNC Syncrhonize
    ;;
    call cpct_scanKeyboard_asm
    call cpct_waitVSYNC_asm

    jr    loop
   ;} 
    ld  ix, #1
    add ix, sp
    ld  sp, ix
    ret
;//////////////////////////////////////////////////////

    
