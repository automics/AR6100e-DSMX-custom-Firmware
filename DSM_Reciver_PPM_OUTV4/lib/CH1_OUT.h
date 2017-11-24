//*****************************************************************************
//*****************************************************************************
//  FILENAME: CH1_OUT.h
//   Version: 2.00, Updated on 2015/3/4 at 22:26:37                                          
//  Generated by PSoC Designer 5.4.3191
//
//  DESCRIPTION: CH1_OUT User Module C Language interface file
//-----------------------------------------------------------------------------
//  Copyright (c) Cypress Semiconductor 2015. All Rights Reserved.
//*****************************************************************************
//*****************************************************************************
#ifndef CH1_OUT_INCLUDE
#define CH1_OUT_INCLUDE

#include <m8c.h>


/* Create pragmas to support proper argument and return value passing */
#pragma fastcall16  CH1_OUT_Stop
#pragma fastcall16  CH1_OUT_Start
#pragma fastcall16  CH1_OUT_On
#pragma fastcall16  CH1_OUT_Off
#pragma fastcall16  CH1_OUT_Switch
#pragma fastcall16  CH1_OUT_Invert
#pragma fastcall16  CH1_OUT_GetState


//-------------------------------------------------
// Constants for CH1_OUT API's.
//-------------------------------------------------
//
#define  CH1_OUT_ON   1
#define  CH1_OUT_OFF  0

//-------------------------------------------------
// Prototypes of the CH1_OUT API.
//-------------------------------------------------
extern void  CH1_OUT_Start(void);                                     
extern void  CH1_OUT_Stop(void);                                      
extern void  CH1_OUT_On(void);                                      
extern void  CH1_OUT_Off(void);                                      
extern void  CH1_OUT_Switch(BYTE bSwitch);
extern void  CH1_OUT_Invert(void);                                         
extern BYTE  CH1_OUT_GetState(void);                                         

//-------------------------------------------------
// Define global variables.                 
//-------------------------------------------------



#endif
