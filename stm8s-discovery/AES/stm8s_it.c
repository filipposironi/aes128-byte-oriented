/*
 * Authors:
 * - Filippo Sironi (filippo.sironi@gmail.com)
 * - Matteo Villa (villa.matteo@gmail.com)
 */

#include "stm8s.h"
#include "stm8s_it.h"

volatile u16 overflows = 0;

void TIM1_Overflow_IRQHandler(void)
{
	++overflows;

	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);

}
