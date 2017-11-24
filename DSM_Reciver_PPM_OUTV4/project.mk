PROJNAME=DSM_Reciver_PPM_OUTV4
DEVICE=CY8C21434MLF
BASEDEVICE=CY8C21030
PROJPATH=E:/WORKSP~1/cypress/DSM_RE~1/DSM_RE~1
PSOCDIR=e:/PROGRA~2/Cypress/PSOCDE~1/5.4/Common/CYPRES~1
INCLUDE_PATH=e:/PROGRA~2/Cypress/PSOCDE~1/5.4/Common/CYPRES~1/tools/include/CY8C21~3
CSRCS= config.c cyrf6936.c dsm.c main.c ppm.c timer.c
LIBCSRCS=
STDCSRCS=
ASMSRCS= delay.asm
LIBASMSRCS= ch0_out.asm ch1_out.asm ch2_out.asm ch3_out.asm ch4_out.asm ch5_out.asm cs_pin.asm e2prom_1.asm led_1.asm psocconfig.asm psocconfigtbl.asm psocgpioint.asm pwm16_1.asm pwm16_1int.asm rst.asm sleeptimer_1.asm sleeptimer_1int.asm spim_1.asm timer8_1.asm timer8_1int.asm
STDASMSRCS=
OBJECT_SOURCES= config.c cyrf6936.c delay.asm dsm.c main.c ppm.c timer.c
FILLVALUE=0x30
LASTROM=0x1fff
LASTRAM=0x1ff
CODECOMPRESSOR=-O -elim:UserModules
MORE_CFLAGS=-Wf-nomac -Wf-Osize 
RELSTART=0x170
INC_PATH=
CDEFINES=
LIBS=
UMLIBS=
LIB_PATH=
ENABLE_ALIGN_SHIFT=0
LMM=
SYS_INC_CONTENTS:=SYSTEM_STACK_PAGE:_equ_0 SYSTEM_STACK_BASE_ADDR:_equ_0h SYSTEM_LARGE_MEMORY_MODEL:_equ_0 SYSTEM_SMALL_MEMORY_MODEL:_equ_1 IMAGECRAFT:_equ_1 HITECH:_equ_2 TOOLCHAIN:_equ_IMAGECRAFT 
SYSTEM_TOOLS=1
CSFLOW=
CONFIG_NAMES=dsm_reciver 