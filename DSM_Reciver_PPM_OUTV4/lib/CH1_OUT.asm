;;*****************************************************************************
;;*****************************************************************************
;;  FILENAME:   CH1_OUT.asm
;;  Version: 2.00, Updated on 2015/3/4 at 22:26:37
;;  Generated by PSoC Designer 5.4.3191
;;
;;  DESCRIPTION: LED user module.
;;
;;
;;  NOTE: User Module APIs conform to the fastcall16 convention for marshalling
;;        arguments and observe the associated "Registers are volatile" policy.
;;        This means it is the caller's responsibility to preserve any values
;;        in the X and A registers that are still needed after the API functions
;;        returns. For Large Memory Model devices it is also the caller's 
;;        responsibility to perserve any value in the CUR_PP, IDX_PP, MVR_PP and 
;;        MVW_PP registers. Even though some of these registers may not be modified
;;        now, there is no guarantee that will remain the case in future releases.
;;-----------------------------------------------------------------------------
;;  Copyright (c) Cypress Semiconductor 2015. All Rights Reserved.
;;*****************************************************************************
;;*****************************************************************************

include "CH1_OUT.inc"
include "memory.inc"

export _CH1_OUT_Start
export  CH1_OUT_Start

export _CH1_OUT_Stop
export  CH1_OUT_Stop

export _CH1_OUT_On
export  CH1_OUT_On

export _CH1_OUT_Off
export  CH1_OUT_Off

export _CH1_OUT_Switch
export  CH1_OUT_Switch

export _CH1_OUT_Invert
export  CH1_OUT_Invert

export _CH1_OUT_GetState
export  CH1_OUT_GetState


AREA UserModules (ROM, REL)


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: CH1_OUT_Start(void)
;  FUNCTION NAME: CH1_OUT_Stop(void)
;
;  FUNCTION NAME: CH1_OUT_Switch(void)
;
;  DESCRIPTION: ( Switch )
;     Turn LED on or off     
;
;  DESCRIPTION: ( Start, Stop )
;     Turn LED off                       
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:  ( Switch )
;     A => If 0, turn off LED, if > 0 turn on LED
;
;  ARGUMENTS:  ( Start, Stop )
;      None
;
;  RETURNS:  none
;
;  SIDE EFFECTS:
;    REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;
;-----------------------------------------------------------------------------
_CH1_OUT_On:
 CH1_OUT_On:
   mov  A,0x01
   jmp  CH1_OUT_Switch 

_CH1_OUT_Start:
 CH1_OUT_Start:
_CH1_OUT_Stop:
 CH1_OUT_Stop:
_CH1_OUT_Off:
 CH1_OUT_Off:
   mov  A,0x00

_CH1_OUT_Switch:
 CH1_OUT_Switch:
   RAM_PROLOGUE RAM_USE_CLASS_4
   RAM_PROLOGUE RAM_USE_CLASS_2
   RAM_SETPAGE_CUR >Port_1_Data_SHADE

   or   A,0x00                                   ; Check mode
   jz   .Turn_Off_LED

.Turn_On_LED:
IF(1)                                            ; Active High Digit Drive
   or   [Port_1_Data_SHADE],CH1_OUT_PinMask
ELSE                                             ; Active Low Digit Drive
   and  [Port_1_Data_SHADE],~CH1_OUT_PinMask
ENDIF
   jmp  .Switch_LED

.Turn_Off_LED:
IF(1)                      ; Active High Digit Drive
   and  [Port_1_Data_SHADE],~CH1_OUT_PinMask
ELSE                              ; Active Low Digit Drive
   or   [Port_1_Data_SHADE],CH1_OUT_PinMask
ENDIF

.Switch_LED:
   mov  A,[Port_1_Data_SHADE]
   mov  reg[CH1_OUT_PortDR],A

   RAM_EPILOGUE RAM_USE_CLASS_2
   RAM_EPILOGUE RAM_USE_CLASS_4
   ret
.ENDSECTION



.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: CH1_OUT_Invert(void)
;
;  DESCRIPTION:
;     Invert state of LED                               
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS: none
;
;  RETURNS:  none
;
;  SIDE EFFECTS:
;    REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;
;-----------------------------------------------------------------------------
_CH1_OUT_Invert:
 CH1_OUT_Invert:
   RAM_PROLOGUE RAM_USE_CLASS_4
   RAM_PROLOGUE RAM_USE_CLASS_2
   RAM_SETPAGE_CUR >Port_1_Data_SHADE

   xor  [Port_1_Data_SHADE],CH1_OUT_PinMask
   mov  A,[Port_1_Data_SHADE]
   mov  reg[CH1_OUT_PortDR],A

   RAM_EPILOGUE RAM_USE_CLASS_2
   RAM_EPILOGUE RAM_USE_CLASS_4
   ret
.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: CH1_OUT_GetState(void)
;
;  DESCRIPTION:
;     Get state of LED
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS: none
;
;  RETURNS:  
;    State of LED   1 = ON,  0 = OFF
;
;  SIDE EFFECTS:
;    REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;
;-----------------------------------------------------------------------------
_CH1_OUT_GetState:
 CH1_OUT_GetState:
   RAM_PROLOGUE RAM_USE_CLASS_4
   RAM_PROLOGUE RAM_USE_CLASS_2
   RAM_SETPAGE_CUR >Port_1_Data_SHADE

   mov   A,[Port_1_Data_SHADE]         ; Get shade value
IF(1)                                  ; Active High Digit Drive
   // Nothing for now
ELSE                                   ; Active Low Digit Drive
   cpl   A                             ; Invert bit if Active low
ENDIF
   and   A,CH1_OUT_PinMask             ; Mask off the trash
   jz    .End_LED_GS                   ; If zero, we're done
   mov   A,0x01                        ; Return a 1 no mater what the mask is.

.End_LED_GS:
   RAM_EPILOGUE RAM_USE_CLASS_2
   RAM_EPILOGUE RAM_USE_CLASS_4
   ret
.ENDSECTION
