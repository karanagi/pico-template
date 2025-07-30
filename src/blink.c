#include "pico/stdlib.h"

#define LED_PIN			25
#define SLEEP_TIME		1000

void init();

int
main(void)
{
	uint32_t		mask;

	init();

	mask = (1 << LED_PIN);
	while(1) {
		gpio_xor_mask(mask);
		sleep_ms(SLEEP_TIME);
	}
}

void
init()
{
	gpio_init(LED_PIN);
	gpio_set_dir(LED_PIN, true);
}
