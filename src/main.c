//Librerias de cpctelera
#include <cpctelera.h>
#include <sprites/g_palette.h>
#include <sprites/enemy-saucer.h>
#include <sprites/player-ship.h>
#include <sprites/vshot.h>

//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
// DEFINE VALUES
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
enum {
      FALSE         = 0
   ,  TRUE          = 1

    // Entity Locations and Velocities
   ,  PLAYER_X      = 37
   ,  PLAYER_Y      = 200 - SP_PLAYER_SHIP_H
   ,  ENEMY_INIT_X  = 80 - SP_ENEMY_SAUCER_W
   ,  ENEMY_Y       = 20
   ,  ENEMY_VX      = -1 
   ,  SHOT_X        = PLAYER_X + 2
   ,  SHOT_INIT_Y   = PLAYER_Y - SP_VSHOT_H
   ,  SHOT_VY       = -2
   ,  COL_MARGIN    =  4
};

/////////////////////////////////////////////////////
// FUNCTION
/////////////////////////////////////////////////////
void drawPlayer() {
   u8 * pvmem = cpct_getScreenPtr(CPCT_VMEM_START, PLAYER_X, PLAYER_Y);
   cpct_drawSprite(sp_player_ship, pvmem, SP_PLAYER_SHIP_W, SP_PLAYER_SHIP_H);
}

/////////////////////////////////////////////////////
// FUNCTION
// Input: u8 x - Horizontal coordinate to draw enemy
/////////////////////////////////////////////////////
void drawEnemy(u8 x) {
   u8 * pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, ENEMY_Y);
   cpct_drawSprite(sp_enemy_saucer, pvmem, SP_ENEMY_SAUCER_W, SP_ENEMY_SAUCER_H);
}

/////////////////////////////////////////////////////
// FUNCTION
// Input: u8 x - Horizontal coordinate to erase enemy
/////////////////////////////////////////////////////
void eraseEnemy(u8 x) {
         u8 * pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, ENEMY_Y);
         cpct_drawSolidBox(pvmem, 0, SP_ENEMY_SAUCER_W, SP_ENEMY_SAUCER_H);
}

/////////////////////////////////////////////////////
// FUNCTION
// Input: u8 y - Vertical coordinate to draw shot
/////////////////////////////////////////////////////
void drawShot(u8 y) {
   u8 * pvmem = cpct_getScreenPtr(CPCT_VMEM_START, SHOT_X, y);
   cpct_drawSprite(sp_vshot, pvmem, SP_VSHOT_W, SP_VSHOT_H);
}

/////////////////////////////////////////////////////
// FUNCTION
// Input: u8 x - Horizontal coordinate to erase shot
/////////////////////////////////////////////////////
void eraseShot(u8 y) {
         u8 * pvmem = cpct_getScreenPtr(CPCT_VMEM_START, SHOT_X, y);
         cpct_drawSolidBox(pvmem, 0, SP_VSHOT_W, SP_VSHOT_H);
}

///////////////////////////////////////
//             MAIN                  //
///////////////////////////////////////

void main(void) {
   // Initialize Local variables
   u8 enemy_x = ENEMY_INIT_X;
   u8 shot_y  = SHOT_INIT_Y;
   u8 shot_on = TRUE;

   // Initialize Amstrad CPC
   cpct_disableFirmware();
   cpct_setVideoMode(0);
   cpct_setPalette(g_palette, 16);
   cpct_setBorder(HW_BLACK);    
   
   // Infinite Loop
   while (TRUE) {
      //
      // DRAW ENTITIES
      //
      if ( enemy_x == 0 ) { eraseEnemy(enemy_x); }
      else                { drawEnemy(enemy_x);  }   
      
      drawPlayer();
      if ( shot_on == TRUE) {
         if ( shot_y == 0 ) { eraseShot(shot_y); }
         else               { drawShot(shot_y);  }         
      }

      //
      // Check Collisions
      //
      
      if (  shot_on
         && shot_y < ENEMY_Y + SP_ENEMY_SAUCER_H - COL_MARGIN
         && shot_y + SP_VSHOT_H > ENEMY_Y + COL_MARGIN
         && enemy_x < SHOT_X + SP_VSHOT_W - COL_MARGIN
         && enemy_x + SP_ENEMY_SAUCER_W > SHOT_X + COL_MARGIN )
      {
         eraseEnemy(enemy_x);
         eraseShot(shot_y);
         shot_on = FALSE;
         enemy_x = 0;
      }

      //
      // UPDATE ENTITIES
      //
      //--Update Enemy
      if ( enemy_x == 0 ) { enemy_x  = ENEMY_INIT_X; }
      else                { enemy_x += ENEMY_VX;  }    
      // Update Shot
      if ( shot_on ) {
         if ( shot_y == 0 )  { shot_on  = FALSE; }
         else                { shot_y += SHOT_VY;  } 
      }  else {
         if ( cpct_isKeyPressed(Key_Space) ){
            shot_on = TRUE;
            shot_y  = SHOT_INIT_Y;  
         }
      }
      
      //
      // VSYNC SYNCRONIZE
      //
      cpct_scanKeyboard();
      cpct_waitVSYNC();
   }
}










