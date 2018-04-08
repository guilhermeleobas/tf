include ../../Makefile.common

SOURCEDIR = .

SMALL_INPUT = 33554432
MEDIUM_INPUT = 134217728
BIG_INPUT = 268435456

run: compile
	@echo "====RUNNING BOTS/FFT===="
	$(MAKE) -i run-parallel;
	$(MAKE) -i run-serial;
