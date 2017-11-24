//*****************************************************************************
//*****************************************************************************
//  FILENAME: CH0_OUT.h
//   Version: 2.00, Updated on 2015/3/4 at 22:26:37                                          
//  Generated by PSoC Designer 5.4.3191
//
//  DESCRIPTION: CH0_OUT User Module C Language interface file
//-----------------------------------------------------------------------------
//  Copyright (c) Cypress Semiconductor 2015. All Rights Reserved.
//*****************************************************************************
//*****************************************************************************
#ifndef CH0_OUT_INCLUDE
#define CH0_OUT_INCLUDE

#include <m8c.h>


/* Create pragmas to support proper argument and return value passing */
#pragma fastcall16  CH0_OUT_Stop
#pragma fastcall16  CH0_OUT_Start
#pragma fastcall16  CH0_OUT_On
#pragma fastcall16  CH0_OUT_Off
#pragma fastcall16  CH0_OUT_Switch
#pragma fastcall16  CH0_OUT_Invert
#pragma fastcall16  CH0_OUT_GetState


//-------------------------------------------------
// Constants for CH0_OUT API's.
//-------------------------------------------------
//
#define  CH0_OUT_ON   1
#define  CH0_OUT_OFF  0

//-------------------------------------------------
// Prototypes of the CH0_OUT API.
//-------------------------------------------------
extern void  CH0_OUT_Start(void);                                     
extern void  CH0_OUT_Stop(void);                                      
extern void  CH0_OUT_On(void);                                      
extern void  CH0_OUT_Off(void);                                      
extern void  CH0_OUT_Switch(BYTE bSwitch);
extern void  CH0_OUT_Invert(void);                                         
extern BYTE  CH0_OUT_GetState(void);                                         

//-------------------------------------------------
// Define global variables.                 
//-------------------------------------------------



#endif
