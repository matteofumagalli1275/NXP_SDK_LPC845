/* ---------------------------------------------------------------------------------------
 * @file:    startup_LPC845.s
 * @purpose: CMSIS Cortex-M0 Core Device Startup File for the LPC845
 * @version: 1.2
 * @date:    2017-6-8
 * ---------------------------------------------------------------------------------------*/
/*
 * Copyright 1997-2016 Freescale Semiconductor, Inc.
 * Copyright 2016-2019 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */
/*****************************************************************************/
/* Version: GCC for ARM Embedded Processors                                  */
/*****************************************************************************/

    .syntax unified
    .arch armv6-m
    .eabi_attribute Tag_ABI_align_preserved, 1 /*8-byte alignment */

    .section .isr_vector, "a"
    .align 2
    .globl __Vectors

__Vectors:
    .long    Image$$ARM_LIB_STACK$$ZI$$Limit                 /* Top of Stack */
    .long    Reset_Handler                                   /* Reset Handler */
    .long    NMI_Handler                                     /* NMI Handler*/
    .long    HardFault_Handler                               /* Hard Fault Handler*/
    .long    0                                               /* Reserved*/
    .long    0                                               /* Reserved*/
    .long    0                                               /* Reserved*/
    .long    0                                               /* Reserved*/
    .long    0                                               /* Reserved*/
    .long    0                                               /* Reserved*/
    .long    0                                               /* Reserved*/
    .long    SVC_Handler                                     /* SVCall Handler*/
    .long    0                                               /* Reserved*/
    .long    0                                               /* Reserved*/
    .long    PendSV_Handler                                  /* PendSV Handler*/
    .long    SysTick_Handler                                 /* SysTick Handler*/

                                                            /* External Interrupts*/
    .long    SPI0_IRQHandler                              /* SPI0 interrupt */
    .long    SPI1_IRQHandler                              /* SPI1 interrupt */
    .long    DAC0_IRQHandler                              /* DAC0 interrupt */
    .long    USART0_IRQHandler                              /* USART0 interrupt */
    .long    USART1_IRQHandler                              /* USART1 interrupt */
    .long    USART2_IRQHandler                              /* USART2 interrupt */
    .long    Reserved22_IRQHandler                              /* Reserved interrupt */
    .long    I2C1_IRQHandler                              /* I2C1 interrupt */
    .long    I2C0_IRQHandler                              /* I2C0 interrupt */
    .long    SCT0_IRQHandler                              /* State configurable timer interrupt */
    .long    MRT0_IRQHandler                              /* Multi-rate timer interrupt */
    .long    CMP_CAPT_IRQHandler                              /* Analog comparator interrupt or Capacitive Touch interrupt */
    .long    WDT_IRQHandler                              /* Windowed watchdog timer interrupt */
    .long    BOD_IRQHandler                              /* BOD interrupts */
    .long    FLASH_IRQHandler                              /* flash interrupt */
    .long    WKT_IRQHandler                              /* Self-wake-up timer interrupt */
    .long    ADC0_SEQA_IRQHandler                              /* ADC0 sequence A completion. */
    .long    ADC0_SEQB_IRQHandler                              /* ADC0 sequence B completion. */
    .long    ADC0_THCMP_IRQHandler                              /* ADC0 threshold compare and error. */
    .long    ADC0_OVR_IRQHandler                              /* ADC0 overrun */
    .long    DMA0_IRQHandler                              /* DMA0 interrupt */
    .long    I2C2_IRQHandler                              /* I2C2 interrupt */
    .long    I2C3_IRQHandler                              /* I2C3 interrupt */
    .long    CTIMER0_IRQHandler                              /* Timer interrupt */
    .long    PIN_INT0_IRQHandler                              /* Pin interrupt 0 or pattern match engine slice 0 interrupt */
    .long    PIN_INT1_IRQHandler                              /* Pin interrupt 1 or pattern match engine slice 1 interrupt */
    .long    PIN_INT2_IRQHandler                              /* Pin interrupt 2 or pattern match engine slice 2 interrupt */
    .long    PIN_INT3_IRQHandler                              /* Pin interrupt 3 or pattern match engine slice 3 interrupt */
    .long    PIN_INT4_IRQHandler                              /* Pin interrupt 4 or pattern match engine slice 4 interrupt */
    .long    PIN_INT5_DAC1_IRQHandler                              /* Pin interrupt 5 or pattern match engine slice 5 interrupt or DAC1 interrupt */
    .long    PIN_INT6_USART3_IRQHandler                              /* Pin interrupt 6 or pattern match engine slice 6 interrupt or UART3 interrupt */
    .long    PIN_INT7_USART4_IRQHandler                              /* Pin interrupt 7 or pattern match engine slice 7 interrupt or UART4 interrupt */
    .size    __Vectors, . - __Vectors

    .text
    .thumb

/* Reset Handler */

    .thumb_func
    .align 2
    .globl   Reset_Handler
    .weak    Reset_Handler
    .type    Reset_Handler, %function

Reset_Handler:
    ldr   r0,=SystemInit
    blx   r0
    ldr   r0,=__main
    bx    r0

    .pool
    .size Reset_Handler, . - Reset_Handler

    .align  1
    .thumb_func
    .weak DefaultISR
    .type DefaultISR, %function
DefaultISR:
    ldr r0, =DefaultISR
    bx r0
    .size DefaultISR, . - DefaultISR

    .align 1
    .thumb_func
    .weak NMI_Handler
    .type NMI_Handler, %function
NMI_Handler:
    ldr   r0,=NMI_Handler
    bx    r0
    .size NMI_Handler, . - NMI_Handler

    .align 1
    .thumb_func
    .weak HardFault_Handler
    .type HardFault_Handler, %function
HardFault_Handler:
    ldr   r0,=HardFault_Handler
    bx    r0
    .size HardFault_Handler, . - HardFault_Handler

    .align 1
    .thumb_func
    .weak SVC_Handler
    .type SVC_Handler, %function
SVC_Handler:
    ldr   r0,=SVC_Handler
    bx    r0
    .size SVC_Handler, . - SVC_Handler

    .align 1
    .thumb_func
    .weak PendSV_Handler
    .type PendSV_Handler, %function
PendSV_Handler:
    ldr   r0,=PendSV_Handler
    bx    r0
    .size PendSV_Handler, . - PendSV_Handler

    .align 1
    .thumb_func
    .weak SysTick_Handler
    .type SysTick_Handler, %function
SysTick_Handler:
    ldr   r0,=SysTick_Handler
    bx    r0
    .size SysTick_Handler, . - SysTick_Handler
    .align 1
    .thumb_func
    .weak SPI0_IRQHandler
    .type SPI0_IRQHandler, %function
SPI0_IRQHandler:
    ldr   r0,=SPI0_DriverIRQHandler
    bx    r0
    .size SPI0_IRQHandler, . - SPI0_IRQHandler

    .align 1
    .thumb_func
    .weak SPI1_IRQHandler
    .type SPI1_IRQHandler, %function
SPI1_IRQHandler:
    ldr   r0,=SPI1_DriverIRQHandler
    bx    r0
    .size SPI1_IRQHandler, . - SPI1_IRQHandler

    .align 1
    .thumb_func
    .weak DAC0_IRQHandler
    .type DAC0_IRQHandler, %function
DAC0_IRQHandler:
    ldr   r0,=DAC0_DriverIRQHandler
    bx    r0
    .size DAC0_IRQHandler, . - DAC0_IRQHandler

    .align 1
    .thumb_func
    .weak USART0_IRQHandler
    .type USART0_IRQHandler, %function
USART0_IRQHandler:
    ldr   r0,=USART0_DriverIRQHandler
    bx    r0
    .size USART0_IRQHandler, . - USART0_IRQHandler

    .align 1
    .thumb_func
    .weak USART1_IRQHandler
    .type USART1_IRQHandler, %function
USART1_IRQHandler:
    ldr   r0,=USART1_DriverIRQHandler
    bx    r0
    .size USART1_IRQHandler, . - USART1_IRQHandler

    .align 1
    .thumb_func
    .weak USART2_IRQHandler
    .type USART2_IRQHandler, %function
USART2_IRQHandler:
    ldr   r0,=USART2_DriverIRQHandler
    bx    r0
    .size USART2_IRQHandler, . - USART2_IRQHandler

    .align 1
    .thumb_func
    .weak Reserved22_IRQHandler
    .type Reserved22_IRQHandler, %function
Reserved22_IRQHandler:
    ldr   r0,=Reserved22_DriverIRQHandler
    bx    r0
    .size Reserved22_IRQHandler, . - Reserved22_IRQHandler

    .align 1
    .thumb_func
    .weak I2C1_IRQHandler
    .type I2C1_IRQHandler, %function
I2C1_IRQHandler:
    ldr   r0,=I2C1_DriverIRQHandler
    bx    r0
    .size I2C1_IRQHandler, . - I2C1_IRQHandler

    .align 1
    .thumb_func
    .weak I2C0_IRQHandler
    .type I2C0_IRQHandler, %function
I2C0_IRQHandler:
    ldr   r0,=I2C0_DriverIRQHandler
    bx    r0
    .size I2C0_IRQHandler, . - I2C0_IRQHandler

    .align 1
    .thumb_func
    .weak SCT0_IRQHandler
    .type SCT0_IRQHandler, %function
SCT0_IRQHandler:
    ldr   r0,=SCT0_DriverIRQHandler
    bx    r0
    .size SCT0_IRQHandler, . - SCT0_IRQHandler

    .align 1
    .thumb_func
    .weak MRT0_IRQHandler
    .type MRT0_IRQHandler, %function
MRT0_IRQHandler:
    ldr   r0,=MRT0_DriverIRQHandler
    bx    r0
    .size MRT0_IRQHandler, . - MRT0_IRQHandler

    .align 1
    .thumb_func
    .weak CMP_CAPT_IRQHandler
    .type CMP_CAPT_IRQHandler, %function
CMP_CAPT_IRQHandler:
    ldr   r0,=CMP_CAPT_DriverIRQHandler
    bx    r0
    .size CMP_CAPT_IRQHandler, . - CMP_CAPT_IRQHandler

    .align 1
    .thumb_func
    .weak WDT_IRQHandler
    .type WDT_IRQHandler, %function
WDT_IRQHandler:
    ldr   r0,=WDT_DriverIRQHandler
    bx    r0
    .size WDT_IRQHandler, . - WDT_IRQHandler

    .align 1
    .thumb_func
    .weak BOD_IRQHandler
    .type BOD_IRQHandler, %function
BOD_IRQHandler:
    ldr   r0,=BOD_DriverIRQHandler
    bx    r0
    .size BOD_IRQHandler, . - BOD_IRQHandler

    .align 1
    .thumb_func
    .weak FLASH_IRQHandler
    .type FLASH_IRQHandler, %function
FLASH_IRQHandler:
    ldr   r0,=FLASH_DriverIRQHandler
    bx    r0
    .size FLASH_IRQHandler, . - FLASH_IRQHandler

    .align 1
    .thumb_func
    .weak WKT_IRQHandler
    .type WKT_IRQHandler, %function
WKT_IRQHandler:
    ldr   r0,=WKT_DriverIRQHandler
    bx    r0
    .size WKT_IRQHandler, . - WKT_IRQHandler

    .align 1
    .thumb_func
    .weak ADC0_SEQA_IRQHandler
    .type ADC0_SEQA_IRQHandler, %function
ADC0_SEQA_IRQHandler:
    ldr   r0,=ADC0_SEQA_DriverIRQHandler
    bx    r0
    .size ADC0_SEQA_IRQHandler, . - ADC0_SEQA_IRQHandler

    .align 1
    .thumb_func
    .weak ADC0_SEQB_IRQHandler
    .type ADC0_SEQB_IRQHandler, %function
ADC0_SEQB_IRQHandler:
    ldr   r0,=ADC0_SEQB_DriverIRQHandler
    bx    r0
    .size ADC0_SEQB_IRQHandler, . - ADC0_SEQB_IRQHandler

    .align 1
    .thumb_func
    .weak ADC0_THCMP_IRQHandler
    .type ADC0_THCMP_IRQHandler, %function
ADC0_THCMP_IRQHandler:
    ldr   r0,=ADC0_THCMP_DriverIRQHandler
    bx    r0
    .size ADC0_THCMP_IRQHandler, . - ADC0_THCMP_IRQHandler

    .align 1
    .thumb_func
    .weak ADC0_OVR_IRQHandler
    .type ADC0_OVR_IRQHandler, %function
ADC0_OVR_IRQHandler:
    ldr   r0,=ADC0_OVR_DriverIRQHandler
    bx    r0
    .size ADC0_OVR_IRQHandler, . - ADC0_OVR_IRQHandler

    .align 1
    .thumb_func
    .weak DMA0_IRQHandler
    .type DMA0_IRQHandler, %function
DMA0_IRQHandler:
    ldr   r0,=DMA0_DriverIRQHandler
    bx    r0
    .size DMA0_IRQHandler, . - DMA0_IRQHandler

    .align 1
    .thumb_func
    .weak I2C2_IRQHandler
    .type I2C2_IRQHandler, %function
I2C2_IRQHandler:
    ldr   r0,=I2C2_DriverIRQHandler
    bx    r0
    .size I2C2_IRQHandler, . - I2C2_IRQHandler

    .align 1
    .thumb_func
    .weak I2C3_IRQHandler
    .type I2C3_IRQHandler, %function
I2C3_IRQHandler:
    ldr   r0,=I2C3_DriverIRQHandler
    bx    r0
    .size I2C3_IRQHandler, . - I2C3_IRQHandler

    .align 1
    .thumb_func
    .weak CTIMER0_IRQHandler
    .type CTIMER0_IRQHandler, %function
CTIMER0_IRQHandler:
    ldr   r0,=CTIMER0_DriverIRQHandler
    bx    r0
    .size CTIMER0_IRQHandler, . - CTIMER0_IRQHandler

    .align 1
    .thumb_func
    .weak PIN_INT0_IRQHandler
    .type PIN_INT0_IRQHandler, %function
PIN_INT0_IRQHandler:
    ldr   r0,=PIN_INT0_DriverIRQHandler
    bx    r0
    .size PIN_INT0_IRQHandler, . - PIN_INT0_IRQHandler

    .align 1
    .thumb_func
    .weak PIN_INT1_IRQHandler
    .type PIN_INT1_IRQHandler, %function
PIN_INT1_IRQHandler:
    ldr   r0,=PIN_INT1_DriverIRQHandler
    bx    r0
    .size PIN_INT1_IRQHandler, . - PIN_INT1_IRQHandler

    .align 1
    .thumb_func
    .weak PIN_INT2_IRQHandler
    .type PIN_INT2_IRQHandler, %function
PIN_INT2_IRQHandler:
    ldr   r0,=PIN_INT2_DriverIRQHandler
    bx    r0
    .size PIN_INT2_IRQHandler, . - PIN_INT2_IRQHandler

    .align 1
    .thumb_func
    .weak PIN_INT3_IRQHandler
    .type PIN_INT3_IRQHandler, %function
PIN_INT3_IRQHandler:
    ldr   r0,=PIN_INT3_DriverIRQHandler
    bx    r0
    .size PIN_INT3_IRQHandler, . - PIN_INT3_IRQHandler

    .align 1
    .thumb_func
    .weak PIN_INT4_IRQHandler
    .type PIN_INT4_IRQHandler, %function
PIN_INT4_IRQHandler:
    ldr   r0,=PIN_INT4_DriverIRQHandler
    bx    r0
    .size PIN_INT4_IRQHandler, . - PIN_INT4_IRQHandler

    .align 1
    .thumb_func
    .weak PIN_INT5_DAC1_IRQHandler
    .type PIN_INT5_DAC1_IRQHandler, %function
PIN_INT5_DAC1_IRQHandler:
    ldr   r0,=PIN_INT5_DAC1_DriverIRQHandler
    bx    r0
    .size PIN_INT5_DAC1_IRQHandler, . - PIN_INT5_DAC1_IRQHandler

    .align 1
    .thumb_func
    .weak PIN_INT6_USART3_IRQHandler
    .type PIN_INT6_USART3_IRQHandler, %function
PIN_INT6_USART3_IRQHandler:
    ldr   r0,=PIN_INT6_USART3_DriverIRQHandler
    bx    r0
    .size PIN_INT6_USART3_IRQHandler, . - PIN_INT6_USART3_IRQHandler

    .align 1
    .thumb_func
    .weak PIN_INT7_USART4_IRQHandler
    .type PIN_INT7_USART4_IRQHandler, %function
PIN_INT7_USART4_IRQHandler:
    ldr   r0,=PIN_INT7_USART4_DriverIRQHandler
    bx    r0
    .size PIN_INT7_USART4_IRQHandler, . - PIN_INT7_USART4_IRQHandler

/*    Macro to define default handlers. Default handler
 *    will be weak symbol and just dead loops. They can be
 *    overwritten by other handlers */
    .macro def_irq_handler  handler_name
    .weak \handler_name
    .set  \handler_name, DefaultISR
    .endm
/* Exception Handlers */
    def_irq_handler    SPI0_DriverIRQHandler              /* SPI0 interrupt */
    def_irq_handler    SPI1_DriverIRQHandler              /* SPI1 interrupt */
    def_irq_handler    DAC0_DriverIRQHandler              /* DAC0 interrupt */
    def_irq_handler    USART0_DriverIRQHandler              /* USART0 interrupt */
    def_irq_handler    USART1_DriverIRQHandler              /* USART1 interrupt */
    def_irq_handler    USART2_DriverIRQHandler              /* USART2 interrupt */
    def_irq_handler    Reserved22_DriverIRQHandler              /* Reserved interrupt */
    def_irq_handler    I2C1_DriverIRQHandler              /* I2C1 interrupt */
    def_irq_handler    I2C0_DriverIRQHandler              /* I2C0 interrupt */
    def_irq_handler    SCT0_DriverIRQHandler              /* State configurable timer interrupt */
    def_irq_handler    MRT0_DriverIRQHandler              /* Multi-rate timer interrupt */
    def_irq_handler    CMP_CAPT_DriverIRQHandler              /* Analog comparator interrupt or Capacitive Touch interrupt */
    def_irq_handler    WDT_DriverIRQHandler              /* Windowed watchdog timer interrupt */
    def_irq_handler    BOD_DriverIRQHandler              /* BOD interrupts */
    def_irq_handler    FLASH_DriverIRQHandler              /* flash interrupt */
    def_irq_handler    WKT_DriverIRQHandler              /* Self-wake-up timer interrupt */
    def_irq_handler    ADC0_SEQA_DriverIRQHandler              /* ADC0 sequence A completion. */
    def_irq_handler    ADC0_SEQB_DriverIRQHandler              /* ADC0 sequence B completion. */
    def_irq_handler    ADC0_THCMP_DriverIRQHandler              /* ADC0 threshold compare and error. */
    def_irq_handler    ADC0_OVR_DriverIRQHandler              /* ADC0 overrun */
    def_irq_handler    DMA0_DriverIRQHandler              /* DMA0 interrupt */
    def_irq_handler    I2C2_DriverIRQHandler              /* I2C2 interrupt */
    def_irq_handler    I2C3_DriverIRQHandler              /* I2C3 interrupt */
    def_irq_handler    CTIMER0_DriverIRQHandler              /* Timer interrupt */
    def_irq_handler    PIN_INT0_DriverIRQHandler              /* Pin interrupt 0 or pattern match engine slice 0 interrupt */
    def_irq_handler    PIN_INT1_DriverIRQHandler              /* Pin interrupt 1 or pattern match engine slice 1 interrupt */
    def_irq_handler    PIN_INT2_DriverIRQHandler              /* Pin interrupt 2 or pattern match engine slice 2 interrupt */
    def_irq_handler    PIN_INT3_DriverIRQHandler              /* Pin interrupt 3 or pattern match engine slice 3 interrupt */
    def_irq_handler    PIN_INT4_DriverIRQHandler              /* Pin interrupt 4 or pattern match engine slice 4 interrupt */
    def_irq_handler    PIN_INT5_DAC1_DriverIRQHandler              /* Pin interrupt 5 or pattern match engine slice 5 interrupt or DAC1 interrupt */
    def_irq_handler    PIN_INT6_USART3_DriverIRQHandler              /* Pin interrupt 6 or pattern match engine slice 6 interrupt or UART3 interrupt */
    def_irq_handler    PIN_INT7_USART4_DriverIRQHandler              /* Pin interrupt 7 or pattern match engine slice 7 interrupt or UART4 interrupt */

    .end
